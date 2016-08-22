
$(function(){

	var serviceid = "SD01";
	var requesttype = 0;

	var search_con = $.cookie("search_con");

    // $.cookie("func_data", "");


	var request_const=function(para){
		var sequ = Math.floor(Math.random()*1000);
		var systemid = "WEB001";
		var projectid = "FDP001";
		var uid = 1;
		var token = "";
		var para = para;
		var reqStr = {
			"serviceid":serviceid,
			"sequ":sequ,
			"systemid":systemid,
			"projectid":projectid,
			"uid":uid,
			"token":token,
			"requesttype":requesttype,
			"para":para
		};
		return reqStr;
	};

	//form序列化为json
	$.fn.serializeObject = function()    
	{    
		var o = {};    
		var a = this.serializeArray();    
		$.each(a, function() {    
			if (o[this.name]) {    
			    if (!o[this.name].push) {    
			         o[this.name] = [o[this.name]];    
			     }    
			    o[this.name].push(this.value || '');    
			 	}else {    
			    o[this.name] = this.value || '';    
		 	}    
		});    
		return o;    
	}; 

	//form序列化成json
   	var json_form = $("#modal_form").serializeObject();
	//生成输入参数
	var json_str = request_const(json_form);

	json_str.para.CLINIC_ADDR=search_con;
	json_str.para.CLINIC_NAME=search_con;
	json_str.para.DOCTOR_TYPE=search_con;
	json_str.para.DOCTOR_NAME=search_con;
	json_str.para.APPOINTMENT_TIME=search_con;

	console.log(json_str);
	json_stringify=JSON.stringify(json_str);
	console.log("123");
	console.log(json_stringify);
	$('#json_str1').val();
	$('#json_str1').val(json_stringify.replace(/[ ]/g,""));

   	var _table = $('#dataTables-example').DataTable({
	   	// "responsive": true,
		"bPaginate": true,//分页按钮
	    "bLengthChange": false,//每页显示记录数
	    "bFilter": false,//搜索栏
	    "scrollX": false,
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

	    "ajax": {
			"type": "POST",
			"url": "classes/class.searchDoctor.php",
			"dataType": "json",
			"data":  function ( d ){
				d.request = JSON.parse($('#json_str1').val());
		 		// request:json_str
		 	},
			// "data": function ( d ) {
			// 	d.CLINIC_ADDR = $('#CLINIC_ADDR').val();
			// 	d.CLINIC_USER_NAME =  $('#CLINIC_USER_NAME').val();
			// 	d.DOCTOR_TYPE =  $('#DOCTOR_TYPE').val();
			// 	d.DOCTOR_NAME =  $('#DOCTOR_NAME').val();
			// 	d.APPOINTMENT_TIME =  $('#APPOINTMENT_TIME').val();
			// 	d.DISTANCE =  $('#DISTANCE').val();
			// },
			// "data":"",
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
	        "class": "col_1_class",
	        "data": null,
	        // "width": "200px",
            "title": "头像",
            render: function (data, type, row, meta) {
                 //这里是主题  把url变成超链接、把图片路径显示为图片
                //return "<a href='" + data + "'>" + data + "</a>";
                // console.log(row.DOCTOR_PHOTO);
                return "<img style='width:50px; hegith:50px' src='img/" + data.DOCTOR_PHOTO + "' />";

            }

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
	        "data": "DOCTOR_TYPE" 
	      },
	      { 
	        "data": "DOCTOR_NAME" 
	      },
	      { 
	      	"class": "wordwrap ellipsis",
	       	"data": "APPOINTMENT_TIME" ,
	       	render: function(data, type, row, meta) {
	            //type 的值  dispaly sort filter
	            //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
	            //这里只处理了类型是显示的，过滤和排序返回原始数据
	            if (type === 'display') {
	                if (data.length > 30) {
	                    return '<span title="' + data + '">' + data.substr(0, 28) + '...</span>';
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
	        // "sWidth": "10px"
	        "sWidth": "15%"
	      },
	      {
	      	"orderable": false,
	        "targets": 4,
	        "sWidth": "10%"
	      },
	      {
	      	"orderable": false,
	        "targets": 5,
	        "sWidth": "10%"
	      },
	      {
	      	"orderable": false,
	        "targets": 6,
	        "sWidth": "500px"
	      },
	      {
	      	"orderable": false,
	        "targets": 7,
	        "sWidth": "8%"
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
			// // 	alert("click me");
			// // });
			// $('#btn_ok').click(function(){
			// 	alert("click me");
			// });
			// console.log(data);
			$.cookie("search_con", "");
			console.log("加载完毕");
		}

	});

	$("div#goon").html('<input type="number" min=1 name="jumpgo" id="jumpgo"/><button class="btn btn-default" id="btn_jumpgo">确认</button>');
	$("div.table_bottom").addClass('col-sm-12 col-md-12');
	$("div#dataTables-example_info").addClass('col-sm-12 col-md-3 pull-left');
	$("div#dataTables-example_paginate").addClass('col-sm-6 col-md-7 pull-left');
	$("div#goon").addClass('col-sm-6 col-md-2');

 //   // 添加索引列
	// _table.on('order.dt search.dt',
	// 	function() {
	// 	_table.column(1, {
	// 		search: 'applied',
	// 		order: 'applied'
	// 	}).nodes().each(function(cell, i) {
	// 		cell.innerHTML = i + 1;
	// 	});
	// }).draw();

	//  // 添加索引列
	// _table.on('',
	// 	function() {
	// 	_table.column(1).nodes().each(function(cell, i) {
	// 		cell.innerHTML = i + 1;
	// 	});
	// }).draw();

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

	

	$('#btn_jumpgo').click(function(){
		var jump = $('#jumpgo').val();
		// console.log("跳转"+jump);
		if(jump == ""){
			alert("请输入跳转页面");
			return;
		}

		// var url = _table.ajax.url("json/data_person_2.json").load();

		// $.ajax({
  //         type: "POST",
  //         url: "classes/class.signup.php",
  //         dataType: "json",
  //         data:  {
  //           request:json_str
  //         },
  //         success: function (msg) {
  //             var ret = msg.response;
  //             // alert("js:"+ ret.msg);
  //             if(ret){
  //               if(ret.result== 2){
  //                 alert(ret.msg);
  //                 return;
  //               }
  //               //alert(msg.response.msg);
  //               window.location.href="sign_in.html";
  //               //_table.ajax.reload();
  //               //window.location.reload()
  //             }else{
  //               alert("添加失败!" + ret.msg);
  //             }
              
  //         },
  //         error: function(XMLHttpRequest, textStatus, errorThrown){
  //           //请求失败之后的操作
  //           alert("ajax添加失败!" + textStatus);
  //           // alert(XMLHttpRequest.status);
  //           // alert(XMLHttpRequest.readyState);
  //        }
  //     });

		$.ajax({
				"type": "POST",
				"url": "classes/class.searchDoctor.php",
				"dataType": "json",
				"data": function ( d ) {
					// d.CLINIC_ADDR = $('#CLINIC_ADDR').val();
					// d.CLINIC_USER_NAME =  $('#CLINIC_USER_NAME').val();
					// d.DOCTOR_TYPE =  $('#DOCTOR_TYPE').val();
					// d.DOCTOR_NAME =  $('#DOCTOR_NAME').val();
					// d.APPOINTMENT_TIME =  $('#APPOINTMENT_TIME').val();
					// d.DISTANCE =  $('#DISTANCE').val();
				},
				success: function (msg) {
					// console.log("btn_searchdoctor");
					// console.log(msg);
					var ret = msg.response;
					// var ret_1 = ret.result;
					// console.log(ret);
					// if(sequ != ret.sequ){
					// 	alert("时序号错误请联系管理员ret. sequ=" + ret.sequ +",sequ="+ sequ);
					// }
					// if(ret.success){
					// 	_table.ajax.reload();
					// 	$('#myModal').modal('hide')
					// }else{
					// 	alert("搜索医生失败!" + ret.status.ret_code + ret.status.ret_msg);
					// }
					//封装返回数据，这里仅演示了修改属性名
                    var returnData = {};
                    returnData.draw = ret.data.draw;//这里直接自行返回了draw计数器,应该由后台返回
                    returnData.recordsTotal = ret.data.recordsTotal;
                    returnData.recordsFiltered = ret.data.recordsFiltered;//后台不实现过滤功能，每次查询均视作全部结果
                    returnData.data = ret.data.data;
                    
                    _table.ajax.reload();
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					//请求失败之后的操作
					alert("ajax搜索医生失败!" + textStatus);
					// alert(XMLHttpRequest.status);
					// alert(XMLHttpRequest.readyState);
				}
		    });

		// var _table = $('#dataTables-example').DataTable({
		// 	"destroy": false,
	 // 		"ajax": {
		// 		"type": "POST",
		// 		"url": "classes/class.searchDoctor.php",
		// 		"dataType": "json",
		// 		"data": function ( d ) {
		// 			// d.CLINIC_ADDR = $('#CLINIC_ADDR').val();
		// 			// d.CLINIC_USER_NAME =  $('#CLINIC_USER_NAME').val();
		// 			// d.DOCTOR_TYPE =  $('#DOCTOR_TYPE').val();
		// 			// d.DOCTOR_NAME =  $('#DOCTOR_NAME').val();
		// 			// d.APPOINTMENT_TIME =  $('#APPOINTMENT_TIME').val();
		// 			// d.DISTANCE =  $('#DISTANCE').val();
		// 		},
		// 		// "data":"",
		// 		dataSrc: function(json){
		// 			   json.draw = json.response.data.draw;
		// 			   json.recordsTotal = json.response.data.recordsTotal;
		// 			   json.recordsFiltered = json.response.data.recordsFiltered;

		// 			   return json.response.data.data;
		// 			}
		//     }
		// });


	});

	$('#btn_search').on('click', function (){
		//form序列化成json
       	json_form = $("#modal_form").serializeObject();
       	requesttype = 1;
		//生成输入参数
		json_str = request_const(json_form);
      	//alert(JSON.stringify(json_str));
      	json_stringify=JSON.stringify(json_str);
      	
      	console.log("json_str");
      	console.log(json_str);
      	var sequ = json_str.sequ;

      	serviceid="123";
      	console.log("serviceid");
      	console.log(serviceid);

		console.log("456");
		console.log(json_stringify.replace(/[ ]/g,""));

		$('#json_str1').val();
      	$('#json_str1').val(json_stringify.replace(/[ ]/g,""));
      	_table.ajax.reload();
      	$('#myModal').modal('hide')
		// alert($("#modal_form").serialize());
		
		// var _table = $('#dataTables-example').DataTable({
 	// 		// destroy: true,
		// 	ajax: {
		// 		type: "POST",
		// 		url: "classes/class.searchDoctor.php",
		// 		dataType: "json",
		// 		data:  {
		// 			request:json_str
		// 		},
		// 		dataSrc: function(json){
		// 		   json.draw = json.response.data.draw;
		// 		   json.recordsTotal = json.response.data.recordsTotal;
		// 		   json.recordsFiltered = json.response.data.recordsFiltered;

		// 		   return json.response.data.data;
		// 		},
		// 		success: function (msg) {
		// 			// console.log("btn_searchdoctor");
		// 			// console.log(msg);
		// 			var ret = msg.response;
		// 			// var ret_1 = ret.result;
		// 			// console.log(ret);
		// 			if(sequ != ret.sequ){
		// 				alert("时序号错误请联系管理员ret. sequ=" + ret.sequ +",sequ="+ sequ);
		// 			}
		// 			if(ret.success){
		// 				_table.ajax.reload();
		// 				$('#myModal').modal('hide')
		// 			}else{
		// 				alert("搜索医生失败!" + ret.status.ret_code + ret.status.ret_msg);
		// 			}
		// 		},
		// 		error: function(XMLHttpRequest, textStatus, errorThrown){
		// 			//请求失败之后的操作
		// 			alert("ajax搜索医生失败!" + textStatus);
		// 			// alert(XMLHttpRequest.status);
		// 			// alert(XMLHttpRequest.readyState);
		// 		}
	 //      	}
	 //    });
	});
	$('#btn_reset').on('click', function (){
		$('#modal_form')[0].reset();
	});

});