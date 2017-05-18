var para, json_str, json_form;
var result, func_code, requesttype;
!function (a) { a.fn.slickModals = function (b) { var c = a.extend({ cookieTriggerClass: "setSlickCookie", cookieName: "slickCookie" }, b); return this.each(function () { function j(c) { "center" === c ? a(b).children(".slickWindow").css({ margin: "auto" }) : "bottomCenter" === c || "topCenter" === c ? a(b).children(".slickWindow").css({ "margin-left": "auto", "margin-right": "auto" }) : "right" !== c && "left" !== c || a(b).children(".slickWindow").css({ "margin-top": "auto", "margin-bottom": "auto" }) } function k() { c.breakPoint = parseInt(c.breakPoint), a(b).children(".slickWindow").addClass("animated").css({ "box-shadow": c.popupShadowOffsetX + " " + c.popupShadowOffsetY + " " + c.popupShadowBlurRadius + " " + c.popupShadowSpreadRadius + " " + c.popupShadowColor, background: c.popupBackground, "-webkit-animation-duration": c.popupAnimationDuration + "s", "animation-duration": c.popupAnimationDuration + "s", "-webkit-animation-delay": parseFloat(c.overlayTransitionSpeed) / 2 + "s", "animation-delay": parseFloat(c.overlayTransitionSpeed) / 2 + "s" }), c.responsive === !0 && a(window).width() <= c.breakPoint ? (a(b).children(".slickWindow").addClass(c.mobileLocation).css({ "border-radius": c.mobileRadius, width: c.mobileWidth, height: c.mobileHeight, margin: c.mobileMargin, padding: c.mobilePadding }), j(c.mobileLocation)) : (a(b).children(".slickWindow").addClass(c.popupLocation).css({ "border-radius": c.popupRadius, width: c.popupWidth, height: c.popupHeight, margin: c.popupMargin, padding: c.popupPadding }), j(c.popupLocation)) } function l() { a(b).children(".slickWindow").addClass(c.popupAnimationEffect) } function m() { a(b).children(".slickWindow").removeClass(c.popupAnimationEffect) } function n() { c.contentAnimate === !0 && a(b).children(".slickWindow").children().not(".slickCloseBtn").wrapAll('<div class="slickContent"></div>') } function o() { c.contentAnimate === !0 && a(b).find(".slickWindow .slickContent").addClass(c.contentAnimateEffect + " animated").css({ "-webkit-animation-duration": c.contentAnimateSpeed + "s", "animation-duration": c.contentAnimateSpeed + "s", "-webkit-animation-delay": c.contentAnimateDelay + "s", "animation-delay": c.contentAnimateDelay + "s" }) } function p() { c.contentAnimate === !0 && a(b).find(".slickWindow .slickContent").removeClass(c.contentAnimateEffect) } function q() { i.addClass("blurred").css({ "-webkit-filter": "blur(" + c.blurBgRadius + ")", filter: "blur(" + c.blurBgRadius + ")" }) } function r() { i.addClass("scaled").css({ "-webkit-transform": "scale(" + c.scaleBgValue + ")", transform: "scale(" + c.scaleBgValue + ")" }) } function s() { "blur" === c.pageEffect ? q() : "scale" === c.pageEffect ? r() : "both" === c.pageEffect && (q(), r()), "blur" !== c.pageEffect && "scale" !== c.pageEffect && "both" !== c.pageEffect || i.css({ "-webkit-transition-duration": c.overlayTransitionSpeed + "s", "transition-duration": c.overlayTransitionSpeed + "s" }) } function t() { (i.hasClass("blurred") || i.hasClass("scaled")) && i.removeClass("blurred scaled").css({ "-webkit-transform": "", transform: "", "-webkit-filter": "", filter: "" }) } function u() { c.overlayBg === !0 && (a(b).prepend('<div class="slickOverlay"></div>'), c.overlayClosesModal === !0 && a(b).children(".slickOverlay").addClass("closeModal"), a(b).children(".slickOverlay").addClass(c.cookieTriggerClass).css({ background: c.overlayBgColor, "-webkit-transition-duration": c.overlayTransitionSpeed + "s", "transition-duration": c.overlayTransitionSpeed + "s" })) } function v() { c.addCloseButton === !0 && (a(b).children(".slickWindow").prepend('<div class="slickCloseBtn close closeModal ' + c.buttonStyle + '"></div>'), c.setCookie === !0 && a(b).find(".slickWindow").children(".closeModal").addClass(c.cookieTriggerClass)) } function w() { c.enableESC === !0 && a(window).bind("keydown", function (a) { 27 === a.keyCode && G() }) } function x() { void 0 !== c.onSlickLoad && c.onSlickLoad() } function y() { void 0 !== c.onSlickClose && c.onSlickClose() } function z() { if (!d) if ("delayed" === c.popupType) setTimeout(F, c.delayTime); else if ("exit" === c.popupType) { var b = !1; a(document).on("mouseleave", function (a) { a.clientY < 0 && !b && (b = !0, F()) }) } else "scrolled" === c.popupType && a(document).scroll(function () { var b = a(this).scrollTop(); b > c.scrollTopDistance && F() }) } function A() { c.videoSupport === !0 && c.videoAutoPlay === !0 && g.length > 0 && g.attr("src", h + "?autoplay=1") } function B() { c.videoSupport === !0 && c.videoStopOnClose === !0 && g.length > 0 && g.attr("src", h + "?autoplay=0") } function C() { switch (days = c.cookieDays, CookieDate = new Date, CookieDate.setTime(CookieDate.getTime() + 24 * days * 60 * 60 * 1e3), c.cookieScope) { case "domain": scopeSetting = "/"; break; case "page": scopeSetting = window.location.href }days > 0 ? document.cookie = c.cookieName + "=true; path=" + scopeSetting + "; expires=" + CookieDate.toGMTString() : 0 === days && (document.cookie = c.cookieName + "=true; path=" + scopeSetting + ";") } function D() { c.setCookie === !0 && (a("." + c.cookieTriggerClass).on("click", function () { C() }), c.enableESC === !0 && a(window).bind("keydown", function (a) { 27 === a.keyCode && C() })) } function E() { a(b).css({ "-webkit-transition-duration": c.overlayTransitionSpeed + "s", "transition-duration": c.overlayTransitionSpeed + "s" }) } function F() { a(b).addClass("isActive"), s(), l(), o(), x(), A() } function G() { a(b).removeClass("isActive"), t(), m(), p(), y(), B() } var b = this, d = document.cookie.indexOf(c.cookieName) >= 0, e = window.location.pathname, f = a.inArray(e, c.hideOnPages) === -1, g = a(b).find('iframe[src*="youtube.com"]'), h = g.attr("src"), i = a("body > *").not(".slickModal, script"); f && (E(), u(), v(), w(), z(), k(), D(), n(), a(b).find(".closeModal").on("click", function () { G() }), a("." + c.reopenClass).on("click", function () { F() })) }) } }(jQuery);



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

    if ($(window).width() > 768) {
        $("#CUSTOMER_USER_MAIL").css("width", "400px");
        $("#CUSTOMER_ADDR").css("width", "400px");

    }


    $("#CUSTOMER_BIRTHDAY").mask("99/99/9999", {
        placeholder: "dd/mm/yyyy"
    });


    $('#popup-1').slickModals({
        overlayBg: true,
        overlayClosesModal: true,
        overlayBgColor: 'rgba(0,0,0,0.85)',
        overlayTransitionSpeed: '0.4',
        popupWidth: '420px',
        popupHeight: '500px',
        popupLocation: 'center',
        popupAnimationDuration: '0.8',
        popupAnimationEffect: 'flipInY',
        popupShadowOffsetX: '0',
        popupShadowOffsetY: '0',
        popupShadowBlurRadius: '20px',
        popupShadowSpreadRadius: '0',
        popupShadowColor: '0',
        popupBackground: 'transparent',
        popupRadius: '0',
        popupMargin: 'auto',
        popupPadding: '0',
        addCloseButton: true,
        buttonStyle: '',
        enableESC: true,
        reopenClass: 'openSlickModal-1',
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

        var EMAIL = $("#CUSTOMER_USER_MAIL").val();


        /* calculate lat/lng begin */
        var address = $('#CUSTOMER_ADDR').val() + "," + $('#CUSTOMER_SUBURB').val() + "," + $("#STATE_ID option:selected").text() + "," + "Australia";
        var geocoder = new google.maps.Geocoder();
        if (geocoder) {
            geocoder.geocode({
                'address': address
            }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {

                        //Step1.sign up

                        $('#CUSTOMER_LAT').val(results[0].geometry.location.lat());
                        $('#CUSTOMER_LNG').val(results[0].geometry.location.lng());

                        var activate_code = "";
                        for (var i = 0; i < 6; i++) {
                            activate_code += Math.floor(Math.random() * 10);
                        }


                        requesttype = 0;
                        func_code = "UU02";
                        json_form = $("#signup_form").serializeObject();

                        json_str = request_const(json_form, func_code, requesttype);

                        json_str.para.ACTIVATION_CODE = activate_code;



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


                        //Step2. send mail

                        var email_text = "Your activate code:" + activate_code;

                        $.ajax({
                            type: "POST",
                            url: "classes/PHPMailer/gmail_activate.php",
                            dataType: "text",
                            async: true,
                            data: {
                                email: EMAIL,
                                pwd: activate_code,
                                name: EMAIL
                            }
                        });

                        if (!result) {
                            return result;
                        }
                        $('#activateBtn').trigger('click');



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


    $('#aOK').click(function () {
        //step1.check if this code is correct
        var EMAIL = $("#CUSTOMER_USER_MAIL").val();
        var ACODE = $("#aCODE").val();

        json_str.para.email = EMAIL;
        json_str.para.acode = ACODE;


        result = true;
        $.ajax({
            type: "POST",
            url: "classes/class.activate.php",
            dataType: "json",
            async: false,
            data: {
                request: json_str
            },
            success: function (msg) {
                if (msg) {


                    func_code = "UI01";
                    requesttype = 0;

                    para = {
                        USER_MAIL: $('#CUSTOMER_USER_MAIL').val(),
                        USER_PWD: $('#CUSTOMER_USER_PWD').val(),
                        usertype: 1
                    }


                    json_str = request_const(para, func_code, requesttype);

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


                                $.cookie("welcomeInfo", $("#TITLE_ID option:selected").text() + ' ' + $('#CUSTOMER_LASTNAME').val());
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


                    //Step2. send mail

                  

                    $.ajax({
                        type: "POST",
                        url: "classes/PHPMailer/gmail_register_succeed.php",
                        dataType: "text",
                        async: true,
                        data: {
                            email: EMAIL,
                            pwd: '',
                            name: EMAIL
                        }
                    });

                    // 登录成功实现跳转
                    if (fd_usertype == 0) {
                        window.location.href = "clinicUpdUserInfo.php";
                    } else if (fd_usertype == 1) {
                        window.location.href = "index.php";
                    } else if (fd_usertype == 2) {
                        window.location.href = "adminQryClinic.php";
                    }




                } else {

                    $("#ainfo").text("Activation code is not correct");



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