// _______________________________________________________________________________________ Globle Variables
var json_form, json_str;
var requesttype = 0;
var func_code, result;


var keyDoctorID;
var keyDate;
var keyTime;




/* ========= INFORMATION ============================

 - document:  Slick Modals - HTML5 and CSS3 powered modal popups
 - author:    Capelle @ Codecanyon
 - profile:   http://codecanyon.net/user/Capelle
 - version:   3.5

 ==================================================== */

! function (a) {
	a.fn.slickModals = function (b) {
		var c = a.extend({
			cookieTriggerClass: "setSlickCookie",
			cookieName: "slickCookie"
		}, b);
		return this.each(function () {
			function j(c) {
				"center" === c ? a(b).children(".slickWindow").css({
					margin: "auto"
				}) : "bottomCenter" === c || "topCenter" === c ? a(b).children(".slickWindow").css({
					"margin-left": "auto",
					"margin-right": "auto"
				}) : "right" !== c && "left" !== c || a(b).children(".slickWindow").css({
					"margin-top": "auto",
					"margin-bottom": "auto"
				})
			}

			function k() {
				if (c.popupWidth == '425px') {
					if ($(window).width() < 425) {
						c.popupWidth = '320px'
						$('.clinic-language').css("width", "400px");
						$('.doctor-language').css("width", "400px");
						$('.doctor-year').css("width", "400px");
						

						$('.doctor-EXTEND_30_MINUTE_CONSULTATION').css("width", "250px");
						$('.clinic-EXTEND_30_MINUTE_CONSULTATION').css("width", "250px");
					}
				}
				c.breakPoint = parseInt(c.breakPoint), a(b).children(".slickWindow").addClass("animated").css({
					"box-shadow": c.popupShadowOffsetX + " " + c.popupShadowOffsetY + " " + c.popupShadowBlurRadius + " " + c.popupShadowSpreadRadius + " " + c.popupShadowColor,
					background: c.popupBackground,
					"-webkit-animation-duration": c.popupAnimationDuration + "s",
					"animation-duration": c.popupAnimationDuration + "s",
					"-webkit-animation-delay": parseFloat(c.overlayTransitionSpeed) / 2 + "s",
					"animation-delay": parseFloat(c.overlayTransitionSpeed) / 2 + "s"
				}), c.responsive === !0 && a(window).width() <= c.breakPoint ? (a(b).children(".slickWindow").addClass(c.mobileLocation).css({
					"border-radius": c.mobileRadius,
					width: c.mobileWidth,
					height: c.mobileHeight,
					margin: c.mobileMargin,
					padding: c.mobilePadding
				}), j(c.mobileLocation)) : (a(b).children(".slickWindow").addClass(c.popupLocation).css({
					"border-radius": c.popupRadius,
					width: c.popupWidth,
					height: c.popupHeight,
					margin: c.popupMargin,
					padding: c.popupPadding
				}), j(c.popupLocation))
			}

			function l() {
				a(b).children(".slickWindow").addClass(c.popupAnimationEffect)
			}

			function m() {
				a(b).children(".slickWindow").removeClass(c.popupAnimationEffect)
			}

			function n() {
				c.contentAnimate === !0 && a(b).children(".slickWindow").children().not(".slickCloseBtn").wrapAll('<div class="slickContent"></div>')
			}

			function o() {
				c.contentAnimate === !0 && a(b).find(".slickWindow .slickContent").addClass(c.contentAnimateEffect + " animated").css({
					"-webkit-animation-duration": c.contentAnimateSpeed + "s",
					"animation-duration": c.contentAnimateSpeed + "s",
					"-webkit-animation-delay": c.contentAnimateDelay + "s",
					"animation-delay": c.contentAnimateDelay + "s"
				})
			}

			function p() {
				c.contentAnimate === !0 && a(b).find(".slickWindow .slickContent").removeClass(c.contentAnimateEffect)
			}

			function q() {
				i.addClass("blurred").css({
					"-webkit-filter": "blur(" + c.blurBgRadius + ")",
					filter: "blur(" + c.blurBgRadius + ")"
				})
			}

			function r() {
				i.addClass("scaled").css({
					"-webkit-transform": "scale(" + c.scaleBgValue + ")",
					transform: "scale(" + c.scaleBgValue + ")"
				})
			}

			function s() {
				"blur" === c.pageEffect ? q() : "scale" === c.pageEffect ? r() : "both" === c.pageEffect && (q(), r()), "blur" !== c.pageEffect && "scale" !== c.pageEffect && "both" !== c.pageEffect || i.css({
					"-webkit-transition-duration": c.overlayTransitionSpeed + "s",
					"transition-duration": c.overlayTransitionSpeed + "s"
				})
			}

			function t() {
				(i.hasClass("blurred") || i.hasClass("scaled")) && i.removeClass("blurred scaled").css({
					"-webkit-transform": "",
					transform: "",
					"-webkit-filter": "",
					filter: ""
				})
			}

			function u() {
				c.overlayBg === !0 && (a(b).prepend('<div class="slickOverlay"></div>'), c.overlayClosesModal === !0 && a(b).children(".slickOverlay").addClass("closeModal"), a(b).children(".slickOverlay").addClass(c.cookieTriggerClass).css({
					background: c.overlayBgColor,
					"-webkit-transition-duration": c.overlayTransitionSpeed + "s",
					"transition-duration": c.overlayTransitionSpeed + "s"
				}))
			}

			function v() {
				c.addCloseButton === !0 && (a(b).children(".slickWindow").prepend('<div class="slickCloseBtn close closeModal ' + c.buttonStyle + '"></div>'), c.setCookie === !0 && a(b).find(".slickWindow").children(".closeModal").addClass(c.cookieTriggerClass))
			}

			function w() {
				c.enableESC === !0 && a(window).bind("keydown", function (a) {
					27 === a.keyCode && G()
				})
			}

			function x() {
				void 0 !== c.onSlickLoad && c.onSlickLoad()
			}

			function y() {
				void 0 !== c.onSlickClose && c.onSlickClose()
			}

			function z() {
				if (!d)
					if ("delayed" === c.popupType) setTimeout(F, c.delayTime);
					else if ("exit" === c.popupType) {
						var b = !1;
						a(document).on("mouseleave", function (a) {
							a.clientY < 0 && !b && (b = !0, F())
						})
					} else "scrolled" === c.popupType && a(document).scroll(function () {
						var b = a(this).scrollTop();
						b > c.scrollTopDistance && F()
					})
			}

			function A() {
				c.videoSupport === !0 && c.videoAutoPlay === !0 && g.length > 0 && g.attr("src", h + "?autoplay=1")
			}

			function B() {
				c.videoSupport === !0 && c.videoStopOnClose === !0 && g.length > 0 && g.attr("src", h + "?autoplay=0")
			}

			function C() {
				switch (days = c.cookieDays, CookieDate = new Date, CookieDate.setTime(CookieDate.getTime() + 24 * days * 60 * 60 * 1e3), c.cookieScope) {
					case "domain":
						scopeSetting = "/";
						break;
					case "page":
						scopeSetting = window.location.href
				}
				days > 0 ? document.cookie = c.cookieName + "=true; path=" + scopeSetting + "; expires=" + CookieDate.toGMTString() : 0 === days && (document.cookie = c.cookieName + "=true; path=" + scopeSetting + ";")
			}

			function D() {
				c.setCookie === !0 && (a("." + c.cookieTriggerClass).on("click", function () {
					C()
				}), c.enableESC === !0 && a(window).bind("keydown", function (a) {
					27 === a.keyCode && C()
				}))
			}

			function E() {
				a(b).css({
					"-webkit-transition-duration": c.overlayTransitionSpeed + "s",
					"transition-duration": c.overlayTransitionSpeed + "s"
				})
			}

			function F() {
				a(b).addClass("isActive"), s(), l(), o(), x(), A()
			}

			function G() {
				a(b).removeClass("isActive"), t(), m(), p(), y(), B()
			}
			var b = this,
				d = document.cookie.indexOf(c.cookieName) >= 0,
				e = window.location.pathname,
				f = a.inArray(e, c.hideOnPages) === -1,
				g = a(b).find('iframe[src*="youtube.com"]'),
				h = g.attr("src"),
				i = a("body > *").not(".slickModal, script");
			f && (E(), u(), v(), w(), z(), k(), D(), n(), a(b).find(".closeModal").on("click", function () {
				G()
			}), a("." + c.reopenClass).on("click", function () {
				F()
			}))
		})
	}
}(jQuery);


// _______________________________________________________________________________________ "Waiting for..." dialog
var waitingDialog = waitingDialog || (function ($) {
	'use strict';

	// Creating modal dialog's DOM
	var $dialog = $(
		'<div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:15%; overflow-y:visible;">' +
		'<div class="modal-dialog modal-m">' +
		'<div class="modal-content">' +
		'<div class="modal-header"><h3 style="margin:0;color:red;"></h3></div>' +
		'<div class="modal-body">' +
		'<div class="progress progress-striped active" style="margin-bottom:0;"><div class="progress-bar" style="width: 100%"></div></div>' +
		'</div>' +
		'</div></div></div>');

	return {
		/**
		 * Opens our dialog
		 * @param message Custom message
		 * @param options Custom options:
		 * 				  options.dialogSize - bootstrap postfix for dialog size, e.g. "sm", "m";
		 * 				  options.progressType - bootstrap postfix for progress bar type, e.g. "success", "warning".
		 */
		show: function (message, options) {
			// Assigning defaults
			if (typeof options === 'undefined') {
				options = {};
			}
			if (typeof message === 'undefined') {
				message = 'Loading';
			}
			var settings = $.extend({
				dialogSize: 'm',
				progressType: '',
				onHide: null // This callback runs after the dialog was hidden
			}, options);

			// Configuring dialog
			$dialog.find('.modal-dialog').attr('class', 'modal-dialog').addClass('modal-' + settings.dialogSize);
			$dialog.find('.progress-bar').attr('class', 'progress-bar');
			if (settings.progressType) {
				$dialog.find('.progress-bar').addClass('progress-bar-' + settings.progressType);
			}
			$dialog.find('h3').text(message);
			// Adding callbacks
			if (typeof settings.onHide === 'function') {
				$dialog.off('hidden.bs.modal').on('hidden.bs.modal', function (e) {
					settings.onHide.call($dialog);
				});
			}
			// Opening dialog
			$dialog.modal();
		},
		/**
		 * Closes dialog
		 */
		hide: function () {
			$dialog.modal('hide');
		}
	};

})(jQuery);



