var para,json_str;
var func_code,request_type;
var username,fd_userid,ilogin;
var result;

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

  // //登录cookie
  // var ilogin = $.cookie("ilogin");
  // if(ilogin == ""){
  //   request_type = 0;
  // }else if(ilogin != ""){
  //   request_type = 1;
  // }

  // //校验用户是否登录
  // ilogin = $.cookie("ilogin");
  // if(ilogin == 1)
  // {
  //    fd_userid = $.cookie("fd_userid");
  //   //校验用户是否登录
  //   var fd_usertype = $.cookie("fd_usertype");
  //   var fd_usertypename = $.cookie("fd_usertypename");

  //   var username = $.cookie("fd_username");

  //   $('#userinfo').html(username);
  //   $('#usertype').html("用户类型: "+ fd_usertypename);

  //   $('#sub_userinfo').removeClass("hidden");

  //   if(fd_usertype == 0){
  //     $('#li_ClinicUser').removeClass("hidden");
  //   }else if(fd_usertype == 1){
  //     $('#li_AppRecoder').removeClass("hidden");
  //   }else if(fd_usertype == 2){
  //     $('#li_Admin').removeClass("hidden");
  //   }else{

  //   }
  // }

  // if(ilogin == 0){

  //   alert($("#Lang0019").html());//您未登陆,无法使用此功能
  //   history.go(-1);
  //   return false;
  //   // $('#a_userAppointmentRecoder').attr("href","#");
  //   // $('#a_userAppointmentRecoder').attr("color","#FF0000");
  // }

  //填充州
  func_code = "SSTE";
  para="";

  json_str = request_const(para,func_code,0);

  // console.log(json_str);
  //请求
  result=true;
  $.ajax({
    type: "POST",
    url: "classes/class.getState.php",
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
              $("#STATE_ID").append("<option value='"+ item.STATE_ID +"'>" + item.STATE_NAME + "</option>");
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


  //填充医生类别
  func_code = "SDTY";
  para="";

  json_str = request_const(para,func_code,0);

  // console.log(json_str);
  //请求
  result=true;
  $.ajax({
    type: "POST",
    url: "classes/class.getDoctorType.php",
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
              $("#DOCTOR_TYPE").append("<option value='"+ item.DOCTOR_TYPE +"'>" + item.DOCTOR_TYPE + "</option>");
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

  func_code = "CU05";
  //form序列化成json
  json_form = $('#adminQryDoctor_form').serializeObject();

  //生成输入参数
  json_str = request_const(json_form,func_code,1);

  console.log(json_str);

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
      "url": "classes/class.ClinicOprDoctor.php",
      "dataType": "json",
      "async":false,
      "data":  function ( d ){
        d.request = json_str
      },
      dataSrc: function(json){
           json.draw = json.response.data.draw;
           json.recordsTotal = json.response.data.recordsTotal;
           json.recordsFiltered = json.response.data.recordsFiltered;

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
              var data_tmp = row.CLINIC_ADDR;
              console.log(data_tmp);
              if (type === 'display') {
                  if (data_tmp.length > 15) {
                      return '<span title="' + data_tmp + '">' + data_tmp.substr(0, 15) + '...</span>';
                  } else {
                    // console.log(data);
                    // return '<span title="' + data_tmp + '>' + data_tmp + '</span>';
                    return data_tmp;
                  }
              }
              return data_tmp;
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
          "data": "DOCTOR_GENDER",
          render: function(data, type, row, meta) {
              //type 的值  dispaly sort filter
              //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
              //这里只处理了类型是显示的，过滤和排序返回原始数据
              if (data === '0') {
                return 'male';
              }
              if (data === '1') {
                return 'female';
              }
              return data;
          }
        },
        {
          "data": "ACTIVE_STATUS",
          render: function(data, type, row, meta) {
              //type 的值  dispaly sort filter
              //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
              //这里只处理了类型是显示的，过滤和排序返回原始数据
              if (data === '0') {
                // console.log("render11");
                return '<span class="td-span-red">' + "inactive" + '</span>';
              }
              else if (data === '1') {
                // console.log("render11");
                return '<span>' + "active" + '</span>';
              }
              return data;
          }
        },
        { 
          "class": "col_center_class",
          "data": null,
          "defaultContent":"<button class='btn btn-primary btn-xs' id='opr_info'>"+$('#Lang0056').html() +"</button><button class='btn btn-danger btn-xs' id='opr_upd'>"+$('#Lang0057').html()+"</button>"
        	  
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
          "sWidth": "15%"
        },
        {
          "orderable": false,
          "targets": 3,
          "sWidth": "15%"
        },
        {
          "orderable": false,
          "targets": 4,
        },
        {
          "orderable": false,
          "targets": 5,
          "sWidth": "5%"
        },
        {
          "orderable": false,
          "targets": 6,
          "sWidth": "5%"
        }
       ],
      //第一列与第二列禁止排序
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
      // $.cookie("search_con", "");
      console.log("加载完毕");
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

  //单机行，中修改按钮
  $('#dataTables-example tbody').on( 'click', 'button', function (event) {
    var imgId = $(this).prop("id");
    var obj_data = _table.row($(this).parents('tr')).data();
    console.log(obj_data);
    var data = {
          imgId:imgId,
          CLINIC_NAME: obj_data.CLINIC_NAME,
          CLINIC_ADDR: obj_data.CLINIC_ADDR,
          DOCTOR_ID: obj_data.DOCTOR_ID,
          DOCTOR_NAME: obj_data.DOCTOR_NAME,
          DOCTOR_GENDER: obj_data.DOCTOR_GENDER,
          DOCTOR_TYPE: obj_data.DOCTOR_TYPE,
          APPOINTMENT_TIME: obj_data.APPOINTMENT_TIME,
          ACTIVE_STATUS: obj_data.ACTIVE_STATUS,
          DOCTOR_PHOTO: obj_data.DOCTOR_PHOTO,
          DOCTOR_INFO: obj_data.DOCTOR_INFO,
          STATE_NAME: obj_data.STATE_NAME,
          CLINIC_POSTCODE:obj_data.CLINIC_POSTCODE,
          CLINIC_SUBURB:obj_data.CLINIC_SUBURB
        };
    var str = JSON.stringify(data);

    sessionStorage.doctorinfo = str;

    window.location.href="adminUpdDoctorDetail.php"; 

    event.stopImmediatePropagation();
  });


  $('#search_ok').click(function(){

    func_code = "CU05";
    //form序列化成json
    json_form = $('#adminQryDoctor_form').serializeObject();

    //生成输入参数
    json_str = request_const(json_form,func_code,1);

    console.log(json_str);

    _table.ajax.reload();
    return false;
  });


  $('#btn_inactive').click(function(){
    var rows = $('tr.selected');
    var rowData = _table.rows(rows).data();
    
    var sel = rowData.length;
    if(!sel){
      
      alert($("#Lang0033").html());//请选择需要修改的数据
      return false;
    }else{

      BootstrapDialog.confirm($('#Lang0018').html(), function(result){
          if(result){
             //press OK
        	  var CLINIC_USER_ID = [];
        	    var DOCTOR_ID = [];

        	    $.each(rowData,function(key,value){
        	      CLINIC_USER_ID.push(fd_userid); 
        	      DOCTOR_ID.push(value.DOCTOR_ID); 
        	    });


        	    para={
        	      action_type: "update",
        	      ACTIVE_STATUS: 0,
        	      DOCTOR_ID: DOCTOR_ID
        	    }

        	    func_code = "CU06";
        	    json_str = request_const(para, func_code, request_type);

        	    console.log(json_str);

        	    //请求 
        	    result=true;
        	    $.ajax({
        	      type: "POST",
        	      url: "classes/class.ClinicOprDoctor.php",
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

        	            func_code = "CU05";
        	            //form序列化成json
        	            json_form = $('#adminQryDoctor_form').serializeObject();

        	            //生成输入参数
        	            json_str = request_const(json_form,func_code,1);

        	            console.log(json_str);

        	            _table.ajax.reload();
        	            $("#chk_all").prop("checked",false);

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
          }
      });
      
    }

    return false;
  });

  $('#btn_active').click(function(){
    var rows = $('tr.selected');
    var rowData = _table.rows(rows).data();
    
    var sel = rowData.length;
    if(!sel){
    	alert($("#Lang0033").html());//请选择需要修改的数据
      return false;
    }else{

      
      BootstrapDialog.confirm($('#Lang0018').html(), function(result){
          if(result){
             //press OK
        	  var CLINIC_USER_ID = [];
        	    var DOCTOR_ID = [];

        	    $.each(rowData,function(key,value){
        	      CLINIC_USER_ID.push(fd_userid); 
        	      DOCTOR_ID.push(value.DOCTOR_ID); 
        	    });

        	    // console.log(CLINIC_USER_ID);
        	    console.log(DOCTOR_ID);

        	    para={
        	      action_type: "update",
        	      ACTIVE_STATUS: 1,
        	      DOCTOR_ID: DOCTOR_ID
        	    }

        	    func_code = "CU06";
        	    json_str = request_const(para, func_code, request_type);

        	    console.log(json_str);

        	    //请求
        	    result=true;
        	    $.ajax({
        	      type: "POST",
        	      url: "classes/class.ClinicOprDoctor.php",
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

        	            func_code = "CU05";
        	            //form序列化成json
        	            json_form = $('#adminQryDoctor_form').serializeObject();

        	            //生成输入参数
        	            json_str = request_const(json_form,func_code,1);

        	            console.log(json_str);

        	            _table.ajax.reload();

        	            $("#chk_all").prop("checked",false);

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
          }
      });
    
    }


    return false;
  });

  
});