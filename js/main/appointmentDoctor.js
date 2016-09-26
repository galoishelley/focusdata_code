var para,json_str,json_form;
var result,func_code,requesttype;
var appointment_date;
$(function(){

  //记住用户名密码
  function Save() {
    var str_username = $("#CUSTOMER_USER_NAME").val();
    var str_password = $("#CUSTOMER_USER_PWD").val();
    var str_usertype = 1;

    $.cookie("fd_username",str_username);
    $.cookie("fd_password",str_password);

    //记录user type
    if(str_usertype==0){
      str_usertypename = "Clinic user";
    }else if(str_usertype==1){
      str_usertypename = "Personal user";
    }else if(str_usertype==2){
      str_usertypename = "Admin";
    }

    $.cookie("fd_usertype",str_usertype);
    $.cookie("fd_usertypename",str_usertypename);
  
  };

  Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
      "M+": this.getMonth() + 1, //月份
      "d+": this.getDate(), //日
      "h+": this.getHours(), //小时
      "m+": this.getMinutes(), //分
      "s+": this.getSeconds(), //秒
      "q+": Math.floor((this.getMonth() + 3) / 3), //季度
      "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) {
     fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
     if (new RegExp("(" + k + ")").test(fmt)) {
         fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
     }
    }
    return fmt;
  }

  //填充州
  func_code = "SSTE";
  para="";

  json_str = request_const(para,func_code,0);

  //console.log(json_str);
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

  var ilogin = $.cookie("ilogin");

  // if(ilogin == 0){
  //   alert("您属于游客,想要预约医生,必须填写以下基础信息,如预约成功后,将自动成为会员");
  // }

  //填充页面左侧医生信息
  var str = sessionStorage.getItem("appointmentdoctor"); 
  console.log(str);
  //处理浏览 修改
  if(str != ""){
    var json_value = JSON.parse(str);
    console.log(json_value);
    var addr = json_value.CLINIC_ADDR + "," + json_value.CLINIC_SUBURB + "," + json_value.STATE_NAME + "," + json_value.CLINIC_POSTCODE;
    $('#doctor_img').attr("src","img/"+json_value.DOCTOR_PHOTO);
    $('#doctor_name').text(json_value.DOCTOR_NAME);
    $('#clinic_name').text(json_value.CLINIC_NAME);
    $('#clinic_addr').text(addr);
    $('#doctor_type').text(json_value.DOCTOR_TYPE);
    $('#doctor_details').text(json_value.DOCTOR_INFO);
    $('#appointment_date').html(json_value.APPOINTMENT_DATE);
    $('#DOCTOR_ID').val(json_value.DOCTOR_ID);
    appointment_date = json_value.APPOINTMENT_DATE; //之后取预约时间ID准备数据
    //分割字符串
    var app_time=json_value.APPOINTMENT_TIME;
    var arr=new Array();
    arr=app_time.split(',');
    for(var i=0;i<arr.length;i++){
    str_radio = '<label class="radio-inline"><input type="radio" name="app_time_radio" id="app_time_radio" value="'+arr[i]+'">'
            +arr[i]+'</label>';
      $('#app_time').append(str_radio);
    } 

    //填充可预约日期
    func_code="ST02";
    para={
      DOCTOR_ID: json_value.DOCTOR_ID
    };

    json_str = request_const(para,func_code,0);

    // console.log(json_str);
    //获取DOCTOR_APPOINTMENT_TIME_ID
    result=true;
    $.ajax({
        type: "POST",
        url: "classes/class.getAppDate.php",
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

              $.each(ret.data, function(i, item) {
                var t_date = item.APPOINTMENT_DATE;
                var m_date = (new Date(t_date)).Format("dd-MM-yyyy");
                $("#APPOINTMENT_DATE").append("<option value='"+ m_date +"'>" + m_date + "</option>");
              });

            }else{
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              result=false;
            }
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          var ret_code = "999999";
          var ret_msg = "ajax失败,请联系管理员";
          alert(func_code+":"+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
          result = false;
       }
    });
    if(!result){
        return result;
    }

  //填充可预约时间
    func_code="ST03";
    para={
      DOCTOR_ID: json_value.DOCTOR_ID,
      APPOINTMENT_DATE: $('#APPOINTMENT_DATE').val()
    };

    json_str = request_const(para,func_code,0);

    // console.log(json_str);
    result=true;
    $.ajax({
        type: "POST",
        url: "classes/class.getAppTime.php",
        dataType: "json",
        async:false,
        data: {
          request:json_str
        },
        success: function (msg) {
            console.log(msg);
            var ret = msg.response;
            if(ret.success){
              if(json_str.sequ != ret.sequ){
                alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                result=false;
              }

              $("#app_time").empty();
              if(ret.data.length==0){
                $("#app_time").append('<label>无可预约时间</label>');
                $('#btn_submit').attr("disabled",true);
              }else{
                $.each(ret.data, function(i, item) {
                  $("#app_time").append('<label class="radio-inline"><input type="radio" name="app_time_radio" id="app_time_radio" value="'+item.APPOINTMENT_TIME+'">'
              +item.APPOINTMENT_TIME+'</label>');
                });
                $('#btn_submit').attr("disabled",false);
              }

            }else{
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              result=false;
            }
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          var ret_code = "999999";
          var ret_msg = "ajax失败,请联系管理员";
          alert(func_code+":"+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
          result = false;
       }
    });
    if(!result){
        return result;
    }
  }

	if(ilogin == 1){

    //校验用户是否登录
    var fd_usertype = $.cookie("fd_usertype");
    var fd_usertypename = $.cookie("fd_usertypename");

    var username = $.cookie("fd_username");

    $('#userinfo').html(username);
    $('#usertype').html($('#Lang0311').html()+": "+ fd_usertypename);

    // 用户名
    $('#userinfo').html(username);
    // 设置用户类型
    $('#usertype').html($('#Lang0311').html()+": "+ fd_usertypename);

    //显示安全退出
    $('#login_out').removeClass("hidden");
    
    if(fd_usertype == 0){
      $('#li_ClinicUser').removeClass("hidden");
    }else if(fd_usertype == 1){
      $('#li_AppRecoder').removeClass("hidden");
    }else if(fd_usertype == 2){
      $('#li_Admin').removeClass("hidden");
    }else{

    }

      //显示收藏医生
      $('#btn_savedoctor').show();
      $('#btn_savedoctor_manage').show();

      //组织request para
      var username = $.cookie("fd_username");

      func_code="UI02";
      para={
        username: username
      };

      json_str = request_const(para,func_code,1);

      console.log(json_str);

      result=true;
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
                  alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                  result=false;
                }
                var data = ret.data[0];
                console.log(data);
                $('#CUSTOMER_USER_NAME').val(data.CUSTOMER_USER_NAME);
                $('#CUSTOMER_USER_PWD').val(data.CUSTOMER_USER_PWD);
                $('#CUSTOMER_NAME').val(data.CUSTOMER_NAME);
                $('#CUSTOMER_GENDER').val(data.CUSTOMER_GENDER);
                $('#CUSTOMER_BIRTHDAY').val(data.CUSTOMER_BIRTHDAY);
                $('#CUSTOMER_ADDR').val(data.CUSTOMER_ADDR);
                $('#CUSTOMER_PHONE_NO').val(data.CUSTOMER_PHONE_NO);
                $('#MEDICAL_CARD_NO').val(data.MEDICAL_CARD_NO);
                $('#CUSTOMER_USER_ID').val(data.CUSTOMER_USER_ID);

                $('#CUSTOMER_USER_NAME').attr("disabled","disabled");
                $('#CUSTOMER_USER_PWD').attr("disabled","disabled");
                $('#CUSTOMER_NAME').attr("disabled","disabled");
                $('#CUSTOMER_GENDER').attr("disabled","disabled");
                $('#CUSTOMER_BIRTHDAY').attr("disabled","disabled");
                $('#CUSTOMER_ADDR').attr("disabled","disabled");
                $('#CUSTOMER_PHONE_NO').attr("disabled","disabled");
                $('#MEDICAL_CARD_NO').attr("disabled","disabled");
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
    }
    else{
    //游客
      $.cookie("ilogin", 0);
      //显示HOME
      $('#li_home').removeClass("hidden");
      //显示搜索医生
      $('#li_SearchDoctor').removeClass("hidden");
      //设置用户类型
      $('#usertype').html($('#Lang0311').html()+": 游客");
      //显示登陆注册
      $('#sign_in').removeClass("hidden");
      $('#sign_up').removeClass("hidden");
      // 隐藏搜索医生
      $('#btn_savedoctor_manage').hide();
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

  // 未注册用户预约医生
  $('#btn_signin').click(function (){

      if($('#CUSTOMER_USER_NAME').val()==""){   

        alert($("#Lang0174").html());//用户名不能为空
        return false;
      }
      if($('#CUSTOMER_USER_PWD').val()==""){

        alert($("#Lang0175").html());//密码不能为空
        return false;
      }
      if($('#verifyCode').val()==""){
   
        alert($("#Lang0176").html());//验证码不能为空
        return false;
      }
      if($('#CUSTOMER_GENDER').val()==""){

        alert($("#Lang0177").html());//性别不能为空
        return false;
      }
      if($('#CUSTOMER_BIRTHDAY').val()==""){

        alert($("#Lang0178").html());//生日不能为空
        return false;
      }
      if($('#CUSTOMER_ADDR').val()==""){

        alert($("#Lang0179").html());//用户地址不能为空
        return false;
      }
      if($('#CUSTOMER_PHONE_NO').val()==""){

        alert($("#Lang0180").html());//手机号码不能为空
        return false;
      }
      if($('#MEDICAL_CARD_NO').val()==""){

        alert($("#Lang0181").html());//医疗卡号不能为空
        return false;
      }

    ///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
      // 注册个人用户信息  
      func_code = "UU01";
      //form序列化成json
      json_form = $("#modal_form").serializeObject();
      //生成输入参数
      json_str = request_const(json_form,func_code,0);
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
                alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                result=false;

              }
              if("UP0001" == ret.status.ret_code){
                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
                result=false;
              }
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              // window.location.href="sign_in.php";

            }else{
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              result=false;
              // $('#signup_ok').attr('disabled',false); 
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

      ///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
    func_code = "UI01";
    requesttype = 0;

    para={
      USER_NAME:$('#CUSTOMER_USER_NAME').val(),
      USER_PWD:$('#CUSTOMER_USER_PWD').val(),
      usertype:1
    }

    // serviceid = UI01
    //生成输入参数,函数参数说明
    // 1- json格式 项目实际需要的参数data
    // 2- serviceid = UI01 在[二维码服务API接口文档.xlsx]文档中 服务(serviceid)列表 查找
    // 3- 默认0 请求类型 一般情况无用
    json_str = request_const(para,func_code,requesttype);
    //alert(JSON.stringify(json_str));

    // console.log(json_str);

    ///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
    //自动登录
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

              //登录标志
              $.cookie("ilogin", 1);
              //记录cookie
              Save();

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
          alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
          result=false;
        }
      });
      if(!result){
        return result;
      }

      //自动登录
      var ilogin = $.cookie("ilogin");
      var username = $.cookie("fd_username");
      var fd_usertype = $.cookie("fd_usertype");

      console.log(ilogin);
      console.log(username);
      console.log(fd_usertype);

        //获取用户基本信息
        url="classes/class.UserDetail.php";
        func_code="UI02";
        para={
            username: username
        };

        json_str = request_const(para,func_code,0);

        console.log(json_str);
        //获取USER_ID
        result = true;
        $.ajax({
            type: "POST",
            url: url,
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
                  var data = ret.data[0];

                  $.cookie("fd_userid", data.CUSTOMER_USER_ID);

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

    // //登录成功实现跳转
    // if(fd_usertype==0){
    //   window.location.href="clinicUpdUserInfo.php";
    // }else if(fd_usertype==1){
    //   window.location.href="index.php";
    // }else if(fd_usertype==2){
    //   window.location.href="adminQryClinic.php";
    // }

      //搜索医生预约时间ID
      var time_id="";
      //选中时间段
      var radio_txt = $("input[name=app_time_radio]:checked").val();

      //搜索医生预约时间ID
      func_code="ST01";
      para={
        DOCTOR_ID: $('#DOCTOR_ID').val(),
        APPOINTMENT_DATE: $('#APPOINTMENT_DATE').val(),
        APPOINTMENT_TIME: radio_txt
      };

      json_str = request_const(para,func_code,0);

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
                  alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                  result=false;
                }
                var data = ret.data[0];
                console.log(ret);
                time_id = data.DOCTOR_APPOINTMENT_TIME_ID;
              }else{
                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
                result=false;
              }
              
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            //请求失败之后的操作
            var ret_code = "999999";
            var ret_msg = "ajax失败,请联系管理员";
            alert(func_code+":"+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
            result = false;
         }
      });
      if(!result){
          return result;
      }

      //获取用户详细信息
      var custom_user_id;
      func_code="UI02"; 
      para={
          username: $('#CUSTOMER_USER_NAME').val()
      };

      json_str = request_const(para,func_code,0);

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
                    alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                    result = false;
                }
                  var data = ret.data[0];
                  custom_user_id=data.CUSTOMER_USER_ID;
              }else{
                  alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
                  result = false;
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

        // 预约医生
        func_code="AD01";
        para={
          action_type: "create",
          // CUSTOMER_USER_NAME: $('#CUSTOMER_USER_NAME').val(),
          // CUSTOMER_USER_PWD: $('#CUSTOMER_USER_PWD').val(),
          CUSTOMER_USER_ID: custom_user_id,
          DOCTOR_ID: $('#DOCTOR_ID').val(),
          DOCTOR_APPOINTMENT_TIME_ID:time_id,
          APPOINTMENT_STATUS_ID:1
        };
        console.log(para);

        requesttype = 1; //注册用户

      json_str = request_const(para,func_code,requesttype);

      // console.log(json_str_1);

      //请求
      result=true;
      $.ajax({
          type: "POST",
          url: "classes/class.appointmentDoctor.php",
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
                  result = false;
                }
                if(ret.status.ret_code == "AD0102"){
                  alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
                  result = false;
                }
                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);

              }else{
                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
                result = false;
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

      //修改医生预约时间状态
      func_code="UAT0"; 
      para={
          action_type:"update",
          DOCTOR_APPOINTMENT_TIME_ID:time_id,
          ACTIVE_STATUS:0
      };

      json_str = request_const(para,func_code,1);

      // console.log(json_str);
      //请求
      result = true;
      $.ajax({
        type: "POST",
        url: "classes/class.appointmentTime.php",
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
                  result = false;
              }

            }else{
                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
                result = false;
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

      if($.cookie("ilogin") == 1){
        window.location.href="userAppointmentRecoder.php"; 
      }else if($.cookie("ilogin") == 0){
        // window.location.href="sign_in.php"; 
      }

      return false;
  });

  $('#btn_submit').click(function (){

	//判断是否选择预约时间点
    var iflag=0;
    
    // if($("input[name=app_time_radio]").length==0){
    //   alert("无可预约时间");
    // };
    $("input[name=app_time_radio]").each(function(){
      if( $(this).attr("checked") ){
        iflag=1;
      }
    });

    if( !iflag ){

      alert($("#Lang0173").html());//请选择预约时间段
      return false;
    }

    //未注册用户
    if($.cookie("ilogin") == 0){
      requesttype = 0; //注册用户
      $('#myModal').modal('show');
      return false;
    }

    // var bootstrapValidator = $("#appointmentDoctor_form").data('bootstrapValidator');
    // bootstrapValidator.validate();
    // if(bootstrapValidator.isValid()){
    //   $("#appointmentDoctor_form").submit();
    // }
    var time_id="";
    //选中时间段
    var radio_txt = $("input[name=app_time_radio]:checked").val();

    //搜索医生预约时间ID
    func_code="ST01";
    para={
      DOCTOR_ID: $('#DOCTOR_ID').val(),
      APPOINTMENT_DATE: $('#APPOINTMENT_DATE').val(),
      APPOINTMENT_TIME: radio_txt
    };

    json_str = request_const(para,func_code,0);

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
                alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                result=false;
              }
              var data_1 = ret.data[0];
              time_id = data_1.DOCTOR_APPOINTMENT_TIME_ID;
            }else{
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              result=false;
            }
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          var ret_code = "999999";
          var ret_msg = "ajax失败,请联系管理员";
          alert(func_code+":"+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
          result = false;
       }
    });
    if(!result){
        return result;
    }

    if(time_id == ""){

      alert($("#Lang0182").html());//获取医生预约时间ID错误!
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
      func_code="UI02"; //获取用户详细信息
      para={
          username: $('#CUSTOMER_USER_NAME').val()
      };

      json_str = request_const(para,func_code,0);

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
                    alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                    result = false;
                }
                  var data = ret.data[0];
                  custom_user_id=data.CUSTOMER_USER_ID;
              }else{
                  alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
                  result = false;
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

      // 预约医生
      func_code="AD01";
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


    json_str = request_const(para,func_code,requesttype);

    // console.log(json_str_1);

    //请求
    result=true;
    $.ajax({
        type: "POST",
        url: "classes/class.appointmentDoctor.php",
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
                result = false;
              }
              if(ret.status.ret_code == "AD0102"){
              	alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              	result = false;
              }
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);

            }else{
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              result = false;
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

    //修改医生预约时间状态
    func_code="UAT0"; 
    para={
        action_type:"update",
        DOCTOR_APPOINTMENT_TIME_ID:time_id,
        ACTIVE_STATUS:0
    };

    json_str = request_const(para,func_code,1);

    // console.log(json_str);
    //请求
    result = true;
    $.ajax({
      type: "POST",
      url: "classes/class.appointmentTime.php",
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
                result = false;
            }

          }else{
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              result = false;
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

    if($.cookie("ilogin") == 1){
      window.location.href="userAppointmentRecoder.php"; 
    }else if($.cookie("ilogin") == 0){
      window.location.href="sign_in.php"; 
    }

    return false;
  });

  $('#btn_savedoctor').click(function(){
      //收藏医生
///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
      func_code = "S001";
      requesttype = 1;
      //form序列化成json
      json_form = {
        action_type:"create",
        CUSTOMER_USER_ID:$('#CUSTOMER_USER_ID').val(),
        DOCTOR_ID:$('#DOCTOR_ID').val()
      };
      //生成输入参数
      json_str = request_const(json_form, func_code, requesttype);
      // alert(JSON.stringify(json_str));

      console.log(json_str);

      result = true;
      $.ajax({
            type: "POST",
            url: "classes/class.saveDoctor.php",
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
                // // window.location.href="index.php";
                alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
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

  $('#APPOINTMENT_DATE').change(function(){ 
  //填充可预约时间
    func_code="ST03";
    para={
      DOCTOR_ID: json_value.DOCTOR_ID,
      APPOINTMENT_DATE: $('#APPOINTMENT_DATE').val()
    };

    json_str = request_const(para,func_code,0);

    // console.log(json_str);
    result=true;
    $.ajax({
        type: "POST",
        url: "classes/class.getAppTime.php",
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

              $("#app_time").empty();
              if(ret.data.length==0){
                $("#app_time").append('<label>无可预约时间</label>');
                $('#btn_submit').attr("disabled",true);
              }else{
                $.each(ret.data, function(i, item) {
                  $("#app_time").append('<label class="radio-inline"><input type="radio" name="app_time_radio" id="app_time_radio" value="'+item.APPOINTMENT_TIME+'">'
              +item.APPOINTMENT_TIME+'</label>');
                });
                
                $('#btn_submit').attr("disabled",false);
              }


            }else{
              alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
              result=false;
            }
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          var ret_code = "999999";
          var ret_msg = "ajax失败,请联系管理员";
          alert(func_code+":"+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
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