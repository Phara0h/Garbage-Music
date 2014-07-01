<?php
include_once ('PH.php');
$ph = new PH();

	$user = $_POST['username'];
	$pass = $_POST['pass'];

	$login = $ph->Login($user, $pass);
	if($login != 1 && $login != 2)
	{
		$ph->setCookie(365, $user, $pass, $login); // login is the username unhashed
		print '1';
	}
	else if($login == 2)
	{
		print '2';
	}
	else
	{
		print '0';
	}

?>