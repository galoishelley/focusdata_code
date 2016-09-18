<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>appointment doctor</title>
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
                <li id="li_home" class="hidden"><a href="index.php">home</a></li>
                <li class="sub-menu"><a href="#">多语言</a><span></span>
                    <ul class="submenu">
                        <li><a href="?lang=en">English</a></li>
                        <li><a href="?lang=ch">中文</a></li>     
                    </ul>
                </li>
                <li><a href="index-2.php">about us</a></li>
                <li><a href="index-3.php">staff</a></li>
                <li><a href="index-4.php">Contacts</a></li>
                <li id="sign_in" class="hidden"><a href="sign_in.php">Sign in</a></li>
                <li id="sign_up" class="hidden"><a href="sign_up_person.php">Sign up</a></li>
                <li class="sub-menu tourist active"><a href="#" id="userinfo">游客</a><span></span>
                    <ul class="submenu">
                        <li><a href="#" id="usertype"></a></li>
                        <li id="li_SearchDoctor" class="hidden"><a href="searchDoctor.php">搜索|预约医生</a></li>
                        <li id="li_AppRecoder" class="hidden"><a href="userAppointmentRecoder.php">个人用户管理</a>
                        </li>
                        <li id="li_ClinicUser" class="hidden"><a href="clinicUpdUserInfo.php">诊所用户管理</a>
                        </li>
                        <li id="li_Admin" class="hidden"><a href="adminQryClinic.php">管理员管理</a></li>
                        <li id="login_out" class="hidden"><button class="btn btn-danger" id="btn_out">安全退出</button></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <h1 class="navbar-brand navbar-brand_"><a href="#"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>

