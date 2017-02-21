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






<link href="css/jquery-ui.css" rel="stylesheet">

<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.equalheights.js"></script> 
<script src="js/sForm.js"></script> 

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
                <div>
                    <div class="row">
                        <!-- <div class="index-form-bg">
                            <div class="index-form-txt">
                                <div class='col-md-12'>    -->
                                    <form  role="form" id="searchdoctor_form">
                                        <input type="hidden" class="form-control" name="action_type" id="action_type" value="index_search">
                                        <input type="hidden" class="form-control" name="from_index" id="from_index" value="1">
                                        
                                        
                                        <div class="form-group col-xs-12">
                                            <label for="DOCTOR_TYPE"><!-- 医生类别--><?php echo $lang['Lang0065']; ?></label>
                                            
                                            <label class="radio-inline"><input type="radio" name="DOCTOR_TYPE" value="GP" checked="checked">GP</label>
											<label class="radio-inline"><input type="radio" name="DOCTOR_TYPE" value="Dentist">Dentist</label>
											<label class="radio-inline"><input type="radio" name="DOCTOR_TYPE" value="Physio">Physio</label>
											<label class="radio-inline"><input type="radio" name="DOCTOR_TYPE" value="Dermatologist">Dermatologist</label>
											<label class="radio-inline"><input type="radio" name="DOCTOR_TYPE" value="Chiropractor">Chiropractor</label>


                                       
                                            
                                        </div>
                                        
                                        
                                        <div class="form-group col-xs-11">
                                            <label for="CLINIC_SUBURB"><!-- 位置--><?php echo $lang['Lang0316']; ?></label>
                                     
                                                <input type="text" class="form-control" id="CLINIC_SUBURB" name="CLINIC_SUBURB" maxlength="300">
                                         
                                        </div>

                                        
                                        
                                    </form>
                                    <div class="row btn_index">

                                        <button type="button" class="btn btn-primary" id="btn_search" ><!-- 一般搜索--><?php echo $lang['Lang0317']; ?></button>
                                         
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
<script src="js/jquery-ui.js"></script>

<script src="js/main/pub.js"></script>
<script src="js/main/index.js"></script>

</body>
</html>