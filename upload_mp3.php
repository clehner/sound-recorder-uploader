<?php
// This file recieves the user's mp3 recording and saves it to the server.

if ($_SERVER['REQUEST_METHOD'] != 'POST')
	die('This page is only for uploading recordings.');

$date = @date("YmdHis");
$filename = $date . ".mp3";
$file = "recordings/" . $filename;
$songname = $_GET["name"] or $songname = $date;

$putdata = fopen("php://input", "r");
$fp = fopen($file, "w");

/* Read the data 1 KB at a time
   and write to the file */
while ($data = fread($putdata, 1024))
	fwrite($fp, $data);

fclose($fp);
fclose($putdata);

echo $filename;
