var para,json_str;
var func_code,request_type;
var username,fd_userid,ilogin;
var result;

$(document).ready(function() {

//登录cookie
  var ilogin = $.cookie("ilogin");
  if(ilogin == ""){
    request_type = 0;
  }else if(ilogin != ""){
    request_type = 1;
  }

  //校验用户是否登录
  ilogin = $.cookie("ilogin");
  if(ilogin == 1)
  {
    fd_userid = $.cookie("fd_userid");
    
    var fd_usertype = $.cookie("fd_usertype");
    var fd_usertypename = $.cookie("fd_usertypename");

    var username = $.cookie("fd_username");

    $('#userinfo').html(username);
    $('#usertype').html($('#Lang0311').html()+": "+ fd_usertypename);

    
    $('#sub_userinfo').removeClass("hidden");

    // // $('#li_home').hide();
    // $('#li_home').addClass('show');

    // // $('#li_SearchDoctor').hidden();

    if(fd_usertype == 0){
      $('#li_ClinicUser').removeClass("hidden");
    }else if(fd_usertype == 1){
      $('#li_AppRecoder').removeClass("hidden");
    }else if(fd_usertype == 2){
      $('#li_Admin').removeClass("hidden");
    }else{

    }
  }

  if(ilogin == 0){
    alert("您未登陆,无法使用此功能");
    history.go(-1);
    return false;
    // $('#a_userAppointmentRecoder').attr("href","#");
    // $('#a_userAppointmentRecoder').attr("color","#FF0000");
  }
  
  func_code = "0000";
  para="";
  
  json_str = request_const(para, func_code, 0);

  var _table = $('#dataTables-example').DataTable({
      // "responsive": true,
      "bPaginate": true,//分页按钮
      "bLengthChange": false,//每页显示记录数
      "bFilter": true,//搜索栏
      "scrollX": true,
      "sPaginationType": "full_numbers",
      "serverSide": false,
      "processing": true,
      "iDisplayLength": 12,  //确定选择每页展示个数列表和默认每页展示个数设置
      // "iDisplayStart" : 0,
      "sort" : "position",
      "autoWidth": false,
      "retrieve": true,
      "destroy": false,
      "ordering": false,//全局禁用排序
      "deferRender":true,//延迟渲染
      "stateSave" : true, //在第三页刷新页面，会自动到第一页
      "bAutoWidth": false,

      "ajax": {
      "type": "POST",
      "url": "classes/class.Service.php",
      "dataType": "json",
      "async":false,
      "data":  function ( d ){
        d.request = json_str
      },
      dataSrc: function(json){
           // json.draw = json.response.data.draw;
           // json.recordsTotal = json.response.data.recordsTotal;
           // json.recordsFiltered = json.response.data.recordsFiltered;

           return json.response.data;
        }
      },

      "columns": [
        {
          "class": "col_0_class",
          "data": null,
          "defaultContent": "<input type='checkbox' id='chk_list' name='chk_list'>"
        },
        { 
          "data": "SERVICE_ID"
        },
        { 
          "data": "DES"
        },
        { 
          "data": "SERVICE_JS"
        },
        { 
          "data": "URL"
        },
        { 
          "class": "text-left",
          "data": "INPUT_PARA",
          render: function(data, type, row, meta) {
              //type 的值  dispaly sort filter
              //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
              //这里只处理了类型是显示的，过滤和排序返回原始数据
              if (type === 'display') {
                  if (data.length > 100) {
                      return '<span title="' + data + '">' + data.substr(0, 100) + '...</span>';
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
          "data": "OUTPUT_PARA"
        },
        { 
          "data": "NOTE"
        }
      ],

      "oLanguage": {
         "oAria": {
             "sSortAscending": " - click/return to sort ascending",
             "sSortDescending": " - click/return to sort descending"
         },
         "sLengthMenu": "显示 _MENU_ 记录",
         "sZeroRecords": "对不起，查询不到任何相关数据",
         "sEmptyTable": "未有相关数据",
         "sLoadingRecords": "正在加载数据-请等待...",
         "sInfo": "当前显示 _START_ 到 _END_ 条,共 _TOTAL_ 条记录",
         "sInfoEmpty": "当前显示0到0条，共0条记录",
         "sInfoFiltered": "（数据库中共为 _MAX_ 条记录）",
         "sProcessing": "<img src='../resources/user_share/row_details/select2-spinner.gif'/> 正在加载数据...",
         "sSearch": "模糊查询：",
         "sUrl": "",
         //多语言配置文件，可将oLanguage的设置放在一个txt文件中，例：Javascript/datatable/dtCH.txt
         "oPaginate": {
             "sFirst": "首页",
             "sPrevious": " << ",
             "sNext": " >> ",
             "sLast": " 尾页 "
        }
      },

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
          "sWidth": "15%"
        },
        {
          "orderable": false,
          "targets": 5,
        },
        {
          "orderable": false,
          "targets": 6,
          "sWidth": "15%"
        }
       ],
      //第一列与第二列禁止排序
      // "order": [
      //    [0, null]
      //    // [1, "desc"]
      // ],

      "dom": 'l<"top">rft<"table_bottom"ip<"#goon">><"clear">',

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
      // console.log("加载完毕");
    }

  });
  $("div.top").html('<a class="btn btn-primary" href="adminQryClinic.php"><span class="glyphicon  glyphicon-arrow-left"> 主页</span></a>');
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

  // //单机行，中修改按钮
  // $('#dataTables-example tbody').on( 'click', 'button', function (event) {
  //   var imgId = $(this).prop("id");
  //   var obj_data = _table.row($(this).parents('tr')).data();
  //   console.log(obj_data);
  //   var data = {
  //         imgId:imgId,
  //         CLINIC_NAME: obj_data.CLINIC_NAME,
  //         CLINIC_ADDR: obj_data.CLINIC_ADDR,
  //         CLINIC_USER_ID: obj_data.CLINIC_USER_ID,
  //         CLINIC_USER_MAIL: obj_data.CLINIC_USER_MAIL,
  //         CLINIC_USER_NAME: obj_data.CLINIC_USER_NAME,
  //         ACTIVE_STATUS: obj_data.ACTIVE_STATUS,
  //       };

  //   if(imgId == "opr_reset_pwd"){
  //     //发送邮件到地址 
  //     var reset_pwd = Math.floor(Math.random()*1000000);
  //     var email_text = "您的新密码:" + reset_pwd;
  //     alert(obj_data.CLINIC_USER_MAIL +" pwd:"+ reset_pwd);
  //     //发送邮件 begin

  //     //发送邮件 end

  //     //修改密码


  //     return false;
  //   }

  //   var str = JSON.stringify(data);

  //   // console.log(str);
  //   sessionStorage.userinfo = str;

  //   window.location.href="adminUpdClinicInfo.php"; 

  //   event.stopImmediatePropagation();
  // });


  
});