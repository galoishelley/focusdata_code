var para,json_str,json_form;
var result,func_code,requesttype;

$(function(){

	$("#sele_user").change(function(){
    if($(this).val() == "1"){
			window.location.href="sign_up_clinic.html";
		}
	});

  //解决表单验证
  $("#signup_form").submit(function(ev){ev.preventDefault();});

  $('#signup_ok').click( function () {
     var bootstrapValidator = $("#signup_form").data('bootstrapValidator');
     bootstrapValidator.validate();
     if(bootstrapValidator.isValid()){
       $("#signup_form").submit();


///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
    requesttype = 0;
    func_code = "UU02";
    //form序列化成json
    json_form = $("#signup_form").serializeObject();
    //生成输入参数
    json_str = request_const(json_form,func_code,requesttype);

    // console.log(json_str);

///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
      result=true;
      $.ajax({
          type: "POST",
          url: "classes/class.sign_up_person.php",
          dataType: "json",
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

              window.location.href="sign_in.php";

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
                      message: '用户名不能为空'
                  }
              }
          },
          CUSTOMER_USER_PWD: {
              validators: {
                  notEmpty: {
                      message: '密码不能为空'
                  }
              }
          },
          verifyCode: {
              validators: {
                  notEmpty: {
                      message: '手机验证码不能为空'
                   }
              }
          },
          CUSTOMER_BIRTHDAY: {
              validators: {
                  notEmpty: {
                      message: '生日不能为空'
                   }
              }
          },
          CUSTOMER_GENDER: {
              validators: {
                  notEmpty: {
                      message: '性别不能为空'
                  }
              }
          },
          CUSTOMER_ADDR: {
              validators: {
                  notEmpty: {
                      message: '家庭住址不能为空'
                  }
              }
          },
          CUSTOMER_PHONE_NO: {
              validators: {
                  notEmpty: {
                      message: '电话号码不能为空'
                   }
              }
          },
          MEDICAL_CARD_NO: {
              validators: {
                  notEmpty: {
                      message: '医疗卡号不能为空'
                   }
              }
          } 
        }
    });
});