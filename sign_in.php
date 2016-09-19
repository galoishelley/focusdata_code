<?php
include_once 'classes/Header/header.php';
?>
<!--content-->
<div class="content">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<div class="row df_content col-md-8 col-md-offset-2">
					<h2 class="wow fadeInRight"><?php echo $lang['Lang0021']; ?></h2>
					<!-- <div>&nbsp;</div>
					<h2 class="indent">Sign in</h2> -->
					<form class="form-horizontal wow fadeInUp" role="form" id="signin_form" >
					<!-- onsubmit="return false;" -->
						<fieldset>
							<!-- <div class="form-group has-error has-feedback">
								<!--<label class="control-label" for="inputError2">Input with error</label>
								<input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status" readonly value="Info: Please sign in">
								<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
								<span id="inputError2Status" class="sr-only">(error)</span>
							</div> -->
							<div class="form-group">
							    <label for="USER_NAME" class="col-sm-2 control-label"><?php echo $lang['Lang0022']; ?><span class="span-red">*</span></label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="USER_NAME" name="USER_NAME" placeholder="<?php echo $lang['Lang0023']; ?>" autofocus >
							    </div>
							</div>
							<div class="form-group">
							    <label for="USER_PWD" class="col-sm-2 control-label"><?php echo $lang['Lang0024']; ?><span class="span-red">*</span></label>
							    <div class="col-sm-10">
							      <input type="password" class="form-control" id="USER_PWD" name="USER_PWD" placeholder="<?php echo $lang['Lang0025']; ?>">
							    </div>
							</div>

							<div class="radio col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="radio" name="usertype" id="usertype" value="0">
							    <?php echo $lang['Lang0026']; ?>
							  </label>
							</div>
							<div class="radio col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="radio" name="usertype" id="usertype" value="1" checked>
							   	<?php echo $lang['Lang0027']; ?>
							  </label>
							</div>
							<div class="radio col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="radio" name="usertype" id="usertype" value="2">
							   <?php echo $lang['Lang0028']; ?>
							  </label>
							</div>

							<div class="checkbox col-sm-10 col-sm-offset-2">
							  <label>
							    <input type="checkbox" value="" id="ck_rmbUser">
							   	<?php echo $lang['Lang0029']; ?>
							  </label>
							</div>
							
							<div class="row">
								<div class="form-group pull-right">
									<button class="btn btn-lg btn-primary btn-block" id="signin_ok"><?php echo $lang['Lang0030']; ?></button>
								 </div>
							</div>
							<div class="row">
								<div class="form-group pull-right">
									<a href="forgotpwd.php"><strong><?php echo $lang['Lang0031']; ?></strong></a>
									<!-- <div class="pull-right">sign in</div> -->
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
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 center">
                <ul class="follow_icon">
                    <li><a href="#" class="fa fa-twitter"></a></li>
                    <li><a href="#" class="fa fa-facebook"></a></li>
                    <li><a href="#" class="fa fa-google-plus"></a></li>
                    <li><a href="#" class="fa fa-rss"></a></li>
                    <li><a href="#" class="fa fa-pinterest"></a></li>
                    <li><a href="#" class="fa fa-linkedin"></a></li>
                </ul>
            </div>
            <div class="col-lg-12 center">
                <p>84, Charing Cross Road,London<br>JL 851213-2340</p>
            </div>
            <div class="col-lg-12 center">
                <p class="privacy">&copy; <em id="copyright-year"></em> <i>|</i> <a href="index-5.php">Privacy Policy</a></p>
            </div>
        </div>
    </div>
</footer>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/sign_in.js"></script>
</body>
</body>
</html>