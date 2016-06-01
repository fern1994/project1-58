<?php
	header("content-type:text/javascript;charset=utf-8"); 
	$objConnect = mysqli_connect("localhost","root","","antidrugdb");
	mysqli_set_charset($objConnect, "utf8");
	//$_POST["sNewsID"] = "10001"; // for Sample

	$strNewsID = $_POST["sNewsID"];
	$strSQL = "SELECT * FROM news WHERE 1 AND newsID = '".$strNewsID."'  ";
 
	$objQuery = mysqli_query($objConnect,$strSQL);
	$obResult = mysqli_fetch_array($objQuery);

	if($obResult)
	{
		$arr["newsID"] = $obResult["newsID"];
		$arr["newsTitile"] = $obResult["newsTitile"];
		$arr["newsDetails"] = $obResult["newsDetails"];
		$arr["newsDate"] = $obResult["newsDate"];
		
	}

	mysqli_close($objConnect);

	/*** return JSON by newsId ***/

	//{"newsId":"3","date":"2016-05-04","header":"กิจกรรม1","detail":"สำรวจหอนางฟ้า"}

	echo json_encode($arr,JSON_UNESCAPED_UNICODE);

?>