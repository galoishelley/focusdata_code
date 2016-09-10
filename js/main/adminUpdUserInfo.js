$(function(){
  
  //校验用户是否登录
  var ilogin = $.cookie("ilogin");
  if(ilogin == 1)
  {
    fd_userid = $.cookie("fd_userid");
    
    var fd_usertype = $.cookie("fd_usertype");
    var fd_usertypename = $.cookie("fd_usertypename");

    var username = $.cookie("fd_username");

    $('#userinfo').html(username);
    $('#usertype').html("用户类型: "+ fd_usertypename);

    
    $('#sub_userinfo').removeClass("hidden");


    if(fd_usertype == 0){
      $('#li_ClinicUser').removeClass("hidden");
    }else if(fd_usertype == 1){
      $('#li_AppRecoder').removeClass("hidden");
    }else if(fd_usertype == 2){
      $('#li_Admin').removeClass("hidden");
    }else{

    }
  }

  var str = sessionStorage.userinfo;
  //处理浏览 修改
  if(str){
    var json_value = JSON.parse(str);
    console.log(json_value);

    $('#CUSTOMER_USER_ID').val(json_value.CUSTOMER_USER_ID);
    $('#CUSTOMER_USER_NAME').val(json_value.CUSTOMER_USER_NAME);
    $('#CUSTOMER_USER_MAIL').val(json_value.CUSTOMER_USER_MAIL);
    $('#CUSTOMER_NAME').val(json_value.CUSTOMER_NAME);
    $('#CUSTOMER_GENDER').val(json_value.CUSTOMER_GENDER);
    $('#CUSTOMER_BIRTHDAY').val(json_value.CUSTOMER_BIRTHDAY);
    $('#CUSTOMER_ADDR').val(json_value.CUSTOMER_ADDR);
    $('#CUSTOMER_PHONE_NO').val(json_value.CUSTOMER_PHONE_NO);
    $('#MEDICAL_CARD_NO').val(json_value.MEDICAL_CARD_NO);
    $("#ACTIVE_STATUS option[value='"+ json_value.ACTIVE_STATUS +"']").attr("selected",true)

    if(json_value.imgId == "opr_info"){
      $("#adminUpdUserInfo input").attr("disabled","disabled");
      $("#adminUpdUserInfo select").attr("disabled","disabled");   
      $("#btn_submit").attr("disabled","disabled");
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

    $("#STATE_ID option[value='"+ json_value.STATE_ID +"']").attr("selected",true);
  }

  $('#btn_submit').click(function (){

///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
    requesttype = 1;
    func_code = "UU03";
    //form序列化成json
    json_form = $("#adminUpdUserInfo").serializeObject();

    var json_stringify=JSON.stringify(json_form);
    json_form = json_stringify.replace(/[ ]/g,"");

    //生成输入参数
    json_str = request_const(JSON.parse(json_form),func_code,requesttype);

    console.log(json_str);

    result = true;
    $.ajax({
        type: "POST",
        url: "classes/class.UserDetail.php",
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
                alert("ST01 时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                result = false;
              }
              // var data = ret.data[0];
              window.location.href="adminQryUser.html"; 
            }else{
              alert("获取用户信息失败!" + ret.status.ret_code + " " + ret.status.ret_msg);
              result = false;
            }
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          alert("error:获取用户信息失败!" + textStatus);
          result = false;
       }
    });
    if(!result){
      return result;
    }
    return false;
  });

});