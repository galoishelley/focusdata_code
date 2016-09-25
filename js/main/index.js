var json_form,json_str;
var requesttype = 0;
var func_code,result;


$(function(){
	
	
	
	
	

	$('#li_home').addClass("active");
	
	//游客隐藏距离选择
	if($.cookie("ilogin") == 1){
		
		$('#DISTANCE').prop('disabled', false);
		
	}
	else
		$('#DISTANCE').prop('disabled', true);
		
// 	$( "#li_Chinese" ).click(function() {
		
// 		// $.cookie("language", "ch"); 
// 		// setLang($.cookie("language"));
		
// //		getAllLangInfo("ch");
// //		$.ajax({
// //	        type: "POST",
// //	        url: "classes/Language/setLanguage.php",
// //	        dataType: "text",
// //	        data: { language: "ch"},
// //	        success: function () {
// //	        	getAllLangInfo("ch");
// //	        },
// //	        error: function(XMLHttpRequest, textStatus, errorThrown){
// //	  			//请求失败之后的操作
// //				var ret_code = "999999";
// //				var ret_msg = "失败,请联系管理员!";
// //				alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
// //				result=false;
// //	       }
// //		});
// 	});
	
// 	$( "#li_English" ).click(function() {
// 		$.cookie("language", "en"); 
// 		setLang($.cookie("language"));
// //		getAllLangInfo("en");
// //		$.ajax({
// //	        type: "POST",
// //	        url: "classes/Language/setLanguage.php",
// //	        dataType: "text",
// //	        data: { language: "en"},
// //	        success: function () {
// //	        	getAllLangInfo("en");
// //	        },
// //	        error: function(XMLHttpRequest, textStatus, errorThrown){
// //	  			//请求失败之后的操作
// //				var ret_code = "999999";
// //				var ret_msg = "失败,请联系管理员!";
// //				alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
// //				result=false;
// //	       }
// //		});
// 	});

	// function setLang(w)
	// {
	// 	if(w!="ch"){
	// 		w="en";
	// 	}
		
	// 	var ret = arrLang[w];
	// 	$('title').text(ret.title);
	// 	$('#li_home>a').text(ret.menu.home);
	// 	$('#li_language>a').text(ret.menu.language);
	//     $('#li_aboutus>a').text(ret.menu.aboutus);
	//     $('#li_staff>a').text(ret.menu.staff);
	//     $('#li_contacts>a').text(ret.menu.contacts);
	//     $('#sign_in>a').text(ret.menu.signin);
	//     $('#sign_up>a').text(ret.menu.signup);
	//     $('#li_tourist>a').text(ret.menu.tourist);
	//     $('#usertype').text(ret.menu.usertype);
	//     $('#li_SearchDoctor>a').text(ret.menu.searchdoctor);
	    	
	//     $('#navbar-brand-img>a>img').attr("src","img/"+ret.menu.navbar_brand_img);
	// }
	// function getAllLangInfo(lang)
	// {
	// 	if(lang == "ch"){
	// 		 url = "classes/Language/index.cn.json";
	// 	}
	// 	else{
	// 		 url = "classes/Language/index.en.json";
	// 	}

	// 	func_code="0000";
	//     result = true;
	//     $.ajax({
	//         type: "POST",
	//         url: url,
	//         dataType: "json",
	//         async: false,
	//         data: "",
	//         success: callbackFun,
	//         error: function(XMLHttpRequest, textStatus, errorThrown){
	//   			//请求失败之后的操作
	// 			var ret_code = "999999";
	// 			var ret_msg = "失败,请联系管理员!";
	// 			alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	// 			result=false;
	//        }
	// 	});
	// 	if(!result){
	//       return result;
	//     }

	//     function callbackFun(msg){
	// 		var ret = msg.index;
	// 		$('title').text(ret.title);
	// 		$('#li_home>a').text(ret.menu.home);
	// 		$('#li_language>a').text(ret.menu.language);
	// 	    $('#li_aboutus>a').text(ret.menu.aboutus);
	// 	    $('#li_staff>a').text(ret.menu.staff);
	// 	    $('#li_contacts>a').text(ret.menu.contacts);
	// 	    $('#sign_in>a').text(ret.menu.signin);
	// 	    $('#sign_up>a').text(ret.menu.signup);
	// 	    $('#li_tourist>a').text(ret.menu.tourist);
	// 	    	$('#usertype').text(ret.menu.usertype);
	// 	    	$('#li_SearchDoctor>a').text(ret.menu.searchdoctor);
		    	
	// 	    $('#navbar-brand-img>a>img').attr("src","img/"+ret.menu.navbar_brand_img);
		    
	// 	};
	// }
	

    // console.log($.cookie("fd_usertype"));

	// 设置语言 end
	
	// //guest无需显示退出和用户类型
	// if($.cookie("fd_usertype") == undefined){
	// 	$('#btn_out').hide();
	// 	$('#usertype').hide();
	// }

 // 	//退出登录
	// $('#btn_out').click(function(){
	// 	$.cookie("ilogin", "");
	// 	// $('#userinfo').html();
	// 	window.location.href="index.php"; 

	// 	if ($.cookie("fd_rmbUser") == "false") {
	// 		$.cookie("fd_userid", "");
	// 		$.cookie("fd_username", "");
	// 		$.cookie("fd_password", "");
	// 		//$.cookie("fd_usertype", "");
	// 		$.removeCookie("fd_usertype");
	// 	}
	// });

	// 导航
	//登录用户
	// if($.cookie("ilogin") == 1)
 //  	{
	// 	var fd_usertype = $.cookie("fd_usertype");
	// 	var fd_usertypename = $.cookie("fd_usertypename");
	//     var username = $.cookie("fd_username");

	//     // 用户名
	//     $('#userinfo').html(username);
	//     // 设置用户类型
	//     $('#usertype').html("用户类型: "+ fd_usertypename);

	// 	//显示安全退出
	// 	$('#li_sign_out').removeClass("hidden");
		

	// 	var url, str_data;
	// 	if(fd_usertype == 0){
	//     	$('#li_ClinicUser').removeClass("hidden");
	//     	url="classes/class.ClinicDetail.php";
	// 		// str_data="CLINIC_USER_ID";
 //  		}else if(fd_usertype == 1){
 //  			$('#li_home').removeClass("hidden");
 //  			$('#li_SearchDoctor').removeClass("hidden");
 //  			$('#li_AppRecoder').removeClass("hidden");
 //  			url="classes/class.UserDetail.php";
 //  			// str_data="CUSTOMER_USER_ID";
 //  		}else if(fd_usertype == 2){
 //  			$('#li_Admin').removeClass("hidden");
 //  			url="classes/class.AdminDetail.php";
 //  			// str_data="ADMIN_ID";
 //  		}else{

 //  		}

	//     //获取用户基本信息
	//     func_code="UI02";
	//     var para={
	//       	username: username
	//     };

	//     var json_str = request_const(para,func_code,0);

	//     // console.log(json_str);
	//     //请求
	//     result = true;
	//     $.ajax({
	//         type: "POST",
	//         url: url,
	//         dataType: "json",
	//         async:false,
	//         data: {
	//           	request:json_str
	//         },
	//         success: function (msg) {
	//             // console.log(msg);
	//             var ret = msg.response;
	//             if(ret.success){
	// 	            if(json_str.sequ != ret.sequ){
	// 	                alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	// 	                result=false;
	// 	            }
	//               	var data = ret.data[0];

	//               	console.log(data);
	//               	if(fd_usertype == 0){
	//               		$.cookie("fd_userid", data.CLINIC_USER_ID);
	// 		  		}else if(fd_usertype == 1){
	// 		  			$.cookie("fd_userid", data.CUSTOMER_USER_ID);
	// 		  		}else if(fd_usertype == 2){
	// 		  			$.cookie("fd_userid", data.ADMIN_ID);
	// 		  		}else{

	// 		  		}
	//             }else{
	//               	alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	//               	result=false;
	//             }
	            
	//         },
	//         error: function(XMLHttpRequest, textStatus, errorThrown){
	//   			//请求失败之后的操作
	// 			var ret_code = "999999";
	// 			var ret_msg = "失败,请联系管理员!";
	// 			alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	// 			result=false;
	//        }
 //    	});
 //    	if(!result){
	//       return result;
	//     }

	// }else{
	// 	//游客
	//     $.cookie("ilogin", 0);
	//     //显示HOME
	//     $('#li_home').removeClass("hidden");
	//     //显示搜索医生
 //  		$('#li_SearchDoctor').removeClass("hidden");
 //  		//设置用户类型
 //  		$('#usertype').html("用户类型: 游客");
 //  		//显示登陆注册
 //  		$('#sign_in').removeClass("hidden");
 //  		$('#sign_up').removeClass("hidden");
	// }

	$('#btn_search').click(function (){
///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
		requesttype = 1;
		func_code="SD02";
		//form序列化成json
		json_form = $("#searchdoctor_form").serializeObject();

	    // var json_stringify=JSON.stringify(json_form);
	    // json_form = json_stringify.replace(/[ ]/g,"");

	    //生成输入参数
	    // json_str = request_const(json_form,func_code,requesttype);
	    // console.log(json_str);
///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
	    
		console.log(json_form);
		var str = JSON.stringify(json_form);
	    sessionStorage.setItem("search_index",str);

      	window.location.href="searchDoctor.php"; 
	});

	// $('#btn_search').click(function(){
	// 	var search = $.trim($('#txt_search').val());

	// 	var data = {
 //          		search: search,
 //          		from_index: "1"
 //        };
 //        var str = JSON.stringify(data);
	// 	sessionStorage.setItem("search_con",str);

	// 	window.location.href="searchDoctor.php"; 
	// });

	$('#txt_search').keypress(function(e){ 
		if(e.keyCode==13){ 
			var search = $.trim($('#txt_search').val());

			var data = {
          		search: search,
          		from_index: "1"
        	};
    		var str = JSON.stringify(data);

    		sessionStorage.setItem("search_con",str);

			window.location.href="searchDoctor.php"; 
		} 
	}); 

	//填充州
	func_code = "SSTE";
	para="";

	json_str = request_const(para,func_code,0);

	// console.log(json_str);
	//请求
	result=true;
	$.ajax({
	type: "POST",
	url: "classes/class.getState.php",
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
	      // var data = ret.data[0];
	      $.each(ret.data, function(i, item) {
	          $("#STATE_ID").append("<option value='"+ item.STATE_ID +"'>" + item.STATE_NAME + "</option>");
	      });
	      // console.log(data);
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


	//填充医生类别
	func_code = "SDTY";
	para="";

	json_str = request_const(para,func_code,0);

	// console.log(json_str);
	//请求
	result=true;
	$.ajax({
	type: "POST",
	url: "classes/class.getDoctorType.php",
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
	      // var data = ret.data[0];
	      $.each(ret.data, function(i, item) {
	          $("#DOCTOR_TYPE").append("<option value='"+ item.DOCTOR_TYPE +"'>" + item.DOCTOR_TYPE + "</option>");
	      });
	      // console.log(data);
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

	var d = new Date()
	var vYear = d.getFullYear()
	var vMon = d.getMonth() + 1
	var vDay = d.getDate()
	var h = d.getHours(); 
	var m = d.getMinutes(); 
	var se = d.getSeconds(); 
	var date_time=vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' '+(h<10 ? "0"+ h : h)+':'+(m<10 ? "0" + m : m)+':'+(se<10 ? "0" +se : se);
	var vDate_F= vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' 00:00';
	var vDate_T= vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' 23:59';
	var vDate_Today= (vDay<10 ? "0"+ vDay : vDay)+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+vYear;

	$("#APPOINTMENT_DATE_BEGIN").val(vDate_Today);
	$("#APPOINTMENT_DATE_END").val(vDate_Today);
	
	$('.form_datetime').datetimepicker({
	    language:  'en',
	    format: "dd-mm-yyyy",
	    todayBtn:  1,
	    autoclose: 1,
	    todayHighlight: 1,
	    startView: 2,
	    minView: "month"
  	});
	
	//设置Bootstrap datetimepicker  I18N 2006/09/25 updated by alex
//	if($("#which_lang").html()=="en"){
//		$('.form_datetime').datetimepicker({
//		    language:  'en',
//		    format: "dd-mm-yyyy",
//		    todayBtn:  1,
//		    autoclose: 1,
//		    todayHighlight: 1,
//		    startView: 2,
//		    minView: "month"
//	  	});
//	}
//	else if($("#which_lang").html()=="ch"){
//		$('.form_datetime').datetimepicker({
//		    language:  'zh-CN',
//		    format: "dd-mm-yyyy",
//		    todayBtn:  1,
//		    autoclose: 1,
//		    todayHighlight: 1,
//		    startView: 2,
//		    minView: "month"
//	  	});
//	}

	

});