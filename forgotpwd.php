<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>forgot password</title>
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
<!--User CSS-->
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/focusdata.css">
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
    <?php
include_once 'classes/Menu/menu.php';
?>
    <h1 class="navbar-brand navbar-brand_"><a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>

<!--content-->
<div class="content forgotpwd">
    <div class="stellar-section">
        <div class="thumb-box9" data-stellar-background-ratio="0.1">
	       <div class="container">
			     <div class="row">
				    <div class="col-md-8 col-md-offset-2">
    					<h2 class="wow fadeInRight"><!-- Forgot Password--><?php echo $lang['Lang0183']; ?></h2>
    					<form class="form-horizontal wow fadeInRight" data-wow-delay="0.5s" role="form">
    						<fieldset>
                                <div class="form-group">
                                    <label for="USER_NAME" class="col-sm-2 control-label"><!-- 用户名--><?php echo $lang['Lang0184']; ?><span class="span-red">*</span></label>
                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="USER_NAME" name="USER_NAME" placeholder="<!-- 请输入用户名 ...--><?php echo $lang['Lang0185']; ?>" autofocus>
                                    </div>
                                </div>

                                <div class="radio col-sm-10 col-sm-offset-2">
                                  <label>
                                    <input type="radio" name="usertype" id="usertype" value="0">
                                    <!-- 诊所用户--><?php echo $lang['Lang0186']; ?>
                                  </label>
                                </div>
                                
                                <div class="radio col-sm-10 col-sm-offset-2">
                                  <label>
                                    <input type="radio" name="usertype" id="usertype" value="1" checked>
                                    <!-- 个人用户--><?php echo $lang['Lang0187']; ?>
                                  </label>
                                </div>

                                <div class="radio col-sm-10 col-sm-offset-2 radio_admin">
                                  <label>
                                    <input type="radio" name="usertype" id="usertype" value="2">
                                   <!-- 管理员--><?php echo $lang['Lang0188']; ?>
                                  </label>
                                </div> 

                                <div class="form-group">
                                    <label for="EMAIL" class="col-sm-2 control-label"><!-- E-mail--><?php echo $lang['Lang0189']; ?><span class="span-red">*</span></label>
                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="EMAIL" name="EMAIL" readonly="true">
                                    </div>
                                </div>
    							
    							<div class="row">
                                    <div class="form-group pull-right send_email">
                                        <button type="submit" class="btn btn-lg btn-primary btn-block" id="send_email"><!-- 发送密码到邮箱--><?php echo $lang['Lang0190']; ?></button>
                                     </div>
                                </div>

                                <div class="row">
                                    <div class="form-group pull-right">
                                        <a href="sign_in.php"><strong><!-- sign in--><?php echo $lang['Lang0191']; ?></strong></a>
                                        <!-- <div class="pull-right">sign in</div> -->
                                    </div>
                                </div>
    						</fieldset>
    					</form>
                    </div>
				</div>
            </div>
            <!-- container -->
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