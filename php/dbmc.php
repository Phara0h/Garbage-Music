<?php

//error_reporting(E_ALL);
//ini_set('display_errors', '1');
class MDB
{
	// mongo
	private $m;
	// database
	private $db;

	
	function __construct()  
	{
		$this->m = new MongoClient();
		$this->db = $this->m->Music;
	}
	
	public function Add($collectionName, $record)
	{
		// select a collection (analogous to a relational database's table)
		$collection = $this->db->$collectionName;
		
		$found = $collection->findOne($record);
		
		if($found == NULL)
		{
			// add a record
			$collection->insert($record);
			return true;
		}
		else
		{
			return false;
		}
		
		// add another record, with a different "shape"
		//$obj = array( "title" => "Calvin and Hobbes", "author" => "Bill Watterson" );
		//$obj = array( "title" => "XKCD", "online" => true );
		//$collection->insert($obj);
		
		
	}
	
	public function Remove($collectionName, $record)
	{
		$collection =  $this->db->$collectionName;
		$collection->remove($record);
	}
	
	public function Find($collectionName, $record)
	{
		$collection =  $this->db->$collectionName;
		
		if($record != null)
		{
			$cursor = $collection->find($record);
		}
		else
		{
			$cursor = $collection->find();
		}
		
		$results = array();
		
		// iterate through the results
		foreach ($cursor as $obj) 
		{
			array_push($results, $obj);
		}
		
		if(count($results) == 0)
			return NULL;
		else
			return $results;
	}
	
	public function Update($collectionName, $record, $field, $data)
	{
		$collection =  $this->db->$collectionName;
		$newdata = array('$set' => array($field => $data));
		$collection->update($record, $newdata);
	}

}
?>