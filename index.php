<!--v1.3-->
<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title><?php echo $lang['Lang0001']; ?></title>
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
<!-- User CSS -->
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/focusdata.css">
<!-- datetime -->
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">


<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.equalheights.js"></script> 
<script src="js/sForm.js"></script> 

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
<div class="content index"> 
    <div class="thumb-box1">
        <div class="container">
            <div class="thumb-box2 clearfix">
                <div class="wow fadeInLeft" data-wow-delay="0.2s">
                    <div class="row">
                        <!-- <div class="index-form-bg">
                            <div class="index-form-txt">
                                <div class='col-md-12'>    -->
                                    <form class="form-inline" role="form" id="searchdoctor_form">
                                        <input type="hidden" class="form-control" name="action_type" id="action_type" value="index_search">
                                        <input type="hidden" class="form-control" name="from_index" id="from_index" value="1">
                                        
                                        <div class="form-group col-md-6">
                                            <label for="CLINIC_SUBURB" class="col-md-3">区</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control" id="CLINIC_SUBURB" name="CLINIC_SUBURB" maxlength="50">
                                            <!-- </div>   -->
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="STATE_ID" class="col-md-3">州</label>
                                            <select class="form-control" name="STATE_ID" id="STATE_ID">
                                              <option value="">全部</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="CLINIC_NAME" class="col-md-3">诊所名称</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control" id="CLINIC_NAME" name="CLINIC_NAME" >
                                            <!-- </div>   -->
                                        </div>
                                        

                                        <div class="form-group col-md-6">
                                            <label for="DOCTOR_TYPE" class="col-md-3">医生类别</label>
                                            <select class="form-control" name="DOCTOR_TYPE" id="DOCTOR_TYPE">
                                              <option value="">全部</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="DOCTOR_NAME" class="col-md-3">医生姓名</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control" id="DOCTOR_NAME" name="DOCTOR_NAME">
                                            <!-- </div> -->
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="distance" class="col-md-3">医生距离</label>
                                            <!-- <div class="col-md-3"> -->
                                                <select class="form-control" id="DISTANCE" name="DISTANCE">
                                                    <option value="">any</option>
                                                    <option value="5km">5km</option>
                                                    <option value="10km">10km</option>
                                                    <option value="20km">20km</option>
                                                </select>
                                            <!-- </div> -->
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="APPOINTMENT_DATE_BEGIN" class="col-md-3">预约日期开始</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control form_datetime" id="APPOINTMENT_DATE_BEGIN" name="APPOINTMENT_DATE_BEGIN">
                                            <!-- </div> -->
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="APPOINTMENT_DATE_END" class="col-md-3">预约日期结束</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control form_datetime" id="APPOINTMENT_DATE_END" name="APPOINTMENT_DATE_END">
                                            <!-- </div> -->
                                        </div>
                                        
                                    </form>
                                    <div class="row btn_index">
                                       <!--  <a class="btn btn-success" href="userSaveSearch.php">常用搜索条件管理</a>
                                        <button type="button" class="btn btn-warning" id="btn_save" >保存为常用搜索条件</button>
                                         <button type="button" class="btn btn-info">保存为常用搜索条件</button> -->
                                        <button type="button" class="btn btn-primary" id="btn_search" >搜索医生</button>
                                    </div>
                               <!--  </div> -->
                            <!-- </div>不透明文字  -->
                        <!-- </div>透明背景 -->
                    </div><!-- /.row --> 
                </div>
            </div><!-- thumb-box2 -->

            <div class="col-lg-12">
                <p class="title wow fadeInUp">We specialize in helping patients with symptomatic rapid appointment to doctor.</p>
            </div>
            <div class="col-lg-10 col-lg-offset-1">
                <p class="description wow fadeInUp" data-wow-delay="0.1s">Nos especializamos en ayudar a los pacientes con cita rápida sintomática en médico.</p>
                <a href="index-2.php" class="btn-default btn1 wow fadeInUp" data-wow-delay="0.2s">read more</a>
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
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>

<script src="js/tm-scripts.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/index.js"></script>

</body>
</html>