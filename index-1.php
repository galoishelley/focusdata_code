<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>our services</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" ><!-- dialog --><link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="fonts/font-awesome.css">
<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.equalheights.js"></script> 
<script src="js/jquery.ui.totop.js"></script>

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
                <li><a href="index.php">home</a></li>
                <li class="sub-menu"><a href="index-1.php">our services</a><span></span>
                    <ul class="submenu">
                        <li class="active"><a href="userAppointmentRecoder.php">个人用户管理</a><span class="fa fa-angle-right"></span>
                             <ul class="submenu">
                                <li><a href="userAppointmentRecoder.php">预约记录</a></li>
                                <li><a href="userManagement.html?iflag=userUpdPersonInfo">修改个人用户信息</a><span class="fa fa-angle-right"></span>
                                     <ul class="submenu">
                                        <li><a href="#">修改用户信息</a></li>
                                        <li><a href="#">修改密码</a></li>
                                    </ul> 
                                </li>
                                <li><a href="#">收藏医生管理</a></li>
                                <li><a href="#">常用搜索条件管理</a></li>
                                
                            </ul> 
                        </li>
                        <li><a href="searchDoctor.php">搜索|预约医生</a></li>
                        <li><a href="clinicManagement.html">Clinic Management</a><span class="fa fa-angle-right"></span>
                            <ul class="submenu">
                                <li><a href="#">Update Clinic user info</a></li>
                                <li><a href="#">Update Doctor info</a></li>
                                <li><a href="#">Update Pwd</a></li>
                            </ul> 
                        </li>
                        
                        <li><a href="adminManagement.html">Admin Management</a></li>
                    </ul>
                </li>
                <li><a href="index-2.php"><!-- about us --><?php echo $lang['Lang0011']; ?></a></li>
                <li><a href="index-3.php">staff</a></li>
                <li><a href="index-4.php">Contacts</a></li>
                <li><a href="sign_in.php">Sign in</a></li>
                <li><a href="sign_up_person.php">Sign up</a></li>
                <li class="sub-menu tourist"><a href="#" id="userinfo">游客</a><span></span>
                    <ul class="submenu">
                        <li><a href="#" id="usertype">用户类型:游客</a></li>
                        <li><a href="#">账户管理</a></li>
                        <li><button class="btn btn-danger" id="btn_out">安全退出</button></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <h1 class="navbar-brand navbar-brand_"><a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>
<!--content-->
<div class="content">  
    <div class="stellar-section">
        <div class="thumb-box9" data-stellar-background-ratio="0.1">
            <div class="container">
                <h2 class="wow fadeInRight">Our Services</h2>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 wow fadeInLeft" data-wow-delay="0.3s">
                        <div class="thumb-pad1-1 maxheight">
                            <div class="thumbnail">
                                <figure><img src="img/page2_pic1.jpg" alt=""></figure>
                                <div class="caption">
                                    <strong>Doctor's appointment</strong>
                                    <p>Doloertas nemo lasasede vole rnatur odiaut taiades goertay. Nernsequ unturera magni dolores eo doloreasqui ratione mias miasera voluptate.</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 wow fadeInLeft" data-wow-delay="0.2s">
                        <div class="thumb-pad1-1 maxheight">
                            <div class="thumbnail">
                                <figure><img src="img/page2_pic2.jpg" alt=""></figure>
                                <div class="caption">
                                    <strong>Clinic Management</strong>
                                    <p>Doloertas nemo lasasede vole rnatur odiaut taiades goertay. Nernsequ unturera magni dolores eo doloreasqui ratione mias miasera voluptate.</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 wow fadeInLeft" data-wow-delay="0.1s">
                        <div class="thumb-pad1-1 maxheight">
                            <div class="thumbnail">
                                <figure><img src="img/page2_pic3.jpg" alt=""></figure>
                                <div class="caption">
                                    <strong>User management</strong>
                                    <p>Doloertas nemo lasasede vole rnatur odiaut taiades goertay. Nernsequ unturera magni dolores eo doloreasqui ratione mias miasera voluptate.</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 wow fadeInLeft">
                        <div class="thumb-pad1-1 maxheight">
                            <div class="thumbnail">
                                <figure><img src="img/page2_pic4.jpg" alt=""></figure>
                                <div class="caption">
                                    <strong>Administrator Management</strong>
                                    <p>Doloertas nemo lasasede vole rnatur odiaut taiades goertay. Nernsequ unturera magni dolores eo doloreasqui ratione mias miasera voluptate.</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<?php
include_once 'classes/Footer/Footer.php';
?>
<?php
include_once 'classes/Language/For_JS_multi_lang.php';
?>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
</body>
</html>