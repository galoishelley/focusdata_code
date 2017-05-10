var para, json_str, json_form;
var result, func_code, requesttype;



(function ($) {
    $.fn.bootstrapValidator.validators.medicareNumberValidation = {
        /**
         * @param {BootstrapValidator}
         *            validator The validator plugin instance
         * @param {jQuery}
         *            $field The jQuery object represents the field element
         * @param {Object}
         *            options The validator options
         * @returns {boolean}
         */
        validate: function (validator, $field, options) {
            // You can get the field value
            var val = $field.val();

            // strip non-numeric, and update the field
            var val = val.replace(/\D/g, '');

            // bail early if blank (may trigger required)
            // if(!val) { returnf; }

            var blacklist = [
                '0000000000',
                '3316611188'
            ];

            if (_.contains(blacklist, val)) {
                // console.warn( 'Medicare # blacklisted' );
                return false;
                // return 'Not a valid medicare number.';
            }

            // valid test medicare number: 123 123 123 1 / 1
            // http://www.clearwater.com.au/code/medicare
            var M_WEIGHTS = [1, 3, 7, 9, 1, 3, 7, 9];

            if (val.length != 10) {
                return false;
                // return 'Must be 10 digits long.';
            }

            var sum = 0;
            var checkDigit = parseInt(val[8], 10);
            for (var i = 0; i < 8; i++) {
                sum += M_WEIGHTS[i] * parseInt(val[i], 10);
            }
            if ((sum % 10) !== checkDigit) {
                return false;
                // return 'Not a valid medicare number.';
            }


            return true;

        }
    };
}(window.jQuery));


