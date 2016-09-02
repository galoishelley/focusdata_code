var para,json_str,json_form;
var result = true;
var func_code;

$(document).ready(function() {

  var ilogin = $.cookie("ilogin");

  $('#btn_out').click(function(){
    $.cookie("ilogin", "");
    // $('#userinfo').html();
    window.location.href="index.html"; 

    if ($.cookie("fd_rmbUser") == "false") {
      $.cookie("fd_userid", "");
      $.cookie("fd_username", "");
      $.cookie("fd_password", "");
      $.cookie("fd_usertype", "");
    }

  });

  var username,fd_userid;
  if(ilogin == 1)
  {
      username = $.cookie("fd_username");
      fd_userid = $.cookie("fd_userid");

      $('#userinfo').html(username);
      $('#usertype').html("用户类型: "+$.cookie("fd_usertype"));
      $('#CUSTOMER_USER_NAME').val(username);
  }

  if(ilogin == 0){
    alert("您未登陆,无法使用此功能");
    history.go(-1);
    return false;
  }


  $('#btn_ok').click(function(){

    //校验两新密码是否一致
    var new_pwd = $('#CUSTOMER_USER_NEWPWD').val();
    var new_c_pwd = $('#CUSTOMER_USER_C_NEWPWD').val();

    if(new_pwd != new_c_pwd){
      alert("两次密码输入不一致");
      return false;
    }

    //校验登录密码是否正确
///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
    //form序列化成json
    json_form = {
      usertype: 2, //个人用户
      USER_NAME:$('#CUSTOMER_USER_NAME').val(),
      USER_PWD:$('#CUSTOMER_USER_PWD').val()
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
                alert("UI01:时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                result=false;
              }
            }else{
              alert("UI01: 用户密码输入错误");
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
    func_code = "AU01";
    //form序列化成json
    json_form = {
      action_type:"update",
      ADMIN_ID:fd_userid,
      ADMIN_PWD:$('#CUSTOMER_USER_NEWPWD').val()
    };
    //生成输入参数
    json_str = request_const(json_form,func_code,1);

    console.log(json_str);

    result = true;
    $.ajax({
          type: "POST",
          url: "classes/class.AdminDetail.php",
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
              // // window.location.href="index.html";
              alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
              refresh();
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