/* Formatting function for row details - modify as you need */
function format ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>Full name:</td>'+
            '<td>'+d.name+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extension number:</td>'+
            '<td>'+d.extn+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extra info:</td>'+
            '<td>And any further details here (images etc)...</td>'+
        '</tr>'+
    '</table>';
}

$(function(){
	
  var serviceid = "300002";

	$("#sele_user").change(function(){
    if($(this).val() == "0"){
			window.location.href="sign_up_person.html";
		}
  //   else if($(this).val() == "1"){
		// 	$("#personal").hide();
		// 	$("#clinic").show();
		// }
	});

/*	$("#sign_in").click(function(){
		alert("OK");
		return false;
	});*/
  
  var requeststr=function(para){
    var sequ = Math.floor(Math.random()*1000);
    var systemid = "100";
    var projectid = "10001";
    var uid = 1;
    var token = "";
    var para = para;
    var reqStr = {
      "serviceid":serviceid,
      "sequ":sequ,
      "systemid":systemid,
      "projectid":projectid,
      "uid":uid,
      "token":token,
      "para":para
    };
    return reqStr;
  };

  //form序列化为json
  $.fn.serializeObject = function()    
  {    
     var o = {};    
     var a = this.serializeArray();    
     $.each(a, function() {    
         if (o[this.name]) {    
             if (!o[this.name].push) {    
                 o[this.name] = [o[this.name]];    
             }    
             o[this.name].push(this.value || '');    
         } else {    
             o[this.name] = this.value || '';    
         }    
     });    
     return o;    
  };  

  //解决表单验证
  $("#signup_form").submit(function(ev){ev.preventDefault();});

  $('#signup_ok').click( function () {
     var bootstrapValidator = $("#signup_form").data('bootstrapValidator');
     bootstrapValidator.validate();
     if(bootstrapValidator.isValid()){
       $("#signup_form").submit();

       //form序列化成json
       var json_func_form = $("#signup_form").serializeObject();
       // var action_type='"action_type":"create"';
       // json_func_form.push(JSON.parse(action_type));
       // var newJson='{"name":"liubei","sex":"男"}';
       // json_func_form.push(JSON.parse(newJson));

      //var j =[{"name":"caocao","sex":"男"}];
      // var newJson='{"name":"liubei","sex":"男"}';

      // j.push(JSON.parse(newJson));

      // alert(JSON.stringify(j));

      //生成输入参数
      var json_str = requeststr(json_func_form);
      //alert(JSON.stringify(json_str));


      alert(JSON.stringify(json_str));

      $.ajax({
          type: "POST",
          url: "classes/class.signup_clinic.php",
          dataType: "json",
          data:  {
            request:json_str
          },
          success: function (msg) {
              var ret = msg.response;
              // alert("js:"+ ret.msg);
              if(ret){
                if(ret.result== 2){
                  alert(ret.msg);
                  return;
                }
                //alert(msg.response.msg);
                window.location.href="sign_in.html";
                //_table.ajax.reload();
                //window.location.reload()
              }else{
                alert("添加失败!" + ret.msg);
              }
              
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            //请求失败之后的操作
            alert("ajax添加失败!" + textStatus);
            // alert(XMLHttpRequest.status);
            // alert(XMLHttpRequest.readyState);
         }
      });
    }
    return false;
  });

  // $("#addCancel").click(function(){
  //   $.cookie("func_data", null);
  //   window.location.href="func.html"; 
  // });


  
	$('#signup_form').bootstrapValidator({
　　　message: 'This value is not valid',
    　feedbackIcons: {
        　　　　　　　　valid: 'glyphicon glyphicon-ok',
        　　　　　　　　invalid: 'glyphicon glyphicon-remove',
        　　　　　　　　validating: 'glyphicon glyphicon-refresh'
                    },
      fields: {
          CLINIC_USER_NAME: {
              validators: {
                  notEmpty: {
                      message: '用户名不能为空'
                  }
              }
          },
          CLINIC_USER_PWD: {
              validators: {
                  notEmpty: {
                      message: '密码不能为空'
                  }
              }
          },
          CLINIC_USER_MAIL: {
              validators: {
                  notEmpty: {
                      message: '邮箱不能为空'
                   }
              }
          },
          CLINIC_NAME: {
              validators: {
                  notEmpty: {
                      message: '诊所名称不能为空'
                   }
              }
          },
          CLINIC_ADDR: {
              validators: {
                  notEmpty: {
                      message: '诊所地址不能为空'
                  }
              }
          }
        }
    });
});