var para, json_str, json_form;
var result = true;
var func_code;

$(document).ready(function () {
  $('#MONDAY_START').css("width","100px");
  $('#MONDAY_START').timepicker();

  $('#MONDAY_END').css("width","100px");
  $('#MONDAY_END').timepicker();

  $('#TUESDAY_START').css("width","100px");
  $('#TUESDAY_START').timepicker();

  $('#TUESDAY_END').css("width","100px");
  $('#TUESDAY_END').timepicker();

  $('#WEDNESDAY_START').css("width","100px");
  $('#WEDNESDAY_START').timepicker();

  $('#WEDNESDAY_END').css("width","100px");
  $('#WEDNESDAY_END').timepicker();

  $('#THURSDAY_START').css("width","100px");
  $('#THURSDAY_START').timepicker();

  $('#THURSDAY_END').css("width","100px");
  $('#THURSDAY_END').timepicker();

  $('#FRIDAY_START').css("width","100px");
  $('#FRIDAY_START').timepicker();

  $('#FRIDAY_END').css("width","100px");
  $('#FRIDAY_END').timepicker();

  $('#SATURDAY_START').css("width","100px");
  $('#SATURDAY_START').timepicker();

  $('#SATURDAY_END').css("width","100px");
  $('#SATURDAY_END').timepicker();

  $('#SUNDAY_START').css("width","100px");
  $('#SUNDAY_START').timepicker();

  $('#SUNDAY_END').css("width","100px");
  $('#SUNDAY_END').timepicker();

  $('#PUBLIC_START').css("width","100px");
  $('#PUBLIC_START').timepicker();

  $('#PUBLIC_END').css("width","100px");
  $('#PUBLIC_END').timepicker();


  var state_id;
  func_code = "CU02";
  para = {
    action_type: "view",
    CLINIC_USER_ID: fd_userid
  };

  json_str = request_const(para, func_code, 0);
  // console.log(json_str);
  //请求
  result = true;
  $.ajax({
    type: "POST",
    url: "classes/class.ClinicDetail.php",
    dataType: "json",
    async: false,
    data: {
      request: json_str
    },
    success: function (msg) {
      // console.log(msg);
      var ret = msg.response;
      if (ret.success) {
        if (json_str.sequ != ret.sequ) {
          alert(func_code + " 时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
          result = false;
        }
        var data = ret.data[0];
        console.log(data);
        $('#CLINIC_USER_ID').val(data.CLINIC_USER_ID);
        $('#CLINIC_PHOTO').val(data.CLINIC_PHOTO);
        $('#CLINIC_PHOTO').attr('src', data.CLINIC_PHOTO);
        $('#feedback').html("<img src='img/clinics/" + data.CLINIC_PHOTO + "'/>");
        $('#CLINIC_USER_MAIL').val(data.CLINIC_USER_MAIL);
        $('#CLINIC_NAME').val(data.CLINIC_NAME);
        $('#CLINIC_POSTCODE').val(data.CLINIC_POSTCODE);
        $('#CLINIC_ADDR').val(data.CLINIC_ADDR);
        $('#CLINIC_SUBURB').val(data.CLINIC_SUBURB);
        $('#CLINIC_OVERVIEW').val(data.CLINIC_OVERVIEW);

        if (data.BULK_BILLING == '0')
          $('#BULK_BILLING').prop('checked', false);
        else
          $('#BULK_BILLING').prop('checked', true);
        if (data.LATE_HOUR_SERVICES == '0')
          $('#LATE_HOUR_SERVICES').prop('checked', false);
        else
          $('#LATE_HOUR_SERVICES').prop('checked', true);
        if (data.FREE_PARKING == '0')
          $('#FREE_PARKING').prop('checked', false);
        else
          $('#FREE_PARKING').prop('checked', true);
        if (data.WHEELCHAIR_ACCESS == '0')
          $('#WHEELCHAIR_ACCESS').prop('checked', false);
        else
          $('#WHEELCHAIR_ACCESS').prop('checked', true);
        if (data.FEMALE_DOCTOR == '0')
          $('#FEMALE_DOCTOR').prop('checked', false);
        else
          $('#FEMALE_DOCTOR').prop('checked', true);
        if (data.HOME_VISIT == '0')
          $('#HOME_VISIT').prop('checked', false);
        else
          $('#HOME_VISIT').prop('checked', true);
        if (data.ONSITE_PATHOLOGY_COLLECTION == '0')
          $('#ONSITE_PATHOLOGY_COLLECTION').prop('checked', false);
        else
          $('#ONSITE_PATHOLOGY_COLLECTION').prop('checked', true);
        if (data.AGPAL == '0')
          $('#AGPAL').prop('checked', false);
        else
          $('#AGPAL').prop('checked', true);

        $('#STANDARD_15_MINUTE_CONSULTATION').val(data.STANDARD_15_MINUTE_CONSULTATION);
        $('#EXTEND_30_MINUTE_CONSULTATION').val(data.EXTEND_30_MINUTE_CONSULTATION);


        $('#MONDAY_START').val(data.MONDAY_START);
        $('#MONDAY_END').val(data.MONDAY_END);

        $('#TUESDAY_START').val(data.TUESDAY_START);
        $('#TUESDAY_END').val(data.TUESDAY_END);

        $('#WEDNESDAY_START').val(data.WEDNESDAY_START);
        $('#WEDNESDAY_END').val(data.WEDNESDAY_END);

        $('#THURSDAY_START').val(data.THURSDAY_START);
        $('#THURSDAY_END').val(data.THURSDAY_END);

        $('#FRIDAY_START').val(data.FRIDAY_START);
        $('#FRIDAY_END').val(data.FRIDAY_END);

        $('#SATURDAY_START').val(data.SATURDAY_START);
        $('#SATURDAY_END').val(data.SATURDAY_END);

        $('#SUNDAY_START').val(data.SUNDAY_START);
        $('#SUNDAY_END').val(data.SUNDAY_END);

        $('#PUBLIC_START').val(data.PUBLIC_START);
        $('#PUBLIC_END').val(data.PUBLIC_END);
        state_id = data.STATE_ID;
      } else {
        alert(func_code + " " + ret.status.ret_code + " " + ret.status.ret_msg);
        result = false;
      }

    },
    error: function (XMLHttpRequest, textStatus, errorThrown) {
      //请求失败之后的操作
      var ret_code = "999999";
      var ret_msg = "ajaxError,contact admin please!";
      alert(func_code + " " + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
      result = false;
    }
  });
  if (!result) {
    return result;
  }

  //填充州
  func_code = "SSTE";
  para = "";

  json_str = request_const(para, func_code, 0);

  // console.log(json_str);
  //请求
  result = true;
  $.ajax({
    type: "POST",
    url: "classes/class.getState.php",
    dataType: "json",
    async: false,
    data: {
      request: json_str
    },
    success: function (msg) {
      // console.log(msg);
      var ret = msg.response;
      if (ret.success) {
        if (json_str.sequ != ret.sequ) {
          alert(func_code + ":时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
          result = false;
        }
        // var data = ret.data[0];
        $.each(ret.data, function (i, item) {
          $("#STATE_ID").append("<option value='" + item.STATE_ID + "'>" + item.STATE_NAME + "</option>");
        });
        // console.log(data);
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
    return result;
  }

  $("#STATE_ID option[value='" + state_id + "']").attr("selected", true);

  $('#btn_ok').click(function () {

    /*calculate lat/lng begin*/
    var address = $('#CLINIC_ADDR').val() + "," + $('#CLINIC_SUBURB').val() + "," + $("#STATE_ID option:selected").text() + "," + "Australia";
    var geocoder = new google.maps.Geocoder();
    if (geocoder) {
      geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {

            $('#CLINIC_LAT').val(results[0].geometry.location.lat());
            $('#CLINIC_LNG').val(results[0].geometry.location.lng());


            ///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
            //form序列化成json
            func_code = "CU03";
            json_form = $("#clinicUpdUserInfo").serializeObject();
            //生成输入参数
            json_str = request_const(json_form, func_code, 1);



            //请求
            result = true;
            $.ajax({
              type: "POST",
              url: "classes/class.ClinicDetail.php",
              dataType: "json",
              async: false,
              data: {
                request: json_str
              },
              success: function (msg) {

                var ret = msg.response;
                if (ret.success) {
                  if (json_str.sequ != ret.sequ) {
                    alert(func_code + " 时序号错误,请联系管理员ret.sequ" + ret.sequ + " json_str.sequ:" + json_str.sequ);
                    result = false;
                  }

                  alert(func_code + " " + ret.status.ret_code + " " + ret.status.ret_msg);

                  $.cookie("fd_username", $('#CLINIC_USER_MAIL').val());

                  var username = $.cookie("fd_username");

                  $('#userinfo').html(username);
                  // $('#usertype').html("用户类型: "+$.cookie("fd_usertype"));

                } else {
                  alert(func_code + " " + ret.status.ret_code + " " + ret.status.ret_msg);
                  result = false;
                }

              },
              error: function (XMLHttpRequest, textStatus, errorThrown) {
                //请求失败之后的操作
                var ret_code = "999999";
                var ret_msg = "ajaxError,contact admin please!";
                alert(func_code + " " + ret_code + ":" + ret_msg + " textStatus:" + textStatus);
                result = false;
              }
            });



          } else {
            alert("Invalid address!");
          }
        } else {
          alert("Geocode was not successful for the following reason: " + status);
        }
      });
    }

    /*calculate lat/lng end*/


    if (!result) {
      return result;
    }

    return false;
  })


  $("#upload_file").change(function () {
    if ($("#upload_file").val() != '') {

      $("#submit_form").submit();
    }



  });

  $("#exec_target").load(function () {

    var data = $(window.frames['exec_target'].document.body).find("textarea").html();
    var img_name = $(window.frames['exec_target'].document.body).find("p").html();


    $('#CLINIC_PHOTO').val(img_name);

    if (data != null) {
      $("#feedback").replaceWith(data.replace(/&lt;/g, '<').replace(/&gt;/g, '>'));

    }
  });

});