// _______________________________________________________________________________________ medicareNumber 输入框检查
(function ($) {
	$.fn.bootstrapValidator.validators.medicareNumberValidation = {
		/**
		 * @param {BootstrapValidator} validator The validator plugin instance
		 * @param {jQuery} $field The jQuery object represents the field element
		 * @param {Object} options The validator options
		 * @returns {boolean}
		 */
		validate: function (validator, $field, options) {
			// You can get the field value
			var val = $field.val();

			// strip non-numeric, and update the field
			var val = val.replace(/\D/g, '');

			// bail early if blank (may trigger required)
			//if(!val) { returnf; }

			var blacklist = [
				'0000000000',
				'3316611188'
			];

			if (_.contains(blacklist, val)) {
				// console.warn( 'Medicare # blacklisted' );
				return false;
				//return 'Not a valid medicare number.';
			}

			// valid test medicare number: 123 123 123 1 / 1
			// http://www.clearwater.com.au/code/medicare
			var M_WEIGHTS = [1, 3, 7, 9, 1, 3, 7, 9];

			if (val.length != 10) {
				return false;
				//return 'Must be 10 digits long.'; 
			}

			var sum = 0;
			var checkDigit = parseInt(val[8], 10);
			for (var i = 0; i < 8; i++) {
				sum += M_WEIGHTS[i] * parseInt(val[i], 10);
			}
			if ((sum % 10) !== checkDigit) {
				return false;
				//return 'Not a valid medicare number.';
			}


			return true;

		}
	};
}(window.jQuery));



