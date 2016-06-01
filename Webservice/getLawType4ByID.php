<?php
	header("content-type:text/javascript;charset=utf-8"); 
	$objConnect = mysqli_connect("localhost","root","","antidrugdb");
	mysqli_set_charset($objConnect, "utf8");

	//$_POST["sLawID"] = "1"; // for Sample

	$strLawID = $_POST["sLawID"];
	$strSQL = "SELECT * FROM lawtype4 WHERE 1 AND lawID = '".$strLawID."'  ";
 
	$objQuery = mysqli_query($objConnect,$strSQL);
	$obResult = mysqli_fetch_array($objQuery);

	if($obResult)
	{
		$arr["lawID"] = $obResult["lawID"];
		$arr["lawName"] = $obResult["lawName"];
		$arr["lawDetail"] = $obResult["lawDetail"];
		
		
	}

	mysqli_close($objConnect);

	/*** return JSON by newsId ***/

	/*{"lawID":"1","lawName":"ผลิต นำเข้า ส่งออก","lawDetail":"- จำคุก 1-10 ปีและปรับ 100,000 -1,000,000 บาท\r\n\r\n- ถ้าเป็นมอร์ฟีน ฝิ่น โคคาอีน จำคุก 20 ปี ถึงตลอดชีวิต และปรับ 2,000,000-5,000,000 บาท"}*/

	echo json_encode($arr,JSON_UNESCAPED_UNICODE);

?>