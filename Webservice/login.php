<?php
	$objConnect = mysqli_connect("localhost","root","","antidrugdb");
 
	//$_POST["strUser"] = "Nanny"; // for Sample
	//$_POST["strPass"] = "Nanny02";  // for Sample

	

$strUsername = $_POST["strUser"];

$strPassword = $_POST["strPass"];

$strSQL = "SELECT * FROM staff WHERE 1 AND staffUsername = '".$strUsername."' AND staffPassword = '".$strPassword."'";
 
	$objQuery = mysqli_query($objConnect,$strSQL);
	$objResult = mysqli_fetch_array($objQuery);
	$intNumRows = mysqli_num_rows($objQuery);

	if($intNumRows==0)
	{
		$arr['StatusID'] = "0";
		$arr['staffID'] = "0";
		$arr['Error'] = "Incorrect Username and Password"; 
	}
	else
	{
		$arr['StatusID'] = "1";
		$arr['staffID'] = $objResult["staffID"];
		$arr['Error'] = "";
	}
 
	/**
	$arr['StatusID'] // (0=Failed , 1=Complete)
	$arr['MemberID'] // MemberID
	$arr['Error' // Error Message
	*/
 
	mysqli_close($objConnect);

	echo json_encode($arr);
?>