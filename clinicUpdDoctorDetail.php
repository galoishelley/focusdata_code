<?php
include_once 'classes/Language/language.common.php';
?>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<title>修改医生信息</title>
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
		<link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />

		<link rel="stylesheet" href="css/datepicker.css">

		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/animate.css">
		<link rel="stylesheet" href="fonts/font-awesome.css">

		
		<!--User CSS-->
		<link rel="stylesheet" href="css/user.css">
		<link rel="stylesheet" href="css/focusdata.css">

		<link rel="stylesheet" href="css/bootstrap-multiselect.css">
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
						<div class="adminUpdDoc">
							<div class="container">
								<div class="row">
									<h2 class="wow fadeInRight">
										<!-- 修改医生信息-->
										<?php echo $lang['Lang0253']; ?>
									</h2>


									<div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
										<form class="form-horizontal wow fadeInLeft" role="form" id="clinicUpdDoctorDetail">
											<fieldset>
												<input type="hidden" class="form-control" name="action_type" id="action_type" value="update_doctor_info">
												<input type="hidden" class="form-control" name="DOCTOR_ID" id="DOCTOR_ID">
												<div class="form-group" id="clinic_info">
													<div class="col-sm-10 col-sm-offset-2">
														<label class="control-label " id="CLINIC_NAME"></label>

														<!-- <label class="control-label" id="STATE_NAME"></label> -->
													</div>
													<div class="col-sm-10 col-sm-offset-2">
														<label class="control-label" id="CLINIC_ADDR"></label>
													</div>
												</div>
												<div class="form-group">

													<label for="DOCTOR_TYPE" class="col-sm-2 control-label">
                                             <!-- 医生类别-->
                                             <?php echo $lang['Lang0065']; ?>
                                          </label>
													<div class="col-sm-10">
														<select class="form-control" name="DOCTOR_TYPE" id="DOCTOR_TYPE">
													<option value="">All</option>
													<option value="GP"><?php echo $lang['Lang0333']; ?></option>
													<option value="Dentist"><?php echo $lang['Lang0334']; ?></option>
													<option value="Dietitian"><?php echo $lang['Lang0335']; ?></option>
													<option value="Physio"><?php echo $lang['Lang0336']; ?></option>
													<option value="Podiatrist"><?php echo $lang['Lang0337']; ?></option>
													<option value="Pschologist"><?php echo $lang['Lang0338']; ?></option>
													<option value="Chiropractor"><?php echo $lang['Lang0339']; ?></option>
													<option value="Audiologist"><?php echo $lang['Lang0340']; ?></option>
													<option value="Optometry"><?php echo $lang['Lang0341']; ?></option>
													<option value="Skin Doctors"><?php echo $lang['Lang0342']; ?></option>
													<option value="Counsellor"><?php echo $lang['Lang0343']; ?></option>
												
											</select>
													</div>

												</div>
												<div class="form-group">
													<label for="DOCTOR_NAME" class="col-sm-2 control-label"><!-- 医生姓名--><?php echo $lang['Lang0255']; ?></label>
													<div class="col-sm-10">
														<input type="text" readonly="true" class="form-control" name="DOCTOR_NAME" id="DOCTOR_NAME">
													</div>
												</div>

												<div class="form-group">
													<label for="DOCTOR_YEAR" class="col-sm-2 control-label"><?php echo $lang['Lang0346']; ?></label>
													<div class="col-sm-10">
														<input type="text" class="form-control" name="DOCTOR_YEAR" id="DOCTOR_YEAR">
													</div>
												</div>


												<div class="form-group">

													<label for="ddlLanguage" class="col-sm-2  control-label"> <!-- 位置-->
															<?php echo $lang['Lang0326']; ?><span class="span-red">*</span></label>
													<div class="col-sm-10">
														<select id="ddlLanguage" multiple="multiple">
													
													

														</select>
													</div>
												</div>
												<div class="form-group">

													<label for="ddlInterests" class="col-sm-2  control-label"> <!-- 位置-->
															<?php echo $lang['Lang0347']; ?><span class="span-red">*</span></label>
													<div class="col-sm-10">
														<select id="ddlInterests" multiple="multiple">
													
													

														</select>
													</div>
												</div>


												<div class="form-group">
													<label for="DOCTOR_GENDER" class="col-sm-2 control-label"><!-- 性别--><?php echo $lang['Lang0256']; ?><span class="span-red">*</span></label>
													<div class="col-sm-10">
														<select class="form-control" name="DOCTOR_GENDER" id="DOCTOR_GENDER">
												  	<option value=""><?php echo $lang['Lang0345']; ?></option>
													<option value="0"><!-- 男--><?php echo $lang['Lang0132']; ?></option>
													<option value="1"><!-- 女--><?php echo $lang['Lang0133']; ?></option>
												</select>
													</div>
												</div>
												<div class="form-group">
													<label for="ACTIVE_STATUS" class="col-sm-2 control-label"><!-- 状态--><?php echo $lang['Lang0259']; ?><span class="span-red">*</span></label>
													<div class="col-sm-10">
														<select class="form-control" name="ACTIVE_STATUS" id="ACTIVE_STATUS">
													<option value="1"><!-- active--><?php echo $lang['Lang0260']; ?></option>
													<option value="0"><!-- inactive--><?php echo $lang['Lang0261']; ?></option>
												</select>
													</div>
												</div>
												<div class="form-group">
													<label for="DOCTOR_INFO" class="col-sm-2 control-label"><?php echo $lang['Lang0262']; ?><span class="span-red">*</span></label>
													<div class="col-sm-10">
														<textarea class="form-control" rows="5" name="DOCTOR_INFO" id="DOCTOR_INFO" placeholder="<?php echo $lang['Lang0262']; ?>"></textarea>
													</div>
												</div>

												<input type="hidden" class="form-control" name="DOCTOR_PHOTO" id="DOCTOR_PHOTO">
												<input type="hidden" class="form-control" name="LANGUAGE_NAME" id="LANGUAGE_NAME">
												<input type="hidden" class="form-control" name="INTEREST_NAME" id="INTEREST_NAME">
											</fieldset>
										</form>


										<div class="row doctor_photo">
											<label for="DOCTOR_PHOTO" class="col-sm-2 control-label"><!-- 医生照片--><?php echo $lang['Lang0264']; ?><span class="span-red">*</span></label>
											<div class="col-sm-offset-2">
												<form id="submit_form" method="post" action="./classes/class.upload.php" target="exec_target" enctype="multipart/form-data">
													<input type="file" name="upload_file" id="upload_file">
												</form>

												<iframe id="exec_target" name="exec_target"></iframe>

												<div id="feedback"></div>



											</div>
										</div>

										<div class="row">
											<div class="form-group pull-right">
												<a href="clinicQryDoctor.php" class="btn btn-primary">
													<!-- Cancel-->
													<?php echo $lang['Lang0265']; ?>
												</a>
												<button type="submit" class="btn btn-warning" id="btn_submit"><!-- Confirm--><?php echo $lang['Lang0266']; ?></button>

											</div>
										</div>

									</div>
									<!-- col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 -->
								</div>
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
					<script src="js/bootstrap-multiselect.js"></script>
					<script src="js/bootstrap-datepicker.js"></script>
					
					<script src="js/main/pub.js"></script>
					<script src="js/main/clinicUpdDoctorDetail.js"></script>
	</body>

	</html>