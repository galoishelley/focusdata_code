    // var serviceid = "UI01";
    // var json_str = request_const(json_func_form,serviceid,0);
    var request_const=function(para,serviceid,requesttype){
      var sequ = Math.floor(Math.random()*1000);
      var systemid = "WEB001";
      var projectid = "FDP001";
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
        "requesttype":requesttype,
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

    //导航条退出
  $('#btn_out').click(function(){
    $.cookie("ilogin", "");
    // $('#userinfo').html();
    window.location.href="index.html"; 

    if ($.cookie("fd_rmbUser") == "false") {
      $.cookie("fd_userid", "");
      $.cookie("fd_username", "");
      $.cookie("fd_password", "");
      $.cookie("fd_usertype", "");
    }

  });

  function setUserinfo(){
    var ilogin = $.cookie("ilogin");
    if(ilogin == 1)
    {
        var username = $.cookie("fd_username");

        $('#userinfo').html(username);
        $('#usertype').html("用户类型: "+$.cookie("fd_usertype"));
    }

    if(ilogin == 0){
      alert("您未登陆,无法使用此功能");
      history.go(-1);
      return false;
      // $('#a_userAppointmentRecoder').attr("href","#");
      // $('#a_userAppointmentRecoder').attr("color","#FF0000");
    }
  }