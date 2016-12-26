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
<header>
    <?php
include_once 'classes/Menu/menu.php';
?>
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
              <a href="adminQryClinic.php" class="list-group-item active" id="user_appointment_recoder" ><!-- 诊所用户管理 --><?php echo $lang['Lang0034']; ?></a>
              <a href="adminQryUser.php" class="list-group-item" id="user_upd_person_pwd"><!-- 个人用户管理 --><?php echo $lang['Lang0035']; ?></a>
              <a href="adminQryDoctor.php" class="list-group-item" id="user_upd_person_info"><!-- 医生信息管理 --><?php echo $lang['Lang0036']; ?></a>
              <a href="adminUpdPwd.php" class="list-group-item" id="user_upd_person_pwd"><!-- 修改管理员密码 --><?php echo $lang['Lang0037']; ?></a>
              <a href="adminService.php" class="list-group-item"><!-- 服务列表 --><?php echo $lang['Lang0038']; ?></a>
            </div>
          </div>

					<!-- <div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s"> -->
          <div class="col-lg-9 col-md-9 col-sm-9">
              <div class="AdminUser">
                <h2><!-- 修改诊所用户信息--><?php echo $lang['Lang0117']; ?></h2>
                <div class="row">
                  <form class="form-inline" role="form" id="adminUpdClinicInfo">

                      <input type="hidden" class="form-control" name="action_type" id="action_type" value="update">
                      <input type="hidden" class="form-control" name="CLINIC_USER_ID" id="CLINIC_USER_ID">

                      

                      <div class="form-group col-md-6">
                        <label for="Addr" class="col-md-3 control-label"><!-- 邮箱--><?php echo $lang['Lang0119']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CLINIC_USER_MAIL" id="CLINIC_USER_MAIL">
                      </div>
                      
                      <div class="form-group col-md-6">
                        <label for="birthday" class="col-md-3 control-label"><!-- 诊所名称--><?php echo $lang['Lang0120']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CLINIC_NAME" id="CLINIC_NAME">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="ACTIVE_STATUS" class="col-md-3"><!-- 状态--><?php echo $lang['Lang0121']; ?><span class="span-red">*</span></label>
                        <select class="form-control" name="ACTIVE_STATUS" id="ACTIVE_STATUS">
                          <option value="1"><!-- active--><?php echo $lang['Lang0095']; ?></option>
                          <option value="0"><!-- inactive--><?php echo $lang['Lang0096']; ?></option>
                        </select>
                      </div>

                      <div class="form-group col-md-9 col-lg-9">
                        <label for="CLINIC_ADDR" class="col-md-2"><!-- 详细地址--><?php echo $lang['Lang0122']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control"  style="width:81%" name="CLINIC_ADDR" id="CLINIC_ADDR" value="1">
                      </div>
                      
                      <div class="form-group col-md-6">
                        <label for="CLINIC_SUBURB" class="col-md-3"><!-- 区--><?php echo $lang['Lang0123']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CLINIC_SUBURB" id="CLINIC_SUBURB" value="1">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="STATE_ID" class="col-md-3"><!-- 州--><?php echo $lang['Lang0124']; ?><span class="span-red">*</span></label>
                        <select class="form-control" id="STATE_ID" name="STATE_ID">
                        </select>
                      </div>

                      <div class="form-group col-md-6">
                        <label for="CLINIC_POSTCODE" class="col-md-3"><!-- 邮编--><?php echo $lang['Lang0125']; ?><span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CLINIC_POSTCODE" id="CLINIC_POSTCODE" value="1">
                      </div>

                      <div class="form-group col-md-12">
                        <div class="pull-right">
                          <a href="adminQryClinic.php" class="btn btn-warning"><!-- return--><?php echo $lang['Lang0126']; ?></a>
                          <button class="btn btn-primary" id="btn_submit"><!-- 确定--><?php echo $lang['Lang0127']; ?></button>
                        </div>
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
<script src="js/main/pub.js"></script>/
<script src="js/main/adminUpdClinicInfo.js"></script>
</body>
</html>