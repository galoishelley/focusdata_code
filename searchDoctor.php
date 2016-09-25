<?Php
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

<!-- <script src="js/main/searchDoctor.js"></script> -->
<!--[if (gt IE 9)|!(IE)]><!-->
<!-- <script src="js/wow/wow.js"></script> -->
<script src="js/wow/device.min.js"></script>
<!-- <script>
    $(document).ready(function () {       
      if ($('html').hasClass('desktop')) {
        new WOW().init();
      }   
    });
</script> -->
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

<div class="content searchDoctor">
	 <div class="stellar-section">
	 	<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<h2 class="wow fadeInRight"><!-- 搜索医生结果--><?php echo $lang['Lang0302']; ?></h2>
                <div class="row">
                    <a class="btn btn-primary" href="index.php">
                      <span class="glyphicon  glyphicon-arrow-left"><!--  主页--><?php echo $lang['Lang0303']; ?></span>
                    </a>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                      <!-- 搜索条件--><?php echo $lang['Lang0304']; ?>
                    </button>
                    <div class="modal fade bs-example-modal-lg" role="dialog" aria-labelledby="gridSystemModalLabel" id="myModal">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h2 class="modal-title" id="gridSystemModalLabel"><!-- 搜索医生--><?php echo $lang['Lang0172']; ?></h2>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <form class="form-inline" role="form" id="modal_form">
                                                <input type="hidden" class="form-control" name="action_type" id="action_type" value="index_search">
                                                <input type="hidden" class="form-control" name="CUSTOMER_USER_ID" id="CUSTOMER_USER_ID">
                                                
                                                <div class="form-group col-md-6">
                                                    <label for="CLINIC_SUBURB" class="col-md-3"><!-- 区--><?php echo $lang['Lang0040']; ?></label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" id="CLINIC_SUBURB" name="CLINIC_SUBURB" >
                                                    </div>  
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="STATE_ID" class="col-md-3"><!-- 州--><?php echo $lang['Lang0041']; ?></label>
                                                    <select class="form-control" name="STATE_ID" id="STATE_ID">
                                                      <option value=""><!-- 全部--><?php echo $lang['Lang0042']; ?></option>
                                                    </select>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="CLINIC_NAME" class="col-md-3"><!-- 诊所名称--><?php echo $lang['Lang0049']; ?></label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" id="CLINIC_NAME" name="CLINIC_NAME" >
                                                    </div>  
                                                </div>
                                                

                                                <div class="form-group col-md-6">
                                                    <label for="DOCTOR_TYPE" class="col-md-3"><!-- 医生类别--><?php echo $lang['Lang0065']; ?></label>
                                                    <select class="form-control" name="DOCTOR_TYPE" id="DOCTOR_TYPE">
                                                      <option value=""><!-- 全部--><?php echo $lang['Lang0042']; ?></option>
                                                    </select>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="DOCTOR_NAME" class="col-md-3"><!-- 医生姓名--><?php echo $lang['Lang0297']; ?></label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" id="DOCTOR_NAME" name="DOCTOR_NAME">
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="distance" class="col-md-3"><!-- 医生距离--><?php echo $lang['Lang0298']; ?></label>
                                                    <div class="col-md-3">
                                                        <select class="form-control" id="DISTANCE" name="DISTANCE">
                                                            <option value=""><!-- All--><?php echo $lang['Lang0042']; ?></option>
                                                            <option value="5km">5km</option>
                                                            <option value="10km">10km</option>
                                                            <option value="20km">20km</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="APPOINTMENT_DATE_BEGIN" class="col-md-3"><!-- 预约日期开始--><?php echo $lang['Lang0300']; ?></label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control form_datetime" id="APPOINTMENT_DATE_BEGIN" name="APPOINTMENT_DATE_BEGIN">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="APPOINTMENT_DATE_END" class="col-md-3"><!-- 预约日期结束--><?php echo $lang['Lang0301']; ?></label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control form_datetime" id="APPOINTMENT_DATE_END" name="APPOINTMENT_DATE_END">
                                                    </div>
                                                </div>
                                                
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><!-- 取消--><?php echo $lang['Lang0139']; ?></button>
                                    <a class="btn btn-danger" href="userSaveSearch.php" id="btn_save_manage"><!-- 常用搜索条件管理--><?php echo $lang['Lang0279']; ?></a>
                                    <button type="button" class="btn btn-warning" id="btn_save" ><!-- 保存为常用搜索条件--><?php echo $lang['Lang0305']; ?></button>
                                    <button type="button" class="btn btn-primary" id="btn_search" ><!-- 搜索--><?php echo $lang['Lang0308']; ?></button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
    

				<div class="row">
                    <input type="hidden" id="json_str1"/>
                    <table id="dataTables-example" class="table table-hover  table-bordered" cellspacing="0" width="100%">
                        <thead class="table_title">
                            <tr>
                            	<!-- <th><input type="checkbox" name="chk_all"></th> -->
                            	<th><!-- 序号--><?php echo $lang['Lang0309']; ?></th>
                            	<th></th>
                                <th><!-- 诊所名称--><?php echo $lang['Lang0039']; ?></th>
                                <th><!-- 详细地址--><?php echo $lang['Lang0050']; ?></th>
                                <th><!-- 区--><?php echo $lang['Lang0040']; ?></th>
                                <th><!-- 州--><?php echo $lang['Lang0041']; ?></th>
                                <th><!-- 邮编--><?php echo $lang['Lang0053']; ?></th>
                                <th><!-- 医生类别--><?php echo $lang['Lang0065']; ?></th>
                                <th><!-- 医生名称--><?php echo $lang['Lang0064']; ?></th>
                                <th><!-- 最早可预约时间--><?php echo $lang['Lang0306']; ?></th>
                                <th><!-- 预约--><?php echo $lang['Lang0307']; ?></th>
                            </tr>
                        </thead>
                    </table> 
				</div>		
			</div>
		</div>
	</div>
</div>
<!--
<div class="container">
		<div class="row" id="container_style1">
			<div class="container_style1">
				<div class="col-md-2">
					<label>hello world</label>
				</div>	
				<div class="col-md-10">
					<label>hello world</label>
				</div>
			</div>
		</div>	
</div>	
-->
<!--footer-->
<?php
include_once 'classes/Footer/Footer.php';
?>
<?php
include_once 'classes/Language/For_JS_multi_lang.php';
?>

<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
<!-- date time -->
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<!-- DataTables JavaScript -->
<!-- <script type="text/javascript" src="js/datatables/dataTables.bootstrap.min.js" charset="UTF-8"></script> -->
<!-- DataTables JavaScript -->
<script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- datetime -->
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

<!-- <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script> -->

<!-- <script src="js/fd_appointmentDoctor.js"></script> -->
<script src="js/jquery.cookie.js"></script>
<!-- <script src="js/fd_searchDoctor.js"></script> -->
<script src="js/main/pub.js"></script>
<!-- <script src="js/main/getdistance.js"></script> -->
<script src="js/main/searchDoctor.js"></script>

</body>
</html>