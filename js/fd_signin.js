$(function(){
	
  var serviceid = "300001";

	if ($.cookie("fd_rmbUser") == "true") {
        $("#ck_rmbUser").attr("checked", true);
        $("#USER_NAME").val($.cookie("fd_username"));
        $("#USER_PWD").val($.cookie("fd_password"));
  }

  //记住用户名密码
  function Save() {
    var str_username = $("#USER_NAME").val();
       var str_password = $("#USER_PWD").val();
      if ($("#ck_rmbUser").attr("checked")) {
          $.cookie("fd_rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
          $.cookie("fd_username", str_username, { expires: 7 });
          $.cookie("fd_password", str_password, { expires: 7 });
      }
      else {
          $.cookie("fd_rmbUser", "false", { expire: -1 }); //保存半小时
          $.cookie("fd_username", "", { expires: -1 });
          $.cookie("fd_password", "", { expires: -1 });
      }

      // $.cookie("username_tmp", "", { expires: -1 });
      // $.cookie("username_tmp", str_username, { expires: 5 });
  };
  
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

  $('#signin_ok').click( function () {
     var bootstrapValidator = $("#signin_form").data('bootstrapValidator');
     bootstrapValidator.validate();
     if(bootstrapValidator.isValid()){
       $("#signin_form").submit();

       //form序列化成json
       var json_func_form = $("#signin_form").serializeObject();
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
      // alert(JSON.stringify(json_str));


      // alert(JSON.stringify(json_str));
      var sequ = json_str.sequ;
      $.ajax({
          type: "POST",
          url: "classes/class.signin.php",
          dataType: "json",
          data:  {
            request:json_str
          },
          success: function (msg) {
              var ret = msg.response;
              // alert("js:"+ ret.msg);
              if(sequ != ret.sequ){
                alert("时序号错误请联系管理员ret. sequ=" + ret.sequ +",sequ="+ sequ);
              }
              if(ret.state=="1"){
                window.location.href="index.html";
                Save();
              }else{
                alert("登录失败!" + ret.msg);
              }
              
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            //请求失败之后的操作
            alert("ajax登录失败!" + textStatus);
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


  
	$('#signin_form').bootstrapValidator({
　　　message: 'This value is not valid',
    　feedbackIcons: {
        　　　　　　　　valid: 'glyphicon glyphicon-ok',
        　　　　　　　　invalid: 'glyphicon glyphicon-remove',
        　　　　　　　　validating: 'glyphicon glyphicon-refresh'
                    },
      fields: {
          USER_NAME: {
              validators: {
                  notEmpty: {
                      message: '用户名不能为空'
                  }
              }
          },
          USER_PWD: {
              validators: {
                  notEmpty: {
                      message: '密码不能为空'
                  }
              }
          }
        }
    });
});