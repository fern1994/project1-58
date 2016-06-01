<?php
	header("content-type:text/javascript;charset=utf-8");
	$objConnect = mysqli_connect("localhost","root","","antidrugdb");
	mysqli_set_charset($objConnect, "utf8");

	//$_POST["sPhaseID"] = "1"; // for Sample

	$strPhaseID = $_POST["sPhaseID"];
	$strSQL = "SELECT * FROM addictphase WHERE 1 AND phaseID = '".$strPhaseID."'  ";
 
	$objQuery = mysqli_query($objConnect,$strSQL);
	$obResult = mysqli_fetch_array($objQuery);

	if($obResult)
	{
		$arr["phaseID"] = $obResult["phaseID"];
		$arr["phaseName"] = $obResult["phaseName"];
		$arr["phaseDetail"] = $obResult["phaseDetail"];
		
		
	}

	mysqli_close($objConnect);

	/*** return JSON by newsId ***/

	/*{"phaseID":"1","phaseName":"ระยะที่ 1","phaseDetail":"ระยะเริ่มต้น\r\n\r\nเป็นช่วงทดลองเสพหรือเสพนาน ๆ ครั้ง เพื่อเข้าสังคมกับกลุ่มเพื่อน โดยผู้เสพส่วนใหญ่มักจะมีความรู้สึกว่าสตนเองทำในสิ่งที่ไม่ถูกต้อง\"}*/

	echo json_encode($arr,JSON_UNESCAPED_UNICODE);

?>