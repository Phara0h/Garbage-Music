<?php
include_once ('PH.php');
$ph = new PH();
$r = $ph->checkCookie($_COOKIE['sessionID'],$_COOKIE['sessionKey']);
if ($r != FALSE)
{
	print $r;
}
else
{
	print '0';
}

?>