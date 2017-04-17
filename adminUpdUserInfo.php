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



</head>
<body>
<!--header-->
<div class="container bars"><em class="bars_"></em></div>
<?php
include_once 'classes/Menu/menu.php';
?>
<header>
    
    <h1 class="navbar-brand navbar-brand_"><a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>

<!--content--> 
<div class="content">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<div class="row left_con">
					<!-- <div class="col-lg-3 col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.1s"> -->
          <div class="col-lg-3 col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.1s">
            <div class="list-group">
              <a href="adminQryClinic.php" class="list-group-item" id="user_appointment_recoder" ><!-- 诊所用户管理 --><?php echo $lang['Lang0034']; ?></a>
              <a href="adminQryUser.php" class="list-group-item active" id="user_upd_person_pwd"><!-- 个人用户管理 --><?php echo $lang['Lang0035']; ?></a>
              <a href="adminQryDoctor.php" class="list-group-item" id="user_upd_person_info"><!-- 医生信息管理 --><?php echo $lang['Lang0036']; ?></a>
              <a href="adminUpdPwd.php" class="list-group-item" id="user_upd_person_pwd"><!-- 修改管理员密码 --><?php echo $lang['Lang0037']; ?></a>
              <a href="adminService.php" class="list-group-item"><!-- 服务列表 --><?php echo $lang['Lang0038']; ?></a>
            </div>
          </div>

					<!-- <div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s"> -->
          <div class="col-lg-9 col-md-9 col-sm-9">
              <div class="AdminUser">
                <h2><!-- 修改个人用户信息--><?php echo $lang['Lang0141']; ?></h2>
                <div class="row">
                  <form class="form-inline" role="form" id="adminUpdUserInfo">

                      <input type="hidden" class="form-control" name="action_type" id="action_type" value="update">
                      <input type="hidden" class="form-control" name="CUSTOMER_USER_ID" id="CUSTOMER_USER_ID">

                      

                      <div class="form-group col-md-6">
                        <label for="CUSTOMER_USER_MAIL" class="col-md-3 control-label"><!-- 邮箱--><?php echo $lang['Lang0143']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" id="CUSTOMER_USER_MAIL" name="CUSTOMER_USER_MAIL">
                      </div>

					<div class="form-group col-md-6">
                        <label for="TITLE_ID" class="col-md-3"><!-- title--><?php echo $lang['Lang0322']; ?><span class="span-red">*</span></label>
                        <select class="form-control" id="TITLE_ID" name="TITLE_ID">
                        </select>
                      </div>
                      <div class="form-group col-md-6">
                        <label for="CUSTOMER_FIRSTNAME" class="col-md-3 control-label"><!-- 名--><?php echo $lang['Lang0320']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" id="CUSTOMER_FIRSTNAME" name="CUSTOMER_FIRSTNAME">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="CUSTOMER_LASTNAME" class="col-md-3 control-label"><!-- 姓--><?php echo $lang['Lang0321']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" id="CUSTOMER_LASTNAME" name="CUSTOMER_LASTNAME">
                      </div>
                      
                      <div class="form-group col-md-6">
                        <label for="CUSTOMER_GENDER"  class="col-md-3 control-label"><!-- 性别--><?php echo $lang['Lang0145']; ?><span class="span-red">*</span></label>
                        <select class="form-control" id="CUSTOMER_GENDER" name="CUSTOMER_GENDER">
                              <option value="0"><!-- 男--><?php echo $lang['Lang0132']; ?></option>
                              <option value="1"><!-- 女--><?php echo $lang['Lang0133']; ?></option>
                        </select>
                      </div>

                      <div class="form-group col-md-6">
                        <label for="CUSTOMER_BIRTHDAY" class="col-md-3 control-label"><!-- 生日--><?php echo $lang['Lang0148']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CUSTOMER_BIRTHDAY" id="CUSTOMER_BIRTHDAY" value="1">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="CUSTOMER_PHONE_NO" class="col-md-3"><!-- 电话号码--><?php echo $lang['Lang0149']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CUSTOMER_PHONE_NO" id="CUSTOMER_PHONE_NO" maxlength="10">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="MEDICAL_CARD_NO" class="col-md-3"><!-- 医疗卡号--><?php echo $lang['Lang0150']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="MEDICAL_CARD_NO" id="MEDICAL_CARD_NO" value="1">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="ACTIVE_STATUS" class="col-md-3"><!-- 状态--><?php echo $lang['Lang0151']; ?><span class="span-red">*</span></label>
                        <select class="form-control" name="ACTIVE_STATUS" id="ACTIVE_STATUS">
                          <option value="1">active</option>
                          <option value="0">inactive</option>
                        </select>
                      </div>

                      <div class="form-group col-md-9 col-lg-9">
                        <label for="CUSTOMER_ADDR" class="col-md-2"><!-- 详细地址--><?php echo $lang['Lang0152']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control"  style="width:81%" name="CUSTOMER_ADDR" id="CUSTOMER_ADDR" value="1">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="CUSTOMER_SUBURB" class="col-md-3"><!-- 区--><?php echo $lang['Lang0153']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CUSTOMER_SUBURB" id="CUSTOMER_SUBURB" value="1">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="STATE_ID" class="col-md-3"><!-- 州--><?php echo $lang['Lang0154']; ?><span class="span-red">*</span></label>
                        <select class="form-control" id="STATE_ID" name="STATE_ID">
                        </select>
                      </div>

                      <div class="form-group col-md-6">
                        <label for="CUSTOMER_POSTCODE" class="col-md-3"><!-- 邮编--><?php echo $lang['Lang0155']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CUSTOMER_POSTCODE" id="CUSTOMER_POSTCODE" value="1">
                      </div>

                      <div class="form-group pull-right">
                        <a href="adminQryUser.php" class="btn btn-warning"><!-- return--><?php echo $lang['Lang0156']; ?></a>
                        <button class="btn btn-primary" id="btn_submit"><!-- 确定--><?php echo $lang['Lang0157']; ?></button>
                      </div>

                    </form>

                  </div> 
                <!-- row -->
              </div>
              <!-- PersonUser -->
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
<?php
include_once 'classes/Footer/Footer.php';
?>
<?php
include_once 'classes/Language/For_JS_multi_lang.php';
?>
<!-- DataTables JavaScript -->
<script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- datetime -->
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/adminUpdUserInfo.js"></script>
</body>
</html>