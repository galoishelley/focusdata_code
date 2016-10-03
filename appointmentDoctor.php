<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>about us</title>
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
<!--user css-->
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
<!-- <div class="content searchDoctorDetail"> -->
<div class="content appointmentDoctor">
    <div class="stellar-section">
        <div class="thumb-box9" data-stellar-background-ratio="0.1">
            <div class="container">
                <h2 class="wow fadeInRight"><!-- 我们的医生--><?php echo $lang['Lang0312']; ?></h2>
                <div class="row">
                    <div class="wow fadeIn maxheight">
                        <div class="extra-wrap col-md-5 col-lg-5">
                        <!-- <div class="thumb-pad2-1 col-md-5 col-lg-5"> -->
                            <!-- <div class="thumbnail"> -->
                                <img src="img/page2_pic10.jpg" class="img-responsive img-thumbnail" alt="" id="doctor_img">
                                
                                <div class="pull-left">
                                    <h2 id="doctor_name"></h2>
                                    <p id="doctor_type"></p>
                                    <p id="clinic_name"></p>
                                    <p id="clinic_addr"></p>
                                    <p id="doctor_details"></p>
                                </div>
                            <!-- </div> -->
                        </div>
                        <div class="extra-wrap col-md-4 col-lg-4">
                            <div class="row appointment_date">
                                <label for="APPOINTMENT_DATE" class="col-md-6 col-lg-6"><!-- 可预约日期--><?php echo $lang['Lang0313']; ?><span class="span-red">*</span></label>
                                <div class="col-md-10 col-lg-10">
                                    <select class="form-control" id="APPOINTMENT_DATE" name="APPOINTMENT_DATE">
                                    </select>
                                </div>
                            </div>
                                
                            <div class="row app_time" id="app_time">
                                <!-- <appointment id="app_time">2016-7-13 9:30</appointment> -->
                               <!--  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                  搜索条件
                                </button> -->

                            </div>
                        </div>
                        <div class="extra-wrap-bottom col-md-3 col-lg-3">
                            <a class="btn btn-primary" href="userSaveDoctor.php" id="btn_savedoctor_manage"><!-- 收藏医生管理--><?php echo $lang['Lang0278']; ?></a>
                            <button class="btn btn-warning" id="btn_savedoctor"><!-- 收藏医生--><?php echo $lang['Lang0171']; ?></button>
                         <!--    <a class="btn btn-primary" href="searchDoctor.php">
                              <span class="glyphicon  glyphicon-arrow-left"> 搜索医生</span>
                            </a> -->
                            <!-- <button class="btn btn-default" id="btn_return">返回</button> -->
                            <button class="btn btn-danger" id="btn_submit"><!-- 预约医生--><?php echo $lang['Lang0291']; ?></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    

    <input type="hidden" id="CUSTOMER_USER_ID"/>
    <input type="hidden" id="DOCTOR_ID"/>
    <div class="modal fade bs-example-modal-lg" role="dialog" aria-labelledby="gridSystemModalLabel" id="myModal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h2 class="modal-title" id="gridSystemModalLabel"><!-- 注册|预约医生--><?php echo $lang['Lang0314']; ?></h2>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                         <form class="form-inline" role="form" id="modal_form">

                            <input type="hidden" class="form-control" name="action_type" id="action_type" value="create">

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="CUSTOMER_USER_NAME" class="col-md-3 col-lg-3"><!-- 用户名--><?php echo $lang['Lang0047']; ?><span class="span-red">*</span></label>
                                <input type="text" class="form-control" id="CUSTOMER_USER_NAME" name="CUSTOMER_USER_NAME">
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="CUSTOMER_USER_MAIL" class="col-md-3 col-lg-3"><!-- 邮箱--><?php echo $lang['Lang0048']; ?><span class="span-red">*</span></label>
                                <input type="text" class="form-control" id="CUSTOMER_USER_MAIL" name="CUSTOMER_USER_MAIL">
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="CUSTOMER_USER_PWD" class="col-md-3 col-lg-3"><!-- 密码--><?php echo $lang['Lang0161']; ?><span class="span-red">*</span></label>
                                <input type="password" class="form-control" name="CUSTOMER_USER_PWD" id="CUSTOMER_USER_PWD">
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="CONFIME_PWD" class="col-md-3 col-lg-3"><!-- 确认密码--><?php echo $lang['Lang0199']; ?><span class="span-red">*</span></label>
                                <input type="password" class="form-control" name="CONFIME_PWD" id="CONFIME_PWD">
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="CUSTOMER_NAME" class="col-md-3 col-lg-3"><!-- 姓名--><?php echo $lang['Lang0216']; ?><span class="span-red">*</span></label>
                                <input type="text" class="form-control" id="CUSTOMER_NAME" name="CUSTOMER_NAME">
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                              <label for="CUSTOMER_GENDER" class="col-md-3 col-lg-3"><!-- 性别--><?php echo $lang['Lang0217']; ?><span class="span-red">*</span></label>
                              <select class="form-control" id="CUSTOMER_GENDER" name="CUSTOMER_GENDER">
                                    <option><!-- 男--><?php echo $lang['Lang0132']; ?></option>
                                    <option><!-- 女--><?php echo $lang['Lang0133']; ?></option>
                              </select>
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="CUSTOMER_BIRTHDAY" class="col-md-3 col-lg-3"><!-- 生日--><?php echo $lang['Lang0148']; ?><span class="span-red">*</span></label>
                                <input type="text" class="form-control" name="CUSTOMER_BIRTHDAY" id="CUSTOMER_BIRTHDAY">
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="CUSTOMER_PHONE_NO" class="col-md-3 col-lg-3"><!-- 电话号码--><?php echo $lang['Lang0149']; ?><span class="span-red">*</span></label>
                                <input type="text" class="form-control" name="CUSTOMER_PHONE_NO" id="CUSTOMER_PHONE_NO" maxlength="10">
                            </div>  

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="MEDICAL_CARD_NO" class="col-md-3 col-lg-3"><!-- 医疗卡号--><?php echo $lang['Lang0150']; ?><span class="span-red">*</span></label>
                                <input type="text" class="form-control" name="MEDICAL_CARD_NO" id="MEDICAL_CARD_NO">
                            </div>


                            <div class="form-group col-md-9 col-lg-9">
                                <label for="CUSTOMER_ADDR" class="col-md-2 col-lg-2"><!-- 详细地址--><?php echo $lang['Lang0152']; ?><span class="span-red">*</span></label>
                                <input type="text" class="form-control"  style="width:81%" name="CUSTOMER_ADDR" id="CUSTOMER_ADDR">
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="CUSTOMER_SUBURB" class="col-md-3 col-lg-3"><!-- 区--><?php echo $lang['Lang0153']; ?><span class="span-red">*</span></label>
                                <input type="text" class="form-control" name="CUSTOMER_SUBURB" id="CUSTOMER_SUBURB">
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                              <label for="STATE_ID" class="col-md-3 col-lg-3"><!-- 州--><?php echo $lang['Lang0154']; ?><span class="span-red">*</span></label>
                              <select class="form-control" id="STATE_ID" name="STATE_ID">
                              </select>
                            </div>

                            <div class="form-group col-md-6 col-lg-6">
                                <label for="CUSTOMER_POSTCODE" class="col-md-3 col-lg-3"><!-- 邮编--><?php echo $lang['Lang0155']; ?><span class="span-red">*</span></label>
                                <input type="text" class="form-control" name="CUSTOMER_POSTCODE" id="CUSTOMER_POSTCODE">
                            </div>

                        </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><!-- Close--><?php echo $lang['Lang0139']; ?></button>
                    <button type="button" class="btn btn-primary" id="btn_signin" ><!-- 注册|预约医生--><?php echo $lang['Lang0314']; ?></button>
                </div>
            </div><!-- /.modal-content
        </div><!-- /.modal-dialog 
    </div><!-- /.modal 
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
<script src="js/jquery.cookie.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/appointmentDoctor.js"></script>
</body>
</html>