<?php
	$objConnect = mysql_connect("localhost","root","root");
	$objDB = mysql_select_db("mydatabase");
	
	
		$_POST["sMemberID"] = "2";
		$_POST["sPassword"] = "adisorn@2";
		$_POST["sName"] = "Adisorn Bunsong";
		$_POST["sEmail"] = "adisorn@thaicreate.com";
		$_POST["sTel"] = "021978032";
	

	$strMemberID = $_POST["sMemberID"];
	$strPassword = $_POST["sPassword"];
	$strName = $_POST["sName"];
	$strEmail = $_POST["sEmail"];
	$strTel = $_POST["sTel"];

	/*** Check Email Exists ***/
	$strSQL = "SELECT * FROM member WHERE Email = '".$strEmail."' AND MemberID != '".$strMemberID."' ";
	$objQuery = mysql_query($strSQL);
	$objResult = mysql_fetch_array($objQuery);
	if($objResult)
	{
		$arr['StatusID'] = "0"; 
		$arr['Error'] = "Email Exists!";	
		echo json_encode($arr);
		exit();
	}
	
	/*** Update ***/
	$strSQL = " UPDATE member SET
		Password = '".$strPassword."'
		,Name = '".$strName."'
		,Email = '".$strEmail."'
		,Tel = '".$strTel."'
		WHERE MemberID = '".$strMemberID."'
	";

	$objQuery = mysql_query($strSQL);
	if(!$objQuery)
	{
		$arr['StatusID'] = "0"; 
		$arr['Error'] = "Cannot save data!";	
	}
	else
	{
		$arr['StatusID'] = "1"; 
		$arr['Error'] = "";	
	}

	/**
		$arr['StatusID'] // (0=Failed , 1=Complete)
		$arr['Error'] // Error Message
	*/
	
	mysql_close($objConnect);
	
	echo json_encode($arr);
?>