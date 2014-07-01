#!/usr/bin/php
<?php

include_once('dbmc.php');
//error_reporting(E_ALL);
//ini_set('display_errors', '1');

class Recommend
{
	public $_db;

	function __construct()
	{

		$this->_db = new MDB();

		$users = $this->_db->Find("users", null);
		
		$pairs = array();
		
		foreach($users as &$user1)
		{
			$r1 = $this->_db->Find("ratings", array("UserID" => $user1["UserID"]));
			uasort($r1, "cmp");
			//print_r($r1);
			$highid = 0;
			$high = 0;
			foreach($users as &$user2)
			{
				$r2 =  $this->_db->Find("ratings", array("UserID" => $user2["UserID"]));
				
				$array_x = array();
				$array_y = array();
				for ($i=0; $i<=count($r1); $i++)
				{
					$rating = $this->_db->Find("ratings", array("UserID" => $user2["UserID"], "TrackID" => $r1[$i]["TrackID"]));
					
					
					//print_r($rating);
					if($rating != null)
					{
						array_push($array_x,$r1[$i]['Rating']+1);
						array_push($array_y,$rating[0]['Rating']+1);
					}
					
					
				}
				//print_r($array_x);
				//print_r($array_y);
				$pearson = Correlation($array_x,$array_y);
				
				if($pearson > $high && $user2['UserID'] != $user1['UserID'])
				{
					$high = $pearson;
					$highid = $user2['UserID'];
				}
				
				$u1 = $user1['UserID'];
				$u2 = $user2['UserID'];
				//echo "user1:'$u1' user2:'$u2' r:'$pearson'";
				
			}
			
			array_push($pairs, array("UserID1" => $user1['UserID'], "UserID2" => $highid,"R" => $high));
			
		}
		
		print_r($pairs);
		
		foreach($pairs as &$pair)
		{
			$r = $this->_db->Find("ratings", array("UserID" => $pair["UserID2"]));
			if($r != null)
			{
				uasort($r, "cmp");
				//print_r($r);
				$tt = array();
				
				foreach($r as &$ra)
				{
					array_push($tt, $ra["TrackID"]);
				}
				$t1 = $this->_db->Find("track", array("TrackID" => $tt[0]));
				$t2 = $this->_db->Find("track", array("TrackID" => $tt[1]));
				$t3 = $this->_db->Find("track", array("TrackID" => $tt[3]));
				
				$t = array($t1[0]["TrackName"], $t2[0]["TrackName"], $t3[0]["TrackName"]);
				
				$this->_db->Update("users", array("UserID" => $pair["UserID1"]), 'Recommendations', $t);
				
				
				//print_r($tt);
				
				print $pair["UserID1"];
				print " | ";
				print $t1[0]["TrackName"];
				print " | ";
				print_r($t2);
				print " | ";
				print $t3[0]["TrackName"];
				print " \n ";
			}
			
		}
		 
	
		
	}


}
function cmp($a, $b)
{
	if ($a ['Rating'] == $b ['Rating']) {
		return 0;
	}
	return ($a ['Rating'] < $b ['Rating']) ? 1 : -1;
}

function Correlation($arr1, $arr2)
{
	$correlation = 0;

	$k = SumProductMeanDeviation($arr1, $arr2);
	$ssmd1 = SumSquareMeanDeviation($arr1);
	$ssmd2 = SumSquareMeanDeviation($arr2);

	$product = $ssmd1 * $ssmd2;

	$res = sqrt($product);

	$correlation = $k / $res;

	return $correlation;
}

function SumProductMeanDeviation($arr1, $arr2)
{
	$sum = 0;

	$num = count($arr1);

	for($i=0; $i<$num; $i++)
	{
		$sum = $sum + ProductMeanDeviation($arr1, $arr2, $i);
	}

	return $sum;
}

function ProductMeanDeviation($arr1, $arr2, $item)
{
	return (MeanDeviation($arr1, $item) * MeanDeviation($arr2, $item));
}

function SumSquareMeanDeviation($arr)
{
	$sum = 0;

	$num = count($arr);

	for($i=0; $i<$num; $i++)
	{
		$sum = $sum + SquareMeanDeviation($arr, $i);
	}

	return $sum;
}

function SquareMeanDeviation($arr, $item)
{
	return MeanDeviation($arr, $item) * MeanDeviation($arr, $item);
}

function SumMeanDeviation($arr)
{
	$sum = 0;

	$num = count($arr);

	for($i=0; $i<$num; $i++)
	{
		$sum = $sum + MeanDeviation($arr, $i);
	}

	return $sum;
}

function MeanDeviation($arr, $item)
{
	$average = Average($arr);

	return $arr[$item] - $average;
}

function Average($arr)
{
	$sum = Sum($arr);
	$num = count($arr);

	return $sum/$num;
}

function Sum($arr)
{
	return array_sum($arr);
}


$rec = new Recommend();
?>