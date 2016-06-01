<?php
	header("content-type:text/javascript;charset=utf-8"); 
	$objConnect = mysqli_connect("localhost","root","","antidrugdb");
	mysqli_set_charset($objConnect, "utf8");

	//$_POST["sDrugID"] = "3"; // for Sample

	$strDrugID = $_POST["sDrugID"];
	$strSQL = "SELECT * FROM drug WHERE 1 AND drugID = '".$strDrugID."'  ";
 
	$objQuery = mysqli_query($objConnect,$strSQL);
	$obResult = mysqli_fetch_array($objQuery);

	if($obResult)
	{
		$arr["drugID"] = $obResult["drugID"];
		$arr["drugName"] = $obResult["drugName"];
		$arr["drugDetail"] = $obResult["drugDetail"];
		
		
	}

	mysqli_close($objConnect);

	/*** return JSON by newsId ***/

	/*{"drugID":"1","drugName":"ฝิ่น","drugDetail":"ชื่อทั่วไป :ฝิ่น (Opium)\r\nชื่ออื่น ๆ :PAPAVER SOMNIFERUM และ PAPAVER BRACTEATUM (ชื่อทางพฤกษศาสตร์) หมู (ฝิ่นที่คลุกยาฉุน ยาเส้น ใบพลู ใบจาก หรือกัญชาใช้ม้วนสูบด้วยกล้อง)\r\nสารเคมีที่ออกฤทธิ์ : Morphine และ อัลคาลอยด์ของฝิ่น\r\nลักษณะทางกายภาพ\r\nเนื้อฝิ่นได้มาจากยางของผลฝิ่นที่ถูกกรีดจะมีสีขาว เมื่อถูกอากาศจะมีสีคล้ำลง กลายเป็นยางเหนียวสีน้ำตาลไหม้ หรือดำ มีกลิ่นเหม็นเขียวและรสขม เรียนว่า “ฝิ่นดิบ” ส่วนฝิ่นที่มีการนำมาใช้เสพ เรียกว่า “ฝิ่นสุก” ได้มาจากนำฝิ่นดิบไปต้มหรือเคี่ยวจนสุก\r\n"}*/

	echo json_encode($arr,JSON_UNESCAPED_UNICODE);

?>