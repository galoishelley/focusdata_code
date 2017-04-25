<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>sign up</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name="format-detection" content="telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- dialog -->
<link href="css/bootstrap-dialog.min.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="fonts/font-awesome.css">
<!--User CSS-->
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/focusdata.css">
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.ui.totop.js"></script>

</head>
<body>
	<!--header-->
	<div class="container bars">
		<em class="bars_"></em>
	</div>
	<?php
				include_once 'classes/Menu/menu.php';
				?>
	<header>
    
    <h1 class="navbar-brand navbar-brand_">
			<a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>"
				alt="logo"></a>
		</h1>
	</header>

	<!--content-->
	<div class="content">
		<div class="stellar-section">
			<div class="thumb-box9" data-stellar-background-ratio="0.1">
				<div class="container">
					<div class="row df_content">
						<h2 class="wow fadeInRight">
							<!-- 诊所用户注册-->
							<?php echo $lang['Lang0192']; ?></h2>
						<form class="form-inline wow fadeInLeft form_add" role="form"
							id="signup_form">
							<fieldset>
								<!-- 		<div class="form-group has-error has-feedback">
								<!--<label class="control-label" for="inputError2">Input with error</label>
								<input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status" readonly value="Info: Please select user">
								<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
								<span id="inputError2Status" class="sr-only">(error)</span>
							</div> -->
								<input type="hidden" class="form-control" name="action_type"
									id="action_type" value="create">
									
									<input type="hidden"
											class="form-control" name="CLINIC_LAT"
											id="CLINIC_LAT">
											<input type="hidden"
											class="form-control" name="CLINIC_LNG"
											id="CLINIC_LNG">

								<div class="form-group">
									<label for="sele_user" class="control-label">
										<!-- 选择用户-->
										<?php echo $lang['Lang0193']; ?><span class="span-red">*</span>
									</label> <select class="form-control" id="sele_user" autofocus>
										<!-- <option value="0">Please select user</option> -->
										<option value="0"><!-- 个人用户--><?php echo $lang['Lang0194']; ?></option>
										<option value="1" selected><!-- 诊所用户--><?php echo $lang['Lang0195']; ?></option>
									</select>
								</div>

								<div id="personal">
									
									<div class="row">
										<div class="form-group col-md-9">
											<label for="pwd">
												<!-- 邮箱-->
												<?php echo $lang['Lang0197']; ?><span class="span-red">*</span>
											</label> <input type="email" class="form-control"
												name="CLINIC_USER_MAIL" style="width: 38%"  id="CLINIC_USER_MAIL" >
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<label for="CLINIC_USER_PWD">
												<!-- 密码-->
												<?php echo $lang['Lang0198']; ?><span class="span-red">*</span>
											</label> <input type="password" class="form-control"
												name="CLINIC_USER_PWD" id="CLINIC_USER_PWD">
										</div>

										<div class="form-group">
											<label for="CONFIME_PWD">
												<!-- 确认密码-->
												<?php echo $lang['Lang0199']; ?><span class="span-red">*</span>
											</label> <input type="password" class="form-control"
												name="CONFIME_PWD" id="CONFIME_PWD">
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<label for="birthday">
												<!-- 诊所名称-->
												<?php echo $lang['Lang0200']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control"
												name="CLINIC_NAME" id="CLINIC_NAME">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-9">
											<label for="CLINIC_ADDR">
												<!-- 详细地址-->
												<?php echo $lang['Lang0202']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control"
												style="width: 81%" name="CLINIC_ADDR" id="CLINIC_ADDR">
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<label for="CLINIC_SUBURB">
												<!-- 区-->
												<?php echo $lang['Lang0203']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control"
												name="CLINIC_SUBURB" id="CLINIC_SUBURB">
										</div>

										<div class="form-group">
											<label for="STATE_ID">
												<!-- 州-->
												<?php echo $lang['Lang0204']; ?><span class="span-red">*</span>
											</label> <select class="form-control" id="STATE_ID"
												name="STATE_ID">
											</select>
										</div>
										<div class="form-group">
											<label for="CLINIC_POSTCODE">
												<!-- 邮编-->
												<?php echo $lang['Lang0201']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control"
												name="CLINIC_POSTCODE" id="CLINIC_POSTCODE">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group pull-right">
										<button type="submit" class="btn btn-lg btn-primary btn-block"
											id="signup_ok">
											<!-- Sign up for free-->
											<?php echo $lang['Lang0205']; ?></button>
									</div>
								</div>
								<div class="row">
									<div class="pull-right">
										<a href="sign_in.php"><strong>
												<!-- sign in-->
												<?php echo $lang['Lang0206']; ?></strong></a>
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
<?php
include_once 'classes/Footer/Footer.php';
?>
<?php
include_once 'classes/Language/For_JS_multi_lang.php';
?>
<script src="js/bootstrap.min.js"></script>
	<!-- dialog -->
	<script src="js/bootstrap-dialog.min.js"></script>
	<script src="js/tm-scripts.js"></script>
	<script src="js/jquery.cookie.js"></script>
	<script src="js/jquery.maskedinput.min.js"></script>
	<script src="js/bootstrapValidator.js"></script>
	<script src="js/main/pub.js"></script>
	<script src="js/main/sign_up_clinic.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCyZERlQBAH0_PRkVI8bu7oqx8HIBlyZG4&libraries=geometry"></script>
</body>
</html>