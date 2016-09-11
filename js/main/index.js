var fd_usertype,fd_usertypename;
var func_code,result;
$(function(){

 	//退出登录
	$('#btn_out').click(function(){
		$.cookie("ilogin", "");
		// $('#userinfo').html();
		window.location.href="index.php"; 

		if ($.cookie("fd_rmbUser") == "false") {
			$.cookie("fd_userid", "");
			$.cookie("fd_username", "");
			$.cookie("fd_password", "");
			$.cookie("fd_usertype", "");
		}
	});


	//登录用户
	if($.cookie("ilogin") == 1)
  	{
		var fd_usertype = $.cookie("fd_usertype");
		var fd_usertypename = $.cookie("fd_usertypename");

	    var username = $.cookie("fd_username");

	    // alert(fd_usertypename);
	    $('#userinfo').html(username);
	    $('#usertype').html("用户类型: "+ fd_usertypename);

		$('#sub_userinfo').removeClass("hidden");

		var url, str_data;
		if(fd_usertype == 0){
	    	$('#li_ClinicUser').removeClass("hidden");
	    	url="classes/class.ClinicDetail.php";
			str_data="CLINIC_USER_ID";
  		}else if(fd_usertype == 1){
  			$('#li_home').removeClass("hidden");
  			$('#li_SearchDoctor').removeClass("hidden");
  			$('#li_AppRecoder').removeClass("hidden");
  			url="classes/class.UserDetail.php";
  			str_data="CUSTOMER_USER_ID";
  		}else if(fd_usertype == 2){
  			$('#li_Admin').removeClass("hidden");
  			url="classes/class.AdminDetail.php";
  			str_data="ADMIN_ID";
  		}else{

  		}

	    //获取用户基本信息
	    func_code="UI02";
	    var para={
	      	username: username
	    };

	    var json_str = request_const(para,func_code,0);

	    // console.log(json_str);
	    //请求
	    result = true;
	    $.ajax({
	        type: "POST",
	        url: url,
	        dataType: "json",
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

	              	console.log(data);
	              	if(fd_usertype == 0){
	              		$.cookie("fd_userid", data.CLINIC_USER_ID);
			  		}else if(fd_usertype == 1){
			  			$.cookie("fd_userid", data.CUSTOMER_USER_ID);
			  		}else if(fd_usertype == 2){
			  			$.cookie("fd_userid", data.ADMIN_ID);
			  		}else{

			  		}
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
	    // return false;

	}else{
		//游客
	    $.cookie("ilogin", 0);
	    $('#li_home').removeClass("hidden");
  		$('#li_SearchDoctor').removeClass("hidden");
	}

	$('#btn_search').click(function(){
		var search = $.trim($('#txt_search').val());

		var data = {
          		search: search,
        };
        var str = JSON.stringify(data);
		sessionStorage.setItem("search_con",str);

		window.location.href="searchDoctor.html"; 
	});

	$('#txt_search').keypress(function(e){ 
		if(e.keyCode==13){ 
			var search = $.trim($('#txt_search').val());

			var data = {
          		search: search,
        	};
    		var str = JSON.stringify(data);

    		sessionStorage.setItem("search_con",str);

			window.location.href="searchDoctor.html"; 
		} 
	}); 

});