<?php
include_once 'classes/Header/header.php';
?>
<!--content-->
<div class="content">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="adminUpdDoc">
				<div class="container">
					<div class="row">
							<h2 class="wow fadeInRight">修改医生信息</h2>
							
							
							<div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
								<form class="form-horizontal wow fadeInLeft" role="form" id="clinicUpdDoctorDetail">
									<fieldset>
										<input type="hidden" class="form-control" name="action_type" id="action_type" value="update_doctor_info">
										<input type="hidden" class="form-control" name="DOCTOR_ID" id="DOCTOR_ID">
									 	<div class="form-group" id="clinic_info">
										    <div class="col-sm-10 col-sm-offset-2">
										    	<label class="control-label " id="CLINIC_NAME"></label>
										      	
										      	<!-- <label class="control-label" id="STATE_NAME"></label> -->
										    </div>
										    <div class="col-sm-10 col-sm-offset-2">
										    	<label class="control-label" id="CLINIC_ADDR"></label>
										    </div>
										</div>
									 	<div class="form-group">
										    <label for="DOCTOR_TYPE" class="col-sm-2 control-label">医生类别<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										      <input type="text" class="form-control" name="DOCTOR_TYPE" id="DOCTOR_TYPE">
										    </div>
										</div>
										<div class="form-group">
										    <label for="DOCTOR_NAME" class="col-sm-2 control-label">医生姓名<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										      <input type="text" class="form-control" name="DOCTOR_NAME" id="DOCTOR_NAME">
										    </div>
										</div>	
										<div class="form-group">
										    <label for="DOCTOR_GENDER" class="col-sm-2 control-label">性别<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										      	<select class="form-control" name="DOCTOR_GENDER" id="DOCTOR_GENDER">
													<option>男</option>
													<option>女</option>
												</select>
										    </div>
										</div>
										<div class="form-group">
										    <label for="ACTIVE_STATUS" class="col-sm-2 control-label">状态<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										      	<select class="form-control" name="ACTIVE_STATUS" id="ACTIVE_STATUS">
													<option value="1">active</option>
													<option value="0">inactive</option>
												</select>
										    </div>
										</div>
										<div class="form-group">
										    <label for="DOCTOR_INFO" class="col-sm-2 control-label">医生详细信息<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										    	<textarea class="form-control" rows="5" name="DOCTOR_INFO" id="DOCTOR_INFO"  placeholder="医生详细信息"></textarea>
										    </div>	
										</div>

										<input type="hidden" class="form-control" name="DOCTOR_PHOTO" id="DOCTOR_PHOTO">
										
									</fieldset>
								</form>

								<div class="row doctor_photo">
									 <label for="DOCTOR_PHOTO" class="col-sm-2 control-label">医生照片<span class="span-red">*</span></label>
									<div class="col-sm-offset-2">	
										<form id="submit_form" method="post" action="./classes/class.upload.php" target="exec_target" enctype="multipart/form-data">
											<input type="file" name="upload_file" id="upload_file">
										</form>

										<iframe id="exec_target" name="exec_target"></iframe>

										<div id="feedback"></div>
									</div>
								</div>

								<div class="row">
									<div class="form-group pull-right">
										<a href="clinicQryDoctor.php" class="btn btn-primary">Cancel</a>
										<button type="submit" class="btn btn-warning" id="btn_submit">Confirm</button>
										
								 	</div>
							 	</div>

							</div>
							<!-- col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 -->
					</div>
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
<script src="js/main/pub.js"></script>
<script src="js/main/clinicUpdDoctorDetail.js"></script>
</body>
</html>