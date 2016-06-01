<?php
	header("content-type:text/javascript;charset=utf-8"); 
	$objConnect = mysqli_connect("localhost","root","","antidrugdb");
	
	mysqli_set_charset($objConnect, "utf8");

	/*	$_POST["salertID"] = "";
		$_POST["smeetingDate"] = "2016-05-11";
		$_POST["smeetingTitle"] = "นัดน้องกุ้ก";
		$_POST["smeetingDetail"] = "ฟส่หดาส่หกาสด่าสหก่ดสาหก่";
		$_POST["smeetingSummary"] = "นัดพบ";
		$_POST["smeetingByStaffID"] = "1001";
		
	*/
	$strAlertID = $_POST["salertID"];
	$strMeetingDate = $_POST["smeetingDate"];
	$strMeetingTitle = $_POST["smeetingTitle"];
	$strMeetingDetail = $_POST["smeetingDetail"];
	$strMeetingSummary = $_POST["smeetingSummary"];	
	$strMeetingByStaffID= $_POST["smeetingByStaffID"];
	

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
	$strSQL = "INSERT INTO alertmeeting (alertID,meetingDate,meetingTitle,meetingDetail,meetingSummary,meetingByStaffID) 
		VALUES (
						
				'".$strAlertID."',
				'".$strMeetingDate."',
				'".$strMeetingTitle."',
				'".$strMeetingDetail."',
				'".$strMeetingSummary."',
				'".$strMeetingByStaffID."'
				
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