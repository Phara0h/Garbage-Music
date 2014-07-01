<?php

/*
 * Name: PH Class
 * Function: To hold global gerniric functions for this garbage website
 * 
 *
 */

include_once('dbc.php');
//include_once('dbmc.php');
//error_reporting(E_ALL);
//ini_set('display_errors', '1');
class PH
{	
	public $_db;
	public $_dbm;
	
	function __construct()
	{
		$this->_db = new DBC();
		//$this->_dbm = new MDB();
	}
	
	//////////////////////////////////////
	///// ACCOUNT RELEATED FUNCTIONS /////
	/////////////////////////////////////	
	
	//*********** Verification *************** 
	
	//pass pre hashed user and pass
	public function setCookie($days, $user, $pass)
	{
		$user = md5($this->CleanText($user));
		$pass = md5($this->CleanText($pass));
		$pass = hash('sha512',sha1($pass));
		if($days > 0)
		{
			
			$time = time()+60*60*24*$days;
			
			setcookie('sessionID', $user, $time, '/');
        	setcookie('sessionKey', sha1($pass.'salty'), $time, '/');
		}
		else 
		{
			setcookie('sessionID', $user, false, '/');
        	setcookie('sessionKey', sha1($pass.'salty'), false, '/');
			
		}
	}
	
	public function checkCookie($sessionID,$sessionKey)
	{
		$account = $this->GetAccount($sessionID);
		$pass = $account['Password']; 
		if(sha1($pass.'salty') == $sessionKey)
		{
			session_start();
			$_SESSION['admin']= $account['admin'];
			$_SESSION['userid']= $account['UserID'];
			if($account['admin'] == 1)
			{
				return '<a class="button" id="add_album">+ Album</a>
								<a class="button" id="add_artist">+ Artist</a>
								<a class="button" id="add_genre">+ Genre</a>
								<a class="button" id="add_track">+ Track</a>';
			}
			else
			{
				return TRUE;
			}
			
		}
		else 
		{
			return FALSE;	
		}
	}
	
	// 0 == Sucess
	// 1 = Invailed User
	// 2 = Not Verified
	public function Login ($userName, $pass)
	{
		$userNH =$this->CleanText($userName);
		// Clean text and then hash it
    	$userName = md5($userNH);
		$pass = md5($this->CleanText($pass));
		$pass = hash('sha512',sha1($pass));
		
		// Verify Username
		$account = $this->GetAccount($userName);
		
		if($account['UserName'] == $userName)
		{	
				if($account['Password'] == $pass)
				{
					session_start();
					$_SESSION['admin']= $account['admin'];
					$_SESSION['userid']= $account['UserID'];
					if($account['admin'] == 1)
					{
						return '<a class="button" id="add_album">+ Album</a>
								<a class="button" id="add_artist">+ Artist</a>
								<a class="button" id="add_genre">+ Genre</a>
								<a class="button" id="add_track">+ Track</a>';
					}
					
					return $userNH;
				}
				else
				{
					return 1;
				}
		
		} 
		else 
		{
			return 1;
		}
	}
	
	public function Logout()
	{
		//Delete Cookie
		$time = time()-60*60*24*365;
		setcookie('sessionID', '', $time, '/');
        setcookie('sessionKey', '', $time, '/');
		
		//Update Database
		
		//Redirect
		header('Location: ../');	
	}
	
	//*********** MANAGEMENT *************** 
	
	public function AddUser($userName, $pass) 
    {
    	
    	//Clean and hash befor we go
    	$userName = md5($this->CleanText($userName));
		$pass = md5($this->CleanText($pass));
    	$pass = hash('sha512',sha1($pass));
		$verify = md5(uniqid());
		
			
		if($this->GetAccount($userName) == NULL)
		{	
        	$query = "INSERT INTO musicdb.users (`UserID`, `UserName`, `Password`, `admin`) VALUES (NULL, '$userName', '$pass', 0);";
				 

        	$this->_db->Query($query, true);
			
			return $verify;
		}
		else
		{
			return 1;	
		}
    }
	
	public function VerifyUser($code)
	{
		$code = $this->CleanText($code);
		$q = $this->_db->Query("SELECT * FROM Account WHERE verify = '$code'");
		$account = mysql_fetch_array($q);
		
		if($account != NULL)
		{
			$this->UpdateAccount($account['user'],'verify',"1");
			return 1;
		}
		else
		{
			return 0;
		}
	}
	
	
	//*********** DATABASE *************** 
	
