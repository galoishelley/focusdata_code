if ($.cookie("lang") == 'ch') {
  $('#aus').hide();
  $('#china').show();
}
else
{
  $('#china').hide();
  $('#aus').show();
}



$('#sign_in').click(function (e) {

  if ($('#sign_sub').css('display') === 'none') {
    $('#sign_sub').show();
    $('#sub_register').hide();
    $('#sub_language').hide();
    $('#sub_userinfo').hide();
  } else {
    $('#sign_sub').hide();

  }


});


$('#sign_up').click(function (e) {

  if ($('#sub_register').css('display') === 'none') {
    $('#sub_register').show();
    $('#sign_sub').hide();
    $('#sub_language').hide();
    $('#sub_userinfo').hide();
  } else {
    $('#sub_register').hide();

  }


});


$('#langlang').click(function (e) {

  if ($('#sub_language').css('display') === 'none') {
    $('#sub_language').show();
    $('#sub_register').hide();
    $('#sign_sub').hide();
    $('#sub_userinfo').hide();
  } else {
    $('#sub_language').hide();

  }


});



$('#userinfo').click(function (e) {

  if ($('#sub_userinfo').css('display') === 'none') {
    $('#sub_userinfo').show();
    $('#sub_language').hide()
    $('#sub_register').hide();
    $('#sign_sub').hide();

  } else {
    $('#sub_userinfo').hide();

  }


});




var request_const = function (para, serviceid, requesttype) {
  var sequ = Math.floor(Math.random() * 1000);
  var systemid = "WEB001";
  var projectid = "FDP001";
  var uid = 1;
  var token = "";
  var para = para;
  var reqStr = {
    "serviceid": serviceid,
    "sequ": sequ,
    "systemid": systemid,
    "projectid": projectid,
    "uid": uid,
    "token": token,
    "requesttype": requesttype,
    "para": para
  };
  return reqStr;
};




//form序列化为json
$.fn.serializeObject = function () {
  var o = {};
  var a = this.serializeArray();
  $.each(a, function () {
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

//导航条退出
$('#btn_out').click(function () {
  $.cookie("ilogin", "");
  // $('#userinfo').html();
  window.location.href = "index.php";

  if ($.cookie("fd_rmbUser") == "false") {
    $.cookie("fd_userid", null);
    $.cookie("fd_username", null);
    $.cookie("fd_password", null);
    $.cookie("fd_usertype", null);
  }

});

// 导航
//登录用户
var username, fd_userid;
var ilogin = $.cookie("ilogin");


$('#userinfo').hide();
$('#userinfoGuest').show();
if (ilogin == 1) {
  $('#userinfo').show();
  $('#userinfoGuest').hide();
  var fd_usertype = $.cookie("fd_usertype");
  var fd_usertypename = $.cookie("fd_usertypename");
  if ($.cookie("lang") == 'ch') {
    if (fd_usertypename == 'Clinic user')
      fd_usertypename = '诊所用户';
    else if (fd_usertypename == 'Personal user')
      fd_usertypename = '个人用户';
    else
      fd_usertypename = '管理员';
  }





  username = $.cookie("fd_username");
  fd_userid = $.cookie("fd_userid");

  // 用户名
  $('#userinfo').html($('#Lang0315').html() + ',' + $.cookie("welcomeInfo"));
  // 设置用户类型
  $('#usertype').html($('#Lang0311').html() + ": " + fd_usertypename);

  //显示安全退出
  $('#li_sign_out').removeClass("hidden");


  var url, str_data;
  if (fd_usertype == 0) {
    $('#li_home').removeClass("hidden");
    $('#li_ClinicUser').removeClass("hidden");
    url = "classes/class.ClinicDetail.php";
    // str_data="CLINIC_USER_ID";
  } else if (fd_usertype == 1) {
    $('#li_home').removeClass("hidden");
    $('#li_SearchDoctor').removeClass("hidden");
    $('#li_AppRecoder').removeClass("hidden");
    url = "classes/class.UserDetail.php";
    // str_data="CUSTOMER_USER_ID";
  } else if (fd_usertype == 2) {
    $('#li_Admin').removeClass("hidden");
    url = "classes/class.AdminDetail.php";
    // str_data="ADMIN_ID";
  } else {

  }

  //获取用户基本信息
  var ifunc_code = "UI02";
  var ipara = {
    username: username
  };

  var ijson_str = request_const(ipara, ifunc_code, 0);

  // console.log(json_str);
  //请求
  var result;
  result = true;
  $.ajax({
    type: "POST",
    url: url,
    dataType: "json",
    async: false,
    data: {
      request: ijson_str
    },
    success: function (msg) {
      // console.log(msg);
      var ret = msg.response;
      if (ret.success) {
        if (ijson_str.sequ != ret.sequ) {
          alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
          result = false;
        }
        var data = ret.data[0];

        console.log(data);
        if (fd_usertype == 0) {
          $.cookie("fd_userid", data.CLINIC_USER_ID);
        } else if (fd_usertype == 1) {
          $.cookie("fd_userid", data.CUSTOMER_USER_ID);
        } else if (fd_usertype == 2) {
          $.cookie("fd_userid", data.ADMIN_ID);
        } else {

        }
      } else {
        alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
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
    (function () {
      return result;
    })();
  }

} else {
  //游客
  $.cookie("ilogin", 0);
  //显示HOME
  $('#li_home').removeClass("hidden");
  //显示搜索医生
  $('#li_SearchDoctor').removeClass("hidden");
  //设置用户类型
  $('#usertype').html($('#Lang0311').html() + ": " + $('#Lang0016').html());
  //显示登陆注册
  $('#sign_in').removeClass("hidden");
  $('#sign_up').removeClass("hidden");
}


