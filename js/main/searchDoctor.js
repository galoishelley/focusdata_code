var json_form,json_str;
var requesttype = 0;
var func_code,result;

$(function(){

	var d = new Date()
	var vYear = d.getFullYear()
	var vMon = d.getMonth() + 1
	var vDay = d.getDate()
	var h = d.getHours(); 
	var m = d.getMinutes(); 
	var se = d.getSeconds(); 
	var date_time=vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' '+(h<10 ? "0"+ h : h)+':'+(m<10 ? "0" + m : m)+':'+(se<10 ? "0" +se : se);
	var vDate_F= vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' 00:00';
	var vDate_T= vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' 23:59';
	var vDate_Today= vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay);

	$("#APPOINTMENT_DATE_BEGIN").val(date_time);
	$("#APPOINTMENT_DATE_END").val(vDate_T);
	
	var ilogin = $.cookie("ilogin");

	$('#btn_out').click(function(){
		$.cookie("ilogin", "");
		// $('#userinfo').html();
		window.location.href="index.php"; 

		if ($.cookie("fd_rmbUser") == "false") {
		  $.cookie("fd_userid", "");
		  $.cookie("fd_username", "");
		  $.cookie("fd_password", "");
		  $.cookie("fd_usertype", "");
		}

	});

	if(ilogin == 1)
	{
		var fd_userid = $.cookie("fd_userid");
	    var fd_usertype = $.cookie("fd_usertype");
	    var fd_usertypename = $.cookie("fd_usertypename");

	    var username = $.cookie("fd_username");

	    $('#userinfo').html(username);
	    $('#usertype').html("用户类型: "+ fd_usertypename);

	    // 用户名
	    $('#userinfo').html(username);
	    // 设置用户类型
	    $('#usertype').html("用户类型: "+ fd_usertypename);

		//显示安全退出
		$('#login_out').removeClass("hidden");

	    if(fd_usertype == 0){
	      $('#li_ClinicUser').removeClass("hidden");
	    }else if(fd_usertype == 1){
	      $('#li_AppRecoder').removeClass("hidden");
	    }else if(fd_usertype == 2){
	      $('#li_Admin').removeClass("hidden");
	    }else{

	    }
		$('#CUSTOMER_USER_ID').val(fd_userid);
		$('#btn_save').show();
	}else{
		//游客
	    $.cookie("ilogin", 0);
	    //显示HOME
	    $('#li_home').removeClass("hidden");
	    //显示搜索医生
  		$('#li_SearchDoctor').removeClass("hidden");
  		//设置用户类型
  		$('#usertype').html("用户类型: 游客");
  		//显示登陆注册
  		$('#sign_in').removeClass("hidden");
  		$('#sign_up').removeClass("hidden");
	}

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
	          $("#STATE_ID").append("<option value='"+ item.STATE_NAME +"'>" + item.STATE_NAME + "</option>");
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
	    var ret_msg = "失败,请联系管理员!";
	    alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	    result=false;
	}
	});
	if(!result){
	return result;
	}

	//填充区
	func_code = "SSUB";
	para="";

	json_str = request_const(para,func_code,0);

	// console.log(json_str);
	//请求
	result=true;
	$.ajax({
	type: "POST",
	url: "classes/class.getSuburb.php",
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
	          $("#CLINIC_SUBURB").append("<option value='"+ item.CLINIC_SUBURB +"'>" + item.CLINIC_SUBURB + "</option>");
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
	    var ret_msg = "失败,请联系管理员!";
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
	    var ret_msg = "失败,请联系管理员!";
	    alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	    result=false;
	}
	});
	if(!result){
		return result;
	}

	var str = sessionStorage.saveSearch;

  	if(str){
	    var json_value = JSON.parse(str);
	    console.log(json_value);

	    $('#CLINIC_SUBURB').val(json_value.CLINIC_SUBURB);
	    $('#STATE_ID').val(json_value.STATE_NAME);
	    $('#CLINIC_NAME').val(json_value.CLINIC_NAME);
	    $('#DOCTOR_TYPE').val(json_value.DOCTOR_TYPE);
	    $('#DOCTOR_NAME').val(json_value.DOCTOR_NAME);
	    $('#DISTANCE').val(json_value.DISTANCE);
	}

