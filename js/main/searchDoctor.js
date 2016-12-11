var json_form, json_str;
var requesttype = 0;
var func_code, result;


var keyDoctorID;
var keyDate;
var keyTime;
$(function() {
	
	//记住用户名密码
	  function Save() {
	    var str_username = $("#CUSTOMER_USER_NAME").val();
	    var str_password = $("#CUSTOMER_USER_PWD").val();
	    var str_usertype = 1;

	    $.cookie("fd_username",str_username);
	    $.cookie("fd_password",str_password);

	    //记录user type
	    if(str_usertype==0){
	      str_usertypename = "诊所用户";
	    }else if(str_usertype==1){
	      str_usertypename = "个人用户";
	    }else if(str_usertype==2){
	      str_usertypename = "管理员";
	    }

	    $.cookie("fd_usertype",str_usertype);
	    $.cookie("fd_usertypename",str_usertypename);
	  
	  };
	  
	  
	//autocomplete
	var options = {
		url: "classes/AutoComplete/suburb.php",
		getValue: "Suburb",
		list: {
			match: {
				enabled: true
			}
		},
		placeholder: "Suburb, State or Postcode",
		theme: "plate-dark"
	};
	$("#CLINIC_SUBURB").easyAutocomplete(options);
//	var d = new Date()
//	var vYear = d.getFullYear()
//	var vMon = d.getMonth() + 1
//	var vDay = d.getDate()
//	var h = d.getHours();
//	var m = d.getMinutes();
//	var se = d.getSeconds();
//	var date_time = vYear + '-' + (vMon < 10 ? "0" + vMon : vMon) + '-' + (vDay < 10 ? "0" + vDay : vDay) + ' ' + (h < 10 ? "0" + h : h) + ':' + (m < 10 ? "0" + m : m) + ':' + (se < 10 ? "0" + se : se);
//	var vDate_F = vYear + '-' + (vMon < 10 ? "0" + vMon : vMon) + '-' + (vDay < 10 ? "0" + vDay : vDay) + ' 00:00';
//	var vDate_T = vYear + '-' + (vMon < 10 ? "0" + vMon : vMon) + '-' + (vDay < 10 ? "0" + vDay : vDay) + ' 23:59';
//	var vDate_Today = (vDay < 10 ? "0" + vDay : vDay) + '-' + (vMon < 10 ? "0" + vMon : vMon) + '-' + vYear;
//	$("#APPOINTMENT_DATE_BEGIN").val(vDate_Today);
//	$("#APPOINTMENT_DATE_END").val(vDate_Today);
	//游客隐藏距离选择
	if ($.cookie("ilogin") == 1) {
		$('#DISTANCE').prop('disabled', false);
		
	} 
	else 
		$('#DISTANCE').prop('disabled', true);
	if (ilogin == 1) {
		$('#CUSTOMER_USER_ID').val(fd_userid);
		$('#btn_save_manage').show();
		$('#btn_save').show();
		//显示收藏医生
		$('.save2favBtn').show();
	      $('.jumptouserSaveDoctor').show();
	}
	else
	{
		$('.save2favBtn').hide();
	      $('.jumptouserSaveDoctor').hide();
	}
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
		success: function(msg) {
			// console.log(msg);
			var ret = msg.response;
			if (ret.success) {
				if (json_str.sequ != ret.sequ) {
					alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
					result = false;
				}
				// var data = ret.data[0];
				$.each(ret.data, function(i, item) {
					$("#STATE_ID").append("<option value='" + item.STATE_ID + "'>" + item.STATE_NAME + "</option>");
				});
				// console.log(data);
			} else {
				alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
				result = false;
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			//请求失败之后的操作
			var ret_code = "999999";
			var ret_msg = "失败,请联系管理员!";
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
		success: function(msg) {
			// console.log(msg);
			var ret = msg.response;
			if (ret.success) {
				if (json_str.sequ != ret.sequ) {
					alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
					result = false;
				}
				// var data = ret.data[0];
				$.each(ret.data, function(i, item) {
					$("#DOCTOR_TYPE").append("<option value='" + item.DOCTOR_TYPE + "'>" + item.DOCTOR_TYPE + "</option>");
				});
				// console.log(data);
			} else {
				alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
				result = false;
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			//请求失败之后的操作
			var ret_code = "999999";
			var ret_msg = "失败,请联系管理员!";
			alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
			result = false;
		}
	});
	if (!result) {
		return result;
	}
	Date.prototype.Format = function(fmt) { //author: meizz
			var o = {
				"M+": this.getMonth() + 1, //月份
				"d+": this.getDate(), //日
				"h+": this.getHours(), //小时
				"m+": this.getMinutes(), //分
				"s+": this.getSeconds(), //秒
				"q+": Math.floor((this.getMonth() + 3) / 3), //季度
				"S": this.getMilliseconds() //毫秒
			};
			if (/(y+)/.test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			}
			for (var k in o) {
				if (new RegExp("(" + k + ")").test(fmt)) {
					fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
				}
			}
			return fmt;
		}
		///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
		//首页跳转
	var str = sessionStorage.search_index;
	//???
	if (str === null) {
		str = "";
	}
	if (str === undefined || str === "") {
		var data = {
			action_type: "index_search",
			search: ""
		};
		sessionStorage.setItem("search_con", JSON.stringify(data));
		str = sessionStorage.getItem("search_con");
	}
	//@@@
	var json_value = JSON.parse(str);
	//赋值给此页面搜索条件
	$('#CLINIC_SUBURB').val(json_value.CLINIC_SUBURB);
	$('#CLINIC_NAME').val(json_value.CLINIC_NAME);
	var $radios = $('input:radio[name=DOCTOR_TYPE]');
	if ($radios.is(':checked') === false) {
		$radios.filter('[value=' + json_value.DOCTOR_TYPE + ']').prop('checked', true);
	}
	$('#DOCTOR_NAME').val(json_value.DOCTOR_NAME);
	$('#DISTANCE').val(json_value.DISTANCE);
	$('#APPOINTMENT_DATE').val(json_value.APPOINTMENT_DATE);
	var isFromIndex = json_value.from_index;
	requesttype = 0;
	func_code = "SD01";
	json_form = $("#modal_form_search").serializeObject();
	json_str = request_const(json_form, func_code, requesttype);
	var all_date = [];
	$.ajax({
		type: "POST",
		url: "classes/class.searchDoctor.php",
		dataType: "json",
		async: false,
		data: {
			request: json_str
		},
		success: function(data) {
			console.log(data);
			var groupsDate = _.groupBy(data, function(value) {
				return value.appointment_date;
			});
			var count = 1;
			for (var i in groupsDate) {
				var item = groupsDate[i];
				var each_date = {
					ID: "",
					date: "",
					doctors: []
				};
				each_date.ID = count++;
				each_date.date = i;
				var groupsDoctor = _.groupBy(item, function(value) {
					return value.doctor_id;
				});
				for (var j in groupsDoctor) {
					var jtem = groupsDoctor[j];
					var doctor = {
						doctorID: 0,
						doctorPIC: "",
						doctorName: "",
						clinicName: "",
						clinicAddress: "",
						timeslot: []
					};
					doctor.doctorID = j;
					doctor.doctorPIC = jtem[0].doctor_photo;
					doctor.doctorName = jtem[0].doctor_name;
					doctor.clinicName = jtem[0].clinic_name;
					doctor.clinicAddress = jtem[0].clinic_addr;
					for (var m in jtem) {
						var mtem = jtem[m];
						doctor.timeslot.push({
							time: convertTime(mtem.appointment_time),
							originalTime: mtem.appointment_time
						});
					}
					each_date.doctors.push(doctor);
				}
				all_date.push(each_date);
			}
			console.log(all_date);
			$('#TMP1').html($('#tmp1').render(all_date));
			$('#TMP2').html($('#tmp2').render(all_date));
			//          var ret = msg.response;
			//          if(ret.success){
			//            if(json_str.sequ != ret.sequ){
			//              alert(func_code + ":" + "时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
			//              result=false;
			//            }
			//
			//            alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
			//          }else{
			//            alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg); 
			//            result=false;
			//          }
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			//请求失败之后的操作
			var ret_code = "999999";
			var ret_msg = "失败,请联系管理员!";
			alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
			result = false;
		}
	});
	///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
	//从主页跳转
	if (isFromIndex) {
		$('#searchModal').modal('hide');
		requesttype = 1;
		func_code = "SD02";
		//form序列化成json
		json_form = $("#modal_form_search").serializeObject();
		//生成输入参数
		json_str = request_const(json_form, func_code, requesttype);
		$('#searchModal').modal('hide');
	} else {
		//$('#searchModal').modal('show');
		$('#searchModal').modal('hide');
	}
	$('#btn_search').click(function() {
		// $('#action_type').val("");
		///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
		requesttype = 1;
		func_code = "SD02";
		json_form = $("#modal_form_search").serializeObject();
		json_str = request_const(json_form, func_code, requesttype);
		///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
		var all_date = [];
		$.ajax({
			type: "POST",
			url: "classes/class.searchDoctor.php",
			dataType: "json",
			data: {
				request: json_str
			},
			success: function(data) {
				console.log(data);
				var groupsDate = _.groupBy(data, function(value) {
					return value.appointment_date;
				});
				var count = 1;
				for (var i in groupsDate) {
					var item = groupsDate[i];
					var each_date = {
						ID: "",
						date: "",
						doctors: []
					};
					each_date.ID = count++;
					each_date.date = i;
					var groupsDoctor = _.groupBy(item, function(value) {
						return value.doctor_id;
					});
					for (var j in groupsDoctor) {
						var jtem = groupsDoctor[j];
						var doctor = {
							doctorPIC: "",
							doctorName: "",
							clinicName: "",
							clinicAddress: "",
							timeslot: []
						};
						doctor.doctorPIC = jtem[0].doctor_photo;
						doctor.doctorName = jtem[0].doctor_name;
						doctor.clinicName = jtem[0].clinic_name;
						doctor.clinicAddress = jtem[0].clinic_addr;
						for (var m in jtem) {
							var mtem = jtem[m];
							doctor.timeslot.push({
								time: convertTime(mtem.appointment_time)
							});
						}
						each_date.doctors.push(doctor);
					}
					all_date.push(each_date);
				}
				console.log(all_date);
				$('#TMP1').html($('#tmp1').render(all_date));
				$('#TMP2').html($('#tmp2').render(all_date));
				//	          var ret = msg.response;
				//	          if(ret.success){
				//	            if(json_str.sequ != ret.sequ){
				//	              alert(func_code + ":" + "时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
				//	              result=false;
				//	            }
				//
				//	            alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
				//	          }else{
				//	            alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg); 
				//	            result=false;
				//	          }
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				//请求失败之后的操作
				var ret_code = "999999";
				var ret_msg = "失败,请联系管理员!";
				alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
				result = false;
			}
		});
		$('#searchModal').modal('hide')
	});

	$('#btn_save').click(function() {
		$('#action_type').val("create");
		// var state_name = $("#STATE_ID").find("option:selected").text();
		//收藏医生
		///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
		func_code = "SS01";
		//form序列化成json
		///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
		requesttype = 1;
		//form序列化成json
		json_form = $("#modal_form_search").serializeObject();
		// json_form.STATE_ID = state_name;
		// console.log(json_form);
		//生成输入参数
		json_str = request_const(json_form, func_code, requesttype);
		console.log(json_str);
		///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
		//生成输入参数
		result = true;
		$.ajax({
			type: "POST",
			url: "classes/class.saveSearch.php",
			dataType: "json",
			data: {
				request: json_str
			},
			success: function(msg) {
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
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				//请求失败之后的操作
				var ret_code = "999999";
				var ret_msg = "失败,请联系管理员!";
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
		language: 'zh-CN',
		format: "dd-mm-yyyy",
		todayBtn: 1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: "month"
	});
	
/////////////////点击timeslot按钮，预约 begin
	$(".timeslotBtn").each(function(index) {
		$(this).on("click", function() {
			 keyDoctorID = $(this).attr('keyDoctorID');
			 keyDate = $(this).attr('keyDate');
			 keyTime = $(this).attr('keyTime');
			
			//未注册用户
			if ($.cookie("ilogin") == 0) {
				requesttype = 0; //注册用户
				$('#signupModal').modal('show');
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
				success: function(msg) {
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
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					//请求失败之后的操作
					var ret_code = "999999";
					var ret_msg = "ajax失败,请联系管理员";
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
			} else if ($.cookie("ilogin") == 0) //处理未登录用户预约
			{
				var custom_user_id;
				func_code = "UI02"; //获取用户详细信息
				para = {
					username: $('#CUSTOMER_USER_NAME').val()
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
					success: function(msg) {
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
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						//请求失败之后的操作
						var ret_code = "999999";
						var ret_msg = "失败,请联系管理员!";
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
					CUSTOMER_USER_NAME: $('#CUSTOMER_USER_NAME').val(),
					CUSTOMER_USER_PWD: $('#CUSTOMER_USER_PWD').val(),
					CUSTOMER_USER_ID: custom_user_id,
					DOCTOR_ID: $('#DOCTOR_ID').val(),
					DOCTOR_APPOINTMENT_TIME_ID: time_id,
					APPOINTMENT_STATUS_ID: 1
				};
				console.log(para);
				requesttype = 0; //未注册用户
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
				success: function(msg) {
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
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					//请求失败之后的操作
					var ret_code = "999999";
					var ret_msg = "失败,请联系管理员!";
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
				success: function(msg) {
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
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					//请求失败之后的操作
					var ret_code = "999999";
					var ret_msg = "失败,请联系管理员!";
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
				window.location.href = "sign_in.php";
			}
			return false;
			/////////////////预约 end         
		});
	});
	
	
/////// 未注册用户点击 注册用户预约医生 按钮
	  $('#btn_signin').click(function (){

	      if($('#CUSTOMER_USER_NAME').val()==""){   

	        alert($("#Lang0174").html());//用户名不能为空
	        return false;
	      }
	      if($('#CUSTOMER_USER_PWD').val()==""){

	        alert($("#Lang0175").html());//密码不能为空
	        return false;
	      }
	      if($('#verifyCode').val()==""){
	   
	        alert($("#Lang0176").html());//验证码不能为空
	        return false;
	      }
	      if($('#CUSTOMER_GENDER').val()==""){

	        alert($("#Lang0177").html());//性别不能为空
	        return false;
	      }
	      if($('#CUSTOMER_BIRTHDAY').val()==""){

	        alert($("#Lang0178").html());//生日不能为空
	        return false;
	      }
	      if($('#CUSTOMER_ADDR').val()==""){

	        alert($("#Lang0179").html());//用户地址不能为空
	        return false;
	      }
	      if($('#CUSTOMER_PHONE_NO').val()==""){

	        alert($("#Lang0180").html());//手机号码不能为空
	        return false;
	      }
	      if($('#MEDICAL_CARD_NO').val()==""){

	        alert($("#Lang0181").html());//医疗卡号不能为空
	        return false;
	      }

	    ///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
	      // 注册个人用户信息  
	      func_code = "UU01";
	      //form序列化成json
	      json_form = $("#modal_form_signup").serializeObject();
	      //生成输入参数
	      json_str = request_const(json_form,func_code,0);
	      //alert(JSON.stringify(json_str));

	      console.log(json_str);
	      result=true;
	  ///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
	      $.ajax({
	          type: "POST",
	          url: "classes/class.sign_up_person.php",
	          dataType: "json",
	          async:false,
	          cache : false,
	          data:  {
	            request:json_str
	          },
	          success: function (msg) {
	            var ret = msg.response;
	            if(ret.success){
	              if(json_str.sequ != ret.sequ){
	                alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	                result=false;

	              }
	              if("UP0001" == ret.status.ret_code){
	                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	                result=false;
	              }
	              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	              // window.location.href="sign_in.php";

	            }else{
	              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	              result=false;
	              // $('#signup_ok').attr('disabled',false); 
	            }
	          },
	          error: function(XMLHttpRequest, textStatus, errorThrown){
	            //请求失败之后的操作
	            var ret_code = "999999";
	            var ret_msg = "失败,请联系管理员!";
	            alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	            result=false;
	          }
	        });
	      if(!result){
	        return result;
	      }

	      ///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
	    func_code = "UI01";
	    requesttype = 0;

	    para={
	      USER_NAME:$('#CUSTOMER_USER_NAME').val(),
	      USER_PWD:$('#CUSTOMER_USER_PWD').val(),
	      usertype:1
	    }

	    // serviceid = UI01
	    //生成输入参数,函数参数说明
	    // 1- json格式 项目实际需要的参数data
	    // 2- serviceid = UI01 在[二维码服务API接口文档.xlsx]文档中 服务(serviceid)列表 查找
	    // 3- 默认0 请求类型 一般情况无用
	    json_str = request_const(para,func_code,requesttype);
	    //alert(JSON.stringify(json_str));

	    // console.log(json_str);

	    ///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
	    //自动登录
	    result = true;
	    $.ajax({
	          type: "POST",
	          url: "classes/class.sign_in.php",
	          dataType: "json",
	          async:false,
	          data:  {
	            request:json_str
	          },
	          success: function (msg) {
	            // console.log(msg);
	            var ret = msg.response;
	            if(ret.success){
	              if(json_str.sequ != ret.sequ){
	                alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	                result=false;
	              }

	              //登录标志
	              $.cookie("ilogin", 1);
	              //记录cookie
	              Save();

	          }else{
	            alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	            // $('#signin_ok').attr('disabled',false); 
	            result=false;
	          }
	          
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown){
	          //请求失败之后的操作
	          var ret_code = "999999";
	          var ret_msg = "失败,请联系管理员!";
	          alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	          result=false;
	        }
	      });
	      if(!result){
	        return result;
	      }

	      //自动登录
	      var ilogin = $.cookie("ilogin");
	      var username = $.cookie("fd_username");
	      var fd_usertype = $.cookie("fd_usertype");

	      console.log(ilogin);
	      console.log(username);
	      console.log(fd_usertype);

	        //获取用户基本信息
	        url="classes/class.UserDetail.php";
	        func_code="UI02";
	        para={
	            username: username
	        };

	        json_str = request_const(para,func_code,0);

	        console.log(json_str);
	        //获取USER_ID
	        result = true;
	        $.ajax({
	            type: "POST",
	            url: url,
	            dataType: "json",
	            async:false,
	            data: {
	                request:json_str
	            },
	            success: function (msg) {
	              // console.log(msg);
	              var ret = msg.response;
	              if(ret.success){
	                if(json_str.sequ != ret.sequ){
	                    alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	                    result=false;
	                  }
	                  var data = ret.data[0];

	                  $.cookie("fd_userid", data.CUSTOMER_USER_ID);

	              }else{
	                  alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	                  result=false;
	              }
	            },
	            error: function(XMLHttpRequest, textStatus, errorThrown){
	             //请求失败之后的操作
	              var ret_code = "999999";
	              var ret_msg = "失败,请联系管理员!";
	              alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	              result=false;
	           }
	        });
	        if(!result){
	          return result;
	        }

	    // //登录成功实现跳转
	    // if(fd_usertype==0){
	    //   window.location.href="clinicUpdUserInfo.php";
	    // }else if(fd_usertype==1){
	    //   window.location.href="index.php";
	    // }else if(fd_usertype==2){
	    //   window.location.href="adminQryClinic.php";
	    // }

	      //搜索医生预约时间ID
	      var time_id="";
	      

	      //搜索医生预约时间ID
	      func_code="ST01";
	      para = {
					DOCTOR_ID: keyDoctorID,
					APPOINTMENT_DATE: keyDate,
					APPOINTMENT_TIME: keyTime
				};

	      json_str = request_const(para,func_code,0);

	      // console.log(json_str);
	      //获取DOCTOR_APPOINTMENT_TIME_ID
	      result=true;
	      $.ajax({
	          type: "POST",
	          url: "classes/class.searchAppTimeID.php",
	          dataType: "json",
	          async:false,
	          data: {
	            request:json_str
	          },
	          success: function (msg) {
	              // console.log(msg);
	              var ret = msg.response;
	              if(ret.success){
	                if(json_str.sequ != ret.sequ){
	                  alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	                  result=false;
	                }
	                var data = ret.data[0];
	                console.log(ret);
	                time_id = data.DOCTOR_APPOINTMENT_TIME_ID;
	              }else{
	                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	                result=false;
	              }
	              
	          },
	          error: function(XMLHttpRequest, textStatus, errorThrown){
	            //请求失败之后的操作
	            var ret_code = "999999";
	            var ret_msg = "ajax失败,请联系管理员";
	            alert(func_code+":"+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	            result = false;
	         }
	      });
	      if(!result){
	          return result;
	      }

	      //获取用户详细信息
	      var custom_user_id;
	      func_code="UI02"; 
	      para={
	          username: $('#CUSTOMER_USER_NAME').val()
	      };

	      json_str = request_const(para,func_code,0);

	      // console.log(json_str);
	      //请求
	      result = true;
	      $.ajax({
	          type: "POST",
	          url: "classes/class.searchUserDetail.php",
	          dataType: "json",
	          async:false,
	          data: {
	              request:json_str
	          },
	          success: function (msg) {
	              // console.log(msg);
	              var ret = msg.response;
	              if(ret.success){
	                if(json_str.sequ != ret.sequ){
	                    alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	                    result = false;
	                }
	                  var data = ret.data[0];
	                  custom_user_id=data.CUSTOMER_USER_ID;
	              }else{
	                  alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	                  result = false;
	              }
	              
	          },
	          error: function(XMLHttpRequest, textStatus, errorThrown){
	            //请求失败之后的操作
	            var ret_code = "999999";
	            var ret_msg = "失败,请联系管理员!";
	            alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	            result=false;
	          }
	        });
	        if(!result){
	            return result;
	        }

	        // 预约医生
	        func_code="AD01";
	        para={
	          action_type: "create",
	          // CUSTOMER_USER_NAME: $('#CUSTOMER_USER_NAME').val(),
	          // CUSTOMER_USER_PWD: $('#CUSTOMER_USER_PWD').val(),
	          CUSTOMER_USER_ID: custom_user_id,
	          DOCTOR_ID: keyDoctorID,
	          DOCTOR_APPOINTMENT_TIME_ID:time_id,
	          APPOINTMENT_STATUS_ID:1
	        };
	        console.log(para);

	        requesttype = 1; //注册用户

	      json_str = request_const(para,func_code,requesttype);

	      // console.log(json_str_1);

	      //请求
	      result=true;
	      $.ajax({
	          type: "POST",
	          url: "classes/class.appointmentDoctor.php",
	          dataType: "json",
	          async:false,
	          data: {
	            request:json_str
	          },
	          success: function (msg) {
	              // console.log(msg);
	              var ret = msg.response;
	              if(ret.success){
	                if(json_str.sequ != ret.sequ){
	                  alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	                  result = false;
	                }
	                if(ret.status.ret_code == "AD0102"){
	                  alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	                  result = false;
	                }
	                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);

	              }else{
	                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	                result = false;
	              }
	          },
	          error: function(XMLHttpRequest, textStatus, errorThrown){
	            //请求失败之后的操作
	            var ret_code = "999999";
	            var ret_msg = "失败,请联系管理员!";
	            alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	            result=false;
	         }
	      });
	      if(!result){
	          return result;
	      }

	      //修改医生预约时间状态
	      func_code="UAT0"; 
	      para={
	          action_type:"update",
	          DOCTOR_APPOINTMENT_TIME_ID:time_id,
	          ACTIVE_STATUS:0
	      };

	      json_str = request_const(para,func_code,1);

	      // console.log(json_str);
	      //请求
	      result = true;
	      $.ajax({
	        type: "POST",
	        url: "classes/class.appointmentTime.php",
	        dataType: "json",
	        async:false,
	        data: {
	            request:json_str
	        },
	        success: function (msg) {
	            // console.log(msg);
	            var ret = msg.response;
	            if(ret.success){
	              if(json_str.sequ != ret.sequ){
	                  alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	                  result = false;
	              }

	            }else{
	                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	                result = false;
	            }
	            
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown){
	          //请求失败之后的操作
	          var ret_code = "999999";
	          var ret_msg = "失败,请联系管理员!";
	          alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	          result=false;
	        }
	      });
	      if(!result){
	          return result;
	      }

	      if($.cookie("ilogin") == 1){
	        window.location.href="userAppointmentRecoder.php"; 
	      }else if($.cookie("ilogin") == 0){
	        // window.location.href="sign_in.php"; 
	      }

	      return false;
	  });
	  
	  
	  

	  
	  
	  
	  
	  //收藏医生
	  $(".save2favBtn").each(function(index) {
			$(this).on("click", function() {
				
				var keyDoctorIDsave2fav = $(this).attr('keyDoctorID');

			     
			///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
			      func_code = "S001";
			      requesttype = 1;
			      //form序列化成json
			      json_form = {
			        action_type:"create",
			        CUSTOMER_USER_ID:$('#CUSTOMER_USER_ID').val(),
			        DOCTOR_ID:keyDoctorIDsave2fav
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
			            data:  {
			              request:json_str
			            },
			            success: function (msg) {
			              var ret = msg.response;
			              if(ret.success){
			                if(json_str.sequ != ret.sequ){
			                  alert(func_code + ":" + "时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
			                  result=false;
			                }

			                // //登录标志
			                // $.cookie("ilogin", 1);
			                // //记录cookie
			                // Save();
			                // history.go(-1);
			                // // window.location.href="index.php";
			                alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
			              }else{
			                alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
			                // $('#signin_ok').attr('disabled',false); 
			                result=false;
			              }
			              
			            },
			            error: function(XMLHttpRequest, textStatus, errorThrown){
			              //请求失败之后的操作
			              var ret_code = "999999";
			              var ret_msg = "失败,请联系管理员!";
			              alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
			              result=false;
			            }
			        });
			        if(!result){
			          return result;
			        }

			      return false;

			    
			});
		});
	  
	  
	  if (ilogin == 1) {
			//显示收藏医生
			$('.save2favBtn').show();
		      $('.jumptouserSaveDoctor').show();
		}
		else
		{
			$('.save2favBtn').hide();
		      $('.jumptouserSaveDoctor').hide();
		}
});