<!--v1.3-->
<?php
include_once 'classes/Header/header.php';
?>
<!--content-->
<div class="content index"> 
    <div class="thumb-box1">
        <div class="container">
            <div class="thumb-box2 clearfix">
                <div class="wow fadeInLeft" data-wow-delay="0.2s">
                    <div class="row">
                        <!-- <div class="index-form-bg">
                            <div class="index-form-txt">
                                <div class='col-md-12'>    -->
                                    <form class="form-inline" role="form" id="searchdoctor_form">
                                        <input type="hidden" class="form-control" name="action_type" id="action_type" value="index_search">
                                        <input type="hidden" class="form-control" name="from_index" id="from_index" value="1">
                                        
                                        <div class="form-group col-md-6">
                                            <label for="CLINIC_SUBURB" class="col-md-3">区</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control" id="CLINIC_SUBURB" name="CLINIC_SUBURB" >
                                            <!-- </div>   -->
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="STATE_ID" class="col-md-3">州</label>
                                            <select class="form-control" name="STATE_ID" id="STATE_ID">
                                              <option value="">全部</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="CLINIC_NAME" class="col-md-3">诊所名称</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control" id="CLINIC_NAME" name="CLINIC_NAME" >
                                            <!-- </div>   -->
                                        </div>
                                        

                                        <div class="form-group col-md-6">
                                            <label for="DOCTOR_TYPE" class="col-md-3">医生类别</label>
                                            <select class="form-control" name="DOCTOR_TYPE" id="DOCTOR_TYPE">
                                              <option value="">全部</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="DOCTOR_NAME" class="col-md-3">医生姓名</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control" id="DOCTOR_NAME" name="DOCTOR_NAME">
                                            <!-- </div> -->
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="distance" class="col-md-3">医生距离</label>
                                            <!-- <div class="col-md-3"> -->
                                                <select class="form-control" id="DISTANCE" name="DISTANCE">
                                                    <option value="">any</option>
                                                    <option value="5km">5km</option>
                                                    <option value="10km">10km</option>
                                                    <option value="20km">20km</option>
                                                </select>
                                            <!-- </div> -->
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="APPOINTMENT_DATE_BEGIN" class="col-md-3">预约日期开始</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control form_datetime" id="APPOINTMENT_DATE_BEGIN" name="APPOINTMENT_DATE_BEGIN">
                                            <!-- </div> -->
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="APPOINTMENT_DATE_END" class="col-md-3">预约日期结束</label>
                                            <!-- <div class="col-md-3"> -->
                                                <input type="text" class="form-control form_datetime" id="APPOINTMENT_DATE_END" name="APPOINTMENT_DATE_END">
                                            <!-- </div> -->
                                        </div>
                                        
                                    </form>
                                    <div class="row btn_index">
                                       <!--  <a class="btn btn-success" href="userSaveSearch.php">常用搜索条件管理</a>
                                        <button type="button" class="btn btn-warning" id="btn_save" >保存为常用搜索条件</button>
                                         <button type="button" class="btn btn-info">保存为常用搜索条件</button> -->
                                        <button type="button" class="btn btn-primary" id="btn_search" >搜索医生</button>
                                    </div>
                               <!--  </div> -->
                            <!-- </div>不透明文字  -->
                        <!-- </div>透明背景 -->
                    </div><!-- /.row --> 
                </div>
            </div><!-- thumb-box2 -->

            <div class="col-lg-12">
                <p class="title wow fadeInUp">We specialize in helping patients with symptomatic rapid appointment to doctor.</p>
            </div>
            <div class="col-lg-10 col-lg-offset-1">
                <p class="description wow fadeInUp" data-wow-delay="0.1s">Nos especializamos en ayudar a los pacientes con cita rápida sintomática en médico.</p>
                <a href="index-2.php" class="btn-default btn1 wow fadeInUp" data-wow-delay="0.2s">read more</a>
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
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>

<script src="js/tm-scripts.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/index.js"></script>

</body>
</html>