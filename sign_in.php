<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title><?php echo $lang['PAGE_TITLE_SIGN_IN']; ?></title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" >
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="fonts/font-awesome.css">
<!--User CSS-->
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
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
                <li><a href="index.php"><?php echo $lang['MENU_HOME']; ?></a></li>
                <li class="sub-menu"><a href="index-1.html"><?php echo $lang['MENU_our_service']; ?></a><span></span>
                    <ul class="submenu">
                        <li><a href="searchDoctor.html"><?php echo $lang['MENU_searchDoctor']; ?></a></li>
                        <li id="li_AppRecoder" class="hidden"><a href="userAppointmentRecoder.html"><?php echo $lang['MENU_userAppointmentRecoder']; ?></a>
                        </li>
                        <li id="li_ClinicUser" class="hidden"><a href="clinicUpdUserInfo.html"><?php echo $lang['MENU_clinicUpdUserInfo']; ?></a>
                        </li>
                        <li id="li_Admin" class="hidden"><a href="adminQryClinic.html"><?php echo $lang['MENU_adminQryClinic']; ?></a></li>
                    </ul>
                </li>
                <li class="sub-menu"><a href="#"><?php echo $lang['MENU_Language']; ?></a><span></span>
                    <ul class="submenu">
                        <li><a href="?lang=en">English</a></li>
                        <li><a href="?lang=ch">中文</a></li>     
                    </ul>
                </li>
                <li><a href="index-2.html"><?php echo $lang['MENU_aboutus']; ?></a></li>
                <li><a href="index-3.html"><?php echo $lang['MENU_staff']; ?></a></li>
                <li><a href="index-4.html"><?php echo $lang['MENU_Contacts']; ?></a></li>
                <li class="active"><a href="sign_in.php"><?php echo $lang['MENU_sign_in']; ?></a></li>
                <li><a href="sign_up_person.html"><?php echo $lang['MENU_sign_up_person']; ?></a></li>
                <li class="sub-menu tourist"><a href="#" id="userinfo"><?php echo $lang['MENU_guest']; ?></a><span></span>
                    <ul class="submenu hidden" id="sub_userinfo">
                        <li><a href="#" id="usertype"></a></li>

                        <li><button class="btn btn-danger" id="btn_out"><?php echo $lang['MENU_sign_out']; ?></button></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <h1 class="navbar-brand navbar-brand_"><a href="index.php"><img src="img/<?php echo $lang['HOME_LOGO']; ?>" alt="logo"></a></h1>
</header>

<!--content-->
<div class="content">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<div class="row df_content col-md-8 col-md-offset-2">
					<h2 class="wow fadeInRight"><?php echo $lang['PageSignInSignIn']; ?></h2>
					<!-- <div>&nbsp;</div>
					<h2 class="indent">Sign in</h2> -->
					<form class="form-horizontal wow fadeInUp" role="form" id="signin_form" >
					<!-- onsubmit="return false;" -->
						<fieldset>
							<!-- <div class="form-group has-error has-feedback">
								<!--<label class="control-label" for="inputError2">Input with error</label>
								<input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status" readonly value="Info: Please sign in">
								<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
								<span id="inputError2Status" class="sr-only">(error)</span>
							</div> -->
							<div class="form-group">
							    <label for="USER_NAME" class="col-sm-2 control-label"><?php echo $lang['PageSignInUser']; ?><span class="span-red">*</span></label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="USER_NAME" name="USER_NAME" placeholder="<?php echo $lang['PageSignInUserHint']; ?>" autofocus >
							    </div>
							</div>
							<div class="form-group">
							    <label for="USER_PWD" class="col-sm-2 control-label"><?php echo $lang['PageSignInPWD']; ?><span class="span-red">*</span></label>
							    <div class="col-sm-10">
							      <input type="password" class="form-control" id="USER_PWD" name="USER_PWD" placeholder="<?php echo $lang['PageSignInPWDHint']; ?>">
							    </div>
							</div>

							<div class="radio col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="radio" name="usertype" id="usertype" value="0">
							    <?php echo $lang['PageSignInClinic']; ?>
							  </label>
							</div>
							<div class="radio col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="radio" name="usertype" id="usertype" value="1" checked>
							   	<?php echo $lang['PageSignInPerson']; ?>
							  </label>
							</div>
							<div class="radio col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="radio" name="usertype" id="usertype" value="2">
							   <?php echo $lang['PageSignInAdmin']; ?>
							  </label>
							</div>

							<div class="checkbox col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="checkbox" value="" id="ck_rmbUser">
							   	<?php echo $lang['PageSignInRememberMe']; ?>
							  </label>
							</div>
							
							<div class="row">
								<div class="form-group pull-right">
									<button class="btn btn-lg btn-primary btn-block" id="signin_ok"><?php echo $lang['PageSignInBtnSignIn']; ?></button>
								 </div>
							</div>
							<div class="row">
								<div class="form-group pull-right">
									<a href="forgotpwd.html"><strong><?php echo $lang['PageSignInBtnForgetPWD']; ?></strong></a>
									<!-- <div class="pull-right">sign in</div> -->
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!--footer-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 center">
                <ul class="follow_icon">
                    <li><a href="#" class="fa fa-twitter"></a></li>
                    <li><a href="#" class="fa fa-facebook"></a></li>
                    <li><a href="#" class="fa fa-google-plus"></a></li>
                    <li><a href="#" class="fa fa-rss"></a></li>
                    <li><a href="#" class="fa fa-pinterest"></a></li>
                    <li><a href="#" class="fa fa-linkedin"></a></li>
                </ul>
            </div>
            <div class="col-lg-12 center">
                <p>84, Charing Cross Road,London<br>JL 851213-2340</p>
            </div>
            <div class="col-lg-12 center">
                <p class="privacy">&copy; <em id="copyright-year"></em> <i>|</i> <a href="index-5.html">Privacy Policy</a></p>
            </div>
        </div>
    </div>
</footer>
<script src="js/bootstrap.min.js"></script>
<script src="js/tm-scripts.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/sign_in.js"></script>
</body>
</body>
</html>