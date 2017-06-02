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
		<link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/animate.css">
		<link rel="stylesheet" href="fonts/font-awesome.css">
		<!--User CSS-->
		<link rel="stylesheet" href="css/user.css">
		<link rel="stylesheet" href="css/focusdata.css">
		<link rel="stylesheet" href="css/bootstrapValidator.css" />
		<link rel="stylesheet" type="text/css" href="css/sm.css@ver-3" />

		<style>
			/* Contact form */

			#popup-1 .slickWindow {
				text-align: center;
			}

			#popup-1 .slickWindow .title {
				font-size: 30px;
				font-weight: 700;
			}

			#popup-1 .slickWindow .title,
			#popup-1 .slickWindow p {
				color: #fff;
				opacity: 1;
			}

			#popup-1 .slickWindow .topIcon {
				content: "";
				display: block;
				
				width: 32px;
				height: 32px;
				margin: 0 auto 20px auto;
			}

			#popup-1 .slickWindow form {
				display: block;
				margin: 30px 0;
			}

			#popup-1 .slickWindow input,
			#popup-1 .slickWindow textarea,
			#popup-1 .slickWindow form input.send {
				border-style: solid;
				border-color: transparent transparent #fff transparent;
				border-width: 1px;
				font-size: 12px;
				color: #fff;
				background: transparent;
				display: block;
				width: 100%;
				padding: 12px;
				margin-bottom: 16px;
				text-align: left;
			}

			#popup-1 .slickWindow form input.send {
				background: #ef6161;
				font-size: 14px;
				font-weight: 900;
				letter-spacing: 1px;
				border: none;
				margin-top: 30px;
				display: block;
				text-align: center;
			}

			#popup-1 .slickWindow form input.send:hover {
				background: #fff;
				color: #222;
			}

			#popup-1 .slickWindow .bottomClose {
				font-weight: 700;
				color: #fff;
				font-size: 12px;
			}

			@media screen and (max-width: 480px) {
				#popup-1.slickModal .slickWindow {
					width: 96% !important;
				}
				#popup-1.slickModal .slickWindow .title {
					font-size: 24px;
				}
				#popup-1.slickModal .close.icon {
					right: 0;
					left: 0;
					margin: 0 auto;
				}
			}

			@media screen and (max-height: 480px) {
				#popup-1.slickModal {
					overflow: scroll;
				}
				#popup-1.slickModal .overlay {
					position: fixed;
				}
			}
		</style>
		<!--JS-->
		<script src="js/jquery.js"></script>
		<script src="js/underscore-min.js"></script>
		<script src="js/jquery-migrate-1.2.1.min.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/jquery.mobilemenu.js"></script>
		<script src="js/jquery.equalheights.js"></script>
		<script src="js/jquery.ui.totop.js"></script>

	</head>

	<body>
		<!--header-->
		<div class="container bars">
			<div></div>
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
								<h2>
									<div id="activateBtn" class="openSlickModal-1"></div>
									<div id="popup-1" class="slickModal">
										<div class="slickWindow">
											<div class="topIcon"></div>
											<div class="title">Activate</div>
											<p id="ainfo">Check your email and input your activation code</p>
											<form>
												<input type="text" class="field" placeholder="activation code" id="aCODE"/>
												
												<input type="submit" onclick="return false" class="send" value="Activate" id="aOK"/>
											</form>
											<div class="closeModal bottomClose">No thanks, i don't want to activate right now</div>
										</div>
									</div>
									<!-- 个人用户注册-->
									<?php echo $lang['Lang0208']; ?>
								</h2>
								<form class="form-inline form_add" role="form" id="signup_form">
									<fieldset>
										<input type="hidden" class="form-control" name="action_type" id="action_type" value="create">

										<input type="hidden" class="form-control" name="CUSTOMER_LAT" id="CUSTOMER_LAT">
										<input type="hidden" class="form-control" name="CUSTOMER_LNG" id="CUSTOMER_LNG">



										<div id="personal">

											<div class="row">

												<div class="form-group">
													<label for="CUSTOMER_USER_MAIL"> <!-- 邮箱-->
												<?php echo $lang['Lang0213']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" id="CUSTOMER_USER_MAIL" name="CUSTOMER_USER_MAIL"
													 maxlength="200">
												</div>
											</div>
											<div class="row">
												<div class="form-group">
													<label for="CUSTOMER_USER_PWD"> <!-- 密码-->
												<?php echo $lang['Lang0214']; ?><span class="span-red">*</span>
											</label> <input type="password" class="form-control" name="CUSTOMER_USER_PWD" id="CUSTOMER_USER_PWD">
												</div>

												<div class="form-group">
													<label for="CONFIME_PWD"> <!-- 确认密码-->
												<?php echo $lang['Lang0215']; ?><span class="span-red">*</span>
											</label> <input type="password" class="form-control" name="CONFIME_PWD" id="CONFIME_PWD">
												</div>
											</div>
											<div class="row">
												<div class="form-group">
													<label for="TITLE_ID"> <!-- title-->
												<?php echo $lang['Lang0322']; ?><span class="span-red">*</span>
											</label> <select class="form-control" id="TITLE_ID" name="TITLE_ID">
											</select>
												</div>
												<div class="form-group">
													<label for="CUSTOMER_FIRSTNAME"> <!-- 名-->
												<?php echo $lang['Lang0320']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" id="CUSTOMER_FIRSTNAME" name="CUSTOMER_FIRSTNAME"
													 maxlength="50">
												</div>
												<div class="form-group">
													<label for="CUSTOMER_LASTNAME"> <!-- 姓-->
												<?php echo $lang['Lang0321']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" id="CUSTOMER_LASTNAME" name="CUSTOMER_LASTNAME"
													 maxlength="50">
												</div>



											</div>


											<div class="row">
												<div class="form-group">
													<label for="GENDER_ID"> <!-- 性别-->
												<?php echo $lang['Lang0217']; ?><span class="span-red">*</span>
											</label> <select class="form-control" id="GENDER_ID" name="GENDER_ID">
											</select>
												</div>
												<div class="form-group">
													<label for="CUSTOMER_BIRTHDAY"> <!-- 生日-->
												<?php echo $lang['Lang0220']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" name="CUSTOMER_BIRTHDAY" id="CUSTOMER_BIRTHDAY"
													 placeholder="Birthdate (dd/mm/yyyy)">
												</div>
											</div>

											<div class="row">
												<div class="form-group">
													<label for="CUSTOMER_PHONE_NO"> <!-- 电话号码-->
												<?php echo $lang['Lang0221']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" name="CUSTOMER_PHONE_NO" id="CUSTOMER_PHONE_NO"
													 maxlength="10">
												</div>

												<div class="form-group">
													<label for="MEDICAL_CARD_NO"> <!-- 医疗卡号-->
												<?php echo $lang['Lang0150']; ?>
												<!--<span class="span-red">*</span>-->
											</label> <input type="text" class="form-control" name="MEDICAL_CARD_NO" id="MEDICAL_CARD_NO" maxlength="50">
												</div>

											</div>
											<div class="row col-md-9">
												<div class="form-group">
													<label for="CUSTOMER_ADDR"> <!-- 详细地址-->
												<?php echo $lang['Lang0224']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" name="CUSTOMER_ADDR" id="CUSTOMER_ADDR" maxlength="200">
												</div>
											</div>
											<div class="row">


												<div class="form-group">
													<label for="CUSTOMER_SUBURB"> <!-- 区-->
												<?php echo $lang['Lang0225']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" name="CUSTOMER_SUBURB" id="CUSTOMER_SUBURB">
												</div>

												<div class="form-group">
													<label for="STATE_ID"> <!-- 州-->
												<?php echo $lang['Lang0226']; ?><span class="span-red">*</span>
											</label> <select class="form-control" id="STATE_ID" name="STATE_ID">
											</select>
												</div>
												<div class="form-group">
													<label for="CUSTOMER_POSTCODE"> <!-- 邮编-->
												<?php echo $lang['Lang0223']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" name="CUSTOMER_POSTCODE" id="CUSTOMER_POSTCODE"
													 maxlength="10">
												</div>
											</div>
										</div>
									</fieldset>
								</form>
								<div class="row">
									<div class="form-group pull-right">
										<button type="submit" class="btn btn-lg btn-primary btn-block" id="signup_ok">
									<!-- Sign up for free-->
									<?php echo $lang['Lang0227']; ?></button>
									</div>
								</div>
								<div class="row">
									<div class="pull-right">
										<a href="sign_in.php"><strong> <!-- sign in-->
										<?php echo $lang['Lang0228']; ?></strong></a>
									</div>
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
					<script src="js/bootstrapValidator.js"></script>
					<script src="js/main/pub.js"></script>
					<script src="js/jquery.maskedinput.min.js"></script>
					<script src="js/main/sign_up_person.js"></script>
					<script src="js/slickModal.js"></script>
					<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCyZERlQBAH0_PRkVI8bu7oqx8HIBlyZG4&libraries=geometry"></script>
	</body>

	</html>