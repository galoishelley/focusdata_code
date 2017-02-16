var para,json_str,json_form;
var result = true;
var func_code;

$(document).ready(function() {

  // var ilogin = $.cookie("ilogin");

  // $('#btn_out').click(function(){
  //   $.cookie("ilogin", "");
  //   // $('#userinfo').html();
  //   window.location.href="index.php"; 

  //   if ($.cookie("fd_rmbUser") == "false") {
  //     $.cookie("fd_userid", "");
  //     $.cookie("fd_username", "");
  //     $.cookie("fd_password", "");
  //     $.cookie("fd_usertype", "");
  //   }

  // });

  // var username,fd_userid;
  // if(ilogin == 1)
  // {
  //   fd_userid = $.cookie("fd_userid");
  //   //校验用户是否登录
  //   var fd_usertype = $.cookie("fd_usertype");
  //   var fd_usertypename = $.cookie("fd_usertypename");

  //   var username = $.cookie("fd_username");

  //   $('#userinfo').html(username);
  //   $('#usertype').html("用户类型: "+ fd_usertypename);

  //   $('#sub_userinfo').removeClass("hidden");

  //   if(fd_usertype == 0){
  //     $('#li_ClinicUser').removeClass("hidden");
  //   }else if(fd_usertype == 1){
  //     $('#li_AppRecoder').removeClass("hidden");
  //   }else if(fd_usertype == 2){
  //     $('#li_Admin').removeClass("hidden");
  //   }else{

  //   }
  // }

  // if(ilogin == 0){
	 //  alert($('#Lang0019').html());//您未登陆,无法使用此功能!
  //   history.go(-1);
  //   return false;
  //   // $('#a_userAppointmentRecoder').attr("href","#");
  //   // $('#a_userAppointmentRecoder').attr("color","#FF0000");
  // }

  // alert(fd_userid);
  var state_id;
  func_code = "CU02";
  para={
        action_type: "view",
        CLINIC_USER_ID: fd_userid
      };

  json_str = request_const(para, func_code, 0);
  // console.log(json_str);
  //请求
  result = true;
  $.ajax({
      type: "POST",
      url: "classes/class.ClinicDetail.php",
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
                alert(func_code+" 时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                result = false;
            }
              var data = ret.data[0];
              console.log(data);
              $('#CLINIC_USER_ID').val(data.CLINIC_USER_ID);

              $('#CLINIC_USER_MAIL').val(data.CLINIC_USER_MAIL);
              $('#CLINIC_NAME').val(data.CLINIC_NAME);
              $('#CLINIC_POSTCODE').val(data.CLINIC_POSTCODE);
              $('#CLINIC_ADDR').val(data.CLINIC_ADDR);
              $('#CLINIC_SUBURB').val(data.CLINIC_SUBURB);
              state_id = data.STATE_ID;
          }else{
              alert(func_code + " " +  ret.status.ret_code + " " + ret.status.ret_msg);
              result = false;
          }
          
      },
      error: function(XMLHttpRequest, textStatus, errorThrown){
        //请求失败之后的操作
        var ret_code = "999999";
        var ret_msg = "ajax失败,请联系管理员!";
        alert(func_code + " " +  ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
        result = false;
     }
  });
  if(!result){
    return result;
  }

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

    $("#STATE_ID option[value='"+ state_id +"']").attr("selected",true);

  $('#btn_ok').click(function(){
	  
	  /*calculate lat/lng begin*/ 
	  var address=$('#CLINIC_ADDR').val()+","+$('#CLINIC_SUBURB').val()+","+$("#STATE_ID option:selected").text()+","+"Australia";
	  var geocoder = new google.maps.Geocoder();
	  if (geocoder) {
	      geocoder.geocode( { 'address': address}, function(results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	          if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {
	          
			    $('#CLINIC_LAT').val(results[0].geometry.location.lat());
			    $('#CLINIC_LNG').val(results[0].geometry.location.lng());
			    
			    
///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
			    //form序列化成json
			    func_code="CU03";
			    json_form = $("#clinicUpdUserInfo").serializeObject();
			    //生成输入参数
			    json_str = request_const(json_form,func_code,1);
			    //alert(JSON.stringify(json_str));

			    console.log(json_str);

			///////////////////////////////////组织ajax 请求参数 end///////////////////////////////

			    //请求
			    result = true;
			    $.ajax({
			        type: "POST",
			        url: "classes/class.ClinicDetail.php",
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
			                  alert(func_code+" 时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
			                  result = false;
			              }
			              
			              alert(func_code + " " + ret.status.ret_code + " " + ret.status.ret_msg);

			              $.cookie("fd_username", $('#CLINIC_USER_MAIL').val());

			              var username = $.cookie("fd_username");

			              $('#userinfo').html(username);
			              // $('#usertype').html("用户类型: "+$.cookie("fd_usertype"));

			            }else{
			                alert(func_code + " " + ret.status.ret_code + " " + ret.status.ret_msg);
			                result = false;
			            }
			            
			        },
			        error: function(XMLHttpRequest, textStatus, errorThrown){
			          //请求失败之后的操作
			          var ret_code = "999999";
			          var ret_msg = "ajax失败,请联系管理员!";
			          alert(func_code + " " + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
			          result = false;
			       }
			    });
			    
			    

	          } else {
	            alert("Invalid address!");
	          }
	        } else {
	          alert("Geocode was not successful for the following reason: " + status);
	        }
	      });
	    }
	  
	  /*calculate lat/lng end*/
	  

    if(!result){
      return result;
    }

    return false;
  })

});