///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////

	var str = sessionStorage.getItem("search_con"); 
	console.log(str);
	
	if(str === null ){
		str ="";
	}
	if(str.length==0){
		var data = {
          	search: "",
        };

    	sessionStorage.setItem("search_con",JSON.stringify(data));
    	str = sessionStorage.getItem("search_con"); 
	}
	var json_value = JSON.parse(str);
    var from_index=json_value.from_index;

    if(from_index == "1"){
    	$('#myModal').modal('hide');
    	// console.log("hiden");
    	// console.log(json_value.from_index);
    }
    else{
    	$('#myModal').modal('show');
    }
    // 处理输入%查询问题
    if(json_value.search == "%"){
    	json_value.search = "-";
    }
	requesttype = 0;
	func_code = "SD01";
	json_form = {
		CLINIC_ADDR: json_value.search,
		CLINIC_NAME: json_value.search,
		DOCTOR_TYPE: json_value.search,
		DOCTOR_NAME: json_value.search
		// APPOINTMENT_DATE: json_value.search
	};

    var json_stringify=JSON.stringify(json_form);
    json_form = json_stringify.replace(/[ ]/g,"");

    //生成输入参数
    json_str = request_const(JSON.parse(json_form),func_code,requesttype);

    console.log(json_str);

///////////////////////////////////组织ajax 请求参数 end///////////////////////////////

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

	    "ajax": {
			"type": "POST",
			"url": "classes/class.searchDoctor.php",
			"dataType": "json",
			"data":  function ( d ){
				d.request = json_str;
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
	        // "defaultContent": "<input type='checkbox' id='chk_list' name='chk_list'>"
	        render: function (data, type, row, meta) {
                 //这里是主题  把url变成超链接、把图片路径显示为图片
                //return "<a href='" + data + "'>" + data + "</a>";
                // console.log(data);
                // console.log(type);
                // console.log(row);
                // console.log(meta);
                return meta.row+1;

            }
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
                return "<img style='width:50px; hegith:50px' src='img/doctors/" + data.DOCTOR_PHOTO + "' />";

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
	        "data": "DOCTOR_TYPE",
	        render: function(data, type, row, meta) {
	            //type 的值  dispaly sort filter
	            //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
	            //这里只处理了类型是显示的，过滤和排序返回原始数据
	            if (type === 'display') {
	                if (data.length > 7) {
	                    return '<span title="' + data + '">' + data.substr(0, 5) + '...</span>';
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
	        "data": "DOCTOR_NAME",
	        render: function(data, type, row, meta) {
	            //type 的值  dispaly sort filter
	            //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
	            //这里只处理了类型是显示的，过滤和排序返回原始数据
	            if (type === 'display') {
	                if (data.length > 7) {
	                    return '<span title="' + data + '">' + data.substr(0, 5) + '...</span>';
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
	       	"data": "APPOINTMENT_DATE" ,
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
	         // "searchable": false,
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
	        "sWidth": "8%"
	      },
	      {
	      	"orderable": false,
	        "targets": 6,
	        // "sWidth": "500px"
	      },
	      {
	      	"orderable": false,
	        "targets": 7,
	        "sWidth": "8%"
	      },
	      {
	      	"orderable": false,
	        "targets": 8,
	        "sWidth": "5%"
	      }
	     ],//第一列与第二列禁止排序
	    // "order": [
	    //    [0, null],
	    //    [1, "asc"]
	    // ],


	    // "dom": '<"top">rt<"table_bottom"ip<"#goon">><"clear">',
	    "dom": '<"top">rt<"table_bottom"ip><"clear">',


		initComplete: function(data){
			// $('#ok_id').append("<button id='btn_ok'>OK</button>");

			// // $('#btn_ok').on('click', function(){
			// // 	alert("click me");
			// // });
			// $('#btn_ok').click(function(){
			// 	alert("click me");
			// });
			// console.log(data);

			var data = {
          		search: "",
          		form_index: ""
        	};
    		var str = JSON.stringify(data);

    		sessionStorage.setItem("search_con", str);

			// console.log("加载完毕");
		}

	});
	
	//预留 勿删除
	// $("div#goon").html('<input type="number" min=1 name="jumpgo" id="jumpgo"/><button class="btn btn-default" id="btn_jumpgo">确认</button>');
	$("div.table_bottom").addClass('col-sm-12 col-md-12');
	$("div#dataTables-example_info").addClass('col-sm-12 col-md-3 pull-left');
	// $("div#dataTables-example_paginate").addClass('col-sm-6 col-md-7 pull-left');
	// $("div#goon").addClass('col-sm-6 col-md-2');


   // _table.on( 'order.dt search.dt', function () {
   //      _table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
   //          // console.log(i);
   //          cell.innerHTML = i+1;
   //      } );
   //  } ).draw();

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
		      DOCTOR_ID: obj_data.DOCTOR_ID,
		      DOCTOR_NAME: obj_data.DOCTOR_NAME,
		      DOCTOR_TYPE: obj_data.DOCTOR_TYPE,
		      APPOINTMENT_TIME: obj_data.APPOINTMENT_TIME,
		      APPOINTMENT_DATE: obj_data.APPOINTMENT_DATE,
		      DOCTOR_PHOTO: obj_data.DOCTOR_PHOTO,
		      DOCTOR_INFO: obj_data.DOCTOR_INFO
		    };
		var str = JSON.stringify(data);

		console.log(str);
		sessionStorage.setItem("appointmentdoctor",str);

		window.location.href="appointmentDoctor.html"; 

		event.stopImmediatePropagation();
	});

	

	$('#btn_jumpgo').click(function(){
		var jump = $('#jumpgo').val();
		// console.log("跳转"+jump);
		if(jump == ""){
			alert("请输入跳转页面");
			return;
		}


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

	$('#btn_search').click(function (){
		$('#action_type').val("");

///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
		requesttype = 1;
		func_code="SD02";
		//form序列化成json
		json_form = $("#modal_form").serializeObject();

	    var json_stringify=JSON.stringify(json_form);
	    json_form = json_stringify.replace(/[ ]/g,"");

	    //生成输入参数
	    json_str = request_const(JSON.parse(json_form),func_code,requesttype);
///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
	    console.log(json_str);
      	_table.ajax.reload();
      	$('#myModal').modal('hide')
	});

	$('#btn_reset').on('click', function (){
		$('#modal_form')[0].reset();
	});

	$('#btn_save').click(function(){
	      //收藏医生
	///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
		func_code = "SS01";
		//form序列化成json
	///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
		requesttype = 1;
		//form序列化成json
		json_form = $("#modal_form").serializeObject();

		var json_stringify=JSON.stringify(json_form);
		json_form = json_stringify.replace(/[ ]/g,"");

		//生成输入参数
		json_str = request_const(JSON.parse(json_form),func_code,requesttype);

		console.log(json_str);

	///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
	    //生成输入参数

		result = true;
		$.ajax({
	        type: "POST",
	        url: "classes/class.saveSearch.php",
	        dataType: "json",
	        async: false,
	        data:  {
	          request:json_str
	        },
	        success: function (msg) {
	          var ret = msg.response;
	          if(ret.success){
	            if(json_str.sequ != ret.sequ){
	              alert(func_code + ":" + "时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	              result=false;
	            }

	            // //登录标志
	            // $.cookie("ilogin", 1);
	            // //记录cookie
	            // Save();
	            // history.go(-1);
	            // // window.location.href="index.php";
	            alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
	          }else{
	            alert(func_code + ":" + ret.status.ret_code + " " + ret.status.ret_msg);
	            // $('#signin_ok').attr('disabled',false); 
	            result=false;
	          }
	          
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown){
	          //请求失败之后的操作
	          var ret_code = "999999";
	          var ret_msg = "失败,请联系管理员!";
	          alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	          result=false;
	        }
	    });
	    if(!result){
	      return result;
	    }

	  return false;

	});

	$('.form_datetime').datetimepicker({
	    language:  'zh-CN',
	    format: "yyyy-mm-dd",
	    todayBtn:  1,
	    autoclose: 1,
	    todayHighlight: 1,
	    startView: 2,
	    minView: "month"
  	});

});