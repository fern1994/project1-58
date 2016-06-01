<?php
	header("content-type:text/javascript;charset=utf-8"); 
	$objConnect = mysqli_connect("localhost","root","","antidrugdb");
	mysqli_set_charset($objConnect, "utf8");

	//$_POST["txtKeyword"] = "";

	$strKeyword = $_POST["txtKeyword"];
	$strSQL = "SELECT * FROM lawtype5 WHERE 1 AND lawName LIKE '%".$strKeyword."%'  ORDER BY lawID ASC  ";
	$objQuery = mysqli_query($objConnect,$strSQL);
	$intNumField = mysqli_num_fields($objQuery);
	$resultArray = array();

	while($obResult = mysqli_fetch_array($objQuery))
	{
		$arrCol = array();
		for($i=0;$i<$intNumField;$i++)
		{
			$arrCol[mysqli_fetch_field_direct($objQuery, $i)->name] = $obResult[$i];
		}

		array_push($resultArray,$arrCol);
	}

	mysqli_close($objConnect);
	echo json_encode($resultArray,JSON_UNESCAPED_UNICODE);

?>