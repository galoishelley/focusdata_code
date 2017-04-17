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
		<div class="content">
			<div class="stellar-section">
				<div class="thumb-box9" data-stellar-background-ratio="0.1">
					<div class="container">
						<div class="row df_content col-md-4 col-md-offset-4">
							<div class="col-md-8 col-md-offset-2">
								<h2 class="wow fadeInRight">
									<?php echo $lang['Lang0332']; ?>
								</h2>

								<form class="form-horizontal wow fadeInUp" role="form" id="signin_form">

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
				<script src="js/main/pub.js"></script>
				<script src="js/main/sign_in_admin.js"></script>
	</body>
	</body>

	</html>