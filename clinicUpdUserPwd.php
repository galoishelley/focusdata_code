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
<!--user css-->
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/focusdata.css">
<!--datetables css-->
<link rel="stylesheet" href="js/datatables/dataTables.bootstrap.min.css">
<!-- datetime -->
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.equalheights.js"></script> 
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.cookie.js"></script>



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
    <h1 class="navbar-brand navbar-brand_"><a href="#"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>

<!--content--> 
<div class="content">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<div class="row left_con">
					<div class="col-lg-3 col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.1s">
						<div class="list-group">
              <a href="clinicUpdUserInfo.php" class="list-group-item" id="user_appointment_recoder" ><!-- 修改诊所用户信息--><?php echo $lang['Lang0229']; ?></a>
                					<a href="clinicQryDoctor.php" class="list-group-item" id="user_upd_person_info"><!-- 医生信息管理--><?php echo $lang['Lang0230']; ?></a>
                				<a href="clinicUpdUserPwd.php" class="list-group-item active" id="user_upd_person_pwd"><!-- 修改诊所用户密码--><?php echo $lang['Lang0231']; ?></a>
            </div>
					</div>

					<div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s">
          <div class="PersonUser">
                <h2><!-- 修改诊所用户密码--><?php echo $lang['Lang0231']; ?></h2>
                <div class="row">

                  <form class="form-inline wow fadeInLeft" role="form" id="userUpdPersonPwd">

                      <input type="hidden" class="form-control" name="action_type" id="action_type" value="update">
                      <input type="hidden" class="form-control" name="CUSTOMER_USER_ID" id="CUSTOMER_USER_ID">

                      <div class="form-group col-md-10">
                        <label for="CUSTOMER_USER_NAME" class="col-md-4 control-label"><!-- 用户名--><?php echo $lang['Lang0111']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" id="CUSTOMER_USER_NAME" name="CUSTOMER_USER_NAME" readonly="true">
                      </div>

                      <div class="form-group col-md-10">
                        <label for="CUSTOMER_USER_PWD" class="col-md-4 control-label"><!-- 旧密码--><?php echo $lang['Lang0112']; ?><span class="span-red">*</span></label>
                        <input type="password" class="form-control" id="CUSTOMER_USER_PWD">
                      </div>

                      <div class="form-group col-md-10">
                        <label for="CUSTOMER_USER_NEWPWD" class="col-md-4 control-label"><!-- 新密码--><?php echo $lang['Lang0113']; ?><span class="span-red">*</span></label>
                        <input type="password" class="form-control" id="CUSTOMER_USER_NEWPWD">
                      </div>

                      <div class="form-group col-md-10">
                        <label for="CUSTOMER_USER_C_NEWPWD" class="col-md-4 control-label"><!-- 确认新密码--><?php echo $lang['Lang0114']; ?><span class="span-red">*</span></label>
                        <input type="password" class="form-control" id="CUSTOMER_USER_C_NEWPWD">
                      </div>

                      <div class="form-group col-md-10">
                        <!-- <div class="col-md-12"> -->
                          <button class="btn btn-primary pull-right" id="btn_ok"><!-- 确定--><?php echo $lang['Lang0115']; ?></button>
                        <!-- </div> -->
                      </div>
                    </form>

                  </div> 
                <!-- row -->
              </div>
          </div>
          <!-- wow -->
				</div>
        <!-- row -->
			</div>
      <!-- container -->
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
<!-- 为了实现js多语言 begin -->

<!-- 总开关，为了设置第三方库的多语言而设置 -->
<div id="which_lang" style="display: none;"><?php echo $_SESSION ['lang']; ?></div>

<!-- 密码重置成功! -->
<div id="Lang0032" style="display: none;"><?php echo $lang['Lang0032']; ?></div>

<!-- 请选择需要修改的数据 -->
<div id="Lang0033" style="display: none;"><?php echo $lang['Lang0033']; ?></div>

<!-- 确定修改 -->
<div id="Lang0018" style="display: none;"><?php echo $lang['Lang0018']; ?></div>

<!-- 您未登陆,无法使用此功能 -->
<div id="Lang0019" style="display: none;"><?php echo $lang['Lang0019']; ?></div>

<!-- 请修改个人信息，添加邮箱地址 -->
<div id="Lang0020" style="display: none;"><?php echo $lang['Lang0020']; ?></div>

<!-- 详细 -->
<div id="Lang0056" style="display: none;"><?php echo $lang['Lang0056']; ?></div>

<!-- 修改-->
<div id="Lang0057" style="display: none;"><?php echo $lang['Lang0057']; ?></div>

<!-- 密码重置 -->
<div id="Lang0058" style="display: none;"><?php echo $lang['Lang0058']; ?></div>

<!-- 两次密码输入不一致 -->
<div id="Lang0116" style="display: none;"><?php echo $lang['Lang0116']; ?></div>

<!-- 为了实现js多语言 end -->
<!-- DataTables JavaScript -->
<script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- datetime -->
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/clinicUpdUserPwd.js"></script>
</body>
</html>