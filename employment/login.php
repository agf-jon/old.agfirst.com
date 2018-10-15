<?php
session_start();
//	echo  $_SESSION['uname'];
//echo  "sdfasdf";
$uname=$_POST['uname'];
$password=$_POST['password'];
//if($_POST['uname'] == 'donna' and $_POST['password'] == 'agfirst'){}
$_SESSION['vcheck'] = $uname;
if($uname == 'AgFirstJobs' and $password == 'Qtemf47'){$_SESSION['vcheck']=$uname; header("Location: employment-job-view.php");}
else header("Location: invalid.php");
?>