$(function(){

	$("#right_clinic").load("clinicUpdUserInfo.html");
	$("#clinic_upd_user_info").addClass("list-group-item active");


	$("#clinic_upd_user_info").click(function(){
		$("#right_clinic").load("clinicUpdUserInfo.html");
		return false;
	});
	
	$("#clinic_upd_doctor").click(function(){
		$("#clinic_upd_user_info").removeClass("active");
		$("#right_clinic").load("clinicQryDoctor.html");
		return false;
	});

	$("#clinic_upd_user_pwd").click(function(){
		$("#clinic_upd_user_info").removeClass("active");
		$("#right_clinic").load("clinicUpdUserPwd.html");
		return false;
	});
});
