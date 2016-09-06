
$(function(){

   var _table = $('#dataTables-example').DataTable({
    "bDestroy": true,
    "responsive": true,
    "bPaginate": true,//分页按钮
    "bLengthChange" : false,//每行显示记录数
    "bFilter": false,//搜索栏
    "bSort": true,//排序
    "bInfo": true,//Showing 1 to 10 of 23 entries 总记录数没也显示多少等信息
    "bAutoWidth": false,
    "bDeferRender": true,
    "bSortClasses": false,
    // "sPaginationType": "full_numbers", //用于指定分页器风格
    "sPaginationType": "full_numbers",
    //"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
    "iDisplayLength": 10,  //确定选择每页展示个数列表和默认每页展示个数设置
    "iDisplayStart" : 0,
    "bProcessing" : true,
    "bServerSide" : true,
    "scrollY":200,
    "deferRender":true,
    "scroller":true,
    "cache" : false,  //禁用缓存
    // "stripeClasses": ["odd", "even"],
    // "sScrollXInner": "110%",
    // "bScrollCollapse": true,
    // "pagingType": "scrolling",
     // "sPaginationType": "jPaginator",
    //"serverSide": true,
    // bProcessing: true,
    // bScrollInfinite: true,
    // bSortClasses: false, //不清楚是做什么用的，如果处理大量数据时，必须关闭

    // "sScrollX": true,
    //bScrollCollapse: true,

    // sScrollY: "200px",
    // bPaginate: false,
    // "ajax": {
    //   url: "../ajax/data/role.json",
    // },
    "ajax": {
      //url: "../ajax/data/role_demo.json",
      "type": "POST",
      "url": "classes/class.searchDoctor.php",
      "dataType": "json",
      "data": function ( d ) {
          d.CLINIC_ADDR = $('#CLINIC_ADDR').val();
          d.CLINIC_USER_NAME =  $('#CLINIC_USER_NAME').val();
          d.DOCTOR_TYPE =  $('#DOCTOR_TYPE').val();
          d.DOCTOR_NAME =  $('#DOCTOR_NAME').val();
          d.APPOINTMENT_TIME =  $('#APPOINTMENT_TIME').val();
          d.DISTANCE =  $('#DISTANCE').val();
      }
    },
    // "ajax": "../classes/class.b_roles.php", 
    // "order": "",
    "columns": [
      {
        "class": "details-control",
        "data": null
      },
      {
        "class": "col_0_class",
        "data": null,
        "defaultContent": "<input type='checkbox' id='chk_list' name='chk_list'>"
      },
      { 
        "class": "col_2_class",
        "data": null 

      },
      { 
        "class": "col_3_class",
        "data": "CLINIC_NAME" 
      },
      { 
        "data": "CLINIC_ADDR" 
      },
      { 
        "data": "DOCTOR_NAME" 
      },
      { 
        "data": "DOCTOR_TYPE" 
      },
      // { 
      //   // "class": "col_hiden_class",
      //   "data": "APPOINTMENT_TIME" 
      // }, 
      { 
        "class": "col_center_class",
        "data": null,
        "defaultContent":"<img src='img/details.png'>"
      },
      { 
        "visible": false,
        "data": "DOCTOR_PHOTO" 
      },
      { 
        "visible": false,
        "data": "DOCTOR_INFO" 
      },
      { 
        "visible": false,
        "data": "DOCTOR_ID" 
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
         "sWidth": "5%"
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
         // "sWidth": "30%"
      },
      {
        "orderable": false,
         "targets": 4,
         "sWidth": "15%"
         // "sWidth": "30%"
      },
      {
        "orderable": false,
         "targets": 5,
         "sWidth": "15%"
         // "sWidth": "30%"
      },
      {
        "orderable": false,
         "targets": 6,
         "sWidth": "8%"
         // "sWidth": "20px"
      }
      // },
      // {
      //   "orderable": false,
      //    "targets": 7,
      //    "sWidth": "8%"
      // }
     ],//第一列与第二列禁止排序
    "order": [
       [0, null],
       [1, "desc"]
    ],

   //  // set the initial value
   // "fnCreatedRow": function(nRow, aData, iDataIndex) {
   //     // $('td:eq(0)', nRow).html("<span class='row-details row-details-close' data_id='" + aData[1] + "'></span>&nbsp;" + aData[0]);
   //     $('td:eq(0)', nRow).html("<span class='row-details row-details-close' data_id='" + "hello" + "'></span>&nbsp;" + "world");
   // },

    "dom": '<"top">rt<"table_bottom"ip<"#goon">><"clear">'
  });

  $("div#goon").html('<input type="number" min=1 max=9 name=""><input type="number" min=1 max=9 name="jumpgo" id="jumpgo"/><button class="btn btn-default" id="btn_jumpgo">确认</button>');
  $("div.table_bottom").addClass('col-sm-12 col-md-12');
  $("div#dataTables-example_info").addClass('col-sm-12 col-md-3 pull-left');
  $("div#dataTables-example_paginate").addClass('col-sm-6 col-md-7 pull-left');
  $("div#goon").addClass('col-sm-6 col-md-2');

  //添加索引列
  _table.on('order.dt search.dt',
    function() {
        _table.column(2, {
            search: 'applied',
            order: 'applied'
        }).nodes().each(function(cell, i) {
            cell.innerHTML = i + 1;
        });
    }).draw();

  $('#search_ok').click(function(){
    _table.ajax.reload();
    event.preventDefault();
  });

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

  //单机行，中修改按钮
  $('#dataTables-example tbody').on( 'click', 'img', function (event) {
    var imgId = $(this).prop("id");
    var obj_data = _table.row($(this).parents('tr')).data();
    console.log(obj_data.DOCTOR_ID);
    var data = {
          CLINIC_NAME: obj_data.CLINIC_NAME,,

          CLINIC_ADDR: obj_data.CLINIC_ADDR,
          DOCTOR_ID: obj_data.DOCTOR_ID,
          DOCTOR_NAME: obj_data.DOCTOR_NAME,
          DOCTOR_TYPE: obj_data.DOCTOR_TYPE,
          APPOINTMENT_TIME: obj_data.APPOINTMENT_TIME,
          DOCTOR_PHOTO: obj_data.DOCTOR_PHOTO          DOCTOR_INFO: obj_data.DOCTOR_INFO
        };
    var str = JSON.stringify(data);

    $.cookie("goto_data", str);
    window.location.href="searchDoctorDetails.html"; 

    event.stopImmediatePropagation();
  });

   $('.table').on('click', ' tbody td .row-details',
     function() {
         var nTr = $(this).parents('tr')[0];
         if (oTable.fnIsOpen(nTr)) //判断是否已打开
         {
             /* This row is already open - close it */
             $(this).addClass("row-details-close").removeClass("row-details-open");
             oTable.fnClose(nTr);
         } else {
             /* Open this row */
             $(this).addClass("row-details-open").removeClass("row-details-close");
             //  alert($(this).attr("data_id"));
             //oTable.fnOpen( nTr,
             // 调用方法显示详细信息 data_id为自定义属性 存放配置ID
             fnFormatDetails(nTr, $(this).attr("data_id"));
         }
     });

  
  $('.form_datetime').datetimepicker({
    // language:  'zh-CN',
    format: "yyyy-mm-dd",
    // weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    // forceParse: 0,
    minView: "month" 
  });


	var str = $.cookie("search_doctor_con");
  //处理浏览 修改
  if(str != ""){
    var json_value = JSON.parse(str);
    $("#clinicarea").val(json_value.clinicarea);
    $("#clinicname").val(json_value.clinicname);
    $("#doctortype").val(json_value.doctortype);
    $("#doctorname").val(json_value.doctorname);
    $("#apptime").val(json_value.apptime);
    $("#distance").val(json_value.distance);
  }

});