// _______________________________________________________________________________________ $(document).ready
$(function () {


	function arraymove(arr, fromIndex, toIndex) {
		var element = arr[fromIndex];
		arr.splice(fromIndex, 1);
		arr.splice(toIndex, 0, element);
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

	// _______________________________________________________________________________________ language multiselect
	//_________________________________fill language select
	var ajax_get_lang = $.ajax({

		type: "POST",
		url: 'classes/class.get_lang.php',
		dataType: 'json',
	});

	$('#LANGUAGE').multiselect({
		maxHeight: 200
	});


	ajax_get_lang.done(function (data) {
		var r = [];
		for (var i = 0; i < data.length; i++) {
			var item = { label: data[i].LANGUAGE_NAME, value: data[i].LANGUAGE_NAME };
			r.push(item);
		}

		$('#LANGUAGE').multiselect('dataprovider', r);

	});




	// _______________________________________________________________________________________ fill dropdownlist
	//填充州
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
			//请求失败之后的操作
			var ret_code = "999901";
			var ret_msg = "Error,contact admin please!";
			alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
			result = false;
		}
	});
	if (!result) {
		return result;
	}

	//填充title
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
			//请求失败之后的操作
			var ret_code = "999902";
			var ret_msg = "Error,contact admin please!";
			alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
			result = false;
		}
	});
	if (!result) {
		return result;
	}



	//填充性别
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
			//请求失败之后的操作
			var ret_code = "999903";
			var ret_msg = "Error,contact admin please!";
			alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
			result = false;
		}
	});
	if (!result) {
		return result;
	}

	// _______________________________________________________________________________________ fill CUSTOMER_USER_ID

	var fd_usertype = $.cookie("fd_usertype");
	var fd_userid = $.cookie("fd_userid");

	if (fd_userid)
		if (fd_usertype == 1)
			$('#CUSTOMER_USER_ID').val(fd_userid);


	// _______________________________________________________________________________________ functions 





	function SaveNameAndPWD() {
		var str_username = $("#CUSTOMER_USER_MAIL").val();
		var str_password = $("#CUSTOMER_USER_PWD").val();
		var str_usertype = 1;

		$.cookie("fd_username", str_username);
		$.cookie("fd_password", str_password);

		//记录user type
		if (str_usertype == 0) {
			str_usertypename = "Clinic user";
		} else if (str_usertype == 1) {
			str_usertypename = "Personal user";
		} else if (str_usertype == 2) {
			str_usertypename = "Admin";
		}

		$.cookie("fd_usertype", str_usertype);
		$.cookie("fd_usertypename", str_usertypename);

	};

	// _______________________________________________________________________________________ maskedinput
	$("#CUSTOMER_BIRTHDAY").mask("99/99/9999", { placeholder: "dd/mm/yyyy" });

	// _______________________________________________________________________________________ autocomplete
	var localSuburb = localStorage.getItem('suburb');
	if (localSuburb == null) {
		$.ajax({
			type: "GET",
			url: "classes/AutoComplete/suburb.php",
			dataType: "json",
			async: false,
			cache: false,

			success: function (msg) {
				localStorage.setItem('suburb', JSON.stringify(msg));
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				//请求失败之后的操作
				var ret_code = "999911";
				var ret_msg = "Error,contact admin please!";
				alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
			}
		});
	}
	$("#CLINIC_SUBURB").autocomplete({

		//only match with the beginning of terms
		source: function (request, response) {
			var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(request.term), "i");
			response($.grep(JSON.parse(localStorage.getItem('suburb')), function (item) {
				return matcher.test(item);
			}));
		},




		minLength: 3
	});



	// _______________________________________________________________________________________ page main logic
	/*根据登陆与否确定是否显示按钮*/
	if ($.cookie("ilogin") == 1) {
		$('#DISTANCE').prop('disabled', false);
		$('#btn_save_search_manage').show();
		$('#btn_save_search').show();

	}
	else {
		$('#DISTANCE').prop('disabled', true);
		$('#btn_save_search_manage').hide();
		$('#btn_save_search').hide();

	}

	/***
	 * 按钮事件区
	 */
	/*点击收藏搜索条件*/
	$('#btn_save_search').click(function () {
		$('#action_type').val("create");

		func_code = "SS01";

		requesttype = 1;

		json_form = $("#modal_form_search").serializeObject();

		json_str = request_const(json_form, func_code, requesttype);
		console.log(json_str);

		result = true;
		$.ajax({
			type: "POST",
			url: "classes/class.saveSearch.php",
			dataType: "json",
			data: {
				request: json_str
			},
			success: function (msg) {
				var ret = msg.response;
				if (ret.success) {
					if (json_str.sequ != ret.sequ) {
						alert(func_code + ":" + "时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
						result = false;
					}
					alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
				} else {
					alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
					result = false;
				}
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				//请求失败之后的操作
				var ret_code = "999910";
				var ret_msg = "Error,contact admin please!";
				alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
				result = false;
			}
		});
		if (!result) {
			return result;
		}
		$('#action_type').val("index_search");
		return false;
	});


	//获取首页传递的值
	var str_saveDoctor = sessionStorage.saveDoctor;
	console.log(str_saveDoctor);
	if (str_saveDoctor) {
		var json_value = JSON.parse(str_saveDoctor);
		console.log(json_value);
		$('#CLINIC_SUBURB').val(json_value.CLINIC_SUBURB);
		$('#STATE_ID').val(json_value.STATE_ID);
		$('#CLINIC_NAME').val(json_value.CLINIC_NAME);
		$('#DOCTOR_TYPE').val(json_value.DOCTOR_TYPE);
		$('#DOCTOR_NAME').val(json_value.DOCTOR_NAME);
		$('#DISTANCE').val("");
		$('#searchModal').modal('show');
		sessionStorage.saveDoctor = "";
	}
	//获取常用搜索条件页面传递的值
	var str = sessionStorage.saveSearch;
	if (str) {
		var json_value = JSON.parse(str);
		console.log(json_value);
		$('#CLINIC_SUBURB').val(json_value.CLINIC_SUBURB);
		$('#STATE_ID').val(json_value.STATE_ID);
		$('#CLINIC_NAME').val(json_value.CLINIC_NAME);
		$('#DOCTOR_TYPE').val(json_value.DOCTOR_TYPE);
		$('#DOCTOR_NAME').val(json_value.DOCTOR_NAME);
		$('#DISTANCE').val(json_value.DISTANCE);
		$('#searchModal').modal('show');
		sessionStorage.saveSearch = "";
	}
	$('.form_datetime').datetimepicker({
		language: 'EN',
		format: "dd-mm-yyyy",
		todayBtn: 1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: "month"
	});

	// _______________________________________________________________________________________ set calendar
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1; //January is 0!

	var yyyy = today.getFullYear();
	if (dd < 10) {
		dd = '0' + dd;
	}
	if (mm < 10) {
		mm = '0' + mm;
	}
	today = dd + '-' + mm + '-' + yyyy;

	$('.form_datetime').datetimepicker('setStartDate', today);




	// _______________________________________________________________________________________ Guest click timeslot btn
	$('#btn_signin').click(function () {

		// __________________ Step1.check 
		if ($('#CUSTOMER_USER_MAIL').val() == "") {

			alert($("#Lang0174").html());//用户名不能为空
			return false;
		}
		if ($('#CUSTOMER_USER_PWD').val() == "") {

			alert($("#Lang0175").html());//密码不能为空
			return false;
		}
		if ($('#verifyCode').val() == "") {

			alert($("#Lang0176").html());//验证码不能为空
			return false;
		}
		if ($('#CUSTOMER_GENDER').val() == "") {

			alert($("#Lang0177").html());//性别不能为空
			return false;
		}
		if ($('#CUSTOMER_BIRTHDAY').val() == "") {

			alert($("#Lang0178").html());//生日不能为空
			return false;
		}
		if ($('#CUSTOMER_ADDR').val() == "") {

			alert($("#Lang0179").html());//用户地址不能为空
			return false;
		}
		if ($('#CUSTOMER_PHONE_NO').val() == "") {

			alert($("#Lang0180").html());//手机号码不能为空
			return false;
		}
		// if ($('#MEDICAL_CARD_NO').val() == "") {

		// 	alert($("#Lang0181").html());//医疗卡号不能为空
		// 	return false;
		// }

		// __________________ Step2.sign up
		var EMAIL = $("#CUSTOMER_USER_MAIL").val();

		var activate_code = "";
		for (var i = 0; i < 6; i++) {
			activate_code += Math.floor(Math.random() * 10);
		}

		func_code = "UU01";
		json_form = $("#modal_form_signup").serializeObject();
		json_str = request_const(json_form, func_code, 0);
		json_str.para.ACTIVATION_CODE = activate_code;

		$.ajax({
			type: "POST",
			url: "classes/class.sign_up_person.php",
			dataType: "json",
			async: false,
			data: {
				request: json_str
			}
		});


		//__________________ Step3.send mail

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

		//__________________ Step4.popup activation code input
		$('#activateBtn').trigger('click');

	});


	// _______________________________________________________________________________________ Guest click timeslot btn
	$('#aOK').click(function () {

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

								//登录标志
								$.cookie("ilogin", 1);
								$.cookie("my_email", EMAIL);
								//记录cookie
								SaveNameAndPWD();

							} else {
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
								// $('#signin_ok').attr('disabled',false); 
								result = false;
							}

						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999912";
							var ret_msg = "Error,contact admin please!";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							result = false;
						}
					});
					if (!result) {
						return result;
					}

					//自动登录
					var ilogin = $.cookie("ilogin");
					var username = $.cookie("fd_username");
					var fd_usertype = $.cookie("fd_usertype");

					//获取用户基本信息
					url = "classes/class.UserDetail.php";
					func_code = "UI02";
					para = {
						username: username
					};

					json_str = request_const(para, func_code, 0);

					console.log(json_str);
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
						success: function (msg) {
							// console.log(msg);
							var ret = msg.response;
							if (ret.success) {
								if (json_str.sequ != ret.sequ) {
									alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
									result = false;
								}
								var data = ret.data[0];

								$.cookie("fd_userid", data.CUSTOMER_USER_ID);
								$.cookie("my_lat", data.CUSTOMER_LAT);
								$.cookie("my_lng", data.CUSTOMER_LNG);
								$.cookie("my_firstname", data.CUSTOMER_FIRSTNAME);
								$.cookie("my_lastname", data.CUSTOMER_LASTNAME);
								$.cookie("my_address", data.CUSTOMER_ADDR + ',' + data.CUSTOMER_SUBURB);
								$.cookie("my_phone", data.CUSTOMER_PHONE_NO);

							} else {
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
								result = false;
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999913";
							var ret_msg = "Error,contact admin please!";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							result = false;
						}
					});
					if (!result) {
						return result;
					}


					//搜索医生预约时间ID
					var time_id = "";


					//搜索医生预约时间ID
					func_code = "ST01";
					para = {
						DOCTOR_ID: keyDoctorID,
						APPOINTMENT_DATE: keyDate,
						APPOINTMENT_TIME: keyTime
					};

					json_str = request_const(para, func_code, 0);
					//获取DOCTOR_APPOINTMENT_TIME_ID
					result = true;
					$.ajax({
						type: "POST",
						url: "classes/class.searchAppTimeID.php",
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
								console.log(ret);
								time_id = data.DOCTOR_APPOINTMENT_TIME_ID;
							} else {
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
								result = false;
							}

						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999914";
							var ret_msg = "ajaxError,contact admin please";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							result = false;
						}
					});
					if (!result) {
						return result;
					}

					//获取用户详细信息
					var custom_user_id;
					func_code = "UI02";
					para = {
						user_mail: $('#CUSTOMER_USER_MAIL').val()
					};

					json_str = request_const(para, func_code, 0);

					// console.log(json_str);
					//请求
					result = true;
					$.ajax({
						type: "POST",
						url: "classes/class.searchUserDetail.php",
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
								custom_user_id = data.CUSTOMER_USER_ID;
							} else {
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
								result = false;
							}

						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999915";
							var ret_msg = "Error,contact admin please!";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							result = false;
						}
					});
					if (!result) {
						return result;
					}

					// 预约医生
					func_code = "AD01";
					para = {
						action_type: "create",

						CUSTOMER_USER_ID: custom_user_id,
						DOCTOR_ID: keyDoctorID,
						DOCTOR_APPOINTMENT_TIME_ID: time_id,
						APPOINTMENT_STATUS_ID: 1
					};


					requesttype = 1; //注册用户

					json_str = request_const(para, func_code, requesttype);


					//请求
					result = true;
					$.ajax({
						type: "POST",
						url: "classes/class.appointmentDoctor.php",
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
								if (ret.status.ret_code == "AD0102") {
									alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
									result = false;
								}
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);

							} else {
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
								result = false;
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999916";
							var ret_msg = "Error,contact admin please!";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							result = false;
						}
					});
					if (!result) {
						return result;
					}

					//修改医生预约时间状态
					func_code = "UAT0";
					para = {
						action_type: "update",
						DOCTOR_APPOINTMENT_TIME_ID: time_id,
						ACTIVE_STATUS: 0
					};

					json_str = request_const(para, func_code, 1);


					//请求
					result = true;
					$.ajax({
						type: "POST",
						url: "classes/class.appointmentTime.php",
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

							} else {
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
								result = false;
							}

						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999917";
							var ret_msg = "Error,contact admin please!";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							result = false;
						}
					});
					if (!result) {
						return result;
					}

					if ($.cookie("ilogin") == 1) {
						window.location.href = "userAppointmentRecoder.php";
					} else if ($.cookie("ilogin") == 0) {
						// window.location.href="sign_in.php"; 
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





	$('#modal_form_signup').bootstrapValidator({
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
					field: 'CUSTOMER_USER_PWD', //需要进行比较的input name值
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
					identical: {//相同
						field: 'CUSTOMER_USER_PWD', //需要进行比较的input name值
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
					//notEmpty: {
					// message: '生日不能为空'
					// }
					// date: {
					//    format: 'YYYY/MM/DD',
					//    message: '不是合法的生日'
					//  }
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

	function rebindProfile() {


		$('#doctorProfile').slickModals({
			// Hide on pages
			hideOnPages: [
				'/foo/page1/',
				'/foo/page2/',
				'/foo/page3/'
			],
			// Popup type
			popupType: '',
			delayTime: 0,
			scrollTopDistance: 400,
			// Popup cookies
			setCookie: false,
			cookieDays: 30,
			cookieTriggerClass: 'setCookie-1',
			cookieName: 'slickModal-1',
			cookieScope: 'domain',
			// Overlay styling
			overlayBg: true,
			overlayClosesModal: true,
			overlayBgColor: 'rgba(0,0,0,0.5)',
			overlayTransitionSpeed: '0.4',
			// Background effects
			pageEffect: 'scale',
			blurBgRadius: '1px',
			scaleBgValue: '0.98',
			// Popup styling
			popupWidth: '425px',
			popupHeight: '100%',
			popupLocation: 'topRight',
			popupAnimationDuration: '0.6',
			popupAnimationEffect: 'slideRight',
			popupShadowOffsetX: '0',
			popupShadowOffsetY: '0',
			popupShadowBlurRadius: '60px',
			popupShadowSpreadRadius: '0',
			popupShadowColor: 'rgba(0,0,0,0.8)',
			popupBackground: '#fff',
			popupRadius: '0',
			popupMargin: '0',
			popupPadding: '0',
			// Responsive rules
			responsive: false,
			breakPoint: '480px',
			mobileLocation: 'center',
			mobileWidth: '100%',
			mobileHeight: 'auto',
			mobileRadius: '0',
			mobileMargin: '0',
			mobilePadding: '20px',
			// Animate content
			contentAnimate: false,
			contentAnimateEffect: 'slideRight',
			contentAnimateSpeed: '0.4',
			contentAnimateDelay: '0.4',
			// Youtube videos
			videoSupport: true,
			videoAutoPlay: true,
			videoStopOnClose: true,
			// Close and reopen button
			addCloseButton: false,
			buttonStyle: 'icon',
			enableESC: true,
			reopenClass: 'showProfileDoctor',
			// Additional events

			onSlickClose: function () {
				console.log("Slick is hidden")
			}
		});



		// Mini cart
		$('#clinicProfile').slickModals({
			// Hide on pages
			hideOnPages: [
				'/foo/page1/',
				'/foo/page2/',
				'/foo/page3/'
			],
			// Popup type
			popupType: '',
			delayTime: 0,
			scrollTopDistance: 400,
			// Popup cookies
			setCookie: false,
			cookieDays: 30,
			cookieTriggerClass: 'setCookie-1',
			cookieName: 'slickModal-1',
			cookieScope: 'domain',
			// Overlay styling
			overlayBg: true,
			overlayClosesModal: true,
			overlayBgColor: 'rgba(0,0,0,0.5)',
			overlayTransitionSpeed: '0.4',
			// Background effects
			pageEffect: 'scale',
			blurBgRadius: '1px',
			scaleBgValue: '0.98',
			// Popup styling
			popupWidth: '425px',
			popupHeight: '100%',
			popupLocation: 'topRight',
			popupAnimationDuration: '0.6',
			popupAnimationEffect: 'slideRight',
			popupShadowOffsetX: '0',
			popupShadowOffsetY: '0',
			popupShadowBlurRadius: '60px',
			popupShadowSpreadRadius: '0',
			popupShadowColor: 'rgba(0,0,0,0.8)',
			popupBackground: '#fff',
			popupRadius: '0',
			popupMargin: '0',
			popupPadding: '0',
			// Responsive rules
			responsive: false,
			breakPoint: '480px',
			mobileLocation: 'center',
			mobileWidth: '100%',
			mobileHeight: 'auto',
			mobileRadius: '0',
			mobileMargin: '0',
			mobilePadding: '20px',
			// Animate content
			contentAnimate: false,
			contentAnimateEffect: 'slideRight',
			contentAnimateSpeed: '0.4',
			contentAnimateDelay: '0.4',
			// Youtube videos
			videoSupport: true,
			videoAutoPlay: true,
			videoStopOnClose: true,
			// Close and reopen button
			addCloseButton: false,
			buttonStyle: 'icon',
			enableESC: true,
			reopenClass: 'showProfileClinic',
			// Additional events

			onSlickClose: function () {
				console.log("Slick is hidden")
			}
		});


	}

	function replaceToday() {
		$("ul.nav-tabs > li").each(function () {
			var LI = $(this);
			var spanValue = LI.find("a").text();

			var rightNow = new Date();
			var res = rightNow.toISOString().slice(0, 10).replace(/-/g, "-");

			if (reformatDate(res.trim()) == spanValue.trim()) {
				LI.find("a").text("Today");
			}

		});


		$(".search-time-booknow").each(function () {
			var span = $(this);
			var spanValue = span.text();

			var rightNow = new Date();
			var res = rightNow.toISOString().slice(0, 10).replace(/-/g, "-");

			if (reformatDate(res.trim()) == spanValue.trim()) {
				span.text("Today");
			}

		});



	}

	function reformatDate(dateStr) {
		if (dateStr) {
			dArr = dateStr.split("-");  // ex input "2010-01-18"
			return dArr[2] + "-" + dArr[1] + "-" + dArr[0]; //inverse year and day
		}
	}

	/* input: 13:00:00
     * output: 1:00 pm
     */
	function reformatTime(isoTime) {
		var hours = parseInt(isoTime.substring(0, 2), 10),
			minutes = parseInt(isoTime.substring(3, 5), 10),
			ampm = 'am';

		if (hours >= 12) {
			ampm = 'pm';
		}

		if (hours > 12) {
			hours -= 12;
		}

		if (minutes == 0)
			minutes = "00";
		return hours + ':' + minutes + ' ' + ampm;
	}

	function bind_day_tabs(json_str) {


		json_str.para.action_type = "GET_7_DAYS";

		var activeIndex;


		$.ajax({
			type: "POST",
			url: "classes/class.searchClinic.php",
			dataType: "json",
			async: false,
			data: {
				request: json_str
			},
			success: function (msg) {
				var ret = msg.response;

				if (ret.data.length == 0) {
					//we've got only yellowpage
					$("#Day_Tab").empty();
					$("#Day_Tab").append("<li><a id=\"tab_Advanced_Search\" href=\"#\" data-toggle=\"modal\" data-target=\"#searchModal\">Search</a></li>");

				}
				else {

					$("#Day_Tab").empty();

					if (json_str.serviceid == "RETURN_CLINIC_BUTTON") {
						activeIndex = $("ul#TMP_Doctor_Tab li.active").text().trim();
						if (activeIndex == null || activeIndex == "Today")
							activeIndex = reformatDate(ret.data[0]["APPOINTMENT_DATE"]);

					}
					else if (json_str.serviceid == "ADVANCED_SEARCH") {
						if (json_str.para.APPOINTMENT_DATE) {
							activeIndex = json_str.para.APPOINTMENT_DATE;
						}
						else
							activeIndex = reformatDate(ret.data[0]["APPOINTMENT_DATE"]);
					}
					else
						activeIndex = reformatDate(ret.data[0]["APPOINTMENT_DATE"]);

					var days = [];

					for (var i in ret.data) {
						var item = ret.data[i];
						var each_day = {

							day: reformatDate(item.APPOINTMENT_DATE),
							activeID: activeIndex
						};

						days.push(each_day);
					}

					$('#Day_Tab').html($('#tmp_day_tab').render(days));
					$("#Day_Tab").append("<li><a id=\"tab_Return_Clinic\" href=\"#\">Clinic</a></li>");
					$("#Day_Tab").append("<li><a id=\"tab_Advanced_Search\" href=\"#\" data-toggle=\"modal\" data-target=\"#searchModal\">Search</a></li>");


				}


			}
		});

		return reformatDate(activeIndex);

	}
	function bindMapBtn() {
		$('#popup-Googlemap').slickModals({
			overlayBg: true,
			overlayClosesModal: true,
			overlayBgColor: 'rgba(0,0,0,0.85)',
			overlayTransitionSpeed: '0.4',
			popupWidth: '60%',
			popupHeight: '50%',
			popupLocation: 'center',
			popupAnimationDuration: '0.8',
			popupAnimationEffect: 'fadeIn',
			popupShadowOffsetX: '0',
			popupShadowOffsetY: '0',
			popupShadowBlurRadius: '0',
			popupShadowSpreadRadius: '0',
			popupShadowColor: 'rgba(0,0,0,0)',
			popupBackground: '#fff',
			popupRadius: '0',
			popupMargin: '0',
			popupPadding: '0',
			addCloseButton: true,
			buttonStyle: 'labeled',
			enableESC: true,
			reopenClass: 'showMap',
		});

	}
	function bindMoreLessBtn() {
		//More Less Btn
		var moreNumber = ($(window).width() >= 768 ? 8 : 6);
		$('.search-more').each(function () {
			if ($(this).parents('.search-time-scroll:first').children('a').length <= moreNumber) {
				$(this).hide();
			}
		});
		var curHeight = ($(window).width() >= 768 ? '54px' : '51px');
		if ($(window).width() >= 768) {
			$('.search-more').each(function () {
				var $stc = $(this).parents('.search-time-container:first');


				var count = $(this).parents('.search-time-scroll:first').children().length - 2;

				var autoHeight;
				if (Math.ceil(count / 9) == count / 9)
					autoHeight = (Math.ceil(count / 9) + 1) * 47 + 5;
				else
					autoHeight = Math.ceil(count / 9) * 47 + 5;
				$stc.css('height', curHeight).addClass('closed');
				$(this).on('click', function () {
					if ($stc.hasClass('closed')) {
						$stc.height(curHeight).not(':animated').animate({
							height: autoHeight
						}, 100).removeClass('closed');
						$(this).text('Less').addClass('less');
					} else {
						$stc.height(autoHeight).not(':animated').animate({
							height: curHeight
						}, 100).addClass('closed');
						$(this).text('More').removeClass('less');
					}
				});
			});
		}

	}


	var curPage = 1; //当前页码
	var total, pageSize, totalPage;

	function getPageBar() {
		//页码大于最大页数
		if (curPage > totalPage) curPage = totalPage;
		//页码小于1
		if (curPage < 1) curPage = 1;

		pageStr = "<span class=\"he-global-pagtext\">Page " + curPage + " of " + totalPage + "</span>";
		//pageStr+="<span class=\"he-global-pagtext\">Total:" + total + "</span>";
		pageStr += "<div class=\"he-global-paglinks\">";
		//如果是第一页
		if (curPage == 1) {
			pageStr += "<span><bb>First</bb></span><span><bb>Prev</bb></span>";
		} else {
			pageStr += "<span><a href='javascript:void(0)' rel='1'>First</a></span><span><a href='javascript:void(0)' rel='" + (curPage - 1) + "'>Prev</a></span>";
		}

		//如果是最后页
		if (curPage >= totalPage) {
			pageStr += "<span><bb>Next</bb></span><span><bb>Last</bb></span>";
		} else {
			pageStr += "<span><a href='javascript:void(0)' rel='" + (parseInt(curPage) + 1) + "'>Next</a></span><span><a href='javascript:void(0)' rel='" + totalPage + "'>Last</a></span>";
		}
		pageStr += "</div>";

		$(".he-global-paginner").html(pageStr);
	}

	function distance(lat1, lon1, lat2, lon2, unit) {
		var radlat1 = Math.PI * lat1 / 180
		var radlat2 = Math.PI * lat2 / 180
		var theta = lon1 - lon2
		var radtheta = Math.PI * theta / 180
		var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
		dist = Math.acos(dist)
		dist = dist * 180 / Math.PI
		dist = dist * 60 * 1.1515
		if (unit == "K") { dist = dist * 1.609344 }
		if (unit == "N") { dist = dist * 0.8684 }
		return dist.toFixed(2);
	}

	//__________________________________________________________________________________________________________________Clinic Logic
	function bind_clinic_content_per_day(json_str, page) {


		json_str.para.pageNum = page - 1;
		json_str.para.action_type = "GET_ALL_CLINIC";

		if (!Array.isArray(json_str.para.LANGUAGE)) {
			json_str.para.LANGUAGE = [json_str.para.LANGUAGE];
		}


		$.ajax({
			type: "POST",
			url: "classes/class.searchClinic.php",
			dataType: "json",
			//async: false,
			data: {
				request: json_str
			},
			beforeSend: function () {
				$('#Doctor_Tab_Content').hide();
				$('#Clinic_Tab_Content').empty();
				$("#Clinic_Tab_Content").append("<h1 id='loading'>loading...</h1>");
				$('#Clinic_Tab_Content').show();
			},
			success: function (msg) {

				var ret = msg.response;

				total = ret.page_info.total;
				pageSize = ret.page_info.pageSize;
				curPage = page; //当前页
				totalPage = ret.page_info.totalPage;

				if (ret.data.length == 0) {
					$(".warning").css('display', 'block');
				}
				else {
					$(".warning").css('display', 'none');

					var clinics = [];

					for (var i in ret.data) {
						var item = ret.data[i];
						var clinic = {

							clinicID: item.CLINIC_USER_ID,
							clinicPIC: 'img/clinics/' + item.CLINIC_PHOTO,
							clinicName: item.CLINIC_NAME,
							clinicPhone: item.CLINIC_PHONE,

							clinicAddress: item.CLINIC_ADDR,
							clinicSuburb: item.CLINIC_SUBURB,
							clinicLat: item.CLINIC_LAT,
							clinicLng: item.CLINIC_LNG,

							distance: 0,


							BULK_BILLING: item.BULK_BILLING,
							LATE_HOUR_SERVICES: item.LATE_HOUR_SERVICES,
							FREE_PARKING: item.FREE_PARKING,
							WHEELCHAIR_ACCESS: item.WHEELCHAIR_ACCESS,
							FEMALE_DOCTOR: item.FEMALE_DOCTOR,
							HOME_VISIT: item.HOME_VISIT,
							ONSITE_PATHOLOGY_COLLECTION: item.ONSITE_PATHOLOGY_COLLECTION,
							AGPAL: item.AGPAL,

							STANDARD_15_MINUTE_CONSULTATION: item.STANDARD_15_MINUTE_CONSULTATION,

							EXTEND_30_MINUTE_CONSULTATION: item.EXTEND_30_MINUTE_CONSULTATION,


							MONDAY_START: item.MONDAY_START,
							MONDAY_END: item.MONDAY_END,

							TUESDAY_START: item.TUESDAY_START,
							TUESDAY_END: item.TUESDAY_END,

							WEDNESDAY_START: item.WEDNESDAY_START,
							WEDNESDAY_END: item.WEDNESDAY_END,

							THURSDAY_START: item.THURSDAY_START,
							THURSDAY_END: item.THURSDAY_END,

							FRIDAY_START: item.FRIDAY_START,
							FRIDAY_END: item.FRIDAY_END,

							SATURDAY_START: item.SATURDAY_START,
							SATURDAY_END: item.SATURDAY_END,

							SUNDAY_START: item.SUNDAY_START,
							SUNDAY_END: item.SUNDAY_END,

							PUBLIC_START: item.PUBLIC_START,
							PUBLIC_END: item.PUBLIC_END,



							overview: item.CLINIC_OVERVIEW,

							language: "",
							interest: "",
							timeslot: [],

							day: reformatDate(json_str.para.APPOINTMENT_DATE),
							isYellowPage: item.IS_YELLOWPAGE
						};



						var my_lat = $.cookie("my_lat");
						var my_lng = $.cookie("my_lng");
						clinic.distance = distance(my_lat, my_lng, item.CLINIC_LAT, item.CLINIC_LNG, 'K');




						if (item.LANGUAGE_NAME) {
							//Step1.convert string to array
							var langArr = item.LANGUAGE_NAME.split(",");
							//Step2.identify the unique
							var langArrUni = _.uniq(langArr);

							if (langArrUni.indexOf("English") > -1) {
								//move 'English' to the first place
								arraymove(langArrUni, langArrUni.indexOf("English"), 0);
							}
							//Step3.convert array to string
							clinic.language = langArrUni.join();
						}

						if (item.INTEREST_NAME) {
							//Step1.convert string to array
							var inArr = item.INTEREST_NAME.split(",");
							//Step2.identify the unique
							var inArrUni = _.uniq(inArr);
							//Step3.convert array to string
							clinic.interest = inArrUni.join();
						}

						if (item.APPOINTMENT_TIME) {
							var timeslotArr = item.APPOINTMENT_TIME.split(",");
							var timeslotArrUni = _.uniq(timeslotArr);
							for (var m in timeslotArrUni) {
								clinic.timeslot.push({
									time: reformatTime(timeslotArrUni[m])
								});

							}
						}
						clinics.push(clinic);
					}

				}

				if (ret.success) {
					if (json_str.sequ != ret.sequ) {
						alert(func_code + ":" + "时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
						result = false;
					}


					$('#Clinic_Tab_Content').html($('#tmp_clinic_content').render(clinics));




					bindMoreLessBtn();
					bindMapBtn();
					rebindProfile();

					// replaceToday();
				} else {
					alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
					result = false;
				}
			},
			complete: function () {
				bindShowDoctorsBtn(json_str);

				bindShowMapBtn();

				bindClinicProfileBtn();

				getPageBar();

				$(".he-global-paglinks span a").unbind();
				$(".he-global-paglinks span a").on('click', function () {
					var rel = $(this).attr("rel");
					if (rel) {
						bind_clinic_content_per_day(json_str, rel);
					}
				});

				if ($.cookie("ilogin") == 1) {

					$('.clinic-distance').show();
				}
				else {
					$('.clinic-distance').hide();
				}
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				//请求失败之后的操作
				var ret_code = "999904";
				var ret_msg = "Error,contact admin please!";
				alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
				result = false;
			}
		});





	}
	function bindShowDoctorsBtn(json_str) {
		$(".showDoctors").each(function (index) {
			$(this).on("click", function () {

				json_str.serviceid = "CLICK_DOCTOR_BTN";
				json_str.para.CLINIC_USER_ID = $(this).attr('keyClinicID');
				ajaxSearchDoctor(json_str);
			});
		});
	}
	function bindShowMapBtn() {
		$(".showMap").each(function (index) {
			$(this).on("click", function () {
				var lat = $(this).attr('lat');
				var lng = $(this).attr('lng');
				var street = $(this).attr('street');
				var suburb = $(this).attr('suburb');

				var address = street + "," + suburb + ",Australia";
				var mylocation = new google.maps.LatLng(lat, lng);
				var mapCanvas = document.getElementById('mapDiv');
				var mapOptions = {
					center: new google.maps.LatLng(lat, lng),
					zoom: 12,
					styles: [{ "featureType": "administrative", "elementType": "all", "stylers": [{ "visibility": "on" }, { "lightness": 33 }] }, { "featureType": "landscape", "elementType": "all", "stylers": [{ "color": "#f2e5d4" }] }, { "featureType": "poi.park", "elementType": "geometry", "stylers": [{ "color": "#c5dac6" }] }, { "featureType": "poi.park", "elementType": "labels", "stylers": [{ "visibility": "on" }, { "lightness": 20 }] }, { "featureType": "road", "elementType": "all", "stylers": [{ "lightness": 20 }] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [{ "color": "#c5c6c6" }] }, { "featureType": "road.arterial", "elementType": "geometry", "stylers": [{ "color": "#e4d7c6" }] }, { "featureType": "road.local", "elementType": "geometry", "stylers": [{ "color": "#fbfaf7" }] }, { "featureType": "water", "elementType": "all", "stylers": [{ "visibility": "on" }, { "color": "#acbcc9" }] }]
				}


				map = new google.maps.Map(mapCanvas, mapOptions)

				var infowindow = new google.maps.InfoWindow(
					{
						content: '<b>' + address + '</b>',
						size: new google.maps.Size(150, 50)
					});

				var marker = new google.maps.Marker({
					position: new google.maps.LatLng(lat, lng),
					map: map,
					title: address
				});
				google.maps.event.addListener(marker, 'click', function () {
					infowindow.open(map, marker);
				});


			});
		});

	}
	function bindClinicProfileBtn() {

		$(".showProfileClinic").each(function (index) {
			$(this).on("click", function () {



				var clinic_img = $(this).parent().find('.lazy').attr('src');

				$('#clinicProfile').find('.clinic-img').attr('src', clinic_img);
				var clinic_title = $(this).text();

				$('#clinicProfile').find('.clinic-title').text(clinic_title);

				var clinic_phone = $(this).parent().find('.clinic-phone').text();
				$('#clinicProfile').find('.clinic-mobile').text(clinic_phone);


				var clinic_address = $(this).parent().find('.clinic-addr').text().trim() + ", " + $(this).parent().find('.search-suburb').text();
				$('#clinicProfile').find('.clinic-address').text(clinic_address);

				var clinic_lang = $(this).parent().find('.clinic-lang').text();

				clinic_lang = clinic_lang.replace(/,/g, ', ');
				$('#clinicProfile').find('.clinic-language').text($("#Lang0369").html() + ' ' + clinic_lang + '.');









				//___________________________________________________________interest

				var clinic_interest = $(this).parent().find('.clinic-interest').text();
				clinic_interest = clinic_interest.trim();

				var interestArr = clinic_interest.split(",");
				$('#clinicProfile').find('.interest-content').empty();
				for (var i = 0; i < interestArr.length; i++) {

					if ($.cookie("lang") == 'ch') {
						if (interestArr[i] == 'Family medicine') {
							interestArr[i] = '家庭医药健康';
						}
						else if (interestArr[i] == 'General Check-ups for the Family') {
							interestArr[i] = '体检';
						}
						else if (interestArr[i] == 'Care planning and advice') {
							interestArr[i] = '保健计划指导';
						}
						else if (interestArr[i] == 'Travel medicine and vaccinations') {
							interestArr[i] = '旅行医药指导和疫苗接种';
						}
						else if (interestArr[i] == 'Onsite Allied Health Services') {
							interestArr[i] = '综合健康辅导';
						}
						else if (interestArr[i] == 'General consultations') {
							interestArr[i] = '全科问诊';
						}
						else if (interestArr[i] == 'Men’s health issues') {
							interestArr[i] = '男子健康';
						}
						else if (interestArr[i] == 'Women’s health issues') {
							interestArr[i] = '妇科健康';
						}
						else if (interestArr[i] == 'Children’s health issues') {
							interestArr[i] = '儿童健康';
						}
						else if (interestArr[i] == 'Skin checks') {
							interestArr[i] = '皮肤问题检查';
						}
						else if (interestArr[i] == 'Travel medicine - advice and vaccinations') {
							interestArr[i] = '旅行医药指导和疫苗接种';
						}
						else if (interestArr[i] == 'Children’s immunisations') {
							interestArr[i] = '儿童疫苗接种';
						}
						else if (interestArr[i] == 'Pregnancy care') {
							interestArr[i] = '孕期体检';
						}
						else if (interestArr[i] == 'Work cover') {
							interestArr[i] = '工伤医疗';
						}
						else if (interestArr[i] == 'Driving and pre-employment medicals') {
							interestArr[i] = '驾驶及职前健康检查';
						}
						else if (interestArr[i] == 'Cosmetic medicine') {
							interestArr[i] = '美容医疗';
						}
						else if (interestArr[i] == 'Psychology') {
							interestArr[i] = '心理辅导';
						}
						else if (interestArr[i] == 'Physiotherapy') {
							interestArr[i] = '理疗';
						}
						else if (interestArr[i] == 'Dietetics') {
							interestArr[i] = '营养指导';
						}
						else if (interestArr[i] == 'Diabetes education') {
							interestArr[i] = '糖尿病预防指导';
						}
						else if (interestArr[i] == 'Podiatry') {
							interestArr[i] = '足疗服务';
						}
						else if (interestArr[i] == 'Pathology collection') {
							interestArr[i] = '接收体检化验血／尿样';
						}
					}
					$('#clinicProfile').find('.interest-content').append("<li>" + interestArr[i] + "</li>");
				}

				//___________________________________________________________hours

				var MONDAY_START = $(this).parent().find('.MONDAY_START').text();
				var MONDAY_END = $(this).parent().find('.MONDAY_END').text();

				var TUESDAY_START = $(this).parent().find('.TUESDAY_START').text();
				var TUESDAY_END = $(this).parent().find('.TUESDAY_END').text();

				var WEDNESDAY_START = $(this).parent().find('.WEDNESDAY_START').text();
				var WEDNESDAY_END = $(this).parent().find('.WEDNESDAY_END').text();

				var THURSDAY_START = $(this).parent().find('.THURSDAY_START').text();
				var THURSDAY_END = $(this).parent().find('.THURSDAY_END').text();

				var FRIDAY_START = $(this).parent().find('.FRIDAY_START').text();
				var FRIDAY_END = $(this).parent().find('.FRIDAY_END').text();

				var SATURDAY_START = $(this).parent().find('.SATURDAY_START').text();
				var SATURDAY_END = $(this).parent().find('.SATURDAY_END').text();

				var SUNDAY_START = $(this).parent().find('.SUNDAY_START').text();
				var SUNDAY_END = $(this).parent().find('.SUNDAY_END').text();

				var PUBLIC_START = $(this).parent().find('.PUBLIC_START').text();
				var PUBLIC_END = $(this).parent().find('.PUBLIC_END').text();
				$('#clinicProfile').find('.hours-content').empty();
				if (MONDAY_START.trim() == '' && MONDAY_END.trim() == '')
					$('#clinicProfile').find('.hours-content').append("<li>Monday:Closed</li>");
				else
					$('#clinicProfile').find('.hours-content').append("<li>Monday:" + MONDAY_START + "-" + MONDAY_END + "</li>");

				if (TUESDAY_START.trim() == '' && TUESDAY_END.trim() == '')
					$('#clinicProfile').find('.hours-content').append("<li>Tuesday:Closed</li>");
				else
					$('#clinicProfile').find('.hours-content').append("<li>Tuesday:" + TUESDAY_START + "-" + TUESDAY_END + "</li>");

				if (WEDNESDAY_START.trim() == '' && WEDNESDAY_END.trim() == '')
					$('#clinicProfile').find('.hours-content').append("<li>Wednesday:Closed</li>");
				else
					$('#clinicProfile').find('.hours-content').append("<li>Wednesday:" + WEDNESDAY_START + "-" + WEDNESDAY_END + "</li>");

				if (THURSDAY_START.trim() == '' && THURSDAY_END.trim() == '')
					$('#clinicProfile').find('.hours-content').append("<li>Thursday:Closed</li>");
				else
					$('#clinicProfile').find('.hours-content').append("<li>Thursday:" + THURSDAY_START + "-" + THURSDAY_END + "</li>");

				if (FRIDAY_START.trim() == '' && FRIDAY_END.trim() == '')
					$('#clinicProfile').find('.hours-content').append("<li>Friday:Closed</li>");
				else
					$('#clinicProfile').find('.hours-content').append("<li>Friday:" + FRIDAY_START + "-" + FRIDAY_END + "</li>");

				if (SATURDAY_START.trim() == '' && SATURDAY_END.trim() == '')
					$('#clinicProfile').find('.hours-content').append("<li>Saturday:Closed</li>");
				else
					$('#clinicProfile').find('.hours-content').append("<li>Saturday:" + SATURDAY_START + "-" + SATURDAY_END + "</li>");

				if (SUNDAY_START.trim() == '' && SUNDAY_END.trim() == '')
					$('#clinicProfile').find('.hours-content').append("<li>Sunday:Closed</li>");
				else
					$('#clinicProfile').find('.hours-content').append("<li>Sunday:" + SUNDAY_START + "-" + SUNDAY_END + "</li>");

				if (PUBLIC_START.trim() == '' && PUBLIC_END.trim() == '')
					$('#clinicProfile').find('.hours-content').append("<li>Public holiday:Closed</li>");
				else
					$('#clinicProfile').find('.hours-content').append("<li>Public holiday:" + PUBLIC_START + "-" + PUBLIC_END + "</li>");



				//_____________________________________________________fees





				var clinic_STANDARD_15_MINUTE_CONSULTATION = $(this).parent().find('.search-STANDARD_15_MINUTE_CONSULTATION').text();
				if (clinic_STANDARD_15_MINUTE_CONSULTATION != 0) {
					$('#clinicProfile').find('.clinic-STANDARD_15_MINUTE_CONSULTATION').show();
					$('#clinicProfile').find('.clinic-STANDARD_15_MINUTE_CONSULTATION').text($('#Lang0382').html() + ' - $' + clinic_STANDARD_15_MINUTE_CONSULTATION);
				}
				else
					$('#clinicProfile').find('.clinic-STANDARD_15_MINUTE_CONSULTATION').hide();

				var clinic_EXTEND_30_MINUTE_CONSULTATION = $(this).parent().find('.search-EXTEND_30_MINUTE_CONSULTATION').text();
				if (clinic_EXTEND_30_MINUTE_CONSULTATION != 0) {
					$('#clinicProfile').find('.clinic-EXTEND_30_MINUTE_CONSULTATION').show();
					$('#clinicProfile').find('.clinic-EXTEND_30_MINUTE_CONSULTATION').text($('#Lang0383').html() + ' - $' + clinic_EXTEND_30_MINUTE_CONSULTATION);
				}
				else
					$('#clinicProfile').find('.clinic-EXTEND_30_MINUTE_CONSULTATION').hide();



				//_________________________________________________________________map




				var lat = $(this).parent().find('.showMap').attr("lat");
				var lng = $(this).parent().find('.showMap').attr("lng");
				var street = $(this).parent().find('.showMap').attr("street");
				var suburb = $(this).parent().find('.showMap').attr("suburb");

				var address = street + "," + suburb + ",Australia";
				var mylocation = new google.maps.LatLng(lat, lng);
				var mapCanvas = document.getElementById('clinic-map');
				var mapOptions = {
					center: new google.maps.LatLng(lat, lng),
					zoom: 12,
					styles: [{ "featureType": "administrative", "elementType": "all", "stylers": [{ "visibility": "on" }, { "lightness": 33 }] }, { "featureType": "landscape", "elementType": "all", "stylers": [{ "color": "#f2e5d4" }] }, { "featureType": "poi.park", "elementType": "geometry", "stylers": [{ "color": "#c5dac6" }] }, { "featureType": "poi.park", "elementType": "labels", "stylers": [{ "visibility": "on" }, { "lightness": 20 }] }, { "featureType": "road", "elementType": "all", "stylers": [{ "lightness": 20 }] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [{ "color": "#c5c6c6" }] }, { "featureType": "road.arterial", "elementType": "geometry", "stylers": [{ "color": "#e4d7c6" }] }, { "featureType": "road.local", "elementType": "geometry", "stylers": [{ "color": "#fbfaf7" }] }, { "featureType": "water", "elementType": "all", "stylers": [{ "visibility": "on" }, { "color": "#acbcc9" }] }]
				}


				map = new google.maps.Map(mapCanvas, mapOptions)

				var infowindow = new google.maps.InfoWindow(
					{
						content: '<b>' + address + '</b>',
						size: new google.maps.Size(150, 50)
					});

				var marker = new google.maps.Marker({
					position: new google.maps.LatLng(lat, lng),
					map: map,
					title: address
				});
				google.maps.event.addListener(marker, 'click', function () {
					infowindow.open(map, marker);
				});


















				var clinic_BULK_BILLING = $(this).parent().find('.search-BULK_BILLING').text();
				if (clinic_BULK_BILLING != 0)
					$('#clinicProfile').find('.clinic-BULK_BILLING').show();
				else
					$('#clinicProfile').find('.clinic-BULK_BILLING').hide();

				var clinic_LATE_HOUR_SERVICES = $(this).parent().find('.search-LATE_HOUR_SERVICES').text();
				if (clinic_LATE_HOUR_SERVICES != 0)
					$('#clinicProfile').find('.clinic-LATE_HOUR_SERVICES').show();
				else
					$('#clinicProfile').find('.clinic-LATE_HOUR_SERVICES').hide();

				var clinic_FREE_PARKING = $(this).parent().find('.search-FREE_PARKING').text();
				if (clinic_FREE_PARKING != 0)
					$('#clinicProfile').find('.clinic-FREE_PARKING').show();
				else
					$('#clinicProfile').find('.clinic-FREE_PARKING').hide();

				var clinic_WHEELCHAIR_ACCESS = $(this).parent().find('.search-WHEELCHAIR_ACCESS').text();
				if (clinic_WHEELCHAIR_ACCESS != 0)
					$('#clinicProfile').find('.clinic-WHEELCHAIR_ACCESS').show();
				else
					$('#clinicProfile').find('.clinic-WHEELCHAIR_ACCESS').hide();

				var clinic_FEMALE_DOCTOR = $(this).parent().find('.search-FEMALE_DOCTOR').text();
				if (clinic_FEMALE_DOCTOR != 0)
					$('#clinicProfile').find('.clinic-FEMALE_DOCTOR').show();
				else
					$('#clinicProfile').find('.clinic-FEMALE_DOCTOR').hide();

				var clinic_HOME_VISIT = $(this).parent().find('.search-HOME_VISIT').text();
				if (clinic_HOME_VISIT != 0)
					$('#clinicProfile').find('.clinic-HOME_VISIT').show();
				else
					$('#clinicProfile').find('.clinic-HOME_VISIT').hide();

				var clinic_ONSITE_PATHOLOGY_COLLECTION = $(this).parent().find('.search-ONSITE_PATHOLOGY_COLLECTION').text();
				if (clinic_ONSITE_PATHOLOGY_COLLECTION != 0)
					$('#clinicProfile').find('.clinic-ONSITE_PATHOLOGY_COLLECTION').show();
				else
					$('#clinicProfile').find('.clinic-ONSITE_PATHOLOGY_COLLECTION').hide();

				var clinic_AGPAL = $(this).parent().find('.search-AGPAL').text();
				if (clinic_AGPAL != 0)
					$('#clinicProfile').find('.clinic-AGPAL').show();
				else
					$('#clinicProfile').find('.clinic-AGPAL').hide();







				var clinic_overview = $(this).parent().find('.search-overview').text();
				$('#clinicProfile').find('.clinic-overview').text(clinic_overview);

			});
		});
	}
	function ajaxSearchClinic(json_str) {
		//State Machine
		if (json_str.serviceid != "RETURN_CLINIC_BUTTON")
			json_str.para.APPOINTMENT_DATE = bind_day_tabs(json_str);
		$('#tab_Return_Clinic').hide();


		bind_clinic_content_per_day(json_str, 1);

		$(".tab_container #Day_Tab li a.day-tab").unbind();

		$(".tab_container #Day_Tab li a.day-tab").on('click', function () {
			var date = $(this).text();
			if (date) {
				json_str.para.APPOINTMENT_DATE = reformatDate(date);
				bind_clinic_content_per_day(json_str, 1);
			}
		});



	}

	//__________________________________________________________________________________________________________________Doctor Logic
	function bind_doctor_content_per_day(json_str, page) {

		json_str.para.pageNum = page - 1;
		json_str.para.action_type = "GET_DOCTOR";

		if (!Array.isArray(json_str.para.LANGUAGE)) {
			json_str.para.LANGUAGE = [json_str.para.LANGUAGE];
		}
		$.ajax({
			type: "POST",
			url: "classes/class.searchDoctor.php",
			dataType: "json",
			//async: false,
			data: {
				request: json_str
			},
			beforeSend: function () {

				$('#Clinic_Tab_Content').hide();
				$('#Doctor_Tab_Content').empty();
				$("#Doctor_Tab_Content").append("<h1 id='loading'>loading...</h1>");
				$('#Doctor_Tab_Content').show();
			},
			success: function (msg) {

				var ret = msg.response;

				total = ret.page_info.total;
				pageSize = ret.page_info.pageSize;
				curPage = page; //当前页
				totalPage = ret.page_info.totalPage;

				if (ret.data.length == 0) {
					$(".warning").css('display', 'block');
				}
				else {
					$(".warning").css('display', 'none')


					var doctors = [];

					for (var i in ret.data) {
						var item = ret.data[i];
						var doctor = {

							doctorID: item.DOCTOR_ID,
							doctorPIC: 'img/doctors/' + item.DOCTOR_PHOTO,
							doctorName: item.DOCTOR_NAME,
							overview: item.DOCTOR_INFO,
							doctorSex: item.DOCTOR_GENDER,
							doctorYear: item.DOCTOR_YEAR,
							DOCTOR_TITLE_1: item.DOCTOR_TITLE_1,
							DOCTOR_TITLE_2: item.DOCTOR_TITLE_2,
							DOCTOR_TITLE_3: item.DOCTOR_TITLE_3,
							DOCTOR_TITLE_4: item.DOCTOR_TITLE_4,
							DOCTOR_TITLE_5: item.DOCTOR_TITLE_5,

							STANDARD_15_MINUTE_CONSULTATION: item.STANDARD_15_MINUTE_CONSULTATION,
							EXTEND_30_MINUTE_CONSULTATION: item.EXTEND_30_MINUTE_CONSULTATION,

							CLINIC_STANDARD_15_MINUTE_CONSULTATION: item.CLINIC_STANDARD_15_MINUTE_CONSULTATION,

							interest: "",
							language: "",
							clinicName: item.CLINIC_NAME,
							clinicAddress: item.CLINIC_ADDR + ', ' + item.CLINIC_SUBURB,
							timeslot: [],
							day: reformatDate(json_str.para.APPOINTMENT_DATE)


						};

						if (item.INTEREST_NAME) {
							//Step1.convert string to array
							var interestArr = item.INTEREST_NAME.split(",");
							//Step2.identify the unique
							var interestArrUni = _.uniq(interestArr);
							//Step3.convert array to string
							doctor.interest = interestArrUni.join();
						}

						if (item.LANGUAGE_NAME) {
							//Step1.convert string to array
							var langArr = item.LANGUAGE_NAME.split(",");
							//Step2.identify the unique
							var langArrUni = _.uniq(langArr);

							if (langArrUni.indexOf("English") > -1) {
								//move 'English' to the first place
								arraymove(langArrUni, langArrUni.indexOf("English"), 0);
							}

							//Step3.convert array to string
							doctor.language = langArrUni.join();
						}
						if (item.APPOINTMENT_TIME) {
							var timeslotArr = item.APPOINTMENT_TIME.split(",");
							var timeslotArrUni = _.uniq(timeslotArr);
							for (var m in timeslotArrUni) {
								doctor.timeslot.push({
									time: reformatTime(timeslotArrUni[m]),
									originalTime: timeslotArrUni[m]
								});

							}
						}
						doctors.push(doctor);
					}

				}

				if (ret.success) {
					if (json_str.sequ != ret.sequ) {
						alert(func_code + ":" + "时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
						result = false;
					}



					$('#Doctor_Tab_Content').html($('#tmp_doctor_content').render(doctors));







					bindMoreLessBtn();
					bindMapBtn();
					rebindProfile();

					// replaceToday();
				} else {
					alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
					result = false;
				}
			},
			complete: function () {
				bindEachTimeslotBtn();

				bindSave2favBtn();

				bindDoctorProfileBtn();

				getPageBar();

				$(".he-global-paglinks span a").unbind();

				$(".he-global-paglinks span a").on('click', function () {
					var rel = $(this).attr("rel");
					if (rel) {
						bind_doctor_content_per_day(json_str, rel);
					}
				});

				if ($.cookie("ilogin") == 1 && $.cookie("fd_usertype") != 0) {


					//显示收藏医生
					$('.save2favBtn').show();
					$('.jumptouserSaveDoctor').show();
				}
				else {
					$('.save2favBtn').hide();
					$('.jumptouserSaveDoctor').hide();
				}
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				//请求失败之后的操作
				var ret_code = "999905";
				var ret_msg = "Error,contact admin please!";
				alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
				result = false;
			}
		});





	}
	function bindDoctorProfileBtn() {
		$(".showProfileDoctor").each(function (index) {
			$(this).on("click", function () {

				var doctor_img = $(this).parent().find('.lazy').attr('src');
				$('#doctorProfile').find('.doctor-img').attr('src', doctor_img);
				var doctor_title = $(this).text();
				$('#doctorProfile').find('.doctor-title').text('Dr ' + doctor_title);


				var doctor_title1 = $(this).parent().find('.DOCTOR_TITLE_1').text();
				var doctor_title2 = $(this).parent().find('.DOCTOR_TITLE_2').text();
				var doctor_title3 = $(this).parent().find('.DOCTOR_TITLE_3').text();
				var doctor_title4 = $(this).parent().find('.DOCTOR_TITLE_4').text();
				var doctor_title5 = $(this).parent().find('.DOCTOR_TITLE_5').text();


				var docArray = [];

				if (doctor_title1.trim() != '')
					docArray.push(doctor_title1);

				if (doctor_title2.trim() != '')
					docArray.push(doctor_title2);

				if (doctor_title3.trim() != '')
					docArray.push(doctor_title3);

				if (doctor_title4.trim() != '')
					docArray.push(doctor_title4);

				if (doctor_title5.trim() != '')
					docArray.push(doctor_title5);


				$('#doctorProfile').find('.doctor-title12345').text(docArray.join());




				var doctor_address = $(this).parent().find('.doctor-addr').text();
				$('#doctorProfile').find('.doctor-address').text(doctor_address);


				var doctor_lang = $(this).parent().find('.doctor-lang').text();


				doctor_lang = doctor_lang.replace(/,/g, ', ');

				$('#doctorProfile').find('.doctor-language').text('Dr ' + doctor_title + ' ' + $('#Lang0387').html() + ' ' + doctor_lang + '.');




				var doctor_sex = $(this).parent().find('.doctor-sex').text();
				if (doctor_sex == 0)
					doctor_sex = $('#Lang0132').html();
				else
					doctor_sex = $('#Lang0133').html();
				$('#doctorProfile').find('.doctor-sex').text(doctor_sex);




				var doctor_year = $(this).parent().find('.doctor-year').text();
				$('#doctorProfile').find('.doctor-year').text('Dr ' + doctor_title + ' commenced practice since ' + doctor_year + ', has an interest in');

				$('#doctorProfile').find('.doctor-year').text('Dr ' + doctor_title + $('#Lang0384').html() + doctor_year + $('#Lang0385').html());

				var doctor_interest = $(this).parent().find('.doctor-interest').text();
				//spilt doctor_interest.

				doctor_interest = doctor_interest.trim();

				if (doctor_interest) {
					$('#doctorProfile').find('.doctor-feature').show();
					$('#doctorProfile').find('.doctor-interest').empty();
					//Step1.convert string to array
					var interestArr = doctor_interest.split(",");

					for (var i = 0; i < interestArr.length; i++) {
						if ($.cookie("lang") == 'ch') {
							if (interestArr[i] == 'Family medicine') {
								interestArr[i] = '家庭医药健康';
							}
							else if (interestArr[i] == 'General Check-ups for the Family') {
								interestArr[i] = '体检';
							}
							else if (interestArr[i] == 'Care planning and advice') {
								interestArr[i] = '保健计划指导';
							}
							else if (interestArr[i] == 'Travel medicine and vaccinations') {
								interestArr[i] = '旅行医药指导和疫苗接种';
							}
							else if (interestArr[i] == 'Onsite Allied Health Services') {
								interestArr[i] = '综合健康辅导';
							}
							else if (interestArr[i] == 'General consultations') {
								interestArr[i] = '全科问诊';
							}
							else if (interestArr[i] == 'Men’s health issues') {
								interestArr[i] = '男子健康';
							}
							else if (interestArr[i] == 'Women’s health issues') {
								interestArr[i] = '妇科健康';
							}
							else if (interestArr[i] == 'Children’s health issues') {
								interestArr[i] = '儿童健康';
							}
							else if (interestArr[i] == 'Skin checks') {
								interestArr[i] = '皮肤问题检查';
							}
							else if (interestArr[i] == 'Travel medicine - advice and vaccinations') {
								interestArr[i] = '旅行医药指导和疫苗接种';
							}
							else if (interestArr[i] == 'Children’s immunisations') {
								interestArr[i] = '儿童疫苗接种';
							}
							else if (interestArr[i] == 'Pregnancy care') {
								interestArr[i] = '孕期体检';
							}
							else if (interestArr[i] == 'Work cover') {
								interestArr[i] = '工伤医疗';
							}
							else if (interestArr[i] == 'Driving and pre-employment medicals') {
								interestArr[i] = '驾驶及职前健康检查';
							}
							else if (interestArr[i] == 'Cosmetic medicine') {
								interestArr[i] = '美容医疗';
							}
							else if (interestArr[i] == 'Psychology') {
								interestArr[i] = '心理辅导';
							}
							else if (interestArr[i] == 'Physiotherapy') {
								interestArr[i] = '理疗';
							}
							else if (interestArr[i] == 'Dietetics') {
								interestArr[i] = '营养指导';
							}
							else if (interestArr[i] == 'Diabetes education') {
								interestArr[i] = '糖尿病预防指导';
							}
							else if (interestArr[i] == 'Podiatry') {
								interestArr[i] = '足疗服务';
							}
							else if (interestArr[i] == 'Pathology collection') {
								interestArr[i] = '接收体检化验血／尿样';
							}
						}

						$('#doctorProfile').find('.doctor-interest').append("<li>" + interestArr[i] + "</li>");
					}
				}
				else
					$('#doctorProfile').find('.doctor-feature').hide();



				//_____________________________________________________fees



				var doctor_STANDARD_15_MINUTE_CONSULTATION = $(this).parent().find('.STANDARD_15_MINUTE_CONSULTATION').text();
				if (doctor_STANDARD_15_MINUTE_CONSULTATION != 0) {
					$('#doctorProfile').find('.doctor-STANDARD_15_MINUTE_CONSULTATION').show();
					$('#doctorProfile').find('.doctor-STANDARD_15_MINUTE_CONSULTATION').text($('#Lang0382').html() + ' - $' + doctor_STANDARD_15_MINUTE_CONSULTATION);

				}
				else
					$('#doctorProfile').find('.doctor-STANDARD_15_MINUTE_CONSULTATION').hide();

				var doctor_EXTEND_30_MINUTE_CONSULTATION = $(this).parent().find('.EXTEND_30_MINUTE_CONSULTATION').text();
				if (doctor_EXTEND_30_MINUTE_CONSULTATION != 0) {
					$('#doctorProfile').find('.doctor-EXTEND_30_MINUTE_CONSULTATION').show();

					$('#doctorProfile').find('.doctor-EXTEND_30_MINUTE_CONSULTATION').text($('#Lang0383').html() + ' - $' + doctor_EXTEND_30_MINUTE_CONSULTATION);
				}
				else
					$('#doctorProfile').find('.doctor-EXTEND_30_MINUTE_CONSULTATION').hide();


				var doctor_overview = $(this).parent().find('.search-overview').text();
				$('#doctorProfile').find('.doctor-overview').text(doctor_overview);
			});
		});

	}
	function bindSave2favBtn() {
		$(".save2favBtn").each(function (index) {
			$(this).on("click", function () {

				var keyDoctorIDsave2fav = $(this).attr('keyDoctorID');


				///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
				func_code = "S001";
				requesttype = 1;
				//form序列化成json
				json_form = {
					action_type: "create",
					CUSTOMER_USER_ID: $('#CUSTOMER_USER_ID').val(),
					DOCTOR_ID: keyDoctorIDsave2fav
				};
				//生成输入参数
				json_str = request_const(json_form, func_code, requesttype);
				// alert(JSON.stringify(json_str));

				console.log(json_str);

				result = true;
				$.ajax({
					type: "POST",
					url: "classes/class.saveDoctor.php",
					dataType: "json",
					async: false,
					data: {
						request: json_str
					},
					success: function (msg) {
						var ret = msg.response;
						if (ret.success) {
							if (json_str.sequ != ret.sequ) {
								alert(func_code + ":" + "时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
								result = false;
							}


							alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
						} else {
							alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
							// $('#signin_ok').attr('disabled',false); 
							result = false;
						}

					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
						//请求失败之后的操作
						var ret_code = "999911";
						var ret_msg = "Error,contact admin please!";
						alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
						result = false;
					}
				});
				if (!result) {
					return result;
				}

				return false;


			});
		});

	}
	function bindEachTimeslotBtn() {

		$(".apptTimeBtn").each(function (index) {
			$(this).on("click", function () {
				keyDoctorID = $(this).attr('keyDoctorID');
				keyDate = reformatDate($(this).attr('keyDate'));
				keyTime = $(this).attr('keyTime');

				var keyAppointmentID;
				var keyClinicAddress = $(this).attr('keyClinicAddress');
				var keyClinicName = $(this).attr('keyClinicName');
				var keyDoctorName = $(this).attr('keyDoctorName');
				var keySTANDARD_15_MINUTE_CONSULTATION = $(this).attr('keySTANDARD_15_MINUTE_CONSULTATION');
				var keyClinicSTANDARD_15_MINUTE_CONSULTATION = $(this).attr('keyClinicSTANDARD_15_MINUTE_CONSULTATION');
				var keyfirstname = $.cookie("my_firstname");
				var keylastname = $.cookie("my_lastname");

				var keyAddress = $.cookie("my_address");
				var keyPhone = $.cookie("my_phone");




				//Clinic user
				if ($.cookie("fd_usertype") == 0) {
					alert("Clinic user can not make an appointment");
					return false;
				}


				//未注册用户
				if ($.cookie("ilogin") == 0) {
					requesttype = 0; //注册用户
					$('#signupModal').modal('show');
					return false;
				}



				//Step1.弹出进度条，设置REQUESTING_USER_ID，REQUESTING_FLAG
				waitingDialog.show('Please wait for 10s...');
				var AppointmentSuc = false;

				func_code = "ST01";
				para = {
					DOCTOR_ID: keyDoctorID,
					APPOINTMENT_DATE: keyDate,
					APPOINTMENT_TIME: keyTime,
					CUSTOMER_USER_ID: $('#CUSTOMER_USER_ID').val()
				};
				json_str = request_const(para, func_code, 0);

				$.ajax({
					type: "POST",
					url: "classes/class.REQUESTING_FLAG.php",
					dataType: "json",
					async: false,
					data: {
						request: json_str
					},
					success: function (succeed) {

						if (succeed) {

							AppointmentSuc = true;

						} else {
							alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);

							AppointmentSuc = false;
						}
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
						//请求失败之后的操作
						var ret_code = "999906";
						var ret_msg = "Sorry, your appointment can't be done because of some issue. Please try later.";
						alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
						AppointmentSuc = false;
					}
				});



				setTimeout(function () {

					waitingDialog.hide();

					if (!AppointmentSuc) {
						alert("Sorry, your appointment can't be done because of some issue. Please try later.");
						return false;
					}


					//Step2.等待10s后，检查SUCCESSFUL_FLAG，等于1表示成功，否则失败

					func_code = "ST01";
					para = {
						DOCTOR_ID: keyDoctorID,
						APPOINTMENT_DATE: keyDate,
						APPOINTMENT_TIME: keyTime
					};
					json_str = request_const(para, func_code, 0);

					result = true;
					$.ajax({
						type: "POST",
						url: "classes/class.SUCCESSFUL_FLAG.php",
						dataType: "json",
						async: false,
						data: {
							request: json_str
						},
						success: function (succeed) {

							if (succeed) {
								AppointmentSuc = true;
							} else {
								AppointmentSuc = false;
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999907";
							var ret_msg = "Sorry, your appointment can't be done because of some issue. Please try later.";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							AppointmentSuc = false;
						}
					});
					if (!AppointmentSuc) {
						alert("Sorry, your appointment can't be done because of some issue. Please try later.");
						return false;
					}


					var time_id = "";
					//搜索医生预约时间ID
					func_code = "ST01";
					para = {
						DOCTOR_ID: keyDoctorID,
						APPOINTMENT_DATE: keyDate,
						APPOINTMENT_TIME: keyTime
					};
					json_str = request_const(para, func_code, 0);

					//获取DOCTOR_APPOINTMENT_TIME_ID
					result = true;
					$.ajax({
						type: "POST",
						url: "classes/class.searchAppTimeID.php",
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
								console.log(ret);
								var data = ret.data[0];
								time_id = data.DOCTOR_APPOINTMENT_TIME_ID;
							} else {
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
								result = false;
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999908";
							var ret_msg = "Sorry, your appointment can't be done because of some issue. Please try later.";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							result = false;
						}
					});
					if (!result) {
						return result;
					}
					if (time_id == "") {
						alert($("#Lang0182").html()); //获取医生预约时间ID错误!
						return;
					}
					var requesttype;
					//处理登录用户预约
					if ($.cookie("ilogin") == 1) {
						//组织request para
						var username = $.cookie("fd_username");
						requesttype = 1; //登录用户
						para = {
							action_type: "create",
							CUSTOMER_USER_ID: $('#CUSTOMER_USER_ID').val(),
							DOCTOR_ID: keyDoctorID,
							DOCTOR_APPOINTMENT_TIME_ID: time_id,
							APPOINTMENT_STATUS_ID: 1
						};
					}
					json_str = request_const(para, func_code, requesttype);
					//请求
					result = true;
					$.ajax({
						type: "POST",
						url: "classes/class.appointmentDoctor.php",
						dataType: "json",
						async: false,
						data: {
							request: json_str
						},
						success: function (msg) {
							// console.log(msg);
							var ret = msg.response;
							keyAppointmentID = ret.data;
							if (ret.success) {
								if (json_str.sequ != ret.sequ) {
									alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
									result = false;
								}
								if (ret.status.ret_code == "AD0102") {
									alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
									result = false;
								}
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
							} else {
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
								result = false;
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999909";
							var ret_msg = "Sorry, your appointment can't be done because of some issue. Please try later.";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							result = false;
						}
					});
					if (!result) {
						return result;
					}
					//修改医生预约时间状态
					func_code = "UAT0";
					para = {
						action_type: "update",
						DOCTOR_APPOINTMENT_TIME_ID: time_id,
						ACTIVE_STATUS: 0
					};
					json_str = request_const(para, func_code, 1);
					// console.log(json_str);
					//请求
					result = true;
					$.ajax({
						type: "POST",
						url: "classes/class.appointmentTime.php",
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
							} else {
								alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
								result = false;
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							//请求失败之后的操作
							var ret_code = "999910";
							var ret_msg = "Sorry, your appointment can't be done because of some issue. Please try later.";
							alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
							result = false;
						}
					});
					if (!result) {
						return result;
					}



					var EMAIL = $.cookie("my_email");

					//Step2. send mail to patient
					$.ajax({
						type: "POST",
						url: "classes/PHPMailer/gmail_made_an_appointment.php",
						dataType: "text",
						async: false,
						data: {
							email: EMAIL,
							appID: keyAppointmentID,
							drName: keyDoctorName,
							clinicName: keyClinicName,
							firstName: keyfirstname,
							date: keyDate,
							time: keyTime,
							addr: keyClinicAddress,
							docFee: keySTANDARD_15_MINUTE_CONSULTATION,
							clinicFee: keyClinicSTANDARD_15_MINUTE_CONSULTATION

						}
					});


					var ajax_get_clinic_mail_by_doctorID = $.ajax({
						type: "POST",
						url: 'classes/class.get_clinic_mail_by_doctorID.php',
						dataType: 'json',
						data: {
							doctorID: keyDoctorID
						}
					});

					ajax_send_mail_to_clinic_user = ajax_get_clinic_mail_by_doctorID.then(function (clinic_mail) {

						return $.ajax({
							type: "POST",
							url: "classes/PHPMailer/gmail_made_an_appointment_2_clinic.php",
							dataType: "json",
							async: false,
							data: {
								clinic_mail: clinic_mail,
								appID: keyAppointmentID,
								drName: keyDoctorName,
								clinicName: keyClinicName,
								firstName: keyfirstname,
								lastName: keylastname,
								date: keyDate,
								time: keyTime,
								addr: keyAddress,
								contactNumber: keyPhone,
								contactEmail: EMAIL
							}
						});
					});



					if ($.cookie("ilogin") == 1) {
						window.location.href = "userAppointmentRecoder.php";
					}
					return false;
					/////////////////预约 end 





				}, 10000);

			});
		});
	}
	function ajaxSearchDoctor(json_str) {

		//State Machine
		if (json_str.serviceid != "CLICK_DOCTOR_BTN")
			json_str.para.APPOINTMENT_DATE = bind_day_tabs(json_str);

		$('#tab_Return_Clinic').show();
		$('#tab_Return_Clinic').click(function () {

			requesttype = 1;
			func_code = "RETURN_CLINIC_BUTTON";
			json_form = $("#modal_form_search").serializeObject();
			json_str = request_const(json_form, func_code, requesttype);

			json_str.para.APPOINTMENT_DATE = reformatDate($("ul#Day_Tab li.active").text().trim());
			ajaxSearchClinic(json_str);
			$('#searchModal').modal('hide');
		});


		bind_doctor_content_per_day(json_str, 1);

		$(".tab_container #Day_Tab li a.day-tab").unbind();

		$(".tab_container #Day_Tab li a.day-tab").on('click', function () {
			var date = $(this).text();
			if (date) {
				json_str.para.APPOINTMENT_DATE = reformatDate(date);
				bind_doctor_content_per_day(json_str, 1);
			}
		});



	}



	//__________________________________________________________________________________________________________________Entry
	/*Case0.从主页点击搜索按钮跳转*/
	var fromIndex_searchRestriction = sessionStorage.searchRestriction;

	if (fromIndex_searchRestriction) {
		var json_value = JSON.parse(fromIndex_searchRestriction);
		//赋值给此页面搜索条件
		$('#CLINIC_SUBURB').val(json_value.CLINIC_SUBURB);


		if (json_value.DOCTOR_TYPE)
			$('select option:contains("' + json_value.DOCTOR_TYPE + '")').prop('selected', true);





		requesttype = 0;
		func_code = "FROM_INDEX";
		json_form = $("#modal_form_search").serializeObject();
		json_str = request_const(json_form, func_code, requesttype);

		if (json_value.LANGUAGE) {
			json_str.para.LANGUAGE = json_value.LANGUAGE;
			if (!Array.isArray(json_str.para.LANGUAGE)) {
				json_str.para.LANGUAGE = [json_str.para.LANGUAGE];
			}

		}




		ajaxSearchClinic(json_str);

		sessionStorage.searchRestriction = "";
	}
	else {
		/*Case1.F5 Refresh*/
		requesttype = 0;
		func_code = "F5_REFRESH";
		json_form = $("#modal_form_search").serializeObject();
		json_str = request_const(json_form, func_code, requesttype);
		ajaxSearchClinic(json_str);

	}

	/*Case2.从收藏医生页面点击医生按钮跳转*/
	var fromSaveDoctor_favDoctorID = sessionStorage.favDoctorID;
	if (fromSaveDoctor_favDoctorID) {

		requesttype = 0;
		func_code = "FROM_FAVORITE_DOCTOR_PAGE";
		json_form = JSON.parse('{"DOCTOR_ID":"' + fromSaveDoctor_favDoctorID + '"}');

		json_str = request_const(json_form, func_code, requesttype);
		ajaxSearchDoctor(json_str);

		sessionStorage.favDoctorID = "";
	}


	/*Case3.Advanced Search*/
	$('#btn_search').click(function () {
		///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
		requesttype = 1;
		func_code = "ADVANCED_SEARCH";
		json_form = $("#modal_form_search").serializeObject();
		json_str = request_const(json_form, func_code, requesttype);


		if (json_str.para.DOCTOR_NAME)
			ajaxSearchDoctor(json_str);
		else
			ajaxSearchClinic(json_str);
		$('#searchModal').modal('hide');
	});


	if ($(window).width() > 768) {
		$('#CUSTOMER_USER_MAIL').css("width", "300px");
		$('.multiselect-native-select').css("margin-left", "37px");
		$('#DOCTOR_TYPE').css("margin-left", "37px");
	}






});