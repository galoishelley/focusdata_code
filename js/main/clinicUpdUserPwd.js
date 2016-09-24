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
  //   $('#CLINIC_USER_NAME').val(username);
  // }

  // if(ilogin == 0){
	 //  alert($("#Lang0019").html());//您未登陆,无法使用此功能
  //   history.go(-1);
  //   return false;
  // }

  $('#CLINIC_USER_NAME').val(username);

  $('#btn_ok').click(function(){


    //校验两新密码是否一致
    var new_pwd = $('#CLINIC_USER_NEWPWD').val();
    var new_c_pwd = $('#CONFIRM_PWD').val();

    if(new_pwd != new_c_pwd){
    	alert($("#Lang0116").html());//两次密码输入不一致
      return false;
    }

    //校验登录密码是否正确
///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
    func_code = "UI01";
    //form序列化成json
    json_form = {
      usertype: 0, //个人用户
      USER_NAME:$('#CLINIC_USER_NAME').val(),
      USER_PWD:$('#CLINIC_USER_PWD').val()
    };
    //生成输入参数
    json_str = request_const(json_form,"UI01",0);
    //alert(JSON.stringify(json_str));

    console.log(json_str);

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
            }else{
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              result=false;
            }
            
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            //请求失败之后的操作
            var ret_code = "999999";
            var ret_msg = "失败,请联系管理员!";
            alert("UI01 "+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
            result=false;
          }
      });
    if(!result){
      return result;
    }

    //修改用户密码
///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
    func_code="CU04";
    //form序列化成json
    json_form = {
      action_type:"update",
      CLINIC_USER_ID:fd_userid,
      CLINIC_USER_ID:$('#CLINIC_USER_NEWPWD').val()
    };
    //生成输入参数
    json_str = request_const(json_form,"CU04",1);
    // alert(JSON.stringify(json_str));

    console.log(json_str);

    result = true;
    $.ajax({
          type: "POST",
          url: "classes/class.ClinicDetail.php",
          dataType: "json",
          async: false,
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

              // //登录标志
              // $.cookie("ilogin", 1);
              // //记录cookie
              // Save();
              // history.go(-1);
              // // window.location.href="index.php";
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              $('#CLINIC_USER_PWD').val('');
              $('#CLINIC_USER_NEWPWD').val('');
              $('#CONFIRM_PWD').val('');
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
            alert(func_code+":"+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
            result=false;
          }
      });
      if(!result){
        return result;
      }

    return false;

  });

});