<?php 
//引入发送邮件类
require("smtp.php"); 
//使用163邮箱服务器
// $smtpserver = "smtp.163.com";
// $smtpserver = "smtp.qq.com";
$smtpserver = "smtp.qq.com";
// $smtpserver = "pop.qq.com";
//163,qq邮箱服务器端口 
// $smtpserverport = 465;
$smtpserverport = 465;
//你的163服务器邮箱账号
// $smtpusermail = "@163.com";
$smtpusermail = "316515820@qq.com";
//收件人邮箱
$smtpemailto = "316515820@qq.com";
//你的邮箱账号(去掉@163.com)
$smtpuser = "316515820";//SMTP服务器的用户帐号 
//你的邮箱密码
$smtppass = "yegdodsgpnkwbhcb"; //SMTP服务器的用户密码 
//邮件主题 
$mailsubject = "密码重置";
//邮件内容 
$mailbody = "PHP+MySQL";
//邮件格式（HTML/TXT）,TXT为文本邮件 
$mailtype = "TXT";
//这里面的一个true是表示使用身份验证,否则不使用身份验证. 
// $smtp = new smtp($smtpserver,$smtpserverport,true,$smtpuser,$smtppass);
$smtp = new smtp($smtpserver,$smtpserverport,true,$smtpuser,$smtppass);
//是否显示发送的调试信息 
$smtp->debug = TRUE;
//发送邮件
$smtp->sendmail($smtpemailto, $smtpusermail, $mailsubject, $mailbody, $mailtype); 

// echo "<div style='width:300px; margin:36px auto;'>";
// 	if($state==""){
// 		echo "对不起，邮件发送失败！请检查邮箱填写是否有误。";
// 		echo "<a href='index.php'>点此返回</a>";
// 		exit();
// 	}
// 	echo "恭喜！邮件发送成功！！";
// 	echo "<a href='index.php'>点此返回</a>";
// 	echo "</div>";
?>