var para, json_str, json_form;
var result, func_code, requesttype;

!function (a) { a.fn.slickModals = function (b) { var c = a.extend({ cookieTriggerClass: "setSlickCookie", cookieName: "slickCookie" }, b); return this.each(function () { function j(c) { "center" === c ? a(b).children(".slickWindow").css({ margin: "auto" }) : "bottomCenter" === c || "topCenter" === c ? a(b).children(".slickWindow").css({ "margin-left": "auto", "margin-right": "auto" }) : "right" !== c && "left" !== c || a(b).children(".slickWindow").css({ "margin-top": "auto", "margin-bottom": "auto" }) } function k() { c.breakPoint = parseInt(c.breakPoint), a(b).children(".slickWindow").addClass("animated").css({ "box-shadow": c.popupShadowOffsetX + " " + c.popupShadowOffsetY + " " + c.popupShadowBlurRadius + " " + c.popupShadowSpreadRadius + " " + c.popupShadowColor, background: c.popupBackground, "-webkit-animation-duration": c.popupAnimationDuration + "s", "animation-duration": c.popupAnimationDuration + "s", "-webkit-animation-delay": parseFloat(c.overlayTransitionSpeed) / 2 + "s", "animation-delay": parseFloat(c.overlayTransitionSpeed) / 2 + "s" }), c.responsive === !0 && a(window).width() <= c.breakPoint ? (a(b).children(".slickWindow").addClass(c.mobileLocation).css({ "border-radius": c.mobileRadius, width: c.mobileWidth, height: c.mobileHeight, margin: c.mobileMargin, padding: c.mobilePadding }), j(c.mobileLocation)) : (a(b).children(".slickWindow").addClass(c.popupLocation).css({ "border-radius": c.popupRadius, width: c.popupWidth, height: c.popupHeight, margin: c.popupMargin, padding: c.popupPadding }), j(c.popupLocation)) } function l() { a(b).children(".slickWindow").addClass(c.popupAnimationEffect) } function m() { a(b).children(".slickWindow").removeClass(c.popupAnimationEffect) } function n() { c.contentAnimate === !0 && a(b).children(".slickWindow").children().not(".slickCloseBtn").wrapAll('<div class="slickContent"></div>') } function o() { c.contentAnimate === !0 && a(b).find(".slickWindow .slickContent").addClass(c.contentAnimateEffect + " animated").css({ "-webkit-animation-duration": c.contentAnimateSpeed + "s", "animation-duration": c.contentAnimateSpeed + "s", "-webkit-animation-delay": c.contentAnimateDelay + "s", "animation-delay": c.contentAnimateDelay + "s" }) } function p() { c.contentAnimate === !0 && a(b).find(".slickWindow .slickContent").removeClass(c.contentAnimateEffect) } function q() { i.addClass("blurred").css({ "-webkit-filter": "blur(" + c.blurBgRadius + ")", filter: "blur(" + c.blurBgRadius + ")" }) } function r() { i.addClass("scaled").css({ "-webkit-transform": "scale(" + c.scaleBgValue + ")", transform: "scale(" + c.scaleBgValue + ")" }) } function s() { "blur" === c.pageEffect ? q() : "scale" === c.pageEffect ? r() : "both" === c.pageEffect && (q(), r()), "blur" !== c.pageEffect && "scale" !== c.pageEffect && "both" !== c.pageEffect || i.css({ "-webkit-transition-duration": c.overlayTransitionSpeed + "s", "transition-duration": c.overlayTransitionSpeed + "s" }) } function t() { (i.hasClass("blurred") || i.hasClass("scaled")) && i.removeClass("blurred scaled").css({ "-webkit-transform": "", transform: "", "-webkit-filter": "", filter: "" }) } function u() { c.overlayBg === !0 && (a(b).prepend('<div class="slickOverlay"></div>'), c.overlayClosesModal === !0 && a(b).children(".slickOverlay").addClass("closeModal"), a(b).children(".slickOverlay").addClass(c.cookieTriggerClass).css({ background: c.overlayBgColor, "-webkit-transition-duration": c.overlayTransitionSpeed + "s", "transition-duration": c.overlayTransitionSpeed + "s" })) } function v() { c.addCloseButton === !0 && (a(b).children(".slickWindow").prepend('<div class="slickCloseBtn close closeModal ' + c.buttonStyle + '"></div>'), c.setCookie === !0 && a(b).find(".slickWindow").children(".closeModal").addClass(c.cookieTriggerClass)) } function w() { c.enableESC === !0 && a(window).bind("keydown", function (a) { 27 === a.keyCode && G() }) } function x() { void 0 !== c.onSlickLoad && c.onSlickLoad() } function y() { void 0 !== c.onSlickClose && c.onSlickClose() } function z() { if (!d) if ("delayed" === c.popupType) setTimeout(F, c.delayTime); else if ("exit" === c.popupType) { var b = !1; a(document).on("mouseleave", function (a) { a.clientY < 0 && !b && (b = !0, F()) }) } else "scrolled" === c.popupType && a(document).scroll(function () { var b = a(this).scrollTop(); b > c.scrollTopDistance && F() }) } function A() { c.videoSupport === !0 && c.videoAutoPlay === !0 && g.length > 0 && g.attr("src", h + "?autoplay=1") } function B() { c.videoSupport === !0 && c.videoStopOnClose === !0 && g.length > 0 && g.attr("src", h + "?autoplay=0") } function C() { switch (days = c.cookieDays, CookieDate = new Date, CookieDate.setTime(CookieDate.getTime() + 24 * days * 60 * 60 * 1e3), c.cookieScope) { case "domain": scopeSetting = "/"; break; case "page": scopeSetting = window.location.href }days > 0 ? document.cookie = c.cookieName + "=true; path=" + scopeSetting + "; expires=" + CookieDate.toGMTString() : 0 === days && (document.cookie = c.cookieName + "=true; path=" + scopeSetting + ";") } function D() { c.setCookie === !0 && (a("." + c.cookieTriggerClass).on("click", function () { C() }), c.enableESC === !0 && a(window).bind("keydown", function (a) { 27 === a.keyCode && C() })) } function E() { a(b).css({ "-webkit-transition-duration": c.overlayTransitionSpeed + "s", "transition-duration": c.overlayTransitionSpeed + "s" }) } function F() { a(b).addClass("isActive"), s(), l(), o(), x(), A() } function G() { a(b).removeClass("isActive"), t(), m(), p(), y(), B() } var b = this, d = document.cookie.indexOf(c.cookieName) >= 0, e = window.location.pathname, f = a.inArray(e, c.hideOnPages) === -1, g = a(b).find('iframe[src*="youtube.com"]'), h = g.attr("src"), i = a("body > *").not(".slickModal, script"); f && (E(), u(), v(), w(), z(), k(), D(), n(), a(b).find(".closeModal").on("click", function () { G() }), a("." + c.reopenClass).on("click", function () { F() })) }) } }(jQuery);
$(function () {

    if ($(window).width() > 768) {
        $("#signin_form").css("width", "300px");
        $("#signin_form").css("margin-left", "-40px");
    }

    $('#popup-1').slickModals({
        overlayBg: true,
        overlayClosesModal: true,
        overlayBgColor: 'rgba(0,0,0,0.85)',
        overlayTransitionSpeed: '0.4',
        popupWidth: '420px',
        popupHeight: '500px',
        popupLocation: 'center',
        popupAnimationDuration: '0.8',
        popupAnimationEffect: 'rotateIn',
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
            });
        } else {
            $.cookie("fd_rmbUser", "false", {
                expire: -1
            });
        }



        $.cookie("fd_username", str_username);
        $.cookie("fd_password", str_password);


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
    $("#signup_form").submit(function (ev) {
        ev.preventDefault();
    });

    $('#signin_ok').click(function () {
        var bootstrapValidator = $("#signin_form").data('bootstrapValidator');
        bootstrapValidator.validate();
        if (bootstrapValidator.isValid()) {
            $("#signin_form").submit();
        }


        func_code = "UI01";
        requesttype = 1;

        //form序列化成json
        json_form = $("#signin_form").serializeObject();
        json_form.usertype = 1;

        json_str = request_const(json_form, func_code, requesttype);

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

                var ret = msg.response;
                if (ret.success) {
                    
                    if (ret.active) {
                        $.cookie("ilogin", 1);
                        Save();
                        $.cookie("welcomeInfo", ret.data[0].name);


                        var username = $.cookie("fd_username");

                        func_code = "UI02";
                        var para = {
                            username: username
                        };
                        var json_str = request_const(para, func_code, 0);

                        result = true;
                        $.ajax({
                            type: "POST",
                            url: "classes/class.UserDetail.php",
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
                                    var data = ret.data[0];
                                    $.cookie("fd_userid", data.CUSTOMER_USER_ID);
                                    $.cookie("my_email",$("#USER_MAIL").val());

                                } else {
                                    alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                                    result = false;
                                }
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                //请求失败之后的操作
                                var ret_code = "999999";
                                var ret_msg = "Error,contact admin please!";
                                alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
                                result = false;
                            }
                        });


                        window.location.href = "index.php";
                    }
                    else {
                        $.cookie("welcomeInfo", ret.data[0].name);
                        $('#activateBtn').trigger('click');

                    }






                } else {
                    alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                    $('#signin_ok').attr('disabled', false);
                    result = false;
                }

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {

                var ret_code = "999999";
                var ret_msg = "Error,contact admin please!";
                alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
                result = false;
            }
        });





    });



    $('#aOK').click(function () {
        //step1.check if this code is correct
        var EMAIL = $("#USER_MAIL").val();
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
                    $.cookie("ilogin", 1);
                    $.cookie("my_email",$("#USER_MAIL").val());
                    Save();

                    var username = $.cookie("fd_username");

                    func_code = "UI02";
                    var para = {
                        username: username
                    };
                    var json_str = request_const(para, func_code, 0);

                    result = true;
                    $.ajax({
                        type: "POST",
                        url: "classes/class.UserDetail.php",
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
                                var data = ret.data[0];
                                $.cookie("fd_userid", data.CUSTOMER_USER_ID);

                            } else {
                                alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
                                result = false;
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            //请求失败之后的操作
                            var ret_code = "999999";
                            var ret_msg = "Error,contact admin please!";
                            alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
                            result = false;
                        }
                    });


                    window.location.href = "index.php";


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




    $("body").keydown(function () {
        if (event.keyCode == "13") { //keyCode=13是回车键
            $('#signin_ok').click();
        }
    });

    $('#signin_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
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