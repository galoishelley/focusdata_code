$(function(){
  
  var str = sessionStorage.userinfo;

  if(str){
    var json_value = JSON.parse(str);
    console.log(json_value);

    $('#CLINIC_NAME').val(json_value.CLINIC_NAME);
    $('#CLINIC_ADDR').val(json_value.CLINIC_ADDR);
    $('#CLINIC_USER_ID').val(json_value.CLINIC_USER_ID);
    $('#CLINIC_USER_MAIL').val(json_value.CLINIC_USER_MAIL);
    $('#CLINIC_USER_NAME').val(json_value.CLINIC_USER_NAME);
    $("#ACTIVE_STATUS option[value='"+ json_value.ACTIVE_STATUS +"']").attr("selected",true);

    if(json_value.imgId == "opr_info"){
      $("#adminUpdClinicInfo input").attr("disabled","disabled");
      $("#adminUpdClinicInfo select").attr("disabled","disabled");   
      $("#btn_submit").attr("disabled","disabled");
    }
  }

  $('#btn_submit').click(function (){

///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
    requesttype = 1;
    func_code = "CU03";
    //form序列化成json
    json_form = $("#adminUpdClinicInfo").serializeObject();

    var json_stringify=JSON.stringify(json_form);
    json_form = json_stringify.replace(/[ ]/g,"");

    //生成输入参数
    json_str = request_const(JSON.parse(json_form),func_code,requesttype);

    console.log(json_str);

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
                alert("ST01 时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                result = false;
              }
              // var data = ret.data[0];
              window.location.href="adminQryClinic.html"; 
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