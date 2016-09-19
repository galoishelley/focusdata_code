<?php
include_once 'classes/Header/header.php';
?>
<!--content--> 
<div class="content">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<div class="row left_con">
					<!-- <div class="col-lg-3 col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.1s"> -->
          <div class="col-lg-3 col-md-3 col-sm-3">
						<div class="list-group">
              <a href="adminQryClinic.php" class="list-group-item active" id="user_appointment_recoder" >诊所用户管理</a>
              <a href="adminQryUser.php" class="list-group-item" id="user_upd_person_pwd">个人用户管理</a>
              <a href="adminQryDoctor.php" class="list-group-item" id="user_upd_person_info">医生信息管理</a>
              <a href="adminUpdPwd.php" class="list-group-item" id="user_upd_person_pwd">修改管理员密码</a>
              <a href="adminService.php" class="list-group-item">服务列表</a>
            </div>
					</div>

					<!-- <div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s"> -->
          <div class="col-lg-9 col-md-9 col-sm-9">
              <div class="AdminUser">
                <h2>修改诊所用户信息</h2>
                <div class="row">
                  <form class="form-inline" role="form" id="adminUpdClinicInfo">

                      <input type="hidden" class="form-control" name="action_type" id="action_type" value="update">
                      <input type="hidden" class="form-control" name="CLINIC_USER_ID" id="CLINIC_USER_ID">

                      <div class="form-group col-md-6">
                        <label for="CUSTOMER_USER_NAME" class="col-md-3 control-label">用户名<span class="span-red">*</span></label>
                        <input type="text" class="form-control" id="CLINIC_USER_NAME" name="CLINIC_USER_NAME" readonly="readonly">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="Addr" class="col-md-3 control-label">邮箱<span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CLINIC_USER_MAIL" id="CLINIC_USER_MAIL">
                      </div>
                      
                      <div class="form-group col-md-6">
                        <label for="birthday" class="col-md-3 control-label">诊所名称<span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CLINIC_NAME" id="CLINIC_NAME">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="ACTIVE_STATUS" class="col-md-3">状态<span class="span-red">*</span></label>
                        <select class="form-control" name="ACTIVE_STATUS" id="ACTIVE_STATUS">
                          <option value="1">active</option>
                          <option value="0">inactive</option>
                        </select>
                      </div>

                      <div class="form-group col-md-9 col-lg-9">
                        <label for="CLINIC_ADDR" class="col-md-2">详细地址<span class="span-red">*</span></label>
                        <input type="text" class="form-control"  style="width:81%" name="CLINIC_ADDR" id="CLINIC_ADDR" value="1">
                      </div>
                      
                      <div class="form-group col-md-6">
                        <label for="CLINIC_SUBURB" class="col-md-3">区<span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CLINIC_SUBURB" id="CLINIC_SUBURB" value="1">
                      </div>

                      <div class="form-group col-md-6">
                        <label for="STATE_ID" class="col-md-3">州<span class="span-red">*</span></label>
                        <select class="form-control" id="STATE_ID" name="STATE_ID">
                        </select>
                      </div>

                      <div class="form-group col-md-6">
                        <label for="CLINIC_POSTCODE" class="col-md-3">邮编<span class="span-red">*</span></label>
                        <input type="text" class="form-control" name="CLINIC_POSTCODE" id="CLINIC_POSTCODE" value="1">
                      </div>

                      <div class="form-group col-md-12">
                        <div class="pull-right">
                          <a href="adminQryClinic.php" class="btn btn-warning">return</a>
                          <button class="btn btn-primary" id="btn_submit">确定</button>
                        </div>
                      </div>

                    </form>

                  </div> 
                <!-- row -->
              </div>
              <!-- PersonUser -->
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
<script src="js/main/pub.js"></script>/
<script src="js/main/adminUpdClinicInfo.js"></script>
</body>
</html>