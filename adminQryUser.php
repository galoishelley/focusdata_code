<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>our services</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" ><!-- dialog --><link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="fonts/font-awesome.css">
<!--user css-->
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/focusdata.css">
<!--datetables css-->
<link rel="stylesheet" href="js/datatables/dataTables.bootstrap.min.css">
<!-- datetime -->
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.equalheights.js"></script> 
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.cookie.js"></script>


</head>
<body>
<!--header-->
<div class="container bars"><em class="bars_"></em></div>
<?php
include_once 'classes/Menu/menu.php';
?>
<header>
    
    <h1 class="navbar-brand navbar-brand_"><a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>

<!--content--> 
<div class="content">
  <div class="stellar-section">
    <div class="thumb-box9" data-stellar-background-ratio="0.1">
      <div class="container">
        <div class="row left_con">
          <div class="col-lg-3 col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.1s">
            <div class="list-group">
              <a href="adminQryClinic.php" class="list-group-item" id="user_appointment_recoder" ><!-- 诊所用户管理 --><?php echo $lang['Lang0034']; ?></a>
              <a href="adminQryUser.php" class="list-group-item active" id="user_upd_person_pwd"><!-- 个人用户管理 --><?php echo $lang['Lang0035']; ?></a>
              <a href="adminQryDoctor.php" class="list-group-item" id="user_upd_person_info"><!-- 医生信息管理 --><?php echo $lang['Lang0036']; ?></a>
              <a href="adminUpdPwd.php" class="list-group-item" id="user_upd_person_pwd"><!-- 修改管理员密码 --><?php echo $lang['Lang0037']; ?></a>
              <a href="adminService.php" class="list-group-item"><!-- 服务列表 --><?php echo $lang['Lang0038']; ?></a>
            </div>
          </div>

          <div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s">
              <div class="PersonUser">
                <div class="savedoctor">

                  <h2><!-- 个人用户管理 --><?php echo $lang['Lang0084']; ?></h2>
                  <div class="row">
                      <form class="form-inline" role="form" id="adminQryUser_form">
                          <input type="hidden" class="form-control" name="action_type" id="action_type" value="view_name_area">
                          <div class="form-group">
                            <label for="CUSTOMER_USER_MAIL" class="control-label"><!-- 用户名 --><?php echo $lang['Lang0098']; ?></label>
                            <input type="text" class="form-control" name="CUSTOMER_USER_MAIL" id="CUSTOMER_USER_MAIL">
                          </div>

                         

                          <div class="form-group">
                            <label for="CUSTOMER_SUBURB" class="control-label"><!-- 区 --><?php echo $lang['Lang0087']; ?></label>
                            <input type="text" class="form-control" name="CUSTOMER_SUBURB" id="CUSTOMER_SUBURB">
                          </div>

                          <div class="form-group">
                            <label for="STATE_ID" class="control-label"><!-- 州 --><?php echo $lang['Lang0088']; ?></label>
                            <select class="form-control" name="STATE_ID" id="STATE_ID">
                              <option value=""><!-- 全部 --><?php echo $lang['Lang0089']; ?></option>
                            </select>
                          </div>

                          <div class="form-group">
                            <label for="ACTIVE_STATUS" class="control-label"><!-- 状态 --><?php echo $lang['Lang0090']; ?></label>
                            <select class="form-control" name="ACTIVE_STATUS" id="ACTIVE_STATUS">
                              <option value=""><!-- 全部 --><?php echo $lang['Lang0091']; ?></option>
                              <option value="1"><!-- active --><?php echo $lang['Lang0092']; ?></option>
                              <option value="0"><!-- inactive --><?php echo $lang['Lang0093']; ?></option>
                            </select>
                          </div>

                           <button class="btn btn-primary search_ok" id="search_ok"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> <!-- Search --><?php echo $lang['Lang0094']; ?></button>  

                           <button class="btn btn-warning" id="btn_active"><!-- active --><?php echo $lang['Lang0095']; ?></button>
                           <button class="btn btn-danger" id="btn_inactive"><!-- inactive --><?php echo $lang['Lang0096']; ?></button>
                       </form>
                  </div>

                  <div class="row">
                    <table id="dataTables-example" class="table table-hover  table-bordered" >
                      <thead class="table_title">
                          <tr>
                            <th><input type="checkbox" name="chk_all" id="chk_all"></th>
                           
                            <th><!-- 邮箱 --><?php echo $lang['Lang0098']; ?></th>
                            <th><!-- title --><?php echo $lang['Lang0322']; ?></th>
                            <th><!-- 名 --><?php echo $lang['Lang0320']; ?></th>
                            <th><!-- 姓 --><?php echo $lang['Lang0321']; ?></th>
                            <th><!-- 性别 --><?php echo $lang['Lang0100']; ?></th>
                            <th><!-- 生日 --><?php echo $lang['Lang0101']; ?></th>
                            <th><!-- 详细地址 --><?php echo $lang['Lang0102']; ?></th>
                            <th><!-- 区 --><?php echo $lang['Lang0103']; ?></th>
                            <th><!-- 州 --><?php echo $lang['Lang0104']; ?></th>
                            <th><!-- 邮编 --><?php echo $lang['Lang0105']; ?></th>
                            <th><!-- 手机号 --><?php echo $lang['Lang0106']; ?></th>
                            <th><!-- 医疗卡号 --><?php echo $lang['Lang0107']; ?></th>
                            <th><!-- 状态 --><?php echo $lang['Lang0108']; ?></th>
                            <th><!-- 操作 --><?php echo $lang['Lang0109']; ?></th>
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
<?php
include_once 'classes/Footer/Footer.php';
?>
<?php
include_once 'classes/Language/For_JS_multi_lang.php';
?>
<!-- DataTables JavaScript -->
<script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- datetime -->
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/adminQryUser.js"></script>
</body>
</html>