<!--content-->
<div class="content appointmentDoctor">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="doctor-info">
    	                    <h2>Doctor Info</h2>
    	                    <ul class="list4">
                                <li>
                                    <figure><img src="img/page2_pic10.jpg" class="img-responsive img-thumbnail" alt="" id="doctor_img"></figure>
                                </li>
    	                        <li>
    	                            <strong id="doctor_name"></strong>
    	                            <div class="extra-wrap">
                                        <p id="doctor_type"></p>
    	                                <p id="clinic_name"></p>
                                        <p id="clinic_addr"></p>
                                        <p id="doctor_details"></p>
    	                            </div>
    	                        </li>
    	                        <li>
    	                        	<appointment>预约时间</appointment>
                                    <h3 id="appointment_date"></h3>
                                    <div class="app_time" id="app_time">
    	                            <!-- <appointment id="app_time">2016-7-13 9:30</appointment> -->
    	                        </li>
    	                    </ul>
                        </div>
	                </div>
	                <div class="col-lg-4 col-md-4 col-sm-12 wow fadeInUp person-info" data-wow-delay="0.1s">
	                    <div class="thumb-box5_1">
				        	<div class="row">
					            <div class="box">
					                <strong>Personal Info</strong>
					                <p>如果您未注册,则需要输入以下信息,即可预约医生</p>
					            </div>
					        </div>
				            
				            <div class="row">

                            <form class="form-inline wow fadeInLeft" role="form" id="appointmentDoctor">

                                <input type="hidden" class="form-control" name="action_type" id="action_type" value="create">

                                <div class="form-group col-md-12 col-lg-12">
                                    <label for="CUSTOMER_USER_NAME" class="col-md-3 col-lg-3 control-label">用户名<span class="span-red">*</span></label>
                                    <input type="text" class="form-control" id="CUSTOMER_USER_NAME" name="CUSTOMER_USER_NAME">
                                </div>

                                <div class="form-group col-md-12 col-lg-12">
                                    <label for="CUSTOMER_USER_PWD" class="col-md-3 col-lg-3 control-label">密码<span class="span-red">*</span></label>
                                    <input type="password" class="form-control" name="CUSTOMER_USER_PWD" id="CUSTOMER_USER_PWD">
                                </div>

                                <div class="form-group col-md-12 col-lg-12">
                                    <label for="CUSTOMER_NAME" class="col-md-3 col-lg-3  control-label">姓名<span class="span-red">*</span></label>
                                    <input type="text" class="form-control" name="CUSTOMER_NAME" id="CUSTOMER_NAME">
                                </div>

                                <div class="form-group col-md-12 col-lg-12">
                                    <label for="CUSTOMER_GENDER" class="col-md-3 col-lg-3 control-label">性别<span class="span-red">*</span></label>
                                    <select class="form-control"  name="CUSTOMER_GENDER" id="CUSTOMER_GENDER">
                                        <option>男</option>
                                        <option>女</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 col-lg-12">
                                    <label for="CUSTOMER_BIRTHDAY" class="col-md-3 col-lg-3  control-label">生日<span class="span-red">*</span></label>
                                    <input type="text" class="form-control" name="CUSTOMER_BIRTHDAY" id="CUSTOMER_BIRTHDAY">
                                </div>

                                <div class="form-group col-md-12 col-lg-12">
                                    <label for="CUSTOMER_ADDR" class="col-md-3 col-lg-3  control-label">住址<span class="span-red">*</span></label>
                                    <input type="text" class="form-control" name="CUSTOMER_ADDR" id="CUSTOMER_ADDR">
                                </div>

                                <div class="form-group col-md-12 col-lg-12">
                                    <label for="CUSTOMER_PHONE_NO" class="col-md-3 col-lg-3  control-label">手机号<span class="span-red">*</span></label>
                                    <input type="text" class="form-control" name="CUSTOMER_PHONE_NO" id="CUSTOMER_PHONE_NO">
                                </div>

                                <div class="form-group col-md-12 col-lg-12">
                                    <label for="MEDICAL_CARD_NO" class="col-md-3 col-lg-3  control-label">医疗卡号<span class="span-red">*</span></label>
                                    <input type="text" class="form-control" name="MEDICAL_CARD_NO" id="MEDICAL_CARD_NO">
                                </div>

                            </form>

					            <!-- <form  id="appointmentDoctor_form"  role="form"> -->
					        <!--     <div class="success" style="display: none;">Your subscribe request<br> has been sent!</div> -->
                                <!-- <form id="newsletter"> -->
                                <!-- <form role="form">
                                      <div class="success" style="display: none;">Your subscribe request<br> has been sent!</div> 
					              	<fieldset>


                                       

					                	<input type="password" class="form-control" placeholder="PassWord" name="CUSTOMER_USER_PWD" id="CUSTOMER_USER_PWD" >
					                	<input type="text" class="form-control" placeholder="PhoneCodes" name="verifyCode" id="verifyCode">
                                        <select class="form-control"  name="CUSTOMER_GENDER" id="CUSTOMER_GENDER">
                                            <option class="sele_gender">男</option>
                                            <option class="sele_gender">女</option>
                                        </select>
					                	<input type="text" class="form-control" placeholder="Birthday" name="CUSTOMER_BIRTHDAY" id="CUSTOMER_BIRTHDAY">
					                	<input type="text" class="form-control" placeholder="Home Address"  name="CUSTOMER_ADDR" id="CUSTOMER_ADDR">
					                	<input type="text" class="form-control" placeholder="Phone Number"  name="CUSTOMER_PHONE_NO" id="CUSTOMER_PHONE_NO">
					                	<input type="text" class="form-control" placeholder="Medical Card"  name="MEDICAL_CARD_NO" id="MEDICAL_CARD_NO">

                                        <!-- <a class="btn btn-default btn6" href="searchDoctor.php" style="padding:15px 33px 25px 33px;">
                                          <span class="glyphicon  glyphicon-arrow-left"> 搜索医生</span>
                                        </a>
                                        <button class="btn btn-default btn6" id="btn_submit">Appointment Doctor</button> 
					                	<!-- <button class="btn-default btn6" id="btn_submit">Appointment Doctor</button> 
					            	</fieldset>
					          	</form> -->
				        	</div>
				        
					    </div>
				    	
			        	<div class="row">
			        		<button class="btn btn-danger btn-block" id="btn_submit">Appointment Doctor</button>
			        	</div>
			        	<div class="row">
			        		<button class="btn btn-primary btn-block" id="btn_savedoctor">收藏医生</button>
			        	</div>
						<div class="row">
			        		<a class="btn btn-warning btn-block" href="searchDoctor.php">
                              <span class="glyphicon  glyphicon-arrow-left"> 搜索医生</span>
                            </a>
			        	</div>
	                </div>
				</div>
			</div>
		</div>
	</div>
</div>
<input type="hidden" id="CUSTOMER_USER_ID"/>
<input type="hidden" id="DOCTOR_ID"/>
<!--footer -->
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
<script src="js/main/appointmentDoctor.js"></script>

</body>
</html>