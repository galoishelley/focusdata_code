var para,json_str,json_form;
var result,func_code,requesttype;
var datatable_lang_url;

$(document).ready(function() {
	
	//设置BootstrapDialog & Datatable I18N 2006/09/17 updated by alex
	if($("#which_lang").html()=="en"){
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DEFAULT] = 'Information';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_INFO] = 'Information';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_PRIMARY] = 'Information';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_SUCCESS] = 'Success';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_WARNING] = 'Warning';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DANGER] = 'Danger';
	    BootstrapDialog.DEFAULT_TEXTS['OK'] = 'OK';
	    BootstrapDialog.DEFAULT_TEXTS['CANCEL'] = 'Cancel';
	    BootstrapDialog.DEFAULT_TEXTS['CONFIRM'] = 'Confirmation';

	    datatable_lang_url="//cdn.datatables.net/plug-ins/1.10.12/i18n/English.json";
	}
	else if($("#which_lang").html()=="ch"){
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DEFAULT] = '消息';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_INFO] = '消息';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_PRIMARY] = '消息';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_SUCCESS] = '成功';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_WARNING] = '警告';
	    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DANGER] = '危险';
	    BootstrapDialog.DEFAULT_TEXTS['OK'] = '确定';
	    BootstrapDialog.DEFAULT_TEXTS['CANCEL'] = '取消';
	    BootstrapDialog.DEFAULT_TEXTS['CONFIRM'] = '请确认';

	    datatable_lang_url="//cdn.datatables.net/plug-ins/1.10.12/i18n/Chinese.json";
	}

 //  var ilogin = $.cookie("ilogin");

 //  $('#btn_out').click(function(){
 //    $.cookie("ilogin", "");
 //    // $('#userinfo').html();
 //    window.location.href="index.php"; 

 //    if ($.cookie("fd_rmbUser") == "false") {
 //      $.cookie("fd_userid", "");
 //      $.cookie("fd_username", "");
 //      $.cookie("fd_password", "");
 //      $.cookie("fd_usertype", "");
 //    }

 //  });

 //  if(ilogin == 1)
 //  {
 //      var fd_usertype = $.cookie("fd_usertype");
 //      var fd_usertypename = $.cookie("fd_usertypename");

 //      var username = $.cookie("fd_username");

 //      $('#userinfo').html(username);
 //      $('#usertype').html("用户类型: "+ fd_usertypename);

 //      // 用户名
 //      $('#userinfo').html(username);
 //      // 设置用户类型
 //      $('#usertype').html("用户类型: "+ fd_usertypename);

 //      //显示安全退出
 //      $('#login_out').removeClass("hidden");

 //      if(fd_usertype == 0){
 //        $('#li_ClinicUser').removeClass("hidden");
 //      }else if(fd_usertype == 1){
 //        $('#li_AppRecoder').removeClass("hidden");
 //      }else if(fd_usertype == 2){
 //        $('#li_Admin').removeClass("hidden");
 //      }else{

 //      }
 //  }
 // else{
 //  //游客
 //    $.cookie("ilogin", 0);
 //    //显示HOME
 //    $('#li_home').removeClass("hidden");
 //    //显示搜索医生
 //    $('#li_SearchDoctor').removeClass("hidden");
 //    //设置用户类型
 //    $('#usertype').html("用户类型: 游客");
 //    //显示登陆注册
 //    $('#sign_in').removeClass("hidden");
 //    $('#sign_up').removeClass("hidden");
 //  }

  if(ilogin == 0){
    alert($("#Lang0019").html());//您未登陆,无法使用此功能
    history.go(-1);
    return false;
    // $('#a_userAppointmentRecoder').attr("href","#");
    // $('#a_userAppointmentRecoder').attr("color","#FF0000");
  }

  function GetDateStr(AddDayCount) 
  { 
    var dd = new Date(); 
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期 
    var y = dd.getFullYear(); 
    var m = (dd.getMonth()+1)<10?"0"+(dd.getMonth()+1):(dd.getMonth()+1);//获取当前月份的日期，不足10补0
    var d = dd.getDate()<10?"0"+dd.getDate():dd.getDate(); //获取当前几号，不足10补0
    return d+"-"+m+"-"+y; 
  }

  
  var d = new Date()
  var vYear = d.getFullYear();
  var vMon = d.getMonth() + 1;
  var vDay = d.getDate();
  // 两周后
  var vDay_14 = GetDateStr(14); 
  var h = d.getHours(); 
  var m = d.getMinutes(); 
  var se = d.getSeconds(); 
  var date_time=vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' '+(h<10 ? "0"+ h : h)+':'+(m<10 ? "0" + m : m)+':'+(se<10 ? "0" +se : se);
  var vDate_F= vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' 00:00';
  var vDate_T= vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' 23:59';
  var vDate_Today= (vDay<10 ? "0"+ vDay : vDay)+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+vYear;
  var vDate_Today_1= (vDay_14<10 ? "0"+ vDay_14 : vDay_14)+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+vYear;
  $("#begin_time").val(vDate_Today);
  $("#end_time").val(vDay_14);

  // appointment status loading pages
    func_code = "SP01";
    para="";

    json_str = request_const(para,func_code,0);

    // console.log(json_str);
    //请求
    result=true;
    $.ajax({
      type: "POST",
      url: "classes/class.getAppointmentStatus.php",
      dataType: "json",
      async:false,
      data: {
        request:json_str
      },
      success: function (msg) {
          // console.log(msg);
          var ret = msg.response;
          if(ret.success){
            if(json_str.sequ != ret.sequ){
              alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
              result=false;
            }
            // var data = ret.data[0];
            $.each(ret.data, function(i, item) {
                $("#app_status").append("<option value='"+ item.APPOINTMENT_STATUS_ID +"'>" + item.APPOINTMENT_STATUS + "</option>");
            });
            // console.log(data);
          }else{
            alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
            result=false;
          }
          
      },
      error: function(XMLHttpRequest, textStatus, errorThrown){
          //请求失败之后的操作
          var ret_code = "999999";
          var ret_msg = "Error,contact admin please!";
          alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
          result=false;
      }
    });
    if(!result){
      return result;
    }

  // var user_name = $.cookie("username_tmp");
  // // $("#UserName").addClass("fa fa-user fa-fw");
  // $("#UserName").text(user_name);
  var username,userid;

  if($.cookie("ilogin") == 1){

      //组织request para
      username = $.cookie("fd_username");
      userid = $.cookie("fd_userid");
  }else
  {
    
    alert($("#Lang0284").html());//您未登陆,无预约记录
    return false;
  }

  Date.prototype.Format = function (fmt) { //author: meizz
      var o = {
          "M+": this.getMonth() + 1, //月份
          "d+": this.getDate(), //日
          "h+": this.getHours(), //小时
          "m+": this.getMinutes(), //分
          "s+": this.getSeconds(), //秒
          "q+": Math.floor((this.getMonth() + 3) / 3), //季度
          "S": this.getMilliseconds() //毫秒
      };
     if (/(y+)/.test(fmt)) {
         fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
     }
     for (var k in o) {
         if (new RegExp("(" + k + ")").test(fmt)) {
             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
         }
     }
     return fmt;
  }

  func_code = "SP02";
  para={
    CUSTOMER_USER_ID: userid,
    CREATE_DATE_BEGIN:  $('#begin_time').val(),
    CREATE_DATE_END:  $('#end_time').val(),
    APPOINTMENT_STATUS_ID : $('#app_status').val()
  }

  json_str = request_const(para,func_code,0);

  // console.log(json_str);

  var _table = $('#dataTables-example').DataTable({
      // "responsive": true,
      "bPaginate": true,//分页按钮
      "bLengthChange": false,//每页显示记录数
      "bFilter": false,//搜索栏
      "scrollX": true,
      "sPaginationType": "full_numbers",
      "serverSide": true,
      "processing": true,
      "iDisplayLength": 10,  //确定选择每页展示个数列表和默认每页展示个数设置
      "iDisplayStart" : 0,
      "sort" : "position",
      "autoWidth": false,
      "retrieve": true,
      "destroy": false,
      "ordering": false,//全局禁用排序
      "deferRender":true,//延迟渲染
      "stateSave" : true, //在第三页刷新页面，会自动到第一页

      "ajax": {
      "type": "POST",
      "url": "classes/class.AppointmentRecoder.php",
      "dataType": "json",
      "async":false,
      "data":  function ( d ){
        d.request = json_str
      },
      dataSrc: function(json){
           json.draw = json.response.data.draw;
           json.recordsTotal = json.response.data.recordsTotal;
           json.recordsFiltered = json.response.data.recordsFiltered;
           console.log(json.response.data.data);
           return json.response.data.data;
        }
      },

      "columns": [
        {
          "class": "col_0_class",
          "data": null,
          "defaultContent": "<input type='checkbox' id='chk_list' name='chk_list'>"
        },
        { 
          "class": "col_2_class",
          "data": "CLINIC_NAME",
          render: function(data, type, row, meta) {
              //type 的值  dispaly sort filter
              //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
              //这里只处理了类型是显示的，过滤和排序返回原始数据
              if (type === 'display') {
                  if (data.length > 10) {
                      return '<span title="' + data + '">' + data.substr(0, 8) + '...</span>';
                  } else {
                    // console.log(data);
                      // return '<span title="' + data + '>' + data + '</span>';
                      return data;
                  }
              }
              return data;
          }
        },
        { 
          "data": "CLINIC_ADDR",
          render: function(data, type, row, meta) {
              //type 的值  dispaly sort filter
              //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
              //这里只处理了类型是显示的，过滤和排序返回原始数据
              if (type === 'display') {
                  if (data.length > 15) {
                      return '<span title="' + data + '">' + data.substr(0, 15) + '...</span>';
                  } else {
                    // console.log(data);
                      // return '<span title="' + data + '>' + data + '</span>';
                      return data;
                  }
              }
              return data;
          }
        },
        { 
          "data": "CLINIC_SUBURB"
        },
        { 
          "data": "STATE_NAME"
        },
        { 
          "data": "CLINIC_POSTCODE"
        },
        { 
          "data": "DOCTOR_TYPE",
          render: function(data, type, row, meta) {
              //type 的值  dispaly sort filter
              //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
              //这里只处理了类型是显示的，过滤和排序返回原始数据
              if (data === 'display') {
                  if (data.length > 10) {
                      return '<span title="' + data + '">' + data.substr(0, 8) + '...</span>';
                  } else {
                    // console.log(data);
                      // return '<span title="' + data + '>' + data + '</span>';
                      return data;
                  }
              }
              return data;
          }
        },
        { 
          "data": "DOCTOR_NAME" 
        },
        { 
          "data": "APPOINTMENT_DATE",
          render: function(data, type, row, meta) {
            var m_data = data + " " + row.APPOINTMENT_TIME
            return (new Date(m_data)).Format("dd-MM-yyyy hh:mm");
            // return (new Date(data)).Format("yyyy-MM-dd hh:mm:ss"); 
          }
        }, 
 /*       { 
          "data": "APPOINTMENT_TIME",
          render: function(data, type, row, meta) {
            // return (new Date(data)).Format("dd-MM-yyyy");
            return (new Date(data)).Format("hh:mm"); 
            // return data;
          }
        }, */
        { 
          // "class": "col_center_class",
          "data": "APPOINTMENT_STATUS",
          render: function(data, type, row, meta) {
              //type 的值  dispaly sort filter
              //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
              //这里只处理了类型是显示的，过滤和排序返回原始数据
              // console.log("render");
              // console.log(data);
              if (data === '已预约') {
                // console.log("render11");
                return '<span class="span-red">' + data + '</span>';
              }
              return data;
          }
        },
        {
          "visible": false,
          "data": "CUSTOMER_USER_ID"
        },
        {
          "visible": false,
          "data": "DOCTOR_ID"
        }
      ],
      "oLanguage": { "sUrl": datatable_lang_url },
//      "oLanguage": {
//         "oAria": {
//             "sSortAscending": " - click/return to sort ascending",
//             "sSortDescending": " - click/return to sort descending"
//         },
//         "sLengthMenu": "显示 _MENU_ 记录",
//         "sZeroRecords": "对不起，查询不到任何相关数据",
//         "sEmptyTable": "未有相关数据",
//         "sLoadingRecords": "正在加载数据-请等待...",
//         "sInfo": "当前显示 _START_ 到 _END_ 条,共 _TOTAL_ 条记录",
//         "sInfoEmpty": "当前显示0到0条，共0条记录",
//         "sInfoFiltered": "（数据库中共为 _MAX_ 条记录）",
//         "sProcessing": "<img src='../resources/user_share/row_details/select2-spinner.gif'/> 正在加载数据...",
//         "sSearch": "模糊查询：",
//         "sUrl": "",
//         //多语言配置文件，可将oLanguage的设置放在一个txt文件中，例：Javascript/datatable/dtCH.txt
//         "oPaginate": {
//             "sFirst": "首页",
//             "sPrevious": " << ",
//             "sNext": " >> ",
//             "sLast": " 尾页 "
//        }
//      },

      "columnDefs": [
        {
           "orderable": false,
           "targets": 0,
           "sWidth": "5%"
           
        },
        {
           "orderable": false,
           "targets": 1,
           "sWidth": "15%"
        },
        {
          "orderable": false,
          "targets": 2,
          // "sWidth": "15%"
        },
        {
          "orderable": false,
          "targets": 3,
          // "sWidth": "10px"
          "sWidth": "5%"
        },
        {
          "orderable": false,
          "targets": 4,
          "sWidth": "5%"
        },
        {
          "orderable": false,
          "targets": 5,
          "sWidth": "5%"
        },
        {
          "orderable": false,
          "targets": 6,
          "sWidth": "10%"
        },
        {
          "orderable": false,
          "targets": 7,
          "sWidth": "10%"
          // "sWidth": "500px"
        },
        {
          "orderable": false,
          "targets": 8,
          "sWidth": "10%"
          // "sWidth": "500px"
        },
        {
          "orderable": false,
          "targets": 9,
          "sWidth": "5%"
          // "sWidth": "500px"
        }
       ],//第一列与第二列禁止排序
      // "order": [
      //    [0, null]
      //    // [1, "desc"]
      // ],

      "dom": '<"top">rt<"table_bottom"ip<"#goon">><"clear">',


    initComplete: function(data){
      // $('#ok_id').append("<button id='btn_ok'>OK</button>");

      // // $('#btn_ok').on('click', function(){
      // //   alert("click me");
      // // });
      // $('#btn_ok').click(function(){
      //  alert("click me");
      // });
      // console.log(data);
      $.cookie("search_con", "");
      // console.log("加载完毕");
    }

  });

  // $("div#goon").html('<input type="number" min=1 name="jumpgo" id="jumpgo"/><button class="btn btn-default" id="btn_jumpgo">确认</button>');
  $("div.table_bottom").addClass('col-sm-12 col-md-12 col-lg-12');
  $("div#dataTables-example_info").addClass('col-sm-12 col-md-4 col-lg-3 pull-left');
  $("div#dataTables-example_paginate").addClass('col-sm-12 col-md-8 col-lg-9 pull-right');
  $("div#goon").addClass('col-sm-6 col-md-2');

  //单机行，选中复选框
  $('#dataTables-example tbody').on( 'click', 'tr', function (event) {
    $(this).toggleClass('selected');
    var p = this;
    $($(p).children()[0]).children().each(function(){
    if(this.type=="checkbox"){
        if(!this.checked){
          this.checked = true;
        }else{
          this.checked = false;
      }
    }
    });
  });

  //单机行，选中复选框
  $('#dataTables-example tbody').on( 'click', 'input', function (event) {
    if($(this).prop("checked")){
      $(this).closest("tr").addClass('selected');
    }else
    {
      $(this).closest("tr").removeClass('selected');
    }

    event.stopImmediatePropagation();
  });

  //全选
  $("#chk_all").click(function(){
    if($(this).prop("checked"))
    {
      $("input[name=chk_list]").closest("tr").addClass('selected');
    }else
    {
       $("input[name=chk_list]").closest("tr").removeClass('selected');
    }

    $("input[name=chk_list]").prop("checked",$(this).prop("checked"));
  });


  $('#search_ok').click(function(){
  
    var username,userid;

    if($.cookie("ilogin") == 1){

        //组织request para
        username = $.cookie("fd_username");
        userid = $.cookie("fd_userid");
    }else
    {
      
      alert($("#Lang0285").html());//您未登陆
    }

    func_code="SP02";
    para={
      "CUSTOMER_USER_ID": userid,
      "CREATE_DATE_BEGIN":  $('#begin_time').val(),
      "CREATE_DATE_END":  $('#end_time').val(),
      "APPOINTMENT_STATUS_ID" : $('#app_status').val()
    }

    json_str = request_const(para,func_code,0);

    // console.log(json_str);

    _table.ajax.reload();
    return false;
  });

  $('#btn_cancel').click(function(){
    var rows = $('tr.selected');
    var rowData = _table.rows(rows).data();
    
    var sel = rowData.length;
    if(!sel){
      
      alert($("#Lang0286").html());//请选择取消预约的数据
      return false;
    }else{

      BootstrapDialog.confirm($('#Lang0287').html(), function(result){
          if(result){
             //press OK
        	  var CUSTOMER_USER_ID = [];
        	    var DOCTOR_ID = [];
        	    var CREATE_DATE= [];

        	    $.each(rowData,function(key,value){
        	      CUSTOMER_USER_ID.push(value.CUSTOMER_USER_ID); 
        	      DOCTOR_ID.push(value.DOCTOR_ID); 
        	      CREATE_DATE.push(value.CREATE_DATE); 
        	    });


        	    func_code="AD02";
        	    para={
        	      action_type: "update",
        	      CUSTOMER_USER_ID: CUSTOMER_USER_ID,
        	      DOCTOR_ID: DOCTOR_ID,
        	      CREATE_DATE: CREATE_DATE
        	    }

        	    json_str = request_const(para,func_code,0);

        	    // console.log(json_str);

        	    //请求
        	    result = true;
        	    $.ajax({
        	      type: "POST",
        	      url: "classes/class.AppointmentRecoder.php",
        	      dataType: "json",
        	      async:false,
        	      data: {
        	        request:json_str
        	      },
        	      success: function (msg) {
        	          // console.log(msg);
        	          var ret = msg.response;
        	          if(ret.success){
        	            if(json_str.sequ != ret.sequ){
        	              alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
        	              result=false;
        	            }
        	            // var data = ret.data[0];
        	            // console.log(data);
        	            // $("input[name=chk_list]").closest("tr").removeClass('selected');
        	            // $('#app_status').eq(2).attr('checked', 'true');
        	            // $(":checkbox[id='"+app_status+"']").prop("checked",true);
        	            // return false;
        	            func_code="SP02";
        	            para={
        	              CUSTOMER_USER_ID: userid,
        	              CREATE_DATE_BEGIN:  $('#begin_time').val(),
        	              CREATE_DATE_END:  $('#end_time').val(),
        	              APPOINTMENT_STATUS_ID : $('#app_status').val()
        	            }

        	            json_str = request_const(para,func_code,0);

        	            _table.ajax.reload();

        	          }else{
        	            alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
        	            result=false;
        	          }
        	          
        	      },
        	      error: function(XMLHttpRequest, textStatus, errorThrown){
        	          //请求失败之后的操作
        	          var ret_code = "999999";
        	          var ret_msg = "Error,contact admin please!";
        	          alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
        	          result=false;
        	      }
        	    });
          }
      });

    }

    return false;
  });
  
  $('.form_datetime').datetimepicker({
    language:  'zh-CN',
    format: "dd-mm-yyyy",
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    minView: "month"
  });

});