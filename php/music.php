<?php
$job = $_POST['job'];
include_once ('PH.php');
$ph = new PH();
session_start();

if($job == "getmusic")
{
	$albums = $ph->GetAllMusic();


	echo json_encode($albums);
}
else if($job == "getalbums")
{
	$albums = $ph->GetAllAlbums();
	echo json_encode($albums);
}
else if($job == "getgenres")
{
	$genres = $ph->GetAllGenres();
	echo json_encode($genres);
}
else if($job == "getartists")
{
	$artist = $ph->GetAllArtists();
	echo json_encode($artist);
}
else if($job == "getrecommend")
{
	$rec = $ph->GetRecommend();
	echo json_encode($rec);
}
else if($job == "rate")
{
	$rated = $ph->RateAlbum($_POST['id'], $_POST['rating'], $_POST['user']);
	
	print $rated;
}
else if($job == "track")
{

	$tracked = $ph->AddTrackURL($_POST['id'],$_POST['turl']);
	return 1;
}
else if($job == "addAlbum")
{
	if($_SESSION['admin'] == 1)
	$r = $ph->AddAlbum($_POST['aName'], $_POST['aDate'], $_POST['aURL'], $_POST['aGenre'], $_POST['aArtist']);
	return 1;
}
elseif($job == "addArtist")
{
	if($_SESSION['admin'] == 1)
	$ph->AddArtist($_POST['aName']);
	return 1;
}
elseif($job == "addGenre")
{
	if($_SESSION['admin'] == 1)
	$ph->AddGenre($_POST['gName']);
	return 1;
}
elseif($job == "addTrack")
{
	if($_SESSION['admin'] == 1)
	$ph->AddTrack($_POST['tName'], $_POST['tDur'] ,$_POST['tURL'], $_POST['tAlbum']);
	return 1;
}
else
{
	echo "ERROR";
}


?>