	// Pass hashed username 
	public function GetAccount($username_H)
	{
		$q = $this->_db->Query("SELECT * FROM musicdb.users WHERE UserName = '$username_H'");
		return mysql_fetch_array($q);
	}
	

	
	public function GetAllAlbums()
	{
		$q = $this->_db->Query("SELECT * FROM musicdb.album ORDER BY musicdb.album.AlbumName");
		$albums = array();
		while($entry = mysql_fetch_assoc($q))
		{
			array_push($albums, $entry);
		}
		
		
		return $albums;
		
	}
	
	public function GetAllMusic()
	{
		$q = $this->_db->Query("SELECT * FROM musicdb.album ORDER BY musicdb.album.AlbumName");
		$albums = array();
		while($entry = mysql_fetch_assoc($q))
		{
			array_push($albums, $entry);
		}
		
		foreach($albums as &$album)
		{
			$aid = $album["AlbumID"];
			$tracks = array();
			$artists = array();
			$q = $this->_db->Query("SELECT * FROM musicdb.track WHERE musicdb.track.AlbumID = '$aid'");
			
			while($entry = mysql_fetch_assoc($q))
			{
				array_push($tracks,$entry);
			}
			$album["Tracks"] = $tracks;
			
			$gid = $album["GenreID"];
			$q = $this->_db->Query("SELECT * FROM musicdb.genre WHERE musicdb.genre.GenreID = '$gid'");
			$album["GenreName"] = mysql_fetch_assoc($q)["GenreName"];
			
			$q = $this->_db->Query("SELECT ArtistName FROM musicdb.artist, musicdb.artist_album WHERE musicdb.artist_album.AlbumID = '$aid' AND musicdb.artist_album.ArtistID = musicdb.artist.ArtistID");
			while($entry = mysql_fetch_assoc($q))
			{
				array_push($artists,$entry['ArtistName']);
			}
			$album["Artists"] = $artists;
			
		}
		
		return $albums;
	}
	
	public function GetAllGenres()
	{
		$q = $this->_db->Query("SELECT * FROM musicdb.genre ORDER BY musicdb.genre.GenreName");
		$g = array();
		while($entry = mysql_fetch_assoc($q))
		{
			array_push($g, $entry);
		}
		return $g;
	}
	
	public function GetAllArtists()
	{
		$q = $this->_db->Query("SELECT * FROM musicdb.artist ORDER BY musicdb.artist.ArtistName ");
		$g = array();
		while($entry = mysql_fetch_assoc($q))
		{
			array_push($g, $entry);
		}
		return $g;
	}
	
	public function GetRecommend()
	{
	
		$u = $this->_dbm->Find("users", array("UserID" => intval($_SESSION['userid'])));
		return $u[0]["Recommendations"];
	}
	
	
	public function RateAlbum($id, $rating, $user)
	{
		
		$userName = $this->GetAccount($user);
		$userID = $userName['UserID'];
		$q = $this->_db->Query("SELECT * FROM musicdb.ratings WHERE musicdb.ratings.UserID = '$userID' AND musicdb.ratings.TrackID = '$id'");
		$rate = mysql_fetch_array($q);
		if($rate)
		{
			return $rate['Rating'];
		}
		else
		{
			
			// Track AVG
			$query = "INSERT INTO musicdb.ratings (`UserID`, `TrackID`, `Rating`) VALUES ('$userID', '$id', '$rating');";
			$this->_db->Query($query, true);
			
			$q = $this->_db->Query("SELECT * FROM musicdb.ratings WHERE musicdb.ratings.TrackID = '$id'");
			$count = 0.0;
			$total = 0.0;
			while($en = mysql_fetch_assoc($q))
			{
				$count++;
				$total += floatval($en['Rating']);
			}
			
			
			$t = 0.0;
			if($count > 0)
			{
				$t = (float)$total/(float)$count;
				
				$this->_db->Query("UPDATE musicdb.track SET TrackRating ='$t' WHERE TrackID = '$id'");
			}
			else
			{
				$this->_db->Query("UPDATE musicdb.track SET TrackRating ='$rating' WHERE TrackID = '$id'");
			}
			
			
			// Album AVG
			$q2 = $this->_db->Query("SELECT * FROM musicdb.track WHERE musicdb.track.TrackID = '$id'");
			$album = mysql_fetch_array($q2);
			$albumID = $album['AlbumID'];
			
			$q3 = $this->_db->Query("SELECT * FROM musicdb.track WHERE musicdb.track.AlbumID = '$albumID'");
			$count = 0.0;
			$total = 0.0;
			while($en2 = mysql_fetch_assoc($q3))
			{
				$count++;
				$total += floatval($en2['TrackRating']);
			}
				
			$t = 0.0;
			if($count > 0)
			{
				$t = (float)$total/(float)$count;
			
				$this->_db->Query("UPDATE musicdb.album SET Rating ='$t' WHERE AlbumID = '$albumID'");
			}
			else
			{
				$this->_db->Query("UPDATE musicdb.album SET Rating ='$rating' WHERE AlbumID = '$albumID'");
			}
				
			
			return -1;
		}
		
		return -1;
		
	}
	
