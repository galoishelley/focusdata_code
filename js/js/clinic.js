$(function(){

	// var url=window.location.href;//获取当前的URL
	// url=url.replace(/[^a-z0-9]/gi,"");//用正则清除字符串中的所有非字母和数字的内容
	// if($.cookie(url)=="" || $.cookie(url)==null){
	//    // alert("这是你第一次进入这个页面");
	//    $.cookie(url,"y");
	// 	$("#right_con").load("userRecoder.html");
	// 	$("#user_recoder").addClass("list-group-item active");
	// }else{

	// }

	$("#right_clinic").load("clinicUpd.html");
	$("#clinic_upd").addClass("list-group-item active");


	$("#clinic_upd").click(function(){
		$("#right_clinic").load("clinicUpd.html");
		return false;
	});
	
	$("#clinic_doctor").click(function(){
		$("#clinic_upd").removeClass("active");
		$("#right_clinic").load("userUpd.html");
		return false;
	});

	$("#clinic_pwd").click(function(){
		$("#clinic_upd").removeClass("active");
		$("#right_clinic").load("userPwdUpd.html");
		return false;
	});
});
