<?php
include_once 'classes/Header/header.php';
?>
<!--content-->
<div class="content forgotpwd">
    <div class="stellar-section">
        <div class="thumb-box9" data-stellar-background-ratio="0.1">
	       <div class="container">
			     <div class="row">
				    <div class="col-md-8 col-md-offset-2">
    					<h2 class="wow fadeInRight">Forgot Password</h2>
    					<form class="form-horizontal wow fadeInRight" data-wow-delay="0.5s" role="form">
    						<fieldset>
                                <div class="form-group">
                                    <label for="USER_NAME" class="col-sm-2 control-label">用户名<span class="span-red">*</span></label>
                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="USER_NAME" name="USER_NAME" placeholder="请输入用户名 ..." autofocus>
                                    </div>
                                </div>

                                <div class="radio col-sm-10 col-sm-offset-2">
                                  <label>
                                    <input type="radio" name="usertype" id="usertype" value="0">
                                    诊所用户
                                  </label>
                                </div>
                                
                                <div class="radio col-sm-10 col-sm-offset-2">
                                  <label>
                                    <input type="radio" name="usertype" id="usertype" value="1" checked>
                                    个人用户
                                  </label>
                                </div>

                                <div class="radio col-sm-10 col-sm-offset-2 radio_admin">
                                  <label>
                                    <input type="radio" name="usertype" id="usertype" value="2">
                                   管理员
                                  </label>
                                </div> 

                                <div class="form-group">
                                    <label for="EMAIL" class="col-sm-2 control-label">E-mail<span class="span-red">*</span></label>
                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="EMAIL" name="EMAIL" readonly="true">
                                    </div>
                                </div>
    							
    							<div class="row">
                                    <div class="form-group pull-right send_email">
                                        <button type="submit" class="btn btn-lg btn-primary btn-block" id="send_email">发送密码到邮箱</button>
                                     </div>
                                </div>

                                <div class="row">
                                    <div class="form-group pull-right">
                                        <a href="sign_in.php"><strong>sign in</strong></a>
                                        <!-- <div class="pull-right">sign in</div> -->
                                    </div>
                                </div>
    						</fieldset>
    					</form>
                    </div>
				</div>
            </div>
            <!-- container -->
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
</body>
</html>