	public function AddTrackURL($id, $turl)
	{
		$this->_db->Query("UPDATE musicdb.track SET TrackURL ='$turl' WHERE TrackID = '$id'");
		return 1;
	}
	
	public function AddAlbum($a_name,$a_date,$a_url,$a_genre, $a_artist)
	{
		$a_name = $this->CleanText($a_name);
		$a_genre = $this->CleanText($a_genre);
		
		$q = $this->_db->Query("SELECT * FROM musicdb.genre WHERE musicdb.genre.GenreName = '$a_genre'");
		$genre = mysql_fetch_array($q)['GenreID'];
		
		$q = $this->_db->Query("SELECT * FROM musicdb.artist WHERE musicdb.artist.ArtistName = '$a_artist'");
		$artist = mysql_fetch_array($q)['ArtistID'];
		
		
		$query = "INSERT INTO musicdb.album (`AlbumID`, `AlbumName`, `GenreID`, `ReleaseDate`, `CoverArt`, `Rating`) VALUES (NULL, '$a_name', '$genre', '$a_date', '$a_url', 0);";
		$report = $this->_db->Query($query, true);
		
		$q = $this->_db->Query("SELECT * FROM musicdb.album WHERE musicdb.album.AlbumName = '$a_name'");
		$album = mysql_fetch_array($q)['AlbumID'];
		
		$query = "INSERT INTO musicdb.artist_album (`ArtistID`, `AlbumID`) VALUES ('$artist','$album');";
		$report = $this->_db->Query($query, true);
		
		return $artist;
	}
	
	
	public function AddTrack($t_name,$t_dur,$t_url,$t_album)
	{
		$t_name = $this->CleanText($t_name);
		$q = $this->_db->Query("SELECT * FROM musicdb.album WHERE musicdb.album.AlbumName = '$t_album'");
		$album = mysql_fetch_array($q)['AlbumID'];
		if(empty($t_url))
		{
			$query = "INSERT INTO musicdb.track (`TrackID`, `AlbumID`, `TrackName`, `TrackDuration`, `TrackURL`) VALUES (NULL, '$album', '$t_name', '$t_dur', NULL);";
			$report = $this->_db->Query($query, true);
		}
		else
		{
			$query = "INSERT INTO musicdb.track (`TrackID`, `AlbumID`, `TrackName`, `TrackDuration`, `TrackURL`) VALUES (NULL, '$album', '$t_name', '$t_dur', '$t_url');";
			$report = $this->_db->Query($query, true);
		}
		
		return $report;
	}
	
	public function AddGenre($g_name)
	{
		$g_name = $this->CleanText($g_name);
		$query = "INSERT INTO musicdb.genre (`GenreID`, `GenreName`) VALUES (NULL, '$g_name');";
		$report = $this->_db->Query($query, true);
		
		return $report;
	}
	
	public function AddArtist($a_name)
	{
		$a_name = $this->CleanText($a_name);
		$query = "INSERT INTO musicdb.artist (`ArtistID`, `ArtistName`) VALUES (NULL, '$a_name');";
		$report = $this->_db->Query($query, true);
		
		return $report;
	}
	
	
	//////////////////////////////////////
	/////  MISC RELEATED FUNCTIONS  /////
	////////////////////////////////////
	
	public function CleanText($text)
	{
		return  mysql_real_escape_string($text);
	}

}

?>