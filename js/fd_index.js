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
    alert($.cookie("fd_username"));
    $('#userinfo').html($.cookie("fd_username"));
    $('#usertype').html("用户类型: "+$.cookie("fd_usertype"));
  }else{
    $.cookie("ilogin", 0);
  }

  $('#btn_search').click(function(){
    var search = $.trim($('#txt_search').val());
    console.log(search);
    $.cookie("search_con", search);
    window.location.href="searchDoctor.html"; 
  });

  $('#btn_out').click(function(){
    $.cookie("ilogin", "");
    $('#userinfo').html();
    window.location.href="index.html"; 

    if ($.cookie("fd_rmbUser") == "false") {
      $.cookie("fd_username", "");
      $.cookie("fd_password", "");
      $.cookie("fd_usertype", "");
    }

  });

});