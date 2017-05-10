$(document).ready(function () {


  $('#send_email').click(function () {

    //Step1.Check if mail exist 


    var EMAIL = $("#EMAIL").val();
    if (!EMAIL) {
      alert($("#Lang0020").html()); //请修改个人信息，添加邮箱地址
      return false;
    }


    //form序列化成json
    json_form = {
      action_type: "person",
      email: EMAIL
    };

    json_str = request_const(json_form, "CU04", 1);
    result = true;
    $.ajax({
      type: "POST",
      url: "classes/class.ForgotPWD.php",
      dataType: "json",
      async: false,
      data: {
        request: json_str
      },
      success: function (msg) {
        if (msg == 0) {
          alert("Email does not exist");
          result = false;
        }

      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        //请求失败之后的操作
        var ret_code = "999999";
        var ret_msg = "Error,contact admin please!";
        alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
        result = false;
      }
    });

    if (!result) {
      return result;
    }


    //Step2. send mail
    var reset_pwd = "";
    for (var i = 0; i < 6; i++) {
      reset_pwd += Math.floor(Math.random() * 10);
    }
    var email_text = "Your new password:" + reset_pwd;

    //发送邮件 begin
    $.ajax({
      type: "POST",
      url: "classes/PHPMailer/gmail.php",
      dataType: "text",
      async: true,
      data: {
        email: EMAIL,
        pwd: reset_pwd,
        name: EMAIL
      },
      success: function (msg) {


        alert($("#Lang0032").html()); //密码重置成功!


      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        //请求失败之后的操作
        var ret_code = "999999";
        var ret_msg = "Error,contact admin please!";
        alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
        result = false;
      }
    });

    if (!result) {
      return result;
    }


    //Step3. update password
    func_code = "CU04";

    json_form = {
      action_type: "updatePerson",
      CUSTOMER_USER_MAIL: EMAIL,
      CUSTOMER_USER_PWD: reset_pwd
    };

    json_str = request_const(json_form, "CU04", 1);


    result = true;
    $.ajax({
      type: "POST",
      url: "classes/class.ForgotPWD.php",
      dataType: "json",
      async: false,
      data: {
        request: json_str
      },
      success: function (msg) {
        var ret = msg.response;
        if (ret.success) {
          
        } else {
          alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
          // $('#signin_ok').attr('disabled',false); 
          result = false;
        }

      },
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        //请求失败之后的操作
        var ret_code = "999999";
        var ret_msg = "Error,contact admin please!";
        alert(func_code + ":" + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
        result = false;
      }
    });
    if (!result) {
      return result;
    }
    return false;
  });


});