<?php

	header("Content-Type:application/json");
	$con = mysql_conect("localhost", "root", "");
	mysql_select_db("books_db", $con);
	
	if(!empty($_GET['bookid']))
	{
		$bookId = $_GET['bookid'];
		
		$db_query = "select * from bookauthorinfo where bookid = $bookId;";
		
		$query_result = mysql_db_query($db_query, $con) ;
		if(!empty($query_result))
		{
			Response(200, "book found", $query_result);
		}

	}
	else
	{
		$db_query = "select * from bookauthorinfo;";
		
		$query_result = mysql_db_query($db_query, $con) ;
		if(!empty($query_result))
		{	
			Response(200, "book found", $query_result);
		}
	}

	function Response($status, $statusMsg, $query_result1)
	{
		header("HTTP 1.1 $status $statusMsg");
		
		if(rows($query_result1) <= 0)
		{
			echo "No such book present in Database";
		}
		else
		{
			while($row = mysql_fetch_array($query_result1))
			{
				$response['bookid'] = $row['bookid'];
				$response['title'] = $row['title'];
				$response['authors'] = $row['authors'];
				$response['year'] = $row['year'];
				$response['price'] = $row['price'];
				$response['category'] = $row['category'];
				$resp[] = $response;
			}
			echo json_encode($resp);
		}
	}
?>
