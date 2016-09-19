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
							<a href="userAppointmentRecoder.php" class="list-group-item active" id="user_appointment_recoder" >预约记录</a>
							<a href="userUpdPersonInfo.php" class="list-group-item" id="user_upd_person_info">修改个人用户信息</a>
							<a href="userUpdPersonPwd.php" class="list-group-item" id="user_upd_person_pwd">修改个人用户密码</a>
							<a href="userSaveDoctor.php" class="list-group-item" id="user_collect_doctor">收藏医生管理</a>
							<a href="userSaveSearch.php" class="list-group-item" id="user_search_terms">常用搜索条件管理</a>
						</div>
					</div>

					<div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s">
          <!-- <div class="col-lg-9 col-md-9 col-sm-9"> -->
              <div class="PersonUser">

                <h2>预约记录</h2>
                <div class="row">
                    <form class="form-inline wow fadeInLeft" role="form">
                        <div class="input-group">
                          <span class="input-group-addon" id="basic-addon1">开始时间</span>
                          <input type="text" class="form-control form_datetime" id="begin_time" readonly>
                        </div>

                        <div class="input-group">
                          <span class="input-group-addon" id="basic-addon1">结束时间</span>
                          <input type="text" class="form-control form_datetime" id="end_time" readonly>
                        </div>
                        
                        <div class="form-group">
                          <select class="form-control" id="app_status">
                            <option value="%">全部</option>
                          </select>
                        </div>

                         <button class="btn btn-primary search_ok" id="search_ok"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Search</button>  

                         <button class="btn btn-danger" id="btn_cancel">取消预约</button>
                     </form>
                </div>

                <div class="row">
                  <table id="dataTables-example" class="table table-hover  table-bordered" >
                    <thead class="table_title">
                        <tr>
                          <th><input type="checkbox" name="chk_all" id="chk_all"></th>
                          <th>诊所名称</th>
                          <th>详细地址</th>
                          <th>区</th>
                          <th>州</th>
                          <th>邮编</th>
                          <th>医生类别</th>
                          <th>医生名称</th>
                          <th>预约时间</th>
                          <!-- <th>预约时间</th> -->
                          <th>状态</th>
                        </tr>
                    </thead>
                  </table>
                </div>

            </div>
            <!-- userAppointmentRecoder -->
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
<script src="js/main/userAppointmentRecoder.js"></script>
</body>
</html>