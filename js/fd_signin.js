$(function(){
	
  var serviceid = "UI01";

  if($.cookie("ilogin") == 1)
  {
    $('#userinfo').html($("#USER_NAME").val());
  }

	if ($.cookie("fd_rmbUser") == "true") {
        $("#ck_rmbUser").attr("checked", true);
        $("#USER_NAME").val($.cookie("fd_username"));
        $("#USER_PWD").val($.cookie("fd_password"));
  }

  //记住用户名密码
  function Save() {
    var str_username = $("#USER_NAME").val();
    var str_password = $("#USER_PWD").val();
    var str_usertype = $('input[name="usertype"]:checked').val();

    if ($("#ck_rmbUser").attr("checked")) {
        $.cookie("fd_rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
    }
    else {
        $.cookie("fd_rmbUser", "false", { expire: -1 }); //保存半小时
        // $.cookie("fd_username", "", { expires: -1 });
        // $.cookie("fd_password", "", { expires: -1 });
    }

    $.cookie("fd_username", str_username, { expires: 7 });
    $.cookie("fd_password", str_password, { expires: 7 });

    if(str_usertype==0){
      str_usertype = "诊所用户";
    }else if(str_usertype==1){
      str_usertype = "个人用户";
    }else if(str_usertype==2){
      str_usertype = "管理员";
    }

    $.cookie("fd_usertype", str_usertype, { expires: 7 });
 
    // alert($('input[name="usertype"]:checked').val());
    // alert($('#usertype:checked').val());

    // $.cookie("username_tmp", "", { expires: -1 });
    // $.cookie("username_tmp", str_username, { expires: 5 });
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
      var json_str = request_const(json_func_form,serviceid,0);
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
                //登录标志
                $.cookie("ilogin", 1);
                Save();
                window.location.href="index.html";
                
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