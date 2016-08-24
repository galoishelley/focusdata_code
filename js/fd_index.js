$(function(){
	// $('.form_datetime').datetimepicker({
 //    // language:  'zh-CN',
 //    format: "yyyy-mm-dd",
 //    // weekStart: 1,
 //    todayBtn:  1,
 //    autoclose: 1,
 //    todayHighlight: 1,
 //    startView: 2,
 //    // forceParse: 0,
 //    minView: "month" 
 //  });

 //  $('#search_doc').click(function(){
 //    var clinicarea = $('#clinicarea').val();
 //    var clinicname = $('#clinicname').val();
 //    var doctortype = $('#doctortype').val();
 //    var doctorname = $('#doctorname').val();
 //    var apptime = $('#apptime').val();
 //    var distance = $('#distance').val();

 //    var data = {
 //      clinicarea: clinicarea,
 //      clinicname: clinicname,
 //      doctortype: doctortype,
 //      doctorname: doctorname,
 //      apptime: apptime,
 //      distance: distance
 //    };

 //    var str = JSON.stringify(data);
 //    $.cookie("search_doctor_con", str);
 //    window.location.href="searchDoctor.html"; 

 //    return false;
 //  });

  

  if($.cookie("ilogin") == 1)
  {

    var username = $.cookie("fd_username");

    $('#userinfo').html(username);
    $('#usertype').html("用户类型: "+$.cookie("fd_usertype"));

    var para={
      username: username
    };

    var json_str = request_const(para,"UI02",0);

    // console.log(json_str);
    //请求
    $.ajax({
        type: "POST",
        url: "classes/class.searchUserDetail.php",
        dataType: "json",
        data: {
          request:json_str
        },
        success: function (msg) {
            // console.log(msg);
            var ret = msg.response;
            if(ret.success){
              if(json_str.sequ != ret.sequ){
                alert("时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                return;
              }
              var data = ret.data[0];
              $.cookie("fd_userid", data.CUSTOMER_USER_ID);
            }else{
              alert(ret.status.ret_code + " " + ret.status.ret_msg);
            }
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          var ret_code = "999999";
          var ret_msg = "失败,请联系管理员!";
          alert(ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
       }
    });

  }else{
    $.cookie("ilogin", 0);
  }

  $('#btn_search').click(function(){
    var search = $.trim($('#txt_search').val());
    // console.log(search);
    $.cookie("search_con", search);
    window.location.href="searchDoctor.html"; 
  });

  $('#btn_out').click(function(){
    $.cookie("ilogin", "");
    $('#userinfo').html();
    window.location.href="index.html"; 

    if ($.cookie("fd_rmbUser") == "false") {
      $.cookie("fd_userid", "");
      $.cookie("fd_username", "");
      $.cookie("fd_password", "");
      $.cookie("fd_usertype", "");
    }

  });

});