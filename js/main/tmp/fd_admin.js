$(function(){

	$("#right_admin").load("adminQryClinic.php");
	$("#admin_qry_clinic").addClass("list-group-item active");


	$("#admin_qry_clinic").click(function(){
		$("#right_admin").load("adminQryClinic.php");
		return false;
	});
	
	$("#admin_upd_clinic_user").click(function(){
		$("#admin_qry_clinic").removeClass("active");
		$("#right_admin").load("clinicUpdUserInfo.html");
		return false;
	});

	$("#admin_qry_doctor").click(function(){
		$("#admin_qry_clinic").removeClass("active");
		$("#right_admin").load("clinicQryDoctor.html");
		return false;
	});

	$("#admin_upd_doctor").click(function(){
		$("#admin_qry_clinic").removeClass("active");
		$("#right_admin").load("clinicQryDoctor.html");
		return false;
	});

	$("#admin_qry_person").click(function(){
		$("#admin_qry_clinic").removeClass("active");
		window.location.href="adminQryPersonInfo.html";
		//$("#right_admin").load("adminQryPersonInfo.html");
		return false;
	});

	$("#admin_upd_person").click(function(){
		$("#admin_qry_clinic").removeClass("active");
		$("#right_admin").load("userUpdPersonInfo.html");
		return false;
	});

	$("#admin_reset_pwd").click(function(){
		$("#admin_qry_clinic").removeClass("active");
		$("#right_admin").load("adminResetPwd.html");
		return false;
	});

	$("#admin_upd_pwd").click(function(){
		$("#admin_qry_clinic").removeClass("active");
		$("#right_admin").load("adminUpdPwd.html");
		return false;
	});

	//全选
	$("#qpi_chk_all").click(function(){
		$("input[name=qpi_chk_list]").prop("checked",$(this).prop("checked"));
	});
	
	$("#qc_chk_all").live("click",function(){
    	$("input[name=qc_chk_list]").prop("checked",$(this).prop("checked"));
	});
});
