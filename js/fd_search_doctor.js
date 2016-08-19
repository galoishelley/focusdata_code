$(function(){
  
	var str = $.cookie("search_doctor_con");
  //处理浏览 修改
  if(str != ""){
    var json_value = JSON.parse(str);
    $("#func_code").val(json_value.FUNC_CODE);
    $("#func_name").val(json_value.FUNC_NAME);
    $("#func_note").val(json_value.NOTE);

    if(json_value.IMGID == "updRow"){
      $("#func_id").val(json_value.FUNC_ID);
      $("#action_type").val("update");
      $(".panel-title").html("修改权限");
    }else if(json_value.IMGID == "infoRow")
    {
      $('#func_code').attr("readonly",true);
      $('#func_name').attr("readonly",true);
      $('#func_note').attr("readonly",true);
      $('#func_add_submit').hide();
      $(".panel-title").html("浏览权限");
    }      
  }
});