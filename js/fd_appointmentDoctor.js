var para;
var json_str;
var json_form;
var result = true;

$(function(){

  var ilogin = $.cookie("ilogin");

  // if(ilogin == 0){
  //   alert("您属于游客,想要预约医生,必须填写以下基础信息,如预约成功后,将自动成为会员");
  // }

  //填充页面左侧医生信息
  var str = $.cookie("appointmentdoctor");
  // console.log("appointmentdoctor");
  // console.log($.cookie("appointmentdoctor"));
  //处理浏览 修改
  if(str != ""){
    var json_value = JSON.parse(str);
    // alert(json_value.DOCTOR_ID);
    // doctor_basic_info = json_value.CLINIC_NAME +" "+json_value.CLINIC_ADDR+" "+json_value.DOCTOR_TYPE;
    $('#doctor_img').attr("src","img/"+json_value.DOCTOR_PHOTO);
    $('#doctor_name').text(json_value.DOCTOR_NAME);
    $('#clinic_name').text(json_value.CLINIC_NAME);
    $('#clinic_addr').text(json_value.CLINIC_ADDR);
    $('#doctor_type').text(json_value.DOCTOR_TYPE);
    $('#doctor_details').text(json_value.DOCTOR_INFO);
    $('#DOCTOR_ID').val(json_value.DOCTOR_ID);

    //分割字符串
    var app_time=json_value.APPOINTMENT_TIME;
    var arr=new Array();
    arr=app_time.split(',');
    for(var i=0;i<arr.length;i++){
    str_radio = '<label class="radio-inline"><input type="radio" name="app_time_radio" id="app_time_radio" value="'+arr[i]+'">'
            +arr[i]+'</label>';
      $('#app_time').append(str_radio);
    } 
  }


	if(ilogin == 1){

      //组织request para
      var username = $.cookie("fd_username");

      para={
        username: username
      };

      json_str = request_const(para,"UI02",0);

      console.log(json_str);
      result=true;
      //请求
      $.ajax({
          type: "POST",
          url: "classes/class.UserDetail.php",
          dataType: "json",
          data: {
            request:json_str
          },
          success: function (msg) {
              console.log(msg);
              var ret = msg.response;
              if(ret.success){
                if(json_str.sequ != ret.sequ){
                  alert("UI02:时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                  result=false;
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
                // $('#MEDICAL_CARD_NO').val(data.MEDICAL_CARD_NO);
                $('#CUSTOMER_USER_ID').val(data.CUSTOMER_USER_ID);

                $('#CUSTOMER_USER_NAME').attr("disabled","disabled");
                $('#CUSTOMER_USER_PWD').attr("disabled","disabled");
                $('#CUSTOMER_GENDER').attr("disabled","disabled");
                $('#CUSTOMER_BIRTHDAY').attr("disabled","disabled");
                $('#CUSTOMER_ADDR').attr("disabled","disabled");
                $('#CUSTOMER_PHONE_NO').attr("disabled","disabled");
                $('#MEDICAL_CARD_NO').attr("disabled","disabled");
              }else{
                alert("UI02:" + ret.status.ret_code + " " + ret.status.ret_msg);
                result=false;
              }
              
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown){
            //请求失败之后的操作
            var ret_code = "999999";
            var ret_msg = "ajax失败,请联系管理员";
            alert("UI02 "+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
            result = false;
	        }
      	});
      if(!result){
        return result;
      }
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

  // $('#app_doctor').click(function(){
  //   //判断是否选择预约时间点
  //   var iflag=0;
    
  //   $("input[name=app_time_radio]").each(function(){
  //     if( $(this).attr("checked") ){
  //       iflag=1;
  //     }
  //   });

  //   if( !iflag ){
  //     alert("请选择预约时间段");
  //     return false;
  //   }

  //   alert($.cookie("ilogin"));

  //   if($.cookie("ilogin") == 1){

  //     //组织request para
  //     var username = $.cookie("fd_username");

  //     var para={
  //       username: username
  //     };

  //     var json_str = request_const(para,"UI02",0);

  //     console.log(json_str);
  //     //请求
  //     $.ajax({
  //         type: "POST",
  //         url: "classes/class.searchUserDetail.php",
  //         dataType: "json",
  //         data: {
  //           request:json_str
  //         },
  //         success: function (msg) {
  //             console.log(msg);
  //             var ret = msg.response;
  //             if(ret.success){
  //               if(json_str.sequ != ret.sequ){
  //                 alert("时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
  //                 return;
  //               }
  //               var data = ret.data[0];
  //               console.log(data);
  //               $('#CUSTOMER_USER_NAME').val(data.CUSTOMER_USER_NAME);
  //               $('#CUSTOMER_USER_PWD').val(data.CUSTOMER_USER_PWD);
  //               $('#CUSTOMER_GENDER').val(data.CUSTOMER_GENDER);
  //               $('#CUSTOMER_BIRTHDAY').val(data.CUSTOMER_BIRTHDAY);
  //               $('#CUSTOMER_ADDR').val(data.CUSTOMER_ADDR);
  //               $('#CUSTOMER_PHONE_NO').val(data.CUSTOMER_PHONE_NO);
  //               $('#MEDICAL_CARD_NO').val(data.MEDICAL_CARD_NO);
  //               $('#MEDICAL_CARD_NO').val(data.MEDICAL_CARD_NO);
  //               $('#CUSTOMER_USER_ID').val(data.CUSTOMER_USER_ID);

  //               $('#CUSTOMER_USER_NAME').attr("disabled","disabled");
  //               $('#CUSTOMER_USER_PWD').attr("disabled","disabled");
  //               $('#CUSTOMER_GENDER').attr("disabled","disabled");
  //               $('#CUSTOMER_BIRTHDAY').attr("disabled","disabled");
  //               $('#CUSTOMER_ADDR').attr("disabled","disabled");
  //               $('#CUSTOMER_PHONE_NO').attr("disabled","disabled");
  //               $('#MEDICAL_CARD_NO').attr("disabled","disabled");
  //             }else{
  //               alert("获取用户信息失败!" + ret.status.ret_code + " " + ret.status.ret_msg);
  //             }
              
  //         },
  //         error: function(XMLHttpRequest, textStatus, errorThrown){
  //           //请求失败之后的操作
  //           alert("error:获取用户信息失败!" + textStatus);
  //        }
  //     });
  //   }
  // });

  $('#btn_reset').click(function (){
    $('#modal_form_detail')[0].reset();
  });

  $('#btn_submit').click(function (){

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

     //未注册用户
    if($.cookie("ilogin") == 0){
      requesttype = 0; //注册用户

      if($('#CUSTOMER_USER_NAME').val()==""){
        alert("用户名不能为空");
        return false;
      }
      if($('#CUSTOMER_USER_PWD').val()==""){
        alert("密码不能为空");
        return false;
      }
      if($('#verifyCode').val()==""){
        alert("验证码不能为空");
        return false;
      }
      if($('#CUSTOMER_GENDER').val()==""){
        alert("性别不能为空");
        return false;
      }
      if($('#CUSTOMER_BIRTHDAY').val()==""){
        alert("生日不能为空");
        return false;
      }
      if($('#CUSTOMER_ADDR').val()==""){
        alert("用户地址不能为空");
        return false;
      }
      if($('#CUSTOMER_PHONE_NO').val()==""){
        alert("手机号码不能为空");
        return false;
      }
      if($('#MEDICAL_CARD_NO').val()==""){
        alert("医疗卡号不能为空");
        return false;
      }

      ///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
      //form序列化成json
      json_form = $("#newsletter").serializeObject();
      //生成输入参数
      json_str = request_const(json_form,"UU01",0);
      //alert(JSON.stringify(json_str));

      console.log(json_str);
      result=true;
  ///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
      $.ajax({
          type: "POST",
          url: "classes/class.sign_up_person.php",
          dataType: "json",
          async:false,
          cache : false,
          data:  {
            request:json_str
          },
          success: function (msg) {
            var ret = msg.response;
            if(ret.success){
              if(json_str.sequ != ret.sequ){
                alert("UU01:时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                result=false;

              }
              if("UP0001" == ret.status.ret_code){
                alert("UU01:" + ret.status.ret_code + " " + ret.status.ret_msg);
                result=false;
              }
              alert("UU01:" + ret.status.ret_code + " " + ret.status.ret_msg);
              // window.location.href="sign_in.html";

            }else{
              // result = false;
              alert("UU01:" + ret.status.ret_code + " " + ret.status.ret_msg);
              result=false;
              // $('#signup_ok').attr('disabled',false); 
            }
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            //请求失败之后的操作
            var ret_code = "999999";
            var ret_msg = "ajax失败,请联系管理员";
            alert("UU01 "+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
            result = false;
          }
        });
      if(!result){
        return result;
      }
    }

    // var bootstrapValidator = $("#appointmentDoctor_form").data('bootstrapValidator');
    // bootstrapValidator.validate();
    // if(bootstrapValidator.isValid()){
    //   $("#appointmentDoctor_form").submit();
    // }
    var time_id="";
    //选中时间段
    var radio_txt = $("input[name=app_time_radio]:checked").val();

    para={
      DOCTOR_ID: $('#DOCTOR_ID').val(),
      APPOINTMENT_TIME: radio_txt
    };

    json_str = request_const(para,"ST01",0);

    // console.log(json_str);
    //获取DOCTOR_APPOINTMENT_TIME_ID
    result=true;
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
                alert("ST01:时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                result=false;
              }
              var data_1 = ret.data[0];
              time_id = data_1.DOCTOR_APPOINTMENT_TIME_ID;
            }else{
              alert("ST01:" + ret.status.ret_code + " " + ret.status.ret_msg);
              result=false;
            }
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          var ret_code = "999999";
          var ret_msg = "ajax失败,请联系管理员";
          alert("ST01 "+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
          result = false;
       }
    });
    if(!result){
        return result;
    }

    if(time_id == ""){
      alert("获取医生预约时间ID错误!");
      return;
    }
    
    var requesttype;
    //处理登录用户预约
    if($.cookie("ilogin") == 1){
      //组织request para
      var username = $.cookie("fd_username");

      requesttype = 1; //登录用户

      para={
        action_type: "create",
        CUSTOMER_USER_ID: $('#CUSTOMER_USER_ID').val(),
        DOCTOR_ID: $('#DOCTOR_ID').val(),
        DOCTOR_APPOINTMENT_TIME_ID:time_id,
        APPOINTMENT_STATUS_ID:1
      };

    }else if($.cookie("ilogin") == 0)//处理未登录用户预约
    {
      var custom_user_id;
      para={
          username: $('#CUSTOMER_USER_NAME').val()
      };

      json_str = request_const(para,"UI02",0);

      // console.log(json_str);
      //请求
      result = true;
      $.ajax({
          type: "POST",
          url: "classes/class.searchUserDetail.php",
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
                    alert("时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                    result = false;
                }
                  var data = ret.data[0];
                  custom_user_id=data.CUSTOMER_USER_ID;
              }else{
                  alert(ret.status.ret_code + " " + ret.status.ret_msg);
                  result = false;
              }
              
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            //请求失败之后的操作
            var ret_code = "999999";
            var ret_msg = "ajax失败,请联系管理员";
            alert("UI02 "+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
            result = false;
          }
        });
        if(!result){
            return result;
        }

      para={
        action_type: "create",
        CUSTOMER_USER_NAME: $('#CUSTOMER_USER_NAME').val(),
        CUSTOMER_USER_PWD: $('#CUSTOMER_USER_PWD').val(),
        CUSTOMER_USER_ID: custom_user_id,
        DOCTOR_ID: $('#DOCTOR_ID').val(),
        DOCTOR_APPOINTMENT_TIME_ID:time_id,
        APPOINTMENT_STATUS_ID:1
      };
      console.log(para);

      requesttype = 0; //未注册用户
    }


    json_str = request_const(para,"AD01",requesttype);

    // console.log(json_str_1);

    //请求
    result=true;
    $.ajax({
        type: "POST",
        url: "classes/class.appointmentDoctor.php",
        dataType: "json",
        async:true,
        data: {
          request:json_str
        },
        success: function (msg) {
            // console.log(msg);
            var ret = msg.response;
            if(ret.success){
              if(json_str.sequ != ret.sequ){
                alert("AD01:时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str_1.sequ);
                result = false;
              }
              if(ret.status.ret_code == "AD0102"){
              	alert(ret.status.ret_code + ":" + ret.status.ret_msg);
              	result = false;
              }
              alert(ret.status.ret_code + ":" + ret.status.ret_msg);

              if($.cookie("ilogin") == 1){
                window.location.href="userAppointmentRecoder.html"; 
              }else if($.cookie("ilogin") == 0){
                window.location.href="sign_in.html"; 
              }
              
            }else{
              alert("AD01:"+ret.status.ret_code + ":" + ret.status.ret_msg);
              result = false;
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          var ret_code = "999999";
          var ret_msg = "ajax失败,请联系管理员";
          alert("AD01 "+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
          result = false;
       }
    });
    if(!result){
        return result;
    }
    return false;
  });

//   $('#appointmentDoctor_form').bootstrapValidator({
// 　　　message: 'This value is not valid',
//     　feedbackIcons: {
//         　　　　　　　　valid: 'glyphicon glyphicon-ok',
//         　　　　　　　　invalid: 'glyphicon glyphicon-remove',
//         　　　　　　　　validating: 'glyphicon glyphicon-refresh'
//                     },
//       fields: {
//           CUSTOMER_USER_NAME: {
//               validators: {
//                   notEmpty: {
//                       message: '用户名不能为空'
//                   }
//               }
//           },
//           CUSTOMER_USER_PWD: {
//               validators: {
//                   notEmpty: {
//                       message: '密码不能为空'
//                   }
//               }
//           },
//           verifyCode: {
//               validators: {
//                   notEmpty: {
//                       message: '验证码不能为空'
//                   }
//               }
//           },
//           CUSTOMER_GENDER: {
//               validators: {
//                   notEmpty: {
//                       message: '性别不能为空'
//                   }
//               }
//           },
//           CUSTOMER_BIRTHDAY: {
//               validators: {
//                   notEmpty: {
//                       message: '生日不能为空'
//                   }
//               }
//           },
//           CUSTOMER_ADDR: {
//               validators: {
//                   notEmpty: {
//                       message: '用户住址不能为空'
//                   }
//               }
//           },
//           CUSTOMER_PHONE_NO: {
//               validators: {
//                   notEmpty: {
//                       message: '手号码不能为空'
//                   }
//               }
//           },
//           MEDICAL_CARD_NO: {
//               validators: {
//                   notEmpty: {
//                       message: '医疗卡号不能为空'
//                   }
//               }
//           }
//       }
    // });

});