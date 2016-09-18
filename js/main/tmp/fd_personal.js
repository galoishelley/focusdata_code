$(function(){

	// var url=window.location.href;//获取当前的URL
	// url=url.replace(/[^a-z0-9]/gi,"");//用正则清除字符串中的所有非字母和数字的内容
	// if($.cookie(url)=="" || $.cookie(url)==null){
	//    // alert("这是你第一次进入这个页面");
	//    $.cookie(url,"y");
	// 	$("#right_con").load("userRecoder.html");
	// 	$("#user_appointment_recoder").addClass("list-group-item active");
	// }else{

	// }
	// $.get('userAppointmentRecoder.php',function(data){  
	// 	data=data.slice(data.indexOf('<body>')+6,data.indexOf('</body>'));  
	// 	$("#right_person").html(data);  
	// });  

	$('#right_person').empty();
	$("#right_person").load("userAppointmentRecoder.php");
	$("#user_appointment_recoder").addClass("list-group-item active");


	$("#user_appointment_recoder").click(function(){
		$("#right_person").load("userAppointmentRecoder.php");
		return false;
	});
	
	$("#user_upd_person_info").click(function(){
		$("#user_appointment_recoder").removeClass("active");
		$("#right_person").load("userUpdPersonInfo.php");
		return false;
	});

	$("#user_upd_person_pwd").click(function(){
		$("#user_appointment_recoder").removeClass("active");
		$("#right_person").load("userUpdPersonPwd.php");
		return false;
	});
	
	$("#user_collect_doctor").click(function(){
		$("#user_appointment_recoder").removeClass("active");
		$("#right_person").load("userCollectDoctor.html");
		return false;
	});

	$("#user_search_terms").click(function(){
		$("#user_appointment_recoder").removeClass("active");
		$("#right_person").load("userSearchTerms.html");
		return false;
	});	


	//全选
	$("#ar_chk_all").live("click",function(){
	  $("input[name='ar_chk_list']").prop("checked",$(this).prop("checked"));
	});

	$("#cd_chk_all").live("click",function(){
	  $("input[name='cd_chk_list']").prop("checked",$(this).prop("checked"));
	});

	$("#st_chk_all").live("click",function(){
	  $("input[name='st_chk_list']").prop("checked",$(this).prop("checked"));
	});


	$("#btn_del").live("click",function(){
	  alert("hello text");
	});
});
