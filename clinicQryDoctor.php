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
                <a href="clinicUpdUserInfo.php" class="list-group-item" id="user_appointment_recoder" >修改诊所用户信息</a>
                <a href="clinicQryDoctor.php" class="list-group-item active" id="user_upd_person_info">医生信息管理</a>
                <a href="clinicUpdUserPwd.php" class="list-group-item" id="user_upd_person_pwd">修改诊所用户密码</a>
              </div>
            </div>

          <div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s">
              <div class="PersonUser">
                <div class="savedoctor">

                  <h2>医生信息管理</h2>
                  <div class="row">
                      <form class="form-inline" role="form">
                          <div class="form-group">
                            <label for="DOCTOR_TYPE" class="control-label">医生类别</label>
                            <select class="form-control" id="DOCTOR_TYPE">
                              <option value="">全部</option>
                            </select>
                          </div>

                          <div class="form-group">
                            <label for="DOCTOR_NAME" class="control-label">医生名称</label>
                            <input type="text" class="form-control" id="DOCTOR_NAME">
                          </div>

                          <div class="form-group">
                            <label for="ACTIVE_STATUS" class="control-label">状态</label>
                            <select class="form-control" id="ACTIVE_STATUS">
                              <option value="">全部</option>
                              <option value="1">active</option>
                              <option value="0">inactive</option>
                            </select>
                          </div>

                           <button class="btn btn-primary search_ok" id="search_ok"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Search</button>  

                           <button class="btn btn-danger" id="btn_inactive">inactive</button>
                           <button class="btn btn-warning" id="btn_active">active</button>
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
                            <th>性别</th>
                            <th>状态</th>
                            <th>操作</th>
                          </tr>
                      </thead>
                    </table>
                  </div>

              </div>
              <!-- savedoctor -->
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
<script src="js/main/pub.js"></script>
<script src="js/main/clinicQryDoctor.js"></script>
</body>
</html>