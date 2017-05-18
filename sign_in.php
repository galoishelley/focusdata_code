<?php
include_once 'classes/Language/language.common.php';
?>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<title>
			<?php echo $lang['Lang0002']; ?>
		</title>
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
		<link rel="stylesheet" href="css/bootstrapValidator.css" />
		<link rel="stylesheet" type="text/css" href="css/sm.css@ver-3" />
		<!--JS-->
		<script src="js/jquery.js"></script>
		<script src="js/jquery-migrate-1.2.1.min.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/jquery.mobilemenu.js"></script>
		<script src="js/jquery.equalheights.js"></script>
		<script src="js/jquery.ui.totop.js"></script>

		<style>
		h2{
			font-size: 30px;
		}
	
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

		<div class="content">
			<div class="stellar-section">
				<div class="thumb-box9" data-stellar-background-ratio="0.1">
					<div class="container">
						<div class="row df_content col-md-4 col-md-offset-4">
							<div class="col-md-8 col-md-offset-2">
								<h2 class="wow fadeInRight">
									<?php echo $lang['Lang0330']; ?>
								</h2>

								<form class="form-horizontal" role="form" id="signin_form">

									<fieldset>

										<div class="form-group">
											<input type="text" class="form-control" id="USER_MAIL" name="USER_MAIL" placeholder="<?php echo $lang['Lang0023']; ?>" autofocus>
										</div>
										<div class="form-group">
											<input type="password" class="form-control" id="USER_PWD" name="USER_PWD" placeholder="<?php echo $lang['Lang0025']; ?>">
										</div>
										<div class="form-group">
											<div class="checkbox">
												<label> <input type="checkbox" value="" id="ck_rmbUser">
												<?php echo $lang['Lang0029']; ?>
											</label>

												<div class="pull-right">
													<a href="forgotpwd.php"><strong><?php echo $lang['Lang0031']; ?></strong></a>
												</div>
											</div>
										</div>
										<div class="form-group">
											<button class="btn btn-lg btn-primary btn-block" id="signin_ok"><?php echo $lang['Lang0030']; ?></button>
										</div>
									</fieldset>
								</form>
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
				<script src="js/slickModal.js"></script>
				<script src="js/main/pub.js"></script>
				
				<script src="js/main/sign_in.js"></script>

	</body>

	</html>