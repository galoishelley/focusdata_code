var para,json_str,json_form;
var result,func_code,requesttype;

$(function(){

	$("#CUSTOMER_BIRTHDAY").mask("99/99/9999",{placeholder:"dd/mm/yyyy"});
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


	$("#sele_user").change(function(){
    if($(this).val() == "1"){
			window.location.href="sign_up_clinic.php";
		}
	});

  $("body").keydown(function() {
    if (event.keyCode == "13") {//keyCode=13是回车键
      $('#signup_ok').click();
    }
  });

  //解决表单验证
  $("#signup_form").submit(function(ev){ev.preventDefault();});

  $('#signup_ok').click(function() {
    var bootstrapValidator = $("#signup_form").data('bootstrapValidator');
    bootstrapValidator.validate();
    if(bootstrapValidator.isValid()){
      $("#signup_form").submit();
    }else{
      return false;
    }

    requesttype = 0;
    func_code = "UU02";
    //form序列化成json
    json_form = $("#signup_form").serializeObject();
    //生成输入参数
    json_str = request_const(json_form,func_code,requesttype);

    //console.log(json_str);
 
    result=true;
    $.ajax({
        type: "POST",
        url: "classes/class.sign_up_person.php",
        dataType: "json",
        async:false,
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

            //注册成功
            // window.location.href="sign_in.php";

          }else{
            alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
            $('#signup_ok').attr('disabled',false); 
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
    
    //注册成功
    //登录标志
    // $.cookie("ilogin", 1);
    //记录cookie
    Save();

    var ilogin = $.cookie("ilogin");
    var username = $.cookie("fd_username");
    var fd_usertype = $.cookie("fd_usertype");

    var url;
    if(fd_usertype == 0){
      url="classes/class.ClinicDetail.php";
    }else if(fd_usertype == 1){
      url="classes/class.UserDetail.php";
    }else if(fd_usertype == 2){
      $('#li_Admin').removeClass("hidden");
      url="classes/class.AdminDetail.php";
    }else{

    }

    //获取用户基本信息
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

    //登录成功实现跳转
    if(fd_usertype==0){
      window.location.href="clinicUpdUserInfo.php";
    }else if(fd_usertype==1){
      window.location.href="index.php";
    }else if(fd_usertype==2){
      window.location.href="adminQryClinic.php";
    }

    return false;

  });

	$('#signup_form').bootstrapValidator({
　　message: 'This value is not valid',
  　feedbackIcons: {
      　　　　　　　　valid: 'glyphicon glyphicon-ok',
      　　　　　　　　invalid: 'glyphicon glyphicon-remove',
      　　　　　　　　validating: 'glyphicon glyphicon-refresh'
                  },
    fields: {
        CUSTOMER_USER_NAME: {
            validators: {
              notEmpty: {
                    message: 'The username is required and cannot be empty'
              },
              stringLength: {
                  min: 6,
                  max: 30,
                  message: '6 and less than 30 characters long'
                  // message: 'The username must be more than 6 and less than 30 characters long'
              },
              regexp: {
                  regexp: /^[a-zA-Z0-9_]+$/,
                  message: 'alphabetical, number and underscore'
                  // message: 'The username can only consist of alphabetical, number and underscore'
              },
              different: {
                  field: 'CUSTOMER_USER_PWD',
                  message: '用户名和密码不能相同'
              }
            }
        },
        CUSTOMER_USER_MAIL: {
            validators: {
              notEmpty: {
                  message: 'The email is required and cannot be empty'
              },
              emailAddress: {
                  message: 'The input is not a valid email address'
              }
            }
        },
        CUSTOMER_USER_PWD: {
            validators: {
                notEmpty: {
                    message: '密码不能为空'
                }
            },
            different: {
                field: 'CUSTOMER_USER_NAME',
                message: '用户名和密码不能相同'
            },
            identical: {//相同
                 field: 'CUSTOMER_USER_PWD', //需要进行比较的input name值
                 message: '两次密码不一致'
            }
        },
        CONFIME_PWD: {
            validators: {
                notEmpty: {
                    message: '确认密码不能为空'
                },
                different: {
                    field: 'CUSTOMER_USER_NAME',
                    message: '用户名和密码不能相同'
                },
                identical: {//相同
                     field: 'CUSTOMER_USER_PWD', //需要进行比较的input name值
                     message: '两次密码不一致'
                },
            }
        },
        CUSTOMER_NAME: {
            validators: {
                notEmpty: {
                    message: '姓名不能为空'
                }
            }
        },
        // verifyCode: {
        //     validators: {
        //         notEmpty: {
        //             message: '手机验证码不能为空'
        //          }
        //     }
        // },
        CUSTOMER_GENDER: {
            validators: {
                notEmpty: {
                    message: '请选择性别'
                }
            }
        },
        CUSTOMER_BIRTHDAY: {
          validators: {
              notEmpty: {
                message: '生日不能为空'
             }
             // date: {
             //    format: 'YYYY/MM/DD',
             //    message: '不是合法的生日'
             //  }
          }
        },
        CUSTOMER_PHONE_NO: {
            validators: {
              notEmpty: {
                message: '电话号码不能为空'
              },
              digits: {
                message: 'The phone number is not valid'
              }
            }
        },
        MEDICAL_CARD_NO: {
            validators: {
                notEmpty: {
                    message: '医疗卡号不能为空'
                 }
            }
        },
        CUSTOMER_ADDR: {
            validators: {
                notEmpty: {
                    message: '详细地址不能为空'
                }
            }
        },
        CUSTOMER_POSTCODE: {
            validators: {
                notEmpty: {
                    message: '邮编不能为空'
                }
            }
        },
        CUSTOMER_SUBURB: {
            validators: {
                notEmpty: {
                    message: '区不能为空'
                }
            }
        },
        STATE_ID: {
            validators: {
                notEmpty: {
                    message: '州不能为空'
                }
            }
        }
      }
  });

});