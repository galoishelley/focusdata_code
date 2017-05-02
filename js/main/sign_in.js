var para, json_str, json_form;
var result, func_code, requesttype;

$(function() {

    // if($.cookie("ilogin") == 1)
    // {
    //   $('#userinfo').html($("#USER_MAIL").val());
    // }
    //选择Remember Me记录cookie
    if ($.cookie("fd_rmbUser") == "true") {
        $("#ck_rmbUser").attr("checked", true);
        $("#USER_MAIL").val($.cookie("fd_username"));
        $("#USER_PWD").val($.cookie("fd_password"));
        $("input[name='usertype']:eq(" + $.cookie("fd_usertype") + ")").attr("checked", 'checked');
    }

    //记住用户名密码
    function Save() {
        var str_username = $("#USER_MAIL").val();
        var str_password = $("#USER_PWD").val();
        var str_usertype = 1;

        if ($("#ck_rmbUser").attr("checked")) {
            $.cookie("fd_rmbUser", "true", {
                expires: 7
            }); //存储一个带7天期限的cookie
        } else {
            $.cookie("fd_rmbUser", "false", {
                expire: -1
            }); //保存半小时
            // $.cookie("fd_username", "", { expires: -1 });
            // $.cookie("fd_password", "", { expires: -1 });
        }

//        $.cookie("fd_username", str_username, {
//            expires: 7
//        });
//        $.cookie("fd_password", str_password, {
//            expires: 7
//        });
        
        $.cookie("fd_username", str_username);
        $.cookie("fd_password", str_password);


        //记录user type
        if (str_usertype == 0) {
            str_usertypename = $("#Lang0186").html();
        } else if (str_usertype == 1) {
            str_usertypename = $("#Lang0187").html();
        } else if (str_usertype == 2) {
            str_usertypename = $("#Lang0188").html();
        }

        $.cookie("fd_usertype", str_usertype, {
            expires: 7
        });
        $.cookie("fd_usertypename", str_usertypename, {
            expires: 7
        });

    };

    //解决表单验证
    $("#signup_form").submit(function(ev) {
        ev.preventDefault();
    });

    $('#signin_ok').click(function() {
        var bootstrapValidator = $("#signin_form").data('bootstrapValidator');
        bootstrapValidator.validate();
        if (bootstrapValidator.isValid()) {
            $("#signin_form").submit();
        }

        ///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
        func_code = "UI01";
        requesttype = 1;

        //form序列化成json
        json_form = $("#signin_form").serializeObject();
        json_form.usertype=1;
        // serviceid = UI01
        //生成输入参数,函数参数说明
        // 1- json格式 项目实际需要的参数data
        // 2- serviceid = UI01 在[二维码服务API接口文档.xlsx]文档中 服务(serviceid)列表 查找
        // 3- 默认0 请求类型 一般情况无用
        json_str = request_const(json_form, func_code, requesttype);
        //alert(JSON.stringify(json_str));
        // console.log(json_str);
        ///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
        result = true;
        $.ajax({
            type: "POST",
            url: "classes/class.sign_in.php",
            dataType: "json",
            async: false,
            data: {
                request: json_str
            },
            success: function(msg) {
       
                var ret = msg.response;
                if (ret.success) {
                    if (json_str.sequ != ret.sequ) {
                        alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
                        result = false;
                    }

                    //登录标志
                    $.cookie("ilogin", 1);
                    //记录cookie
                    Save();
                    $.cookie("welcomeInfo", ret.data[0].name);

                } else {
                    alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                    $('#signin_ok').attr('disabled', false);
                    result = false;
                }

            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                //请求失败之后的操作
                var ret_code = "999999";
                var ret_msg = "Error,contact admin please!";
                alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
                result = false;
            }
        });
        if (!result) {
            return result;
        }

        var ilogin = $.cookie("ilogin");
        var username = $.cookie("fd_username");
        var fd_usertype = $.cookie("fd_usertype");

        if (ilogin != 1) return false;

        var url;
        if (fd_usertype == 0) {
            url = "classes/class.ClinicDetail.php";
        } else if (fd_usertype == 1) {
            url = "classes/class.UserDetail.php";
        } else if (fd_usertype == 2) {
            $('#li_Admin').removeClass("hidden");
            url = "classes/class.AdminDetail.php";
        } else {}

        //获取用户基本信息
        func_code = "UI02";
        var para = {
            username: username
        };

        var json_str = request_const(para, func_code, 0);

        // console.log(json_str);
        //获取USER_ID
        result = true;
        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            async: false,
            data: {
                request: json_str
            },
            success: function(msg) {
                // console.log(msg);
                var ret = msg.response;
                if (ret.success) {
                    if (json_str.sequ != ret.sequ) {
                        alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
                        result = false;
                    }
                    var data = ret.data[0];

                    console.log(data);
                    if (fd_usertype == 0) {
                        $.cookie("fd_userid", data.CLINIC_USER_ID);
                    } else if (fd_usertype == 1) {
                        $.cookie("fd_userid", data.CUSTOMER_USER_ID);
                    } else if (fd_usertype == 2) {
                        $.cookie("fd_userid", data.ADMIN_ID);
                    } else {

}
                } else {
                    alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                    result = false;
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                //请求失败之后的操作
                var ret_code = "999999";
                var ret_msg = "Error,contact admin please!";
                alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
                result = false;
            }
        });
        if (!result) {
            return result;
        }

        //登录成功实现跳转
        // var str_usertype = $('input[name="usertype"]:checked').val();
        //记录user type
        if (fd_usertype == 0) {
            window.location.href = "clinicUpdUserInfo.php";
        } else if (fd_usertype == 1) {
            window.location.href = "index.php";
        } else if (fd_usertype == 2) {
            window.location.href = "adminQryClinic.php";
        }

        return false;
    });

    $("body").keydown(function() {
        if (event.keyCode == "13") { //keyCode=13是回车键
            $('#signin_ok').click();
        }
    });

    $('#signin_form').bootstrapValidator({　　　message: 'This value is not valid',
        　feedbackIcons: {　　　　　　　　valid: 'glyphicon glyphicon-ok',
            　　　　　　　　invalid: 'glyphicon glyphicon-remove',
            　　　　　　　　validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            USER_MAIL: {
                validators: {
                    notEmpty: {
                        message: 'User name can not be empty!'
                    }
                }
            },
            USER_PWD: {
                validators: {
                    notEmpty: {
                        message: 'Password can not be empty!'
                    }
                }
            }
        }
    });
});