$(function(){
	
	$("#btn_appointment").click(function(){
		// alert("选中的中文为"+$(this).val());
		
		//判断是否选择预约时间点
		var iflag=0;
		$("input[name=inlineRadioOptions]").each(function(){
			if( $(this).attr("checked") ){
				iflag=1;
			}
		});

		if( !iflag ){
			alert("请选择预约时间段");
			return false;
		}

		var doc_name=$("#doc_name").html();
		var doc_type=$("#doc_type").html();
		var clinic_name=$("#clinic_name").html();
		var clinic_area=$("#clinic_area").html();

		// //跳转到预约页面
		$.post("appointmentDoctor.html",
	    {
	    	name:"Donald Duck123",
	     	city:"Duckburg"
	    },
	    function(data,status){
	    	window.location.href="appointmentDoctor.html";
	      	alert("数据：" + data + "\n状态：" + status);
	    });

		// $.ajax({
		// 	type: "POST",
		// 	url: "appointment.php",
		// 	data: 'doc_name='+doc_name+'&doc_type='+doc_type+'&clinic_name='+clinic_name+'&clinic_area='+clinic_area,
		// 	dataType: "text",
		// 	success: function (msg) {
		// 		location.href = "appointment.php";
		// 	},
		// 	 error: function(XMLHttpRequest, textStatus, errorThrown) {
		// 		 alert("status" + XMLHttpRequest.status);
		// 		 alert("readyState" +XMLHttpRequest.readyState);
		// 		 alert(textStatus);
		// 	 },
		// });
	});

/*	$("#sign_in").click(function(){
		alert("OK");
		return false;
	});*/

	

});