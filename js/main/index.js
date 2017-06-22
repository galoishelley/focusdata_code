var json_form, json_str;
var requesttype = 0;
var func_code, result;


$(function () {





	$("#btn_patient_login").click(function () {
		window.location.href = "sign_in.php";
	});

	$("#btn_practics_login").click(function () {
		window.location.href = "sign_in_clinic.php";
	});



	if ($(window).width() > 768) {
		$(".navbar-brand_").css("top", "45px");
	}
	else {
		$(".navbar-brand_").css("top", "5px");

		$(".index_slogan").hide();
		$('#ddlLanguage').hide();


		$("#location-unified-search").css("width", ($(window).width()-150)+"px");


		$('#lookingfor').hide();
		$('#prefer2speak').hide();



	}
	$(window).resize(function () {
		
			
		


		if ($(window).width() > 768) {
			$(".navbar-brand_").css("top", "45px");
		}
		else {
			$(".navbar-brand_").css("top", "5px");
	
			$(".index_slogan").hide();
			$('#ddlLanguage').hide();


			$("#location-unified-search").css("width", "185px");

			$('#lookingfor').hide();
			$('#prefer2speak').hide();



		}
		$("#location-unified-search").css("width", ($(window).width()-150)+"px");
	});









	//fill lang

	var ajax_get_lang = $.ajax({

		type: "POST",
		url: 'classes/class.get_lang.php',
		dataType: 'json',
	});



	ajax_get_lang.done(function (data) {
		var r = [];
		for (var i = 0; i < data.length; i++) {
			var item = { label: data[i].LANGUAGE_NAME, value: data[i].LANGUAGE_NAME };
			r.push(item);
		}
		if ($(window).width() > 768) {
			$('#ddlLanguage').multiselect('dataprovider', r);
		}


		$('#location-unified-search').show();
		if ($(window).width() > 768)
			$('#DOCTOR_TYPE').show();





	});


	if ($(window).width() > 768) {
		$('#ddlLanguage').multiselect({
			maxHeight: 200
		});
	}






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


	$("#location-unified-search").autocomplete({

		//only match with the beginning of terms
		source: function (request, response) {
			var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(request.term), "i");
			response($.grep(JSON.parse(localStorage.getItem('suburb')), function (item) {
				return matcher.test(item);
			}));
		},




		minLength: 3
	});







	//$('#li_home').addClass("active");

	//游客隐藏距离选择
	if ($.cookie("ilogin") == 1) {

		$('#DISTANCE').prop('disabled', false);

	}
	else
		$('#DISTANCE').prop('disabled', true);


	$('#btn_search').click(function () {
		requesttype = 1;
		func_code = "SD02";
		//form序列化成json
		json_form = $("#unified-search-form-inline").serializeObject();

		var mainIcon = $('.type-unified-search').find('.active .icons-text').text();
		var subIcon = $('.icons-sp-search').find('.active label').text();

		// json_form.DOCTOR_TYPE = "";
		// if (mainIcon != "")
		// 	json_form.DOCTOR_TYPE = mainIcon;

		// if (subIcon != "")
		// 	json_form.DOCTOR_TYPE = subIcon;




		console.log(json_form);
		var str = JSON.stringify(json_form);
		sessionStorage.setItem("searchRestriction", str);

		window.location.href = "searchDoctor.php";
	});


	$(document).on('click', '#btn_search', function (e) {

		//e.preventDefault();



	});



	$('#txt_search').keypress(function (e) {
		if (e.keyCode == 13) {
			var search = $.trim($('#txt_search').val());

			var data = {
				search: search,
				from_index: "1"
			};
			var str = JSON.stringify(data);

			sessionStorage.setItem("search_con", str);

			window.location.href = "searchDoctor.php";
		}
	});

	//填充州
	func_code = "SSTE";
	para = "";

	json_str = request_const(para, func_code, 0);

	// console.log(json_str);
	//请求
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
			var ret_code = "999999";
			var ret_msg = "Error,contact admin please!";
			alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
			result = false;
		}
	});
	if (!result) {
		return result;
	}


	//填充医生类别
	func_code = "SDTY";
	para = "";

	json_str = request_const(para, func_code, 0);

	// console.log(json_str);
	//请求
	result = true;
	$.ajax({
		type: "POST",
		url: "classes/class.getDoctorType.php",
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
				// $.each(ret.data, function (i, item) {
				// 	$("#DOCTOR_TYPE").append("<option value='" + item.DOCTOR_TYPE + "'>" + item.DOCTOR_TYPE + "</option>");
				// });
				// console.log(data);
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
	if (!result) {
		return result;
	}






});