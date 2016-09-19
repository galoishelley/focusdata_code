<?php
include_once 'classes/Header/header.php';
?>

<!--content-->
<div class="content">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<div class="row df_content">
					<h2 class="wow fadeInRight">诊所用户注册</h2>
					<form class="form-inline wow fadeInLeft form_add" role="form" id="signup_form">
						<fieldset>
					<!-- 		<div class="form-group has-error has-feedback">
								<!--<label class="control-label" for="inputError2">Input with error</label>
								<input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status" readonly value="Info: Please select user">
								<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
								<span id="inputError2Status" class="sr-only">(error)</span>
							</div> -->
							<input type="hidden" class="form-control" name="action_type" id="action_type" value="create">

							<div class="form-group">
								<label for="sele_user" class="control-label">选择用户<span class="span-red">*</span></label>
									<select class="form-control" id="sele_user" autofocus>
										<!-- <option value="0">Please select user</option> -->
										<option value="0">个人用户</option>
										<option value="1" selected>诊所用户</option>
									</select>
							</div>
							
							<div id="personal">
								<div class="form-group">
									<label for="username">用户名<span class="span-red">*</span></label>
									<input type="text" class="form-control" id="CLINIC_USER_NAME" name="CLINIC_USER_NAME">
								</div>

								<div class="form-group">
									<label for="pwd">邮箱<span class="span-red">*</span></label>
									<input type="email" class="form-control" name="CLINIC_USER_MAIL" id="CLINIC_USER_MAIL" value="shelleymyl@gmail.com">
								</div>

								<div class="form-group">
									<label for="CLINIC_USER_PWD">密码<span class="span-red">*</span></label>
									<input type="password" class="form-control" name="CLINIC_USER_PWD" id="CLINIC_USER_PWD">
								</div>

								<div class="form-group">
									<label for="CONFIME_PWD">确认密码<span class="span-red">*</span></label>
									<input type="password" class="form-control" name="CONFIME_PWD" id="CONFIME_PWD">
								</div>

								<div class="form-group">
									<label for="birthday">诊所名称<span class="span-red">*</span></label>
									<input type="text" class="form-control" name="CLINIC_NAME" id="CLINIC_NAME" value="1">
								</div>
								
	                            <div class="form-group">
									<label for="CLINIC_POSTCODE">邮编<span class="span-red">*</span></label>
									<input type="text" class="form-control" name="CLINIC_POSTCODE" id="CLINIC_POSTCODE" value="1">
								</div>

								<div class="form-group col-md-9 col-lg-9">
									<label for="CLINIC_ADDR">详细地址<span class="span-red">*</span></label>
									<input type="text" class="form-control"  style="width:81%" name="CLINIC_ADDR" id="CLINIC_ADDR" value="1">
								</div>

								<div class="form-group">
									<label for="CLINIC_SUBURB">区<span class="span-red">*</span></label>
									<input type="text" class="form-control" name="CLINIC_SUBURB" id="CLINIC_SUBURB" value="1">
								</div>

								<div class="form-group">
	                              <label for="STATE_ID">州<span class="span-red">*</span></label>
	                              <select class="form-control" id="STATE_ID" name="STATE_ID">
	                              </select>
	                            </div>
							</div>
							<div class="row">
								<div class="form-group pull-right">
									<button type="submit" class="btn btn-lg btn-primary btn-block" id="signup_ok">Sign up for free</button>
								 </div>
							</div>
							<div class="row">
								<div class="pull-right">
									<a href="sign_in.php"><strong>sign in</strong></a>
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
<script src="js/main/sign_up_clinic.js"></script>
</body>
</html>