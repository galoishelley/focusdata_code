<?php
include_once 'classes/Header/header.php';
?>
<div class="content searchDoctor">
	 <div class="stellar-section">
	 	<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="container">
				<h2 class="wow fadeInRight">搜索医生结果</h2>
                <div class="row">
                    <a class="btn btn-primary" href="index.php">
                      <span class="glyphicon  glyphicon-arrow-left"> 主页</span>
                    </a>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                      搜索条件
                    </button>
                    <div class="modal fade bs-example-modal-lg" role="dialog" aria-labelledby="gridSystemModalLabel" id="myModal">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h2 class="modal-title" id="gridSystemModalLabel">搜索医生</h2>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <form class="form-inline" role="form" id="modal_form">
                                                <input type="hidden" class="form-control" name="action_type" id="action_type" value="index_search">
                                                <input type="hidden" class="form-control" name="CUSTOMER_USER_ID" id="CUSTOMER_USER_ID">
                                                
                                                <div class="form-group col-md-6">
                                                    <label for="CLINIC_SUBURB" class="col-md-3">区</label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" id="CLINIC_SUBURB" name="CLINIC_SUBURB" >
                                                    </div>  
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="STATE_ID" class="col-md-3">州</label>
                                                    <select class="form-control" name="STATE_ID" id="STATE_ID">
                                                      <option value="">全部</option>
                                                    </select>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="CLINIC_NAME" class="col-md-3">诊所名称</label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" id="CLINIC_NAME" name="CLINIC_NAME" >
                                                    </div>  
                                                </div>
                                                

                                                <div class="form-group col-md-6">
                                                    <label for="DOCTOR_TYPE" class="col-md-3">医生类别</label>
                                                    <select class="form-control" name="DOCTOR_TYPE" id="DOCTOR_TYPE">
                                                      <option value="">全部</option>
                                                    </select>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="DOCTOR_NAME" class="col-md-3">医生姓名</label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" id="DOCTOR_NAME" name="DOCTOR_NAME">
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="distance" class="col-md-3">医生距离</label>
                                                    <div class="col-md-3">
                                                        <select class="form-control" id="DISTANCE" name="DISTANCE">
                                                            <option value="">any</option>
                                                            <option value="5km">5km</option>
                                                            <option value="10km">10km</option>
                                                            <option value="20km">20km</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="APPOINTMENT_DATE_BEGIN" class="col-md-3">预约日期开始</label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control form_datetime" id="APPOINTMENT_DATE_BEGIN" name="APPOINTMENT_DATE_BEGIN">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="APPOINTMENT_DATE_END" class="col-md-3">预约日期结束</label>
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control form_datetime" id="APPOINTMENT_DATE_END" name="APPOINTMENT_DATE_END">
                                                    </div>
                                                </div>
                                                
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <a type="hidden" class="btn btn-danger" href="userSaveSearch.php" id="btn_save_manage">常用搜索条件管理</a>
                                    <button type="button" class="btn btn-warning" id="btn_save" >保存为常用搜索条件</button>
                                    <button type="button" class="btn btn-primary" id="btn_search" >搜索</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
    
				<div class="row">
                    <input type="hidden" id="json_str1"/>
                    <table id="dataTables-example" class="table table-hover  table-bordered" cellspacing="0" width="100%">
                        <thead class="table_title">
                            <tr>
                            	<!-- <th><input type="checkbox" name="chk_all"></th> -->
                            	<th>序号</th>
                            	<th></th>
                                <th>诊所名称</th>
                                <th>详细地址</th>
                                <th>区</th>
                                <th>州</th>
                                <th>邮编</th>
                                <th>医生类别</th>
                                <th>医生名称</th>
                                <th>最早预约时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                    </table> 
				</div>		
			</div>
		</div>
	</div>
</div>
<!--
<div class="container">
		<div class="row" id="container_style1">
			<div class="container_style1">
				<div class="col-md-2">
					<label>hello world</label>
				</div>	
				<div class="col-md-10">
					<label>hello world</label>
				</div>
			</div>
		</div>	
</div>	
-->
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
<!-- date time -->
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<!-- DataTables JavaScript -->
<!-- <script type="text/javascript" src="js/datatables/dataTables.bootstrap.min.js" charset="UTF-8"></script> -->
<!-- DataTables JavaScript -->
<script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- datetime -->
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

<!-- <script src="js/fd_appointmentDoctor.js"></script> -->
<script src="js/jquery.cookie.js"></script>
<!-- <script src="js/fd_searchDoctor.js"></script> -->
<script src="js/main/pub.js"></script>
<script src="js/main/getdistance.js"></script>
<script src="js/main/searchDoctor.js"></script>

</body>
</html>