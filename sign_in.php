<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title><?php echo $lang['Lang0002']; ?></title>
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
                <li><a href="index.php"><?php echo $lang['Lang0005']; ?></a></li>
                <li class="sub-menu"><a href="index-1.php">xxxx</a><span></span>
                    <ul class="submenu">
                        <li><a href="searchDoctor.php"><?php echo $lang['Lang0006']; ?></a></li>
                        <li id="li_AppRecoder" class="hidden"><a href="userAppointmentRecoder.php"><?php echo $lang['Lang0007']; ?></a>
                        </li>
                        <li id="li_ClinicUser" class="hidden"><a href="clinicUpdUserInfo.php"><?php echo $lang['Lang0008']; ?></a>
                        </li>
                        <li id="li_Admin" class="hidden"><a href="adminQryClinic.php"><?php echo $lang['Lang0009']; ?></a></li>
                    </ul>
                </li>
                <li class="sub-menu"><a href="#"><?php echo $lang['Lang0010']; ?></a><span></span>
                    <ul class="submenu">
                        <li><a href="?lang=en">English</a></li>
                        <li><a href="?lang=ch">中文</a></li>     
                    </ul>
                </li>
                <li><a href="index-2.php"><?php echo $lang['Lang0011']; ?></a></li>
                <li><a href="index-3.php"><?php echo $lang['Lang0012']; ?></a></li>
                <li><a href="index-4.php"><?php echo $lang['Lang0013']; ?></a></li>
                <li class="active"><a href="sign_in.php"><?php echo $lang['Lang0014']; ?></a></li>
                <li><a href="sign_up_person.php"><?php echo $lang['Lang0015']; ?></a></li>
                <li class="sub-menu tourist"><a href="#" id="userinfo"><?php echo $lang['Lang0016']; ?></a><span></span>
                    <ul class="submenu hidden" id="sub_userinfo">
                        <li><a href="#" id="usertype"></a></li>

                        <li><button class="btn btn-danger" id="btn_out"><?php echo $lang['Lang0017']; ?></button></li>
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
				<div class="row df_content col-md-8 col-md-offset-2">
					<h2 class="wow fadeInRight"><?php echo $lang['Lang0021']; ?></h2>
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
							    <label for="USER_NAME" class="col-sm-2 control-label"><?php echo $lang['Lang0022']; ?><span class="span-red">*</span></label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="USER_NAME" name="USER_NAME" placeholder="<?php echo $lang['Lang0023']; ?>" autofocus >
							    </div>
							</div>
							<div class="form-group">
							    <label for="USER_PWD" class="col-sm-2 control-label"><?php echo $lang['Lang0024']; ?><span class="span-red">*</span></label>
							    <div class="col-sm-10">
							      <input type="password" class="form-control" id="USER_PWD" name="USER_PWD" placeholder="<?php echo $lang['Lang0025']; ?>">
							    </div>
							</div>

							<div class="radio col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="radio" name="usertype" id="usertype" value="0">
							    <?php echo $lang['Lang0026']; ?>
							  </label>
							</div>
							<div class="radio col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="radio" name="usertype" id="usertype" value="1" checked>
							   	<?php echo $lang['Lang0027']; ?>
							  </label>
							</div>
							<div class="radio col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="radio" name="usertype" id="usertype" value="2">
							   <?php echo $lang['Lang0028']; ?>
							  </label>
							</div>

							<div class="checkbox col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="checkbox" value="" id="ck_rmbUser">
							   	<?php echo $lang['Lang0029']; ?>
							  </label>
							</div>
							
							<div class="row">
								<div class="form-group pull-right">
									<button class="btn btn-lg btn-primary btn-block" id="signin_ok"><?php echo $lang['Lang0030']; ?></button>
								 </div>
							</div>
							<div class="row">
								<div class="form-group pull-right">
									<a href="forgotpwd.php"><strong><?php echo $lang['Lang0031']; ?></strong></a>
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
                <p class="privacy">&copy; <em id="copyright-year"></em> <i>|</i> <a href="index-5.php">Privacy Policy</a></p>
            </div>
        </div>
    </div>
</footer>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/sign_in.js"></script>
</body>
</body>
</html>