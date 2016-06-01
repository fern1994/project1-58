<?php
	header("content-type:text/javascript;charset=utf-8"); 
	$objConnect = mysqli_connect("localhost","root","","antidrugdb");
	
	mysqli_set_charset($objConnect, "utf8");

	/*** for Sample
		$_POST["sEvaluateID"] = "";
		$_POST["sPatientIDCard"] = "1111111111111";
		$_POST["sPatientName"] = "เอ";
		$_POST["sPatientLastname"] = "เอส";
		$_POST["sPatientAge"] = "19";
		$_POST["sPatientAddress"] = "djfl;sdkfjdslkfjlskd";
		$_POST["sEvaluatePoint"] = "2";
		$_POST["sDrugType"] = "กัญชา";
		$_POST["sEvaluateResult"] = "low";
		$_POST["sEvaluateDate"] = "2016-04-01";
		$_POST["sEvaluateByStaffID"] = "1";
	*/
	
	$strEvaluateID = $_POST["sEvaluateID"];
	$strPatientIDCard = $_POST["sPatientIDCard"];
	$strPatientName = $_POST["sPatientName"];
	$strPatientLastname = $_POST["sPatientLastname"];
	$strPatientAge = $_POST["sPatientAge"];	
	$strPatientAddress = $_POST["sPatientAddress"];
	$strEvaluatePoint = $_POST["sEvaluatePoint"];
	$strDrugType = $_POST["sDrugType"];
	$strEvaluateResult = $_POST["sEvaluateResult"];
	$strEvaluateDate = $_POST["sEvaluateDate"];
	$strEvaluateByStaffID = $_POST["sEvaluateByStaffID"];

	/*** Check Username Exists ***/
	/*$strSQL = "SELECT * FROM member WHERE Username = '".$strUsername."' ";
	$objQuery = mysqli_query($objConnect,$strSQL);
	$objResult = mysqli_fetch_array($objQuery);
	if($objResult)
	{
		$arr['StatusID'] = "0"; 
		$arr['Error'] = "Username Exists!";	
		echo json_encode($arr);
		exit();
	}*/

	/*** Check Email Exists ***/
	/*$strSQL = "SELECT * FROM member WHERE Email = '".$strEmail."' ";
	$objQuery = mysqli_query($objConnect,$strSQL);
	$objResult = mysqli_fetch_array($objQuery);
	if($objResult)
	{
		$arr['StatusID'] = "0"; 
		$arr['Error'] = "Email Exists!";	
		echo json_encode($arr);
		exit();
	}*/
	
	/*** Insert ***/
	$strSQL = "INSERT INTO evaluate (evaluateID,patientIDCard,patientName,patientLastname,patientAge,patientAddress,evaluatePoint,drugType,evaluateResult,evaluateDate,evaluateByStaffID) 
		VALUES (
						
				'".$strEvaluateID."',
				'".$strPatientIDCard."',
				'".$strPatientName."',
				'".$strPatientLastname."',
				'".$strPatientAge."',
				'".$strPatientAddress."',
				'".$strEvaluatePoint."',
				'".$strDrugType."',
				'".$strEvaluateResult."',
				'".$strEvaluateDate."',
				'".$strEvaluateByStaffID."'
			)
		";

	$objQuery = mysqli_query($objConnect,$strSQL);
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
	
	mysqli_close($objConnect);
	
	echo json_encode($arr,JSON_UNESCAPED_UNICODE);
?>