<?php
	// header("Content-type: text/html; charset=utf-8"); 
	//不存在当前上传文件则上传
	$t=time();
	
	if(!file_exists($_FILES['upload_file']['name']))
		move_uploaded_file($_FILES['upload_file']['tmp_name'],"../img/doctors/".$_FILES['upload_file']['name'].".".$t);
	//输出图片文件<img>标签
	$r="<textarea><img id='doctor_img' src=img/doctors/". $_FILES['upload_file']['name'].".".$t."></textarea><p>".$_FILES['upload_file']['name'].".".$t."</p>";
    echo $r;


//End_php
?>