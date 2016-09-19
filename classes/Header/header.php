<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title><?php echo $lang['Lang0001']; ?></title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" ><!-- dialog --><link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="fonts/font-awesome.css">
<!-- User CSS -->
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/focusdata.css">
<!-- datetime -->
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">


<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.equalheights.js"></script> 
<script src="js/sForm.js"></script> 

<!--[if (gt IE 9)|!(IE)]><!-->
<script src="js/wow/wow.js"></script>
<script src="js/wow/device.min.js"></script>
<script>
    $(document).ready(function () {       
      if ($('html').hasClass('desktop')) {
        new WOW().init();
      }   
    });
</script>
<!--<![endif]-->

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

    <div id="ie6-alert" style="width: 100%; text-align:center;">
    <img src="http://beatie6.frontcube.com/images/ie6.jpg" alt="Upgrade IE 6" width="640" height="344" border="0" usemap="#Map" longdesc="http://die6.frontcube.com" />
      <map name="Map" id="Map"><area shape="rect" coords="496,201,604,329" href="http://www.microsoft.com/windows/internet-explorer/default.aspx" target="_blank" alt="Download Interent Explorer" /><area shape="rect" coords="380,201,488,329" href="http://www.apple.com/safari/download/" target="_blank" alt="Download Apple Safari" /><area shape="rect" coords="268,202,376,330" href="http://www.opera.com/download/" target="_blank" alt="Download Opera" /><area shape="rect" coords="155,202,263,330" href="http://www.mozilla.com/" target="_blank" alt="Download Firefox" />
        <area shape="rect" coords="35,201,143,329" href="http://www.google.com/chrome" target="_blank" alt="Download Google Chrome" />
      </map>
  </div>
  <![endif]-->
</head>
<body>
<!--header-->
<div class="container bars"><em class="bars_"></em></div>
<header>
<nav class="navbar navbar-default navbar-static-top tm_navbar clearfix" role="navigation">
        <div class="container">
            <ul class="nav sf-menu clearfix">
                <li id="li_home" class="hidden active"><a href="index.php"><!-- Home --><?php echo $lang['Lang0005']; ?></a></li>
                <li class="sub-menu"><a href="#"><?php echo $lang['Lang0010']; ?></a><span></span>
                    <ul class="submenu">
                        <li><a href="?lang=en">English</a></li>
                        <li><a href="?lang=ch">中文</a></li>     
                    </ul>
                </li>

                <li><a href="index-2.php"><!-- about us --><?php echo $lang['Lang0011']; ?></a></li>
                <li><a href="index-3.php"><!-- staff --><?php echo $lang['Lang0012']; ?></a></li>
                <li><a href="index-4.php"><!-- Contacts --><?php echo $lang['Lang0013']; ?></a></li>
                <li id="sign_in"><a href="sign_in.php"><!-- Sign in --><?php echo $lang['Lang0014']; ?></a></li>
                <li id="sign_up"><a href="sign_up_person.php"><!-- register --><?php echo $lang['Lang0015']; ?></a></li>
                <li class="sub-menu tourist"><a href="#" id="userinfo"><!-- 游客 --><?php echo $lang['Lang0016']; ?></a><span></span>
                    <ul class="submenu" id="sub_userinfo">
                        <li><a href="#" id="usertype"></a></li>
                        <li><a href="#">账户管理</a></li>
                        <li id="li_SearchDoctor" class="hidden"><a href="searchDoctor.php"><!-- 搜索|预约医生 --><?php echo $lang['Lang0006']; ?></a></li>
                        <li id="li_AppRecoder" class="hidden"><a href="userAppointmentRecoder.php"><!-- 个人用户管理 --><?php echo $lang['Lang0007']; ?></a>
                        </li>
                        <li id="li_ClinicUser" class="hidden"><a href="clinicUpdUserInfo.php"><!-- 诊所用户管理 --><?php echo $lang['Lang0008']; ?></a>
                        </li>
                        <li id="li_Admin" class="hidden"><a href="adminQryClinic.php"><!-- 管理员管理 --><?php echo $lang['Lang0009']; ?></a></li>
                        <li><button class="btn btn-danger" id="btn_out"><!-- 安全退出 --><?php echo $lang['Lang0017']; ?></button></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
<h1 class="navbar-brand navbar-brand_"><a href="#"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>