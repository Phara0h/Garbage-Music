<?php
include_once ('PH.php');
$ph = new PH();

	$user = $_POST['username'];
	$pass = $_POST['pass'];

	print $ph->AddUser($user, $pass);

?>