$(function () {

    if($(window).width()>768)
    {
        $("#CUSTOMER_USER_MAIL").css("width","400px");
        $("#CUSTOMER_ADDR").css("width","400px");
        
    }


    $("#CUSTOMER_BIRTHDAY").mask("99/99/9999", {
        placeholder: "dd/mm/yyyy"
    });
    // 记住用户名密码
    function Save() {
        var str_username = $("#CUSTOMER_USER_MAIL").val();
        var str_password = $("#CUSTOMER_USER_PWD").val();
        var str_usertype = 1;

        $.cookie("fd_username", str_username);
        $.cookie("fd_password", str_password);

        // 记录user type
        if (str_usertype == 0) {
            str_usertypename = "诊所用户";
        } else if (str_usertype == 1) {
            str_usertypename = "个人用户";
        } else if (str_usertype == 2) {
            str_usertypename = "管理员";
        }

        $.cookie("fd_usertype", str_usertype);
        $.cookie("fd_usertypename", str_usertypename);

    };


    // 填充州
    func_code = "SSTE";
    para = "";
    json_str = request_const(para, func_code, 0);

    result = true;
    $.ajax({
        type: "POST",
        url: "classes/class.getState.php",
        dataType: "json",
        async: false,
        data: {
            request: json_str
        },
        success: function (msg) {
            // console.log(msg);
            var ret = msg.response;
            if (ret.success) {
                if (json_str.sequ != ret.sequ) {
                    alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
                    result = false;
                }
                // var data = ret.data[0];
                $.each(ret.data, function (i, item) {
                    $("#STATE_ID").append("<option value='" + item.STATE_ID + "'>" + item.STATE_NAME + "</option>");
                });
                // console.log(data);
            } else {
                alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                result = false;
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            // 请求失败之后的操作
            var ret_code = "999999";
            var ret_msg = "Error,contact admin please!";
            alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
            result = false;
        }
    });
    if (!result) {
        return result;
    }

    // 填充title
    func_code = "SSTE";
    para = "";
    json_str = request_const(para, func_code, 0);

    result = true;
    $.ajax({
        type: "POST",
        url: "classes/class.getTitle.php",
        dataType: "json",
        async: false,
        data: {
            request: json_str
        },
        success: function (msg) {
            // console.log(msg);
            var ret = msg.response;
            if (ret.success) {
                if (json_str.sequ != ret.sequ) {
                    alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
                    result = false;
                }
                // var data = ret.data[0];
                $.each(ret.data, function (i, item) {
                    $("#TITLE_ID").append("<option value='" + item.TITLE_ID + "'>" + item.TITLE_NAME + "</option>");
                });
                // console.log(data);
            } else {
                alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                result = false;
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            // 请求失败之后的操作
            var ret_code = "999999";
            var ret_msg = "Error,contact admin please!";
            alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
            result = false;
        }
    });
    if (!result) {
        return result;
    }



    // 填充性别
    func_code = "SSTE";
    para = "";
    json_str = request_const(para, func_code, 0);

    result = true;
    $.ajax({
        type: "POST",
        url: $('#Lang0323').html(),
        dataType: "json",
        async: false,
        data: {
            request: json_str
        },
        success: function (msg) {
            // console.log(msg);
            var ret = msg.response;
            if (ret.success) {
                if (json_str.sequ != ret.sequ) {
                    alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
                    result = false;
                }

                $.each(ret.data, function (i, item) {
                    $("#GENDER_ID").append("<option value='" + item.GENDER_ID + "'>" + item.GENDER_NAME + "</option>");
                });

            } else {
                alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                result = false;
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            // 请求失败之后的操作
            var ret_code = "999999";
            var ret_msg = "Error,contact admin please!";
            alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
            result = false;
        }
    });
    if (!result) {
        return result;
    }





    $("#sele_user").change(function () {
        if ($(this).val() == "1") {
            window.location.href = "sign_up_clinic.php";
        }
    });

    $("body").keydown(function () {
        if (event.keyCode == "13") { // keyCode=13是回车键
            $('#signup_ok').click();
        }
    });

    // 解决表单验证
    $("#signup_form").submit(function (ev) {
        ev.preventDefault();
    });

    $('#signup_ok').click(function () {
        var bootstrapValidator = $("#signup_form").data('bootstrapValidator');
        bootstrapValidator.validate();
        if (bootstrapValidator.isValid()) {
            $("#signup_form").submit();
        } else {
            return false;
        }

        /* calculate lat/lng begin */
        var address = $('#CUSTOMER_ADDR').val() + "," + $('#CUSTOMER_SUBURB').val() + "," + $("#STATE_ID option:selected").text() + "," + "Australia";
        var geocoder = new google.maps.Geocoder();
        if (geocoder) {
            geocoder.geocode({
                'address': address
            }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {

                        $('#CUSTOMER_LAT').val(results[0].geometry.location.lat());
                        $('#CUSTOMER_LNG').val(results[0].geometry.location.lng());


                        requesttype = 0;
                        func_code = "UU02";
                        // form序列化成json
                        json_form = $("#signup_form").serializeObject();
                        // 生成输入参数
                        json_str = request_const(json_form, func_code, requesttype);

                        // console.log(json_str);

                        result = true;
                        $.ajax({
                            type: "POST",
                            url: "classes/class.sign_up_person.php",
                            dataType: "json",
                            async: false,
                            data: {
                                request: json_str
                            },
                            success: function (msg) {
                                var ret = msg.response;
                                if (ret.success) {
                                    if (json_str.sequ != ret.sequ) {
                                        alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
                                        result = false;
                                    }

                                    // 注册成功
                                    // window.location.href="sign_in.php";

                                } else {
                                    alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                                    $('#signup_ok').attr('disabled', false);
                                    result = false;
                                }
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                // 请求失败之后的操作
                                var ret_code = "999999";
                                var ret_msg = "Error,contact admin please!";
                                alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
                                result = false;
                            }
                        });
                        if (!result) {
                            return result;
                        }


                        // /////////////////////////////////组织ajax 请求参数
                        // begin///////////////////////////////
                        func_code = "UI01";
                        requesttype = 0;

                        para = {
                            USER_MAIL: $('#CUSTOMER_USER_MAIL').val(),
                            USER_PWD: $('#CUSTOMER_USER_PWD').val(),
                            usertype: 1
                        }

                        // serviceid = UI01
                        // 生成输入参数,函数参数说明
                        // 1- json格式 项目实际需要的参数data
                        // 2- serviceid = UI01 在[二维码服务API接口文档.xlsx]文档中 服务(serviceid)列表 查找
                        // 3- 默认0 请求类型 一般情况无用
                        json_str = request_const(para, func_code, requesttype);
                        // alert(JSON.stringify(json_str));

                        // console.log(json_str);

                        // /////////////////////////////////组织ajax 请求参数
                        // end///////////////////////////////
                        // 自动登录
                        result = true;
                        $.ajax({
                            type: "POST",
                            url: "classes/class.sign_in.php",
                            dataType: "json",
                            async: false,
                            data: {
                                request: json_str
                            },
                            success: function (msg) {
                                // console.log(msg);
                                var ret = msg.response;
                                if (ret.success) {
                                    if (json_str.sequ != ret.sequ) {
                                        alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
                                        result = false;
                                    }

                                    // 登录标志
                                    $.cookie("ilogin", 1);


                                    $.cookie("welcomeInfo", $("#TITLE_ID option:selected").text()+' '+$('#CUSTOMER_LASTNAME').val());
                                    // 记录cookie
                                    Save();

                                } else {
                                    alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                                    // $('#signin_ok').attr('disabled',false);
                                    result = false;
                                }

                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                // 请求失败之后的操作
                                var ret_code = "999999";
                                var ret_msg = "Error,contact admin please!";
                                alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
                                result = false;
                            }
                        });
                        if (!result) {
                            return result;
                        }

                        // 注册成功
                        // 登录标志
                        // $.cookie("ilogin", 1);
                        // 记录cookie
                        Save();

                        var ilogin = $.cookie("ilogin");
                        var username = $.cookie("fd_username");
                        var fd_usertype = $.cookie("fd_usertype");

                        var url;
                        if (fd_usertype == 0) {
                            url = "classes/class.ClinicDetail.php";
                        } else if (fd_usertype == 1) {
                            url = "classes/class.UserDetail.php";
                        } else if (fd_usertype == 2) {
                            $('#li_Admin').removeClass("hidden");
                            url = "classes/class.AdminDetail.php";
                        } else {

                        }

                        // 获取用户基本信息
                        func_code = "UI02";
                        para = {
                            username: username
                        };

                        json_str = request_const(para, func_code, 0);

                        console.log(json_str);
                        // 获取USER_ID
                        result = true;
                        $.ajax({
                            type: "POST",
                            url: url,
                            dataType: "json",
                            async: false,
                            data: {
                                request: json_str
                            },
                            success: function (msg) {
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
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                // 请求失败之后的操作
                                var ret_code = "999999";
                                var ret_msg = "Error,contact admin please!";
                                alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
                                result = false;
                            }
                        });
                        if (!result) {
                            return result;
                        }

                        // 登录成功实现跳转
                        if (fd_usertype == 0) {
                            window.location.href = "clinicUpdUserInfo.php";
                        } else if (fd_usertype == 1) {
                            window.location.href = "index.php";
                        } else if (fd_usertype == 2) {
                            window.location.href = "adminQryClinic.php";
                        }

                        return false;


                    } else {
                        alert("Invalid address!");
                    }
                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });
        }

        /* calculate lat/lng end */

    });

    $('#signup_form').bootstrapValidator({　　
        message: 'This value is not valid',
        　feedbackIcons: {　　　　　　　　
            valid: 'glyphicon glyphicon-ok',
            　　　　　　　　invalid: 'glyphicon glyphicon-remove',
            　　　　　　　　validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            CUSTOMER_USER_NAME: {
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: 'Alphabetical, number and underscore'
                    },
                    different: {
                        field: 'CUSTOMER_USER_PWD',
                        message: 'User name and password cannot be the same'
                    }
                }
            },
            CUSTOMER_USER_MAIL: {
                validators: {
                    notEmpty: {
                        message: 'The email is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            CUSTOMER_USER_PWD: {
                validators: {
                    notEmpty: {
                        message: 'Password is required and cannot be empty'
                    }
                },
                different: {
                    field: 'CUSTOMER_USER_NAME',
                    message: 'User name and password cannot be the same'
                },
                identical: {
                    field: 'CUSTOMER_USER_PWD', // 需要进行比较的input name值
                    message: 'The password and the confirm are not the same'
                }
            },
            CONFIME_PWD: {
                validators: {
                    notEmpty: {
                        message: 'Confirm is required and cannot be empty'
                    },
                    different: {
                        field: 'CUSTOMER_USER_NAME',
                        message: 'User name and password cannot be the same'
                    },
                    identical: { // 相同
                        field: 'CUSTOMER_USER_PWD', // 需要进行比较的input name值
                        message: 'The password and the confirm are not the same'
                    },
                }
            },
            CUSTOMER_NAME: {
                validators: {
                    notEmpty: {
                        message: 'Name is required and cannot be empty'
                    }
                }
            },

            CUSTOMER_GENDER: {
                validators: {
                    notEmpty: {
                        message: 'Gender is required and cannot be empty'
                    }
                }
            },
            CUSTOMER_BIRTHDAY: {
                validators: {
                    // notEmpty: {
                    // message: '生日不能为空'
                    // }
                    // date: {
                    // format: 'YYYY/MM/DD',
                    // message: '不是合法的生日'
                    // }
                }
            },
            CUSTOMER_PHONE_NO: {
                validators: {
                    notEmpty: {
                        message: 'Phone number is required and cannot be empty'
                    },
                    digits: {
                        message: 'The phone number is not valid'
                    },
                    stringLength: {
                        min: 10,
                        max: 10,
                        message: 'Needs to be 10 numbers'
                    }
                }
            },
            MEDICAL_CARD_NO: {
                validators: {
                    /*
                    medicareNumberValidation: {
                        message: 'Invalid medicare number'
                    },
                    notEmpty: {
                        message: 'Medical card number is required and cannot be empty'
                    }
                    */
                }
            },
            CUSTOMER_ADDR: {
                validators: {
                    notEmpty: {
                        message: 'Address is required and cannot be empty'
                    }
                }
            },
            CUSTOMER_POSTCODE: {
                validators: {
                    notEmpty: {
                        message: 'Postcode is required and cannot be empty'
                    }
                }
            },
            CUSTOMER_SUBURB: {
                validators: {
                    notEmpty: {
                        message: 'Suburb is required and cannot be empty'
                    }
                }
            },
            STATE_ID: {
                validators: {
                    notEmpty: {
                        message: 'State is required and cannot be empty'
                    }
                }
            }
        }
    });

});