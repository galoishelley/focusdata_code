<nav class="navbar navbar-default navbar-static-top tm_navbar clearfix" role="navigation">
    <div class="container">
        <ul class="nav sf-menu clearfix">
            <li id="li_home" class="hidden">
                <a href="index.php">
                    <!-- Home -->
                    <?php echo $lang['Lang0005']; ?>
                </a>
            </li>
            


            <li class="sub-menu hidden" id="sign_in">
                <a href="#">
                    <?php echo $lang['Lang0014']; ?>
                </a>
                
            </li>


            <li class="sub-menu hidden" id="sign_up">
                <a href="#">
                    <?php echo $lang['Lang0015']; ?>
                </a>
                
            </li>


            <li class="sub-menu" id="langlang">
                <a href="#">
                    <?php echo $lang['Lang0010']; ?>
                    <img id="aus" src="img/lang/australia.png">
                    <img id="china" src="img/lang/china.png">
                </a>
                
                
            </li>


            <li id="userinfoGuest" style="left:250px">
                <a href="#">
             
                    <?php echo $lang['Lang0016']; ?>
                </a>
            </li>

            <li class="sub-menu tourist" style="left:200px" id="userinfo">
                <a href="#">
                    <!-- 游客 -->
                    <?php echo $lang['Lang0016']; ?>
                </a>
                
            </li>
        </ul>


        <ul id="sign_sub" class="submenu sub-menu-login sub-menu" style="display:none; position: absolute ; left:20px">
            <li class="">
                <a href="sign_in.php" style="text-transform: none">
								<?php echo $lang['Lang0027']; ?>                     </a>
            </li>
            <li>
                <a href="sign_in_clinic.php" style="text-transform: none">
								<?php echo $lang['Lang0026']; ?>                     </a>
            </li>

        </ul>

        <ul id="sub_register" class="submenu sub-menu-login sub-menu" style="display:none; position: absolute ; left:20px">
            <li class="">
                <a href="sign_up_person.php" style="text-transform: none">
								<?php echo $lang['Lang0027']; ?>                     </a>
            </li>
            <li>
                <a href="sign_up_clinic.php" style="text-transform: none">
								<?php echo $lang['Lang0026']; ?>                     </a>
            </li>

        </ul>

        <ul id="sub_language" class="submenu sub-menu-login sub-menu" style="display:none; position: absolute ; left:20px">
            <li><a href="?lang=en"><img src="img/lang/australia.png">  English</a></li>
                    <li><a href="?lang=ch"><img src="img/lang/china.png">  中文</a></li>

        </ul>




        <ul class="submenu sub-menu-login sub-menu" id="sub_userinfo" style="display:none; position: absolute ; left:20px">
                    <li>
                        <a href="#" id="usertype"></a>
                    </li>
                    <!-- <li><a href="#">账户管理</a></li> -->
                    <li id="li_SearchDoctor" class="hidden">
                        <a href="searchDoctor.php">
                            <!-- 搜索|预约医生 -->
                            <?php echo $lang['Lang0006']; ?>
                        </a>
                    </li>
                    <li id="li_AppRecoder" class="hidden">
                        <a href="userAppointmentRecoder.php">
                            <!-- 个人用户管理 -->
                            <?php echo $lang['Lang0007']; ?>
                        </a>
                    </li>
                    <li id="li_ClinicUser" class="hidden">
                        <a href="clinicUpdUserInfo.php">
                            <!-- 诊所用户管理 -->
                            <?php echo $lang['Lang0008']; ?>
                        </a>
                    </li>
                    <li id="li_Admin" class="hidden">
                        <a href="adminQryClinic.php">
                            <!-- 管理员管理 -->
                            <?php echo $lang['Lang0009']; ?>
                        </a>
                    </li>
                    <li id="li_sign_out" class="hidden"><button class="btn btn-danger" id="btn_out" style="
    height: 20px;
    padding-top: 0px;
    padding-bottom: 0px;font-size:12px;"><!-- 安全退出 --><?php echo $lang['Lang0017']; ?></button></li>
                </ul>


     



    </div>
</nav>