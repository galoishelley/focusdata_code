$(function(){
  
  $('#btn_return').click(function(){
    window.location.href="searchDoctor.html"; 
  });


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
    // alert(json_value.APPOINTMENT_TIME);
    doctor_basic_info = json_value.CLINIC_NAME +" "+json_value.CLINIC_ADDR+" "+json_value.DOCTOR_TYPE;
    $('#doctor_img').attr("src",json_value.DOCTOR_PHOTO);
    $('#doctor_name').text(json_value.DOCTOR_NAME);
    $('#doctor_basic_info').text(doctor_basic_info);
    $('#doctor_details').text(json_value.DOCTOR_INFO);
    
    //分割字符串
    var app_time=json_value.APPOINTMENT_TIME;
    var arr=new Array();
    arr=app_time.split(',');
    for(var i=0;i<arr.length;i++)
    {
      str_radio = '<label class="radio-inline"><input type="radio" name="app_time_rad" id="app_time_radio">'
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
});