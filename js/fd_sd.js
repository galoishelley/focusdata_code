
$(function(){

   var _table = $('#dataTables-example').DataTable({
   	responsive: true,
	bPaginate: true,//分页按钮
    bLengthChange: false,//每页显示记录数
    bFilter: false,//搜索栏
    bSort: true,//排序
    scrollX: true,
    sPaginationType: "full_numbers",
    iDisplayLength: 12,  //确定选择每页展示个数列表和默认每页展示个数设置

    ajax: {
      type: "POST",
      url: "classes/class.searchDoctor.php",
    },

    columns: [
      {
        class: "col_0_class",
        data: null,
        defaultContent: "<input type='checkbox' id='chk_list' name='chk_list'>"
      },
      { 
        class: "col_1_class",
        data: null

      },
      { 
        class: "col_2_class",
        data: "CLINIC_NAME" 
      },
      { 
        data: "CLINIC_ADDR" 
      },
      { 
        data: "DOCTOR_TYPE" 
      },
      { 
        data: "DOCTOR_NAME" 
      },
      { 
        // "class": "col_hiden_class",
       data: "APPOINTMENT_TIME" 
      }, 
      { 
        class: "col_center_class",
        data: null,
        defaultContent:"<img src='img/details.png'>"
      },
      { 
       	visible: false,
        data: "DOCTOR_PHOTO" 
      },
      { 
        visible: false,
        data: "DOCTOR_INFO" 
      }
    ],

    oLanguage: {
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

    columnDefs: [
      {
         orderable: false,
         targets: 0,
         sWidth: "5%"
         
      },
      {
         orderable: false,
         targets: 1,
         sWidth: "5%"
      },
      {
        orderable: false,
        targets: 2,
        sWidth: "15%"
      },
      {
      	orderable: false,
        targets: 3,
        sWidth: "15%"
      },
      {
      	orderable: false,
        targets: 4,
        sWidth: "10%"
      },
      {
      	orderable: false,
        targets: 5,
        sWidth: "10%"
      },
      {
      	orderable: false,
        targets: 6
      },
      {
      	orderable: false,
        targets: 7,
        sWidth: "8%"
      }
     ],//第一列与第二列禁止排序
    order: [
       [0, null]
       // [1, "desc"]
    ],
    dom: '<"top">rt<"table_bottom"ip<"#goon">><"clear">'
});

	$("div#goon").html('<input type="text" name="jumpgo" id="jumpgo" placeholder="跳转"/><button class="btn btn-default" id="btn_jumpgo">确认</button>');
	$("div.table_bottom").addClass('col-sm-12 col-md-12');
	$("div#dataTables-example_info").addClass('col-sm-12 col-md-3 pull-left');
	$("div#dataTables-example_paginate").addClass('col-sm-6 col-md-7 pull-left');
	$("div#goon").addClass('col-sm-6 col-md-2');

   // 添加索引列
	_table.on('order.dt search.dt',
		function() {
		_table.column(1, {
			search: 'applied',
			order: 'applied'
		}).nodes().each(function(cell, i) {
			cell.innerHTML = i + 1;
		});
	}).draw();

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
	// alert(obj_data.CLINIC_NAME);
	var data = {
	      CLINIC_NAME: obj_data.CLINIC_NAME,
	      CLINIC_ADDR: obj_data.CLINIC_ADDR,
	      DOCTOR_NAME: obj_data.DOCTOR_NAME,
	      DOCTOR_TYPE: obj_data.DOCTOR_TYPE,
	      APPOINTMENT_TIME: obj_data.APPOINTMENT_TIME,
	      DOCTOR_PHOTO: obj_data.DOCTOR_PHOTO,
	      DOCTOR_INFO: obj_data.DOCTOR_INFO
	    };
	var str = JSON.stringify(data);

	$.cookie("goto_data", str);
	window.location.href="searchDoctorDetails.html"; 

	event.stopImmediatePropagation();
	});

	// $('#myModal').on('shown.bs.modal', function () {
	//   $('#myInput').focus()
	// })


});