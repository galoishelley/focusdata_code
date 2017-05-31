$(function () {

  ddlInterests


  //_________________________________handle Commenced practice since
  $('#DOCTOR_YEAR').datepicker({
    language: 'EN',


    format: " yyyy", // Notice the Extra space at the beginning
    viewMode: "years",
    minViewMode: "years"
  });



  //_________________________________fill ddlInterests
  var ajax_get_interest = $.ajax({

    type: "POST",
    url: 'classes/class.get_interest.php',
    dataType: 'json',
  });


  ajax_get_interest.done(function (data) {
    var r = [];
    for (var i = 0; i < data.length; i++) {
      var item = { label: data[i].INTEREST_NAME, value: data[i].INTEREST_NAME };
      r.push(item);
    }

    $('#ddlInterests').multiselect('dataprovider', r);

    var str = sessionStorage.doctorinfo;

    if (str) {
      var json_value = JSON.parse(str);
      if (json_value.INTEREST_NAME) {
        var interestArr = json_value.INTEREST_NAME.split(",");
        $('#ddlInterests').multiselect('select', interestArr);
      }
    }
  });



  $('#ddlInterests').multiselect({
    maxHeight: 200
  });



  //_________________________________fill language select
  var ajax_get_lang = $.ajax({

    type: "POST",
    url: 'classes/class.get_lang.php',
    dataType: 'json',
  });

  ajax_get_lang.done(function (data) {
    var r = [];
    for (var i = 0; i < data.length; i++) {
      var item = { label: data[i].LANGUAGE_NAME, value: data[i].LANGUAGE_NAME };
      r.push(item);
    }

    $('#ddlLanguage').multiselect('dataprovider', r);

    var str = sessionStorage.doctorinfo;

    if (str) {
      var json_value = JSON.parse(str);
      console.log(json_value);

      if (json_value.DOCTOR_GENDER == "0") {
        $("#DOCTOR_GENDER option[value='" + 0 + "']").attr("selected", true);
      }
      if (json_value.DOCTOR_GENDER == "1") {
        $("#DOCTOR_GENDER option[value='" + 1 + "']").attr("selected", true);
      }

      if (json_value.LANGUAGE_NAME) {
        var langArr = json_value.LANGUAGE_NAME.split(",");
        $('#ddlLanguage').multiselect('select', langArr);
      }



      var clinic_addr = json_value.CLINIC_ADDR + "," + json_value.CLINIC_SUBURB + "," + json_value.STATE_NAME + "," + json_value.CLINIC_POSTCODE;
      $('#DOCTOR_PHOTO').attr('src', json_value.DOCTOR_PHOTO);
      $('#CLINIC_NAME').text(json_value.CLINIC_NAME);
      $('#CLINIC_ADDR').text(clinic_addr);
      $('#DOCTOR_TYPE').val(json_value.DOCTOR_TYPE);
      $('#DOCTOR_NAME').val(json_value.DOCTOR_NAME);
      // $('#DOCTOR_GENDER').val(json_value.DOCTOR_GENDER);
      $('#DOCTOR_INFO').val(json_value.DOCTOR_INFO);

      $('#DOCTOR_YEAR').val(json_value.DOCTOR_YEAR);
      $('#DOCTOR_ID').val(json_value.DOCTOR_ID);
      $('#DOCTOR_PHOTO').val(json_value.DOCTOR_PHOTO);
      $('#feedback').html("<img src='img/doctors/" + json_value.DOCTOR_PHOTO + "'/>");
      $('#ACTIVE_STATUS').find("option[value='" + json_value.ACTIVE_STATUS + "']").attr("selected", true);

      if (json_value.imgId == "opr_info") {
        $("#clinicUpdDoctorDetail input").attr("disabled", "disabled");
        $("#clinicUpdDoctorDetail select").attr("disabled", "disabled");
        $("#clinicUpdDoctorDetail textarea").attr("disabled", "disabled");
        $("#submit_form input").attr("disabled", "disabled");
        $("#btn_submit").attr("disabled", "disabled");
      }
    }


  });


  $('#ddlLanguage').multiselect({
    maxHeight: 200
  });




  $('#btn_submit').click(function () {


    if ($('#ddlLanguage').val() == null) {
      alert($("#Lang0327").html());
      return;
    }

    $('#LANGUAGE_NAME').val($('#ddlLanguage').val());


    if ($('#ddlInterests').val() == null) {
      alert($("#Lang0362").html());
      return;
    }

    $('#INTEREST_NAME').val($('#ddlInterests').val());

    ///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
    requesttype = 1;
    func_code = "CU07";
    //form序列化成json
    json_form = $("#clinicUpdDoctorDetail").serializeObject();

    //var json_stringify=JSON.stringify(json_form);
    //json_form = json_stringify.replace(/[ ]/g,"");

    //生成输入参数
    json_str = request_const(json_form, func_code, requesttype);

    console.log(json_str);

    result = true;
    $.ajax({
      type: "POST",
      url: "classes/class.ClinicOprDoctor.php",
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
          window.location.href = "clinicQryDoctor.php";
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
    return false;
  });

  $("#upload_file").change(function () {
    if ($("#upload_file").val() != '') $("#submit_form").submit();
  });

  $("#exec_target").load(function () {
    

    var data = $(window.frames['exec_target'].document.body).find("textarea").html();
    var img_name = $(window.frames['exec_target'].document.body).find("p").html();


    $('#DOCTOR_PHOTO').val(img_name);

    if (data != null) {
      $("#feedback").replaceWith(data.replace(/&lt;/g, '<').replace(/&gt;/g, '>'));

    }


  });

});