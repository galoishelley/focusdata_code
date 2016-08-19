$(function(){
	
	$("#sele_user").change(function(){
    if($(this).val() == "0"){
			$("#personal").show();
			$("#clinic").hide();
		}else if($(this).val() == "1"){
			$("#personal").hide();
			$("#clinic").show();
		}
	});

/*	$("#sign_in").click(function(){
		alert("OK");
		return false;
	});*/

  
	$('#signup_form').bootstrapValidator({
　　　message: 'This value is not valid',
    　feedbackIcons: {
        　　　　　　　　valid: 'glyphicon glyphicon-ok',
        　　　　　　　　invalid: 'glyphicon glyphicon-remove',
        　　　　　　　　validating: 'glyphicon glyphicon-refresh'
                    },
      fields: {
          func_code: {
              message: '权限编码验证失败',
              validators: {
                  notEmpty: {
                      message: '权限编码不能为空'
                  }
              }
          },
          func_name: {
              validators: {
                  notEmpty: {
                      message: '权限名称不能为空'
                  }
              }
          },
          func_note: {
              validators: {
                  stringLength: {
                      max: 100,
                      message: '长度不能超过100个汉字'
                   }
              }
          } 
        }
    });
});