$(function(){
  var serviceid = "AD01";
  
  // $('#btn_return').click(function(){
  //   window.location.href="searchDoctor.html"; 
  // });


  // CLINIC_NAME: obj_data.CLINIC_NAME,
  //         CLINIC_ADDR: obj_data.CLINIC_ADDR,
  //         DOCTOR_NAME: obj_data.DOCTOR_NAME,
  //         DOCTOR_TYPE: obj_data.DOCTOR_TYPE,
  //         APPOINTMENT_TIME: obj_data.APPOINTMENT_TIME,
  //         DOCTOR_PHOTO: obj_data.DOCTOR_PHOTO,
  //         DOCTOR_INFO: obj_data.DOCTOR_INFO
  var str = $.cookie("goto_data");
  //处理浏览 修改
  if(str != ""){
    var json_value = JSON.parse(str);
    // alert(json_value.DOCTOR_ID);
    doctor_basic_info = json_value.CLINIC_NAME +" "+json_value.CLINIC_ADDR+" "+json_value.DOCTOR_TYPE;
    $('#doctor_img').attr("src","img/"+json_value.DOCTOR_PHOTO);
    $('#doctor_name').text(json_value.DOCTOR_NAME);
    $('#doctor_basic_info').text(doctor_basic_info);
    $('#doctor_details').text(json_value.DOCTOR_INFO);
    $('#DOCTOR_ID').val(json_value.DOCTOR_ID);
    
    //分割字符串
    var app_time=json_value.APPOINTMENT_TIME;
    var arr=new Array();
    arr=app_time.split(',');
    for(var i=0;i<arr.length;i++)
    {
      str_radio = '<label class="radio-inline"><input type="radio" name="app_time_radio" id="app_time_radio" value="'+arr[i]+'">'
                +arr[i]+'</label>';
      $('#app_time').append(str_radio);
    }
    /*$("#func_code").val(json_value.FUNC_CODE);
    $("#func_name").val(json_value.FUNC_NAME);
    $("#func_note").val(json_value.NOTE);

    if(json_value.IMGID == "updRow"){
      $("#func_id").val(json_value.FUNC_ID);
      $("#action_type").val("update");
      $(".panel-title").html("修改权限");
    }else if(json_value.IMGID == "infoRow")
    {
      $('#func_code').attr("readonly",true);
      $('#func_name').attr("readonly",true);
      $('#func_note').attr("readonly",true);
      $('#func_add_submit').hide();
      $(".panel-title").html("浏览权限");
    }      */
  }

    //只有一个预约时间段 默认选中
    var iCount = 0;
    $("input[name=app_time_radio]").each(function(){
      iCount++;
    });

    if(iCount == 1){
      $('input[name=app_time_radio]').attr("checked","checked");
      iflag=1;
    }

  $('#app_doctor').click(function(){
    //判断是否选择预约时间点
    var iflag=0;
    
    $("input[name=app_time_radio]").each(function(){
      if( $(this).attr("checked") ){
        iflag=1;
      }
    });

    if( !iflag ){
      alert("请选择预约时间段");
      return false;
    }

    if($.cookie("ilogin") == 1){

      //组织request para
      var username = $.cookie("fd_username");

      var para={
        username: username
      };

      var json_str = request_const(para,"UI02",0);

      console.log(json_str);
      //请求
      $.ajax({
          type: "POST",
          url: "classes/class.searchUserDetail.php",
          dataType: "json",
          data: {
            request:json_str
          },
          success: function (msg) {
              console.log(msg);
              var ret = msg.response;
              if(ret.success){
                if(json_str.sequ != ret.sequ){
                  alert("时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                  return;
                }
                var data = ret.data[0];
                console.log(data);
                $('#CUSTOMER_USER_NAME').val(data.CUSTOMER_USER_NAME);
                $('#CUSTOMER_USER_PWD').val(data.CUSTOMER_USER_PWD);
                $('#CUSTOMER_GENDER').val(data.CUSTOMER_GENDER);
                $('#CUSTOMER_BIRTHDAY').val(data.CUSTOMER_BIRTHDAY);
                $('#CUSTOMER_ADDR').val(data.CUSTOMER_ADDR);
                $('#CUSTOMER_PHONE_NO').val(data.CUSTOMER_PHONE_NO);
                $('#MEDICAL_CARD_NO').val(data.MEDICAL_CARD_NO);
                $('#MEDICAL_CARD_NO').val(data.MEDICAL_CARD_NO);
                $('#CUSTOMER_USER_ID').val(data.CUSTOMER_USER_ID);

                $('#CUSTOMER_USER_NAME').attr("disabled","disabled");
                $('#CUSTOMER_USER_PWD').attr("disabled","disabled");
                $('#CUSTOMER_GENDER').attr("disabled","disabled");
                $('#CUSTOMER_BIRTHDAY').attr("disabled","disabled");
                $('#CUSTOMER_ADDR').attr("disabled","disabled");
                $('#CUSTOMER_PHONE_NO').attr("disabled","disabled");
                $('#MEDICAL_CARD_NO').attr("disabled","disabled");
              }else{
                alert("获取用户信息失败!" + ret.status.ret_code + " " + ret.status.ret_msg);
              }
              
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            //请求失败之后的操作
            alert("error:获取用户信息失败!" + textStatus);
         }
      });
    }

  });

  $('#btn_reset').click(function (){
    $('#modal_form_detail')[0].reset();
  });

  $('#btn_submit').click(function (){

    var time_id="";
    //选中时间段
    var radio_txt = $("input[name=app_time_radio]:checked").val();

    var para={
      DOCTOR_ID: $('#DOCTOR_ID').val(),
      APPOINTMENT_TIME: radio_txt
    };

    var json_str = request_const(para,"ST01",0);

    // console.log(json_str);

    //获取DOCTOR_APPOINTMENT_TIME_ID 
    $.ajax({
        type: "POST",
        url: "classes/class.searchAppTimeID.php",
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
                return;
              }
              var data_1 = ret.data[0];
              time_id = data_1.DOCTOR_APPOINTMENT_TIME_ID;
            }else{
              alert("获取用户信息失败!" + ret.status.ret_code + " " + ret.status.ret_msg);
              return;
            }
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          alert("error:获取用户信息失败!" + textStatus);
          return;
       }
    });

    if(time_id == ""){
      alert("获取医生预约时间ID错误!");
      return;
    }
    

    if($.cookie("ilogin") == 1){
      //组织request para
      var username = $.cookie("fd_username");
    }
    var para_1={
      action_type: "create",
      CUSTOMER_USER_ID: $('#CUSTOMER_USER_ID').val(),
      DOCTOR_ID: $('#DOCTOR_ID').val(),
      DOCTOR_APPOINTMENT_TIME_ID:time_id,
      APPOINTMENT_STATUS_ID:1
    };

    json_str_1 = request_const(para_1,"AD01",0);

    // console.log(json_str_1);

    //请求
    $.ajax({
        type: "POST",
        url: "classes/class.appointmentDoctor.php",
        dataType: "json",
        async:false,
        data: {
          request:json_str_1
        },
        success: function (msg) {
            // console.log(msg);
            var ret_1 = msg.response;
            if(ret_1.success){
              if(json_str_1.sequ != ret_1.sequ){
                alert("AD01 时序号错误,请联系管理员ret.sequ"+ret_1.sequ+" json_str.sequ:"+json_str_1.sequ);
                return;
              }
              window.location.href="userManagement.html"; 
              
            }else{
              alert(ret_1.status.ret_code + ":" + ret_1.status.ret_msg);
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          alert("error:预约医生失败!" + textStatus);
       }
    });
  });
});