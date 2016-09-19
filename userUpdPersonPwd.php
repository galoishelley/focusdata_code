<?php
include_once 'classes/Header/header.php';
?>
<!--content--> 
<div class="content">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<div class="row left_con">
					<div class="col-lg-3 col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.1s">
						<div class="list-group">
							<a href="userAppointmentRecoder.php" class="list-group-item" id="user_appointment_recoder" >预约记录</a>
							<a href="userUpdPersonInfo.php" class="list-group-item" id="user_upd_person_info">修改个人用户信息</a>
							<a href="userUpdPersonPwd.php" class="list-group-item active" id="user_upd_person_pwd">修改个人用户密码</a>
              <a href="userSaveDoctor.php" class="list-group-item" id="user_collect_doctor">收藏医生管理</a>
              <a href="userSaveSearch.php" class="list-group-item" id="user_search_terms">常用搜索条件管理</a>
						</div>
					</div>

					<div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s">
          <div class="PersonUser">
                <h2>修改个人用户密码</h2>
                <div class="row">

                  <form class="form-inline wow fadeInLeft" role="form" id="userUpdPersonPwd">

                      <input type="hidden" class="form-control" name="action_type" id="action_type" value="update">
                      <input type="hidden" class="form-control" name="CUSTOMER_USER_ID" id="CUSTOMER_USER_ID">

                      <div class="form-group col-md-10">
                        <label for="CUSTOMER_USER_NAME" class="col-md-4 control-label">用户名<span class="span-red">*</span></label>
                        <input type="text" class="form-control" id="CUSTOMER_USER_NAME" name="CUSTOMER_USER_NAME" readonly="true">
                      </div>

                      <div class="form-group col-md-10">
                        <label for="CUSTOMER_USER_PWD" class="col-md-4 control-label">旧密码<span class="span-red">*</span></label>
                        <input type="password" class="form-control" id="CUSTOMER_USER_PWD">
                      </div>

                      <div class="form-group col-md-10">
                        <label for="CUSTOMER_USER_NEWPWD" class="col-md-4 control-label">新密码<span class="span-red">*</span></label>
                        <input type="password" class="form-control" id="CUSTOMER_USER_NEWPWD">
                      </div>

                      <div class="form-group col-md-10">
                        <label for="CUSTOMER_USER_C_NEWPWD" class="col-md-4 control-label">确认新密码<span class="span-red">*</span></label>
                        <input type="password" class="form-control" id="CUSTOMER_USER_C_NEWPWD">
                      </div>

                      <div class="form-group col-md-10">
                        <!-- <div class="col-md-12"> -->
                          <button class="btn btn-primary pull-right" id="btn_ok">确定</button>
                        <!-- </div> -->
                      </div>
                    </form>

                  </div> 
                <!-- row -->
              </div>
          </div>
          <!-- wow -->
				</div>
        <!-- row -->
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

<!-- DataTables JavaScript -->
<script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- datetime -->
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/userUpdPersonPwd.js"></script>
</body>
</html>