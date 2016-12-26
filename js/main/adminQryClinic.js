var para,json_str,json_form;
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
  else{}

 

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
        var ret_msg = "失败,请联系管理员!";
        alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
        result=false;
    }
  });
  if(!result){
    return result;
  }


  func_code = "AU02";
  //form序列化成json
  json_form = $('#adminQryClinic_form').serializeObject();

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
      "serverSide": false,
      "processing": true,
      "iDisplayLength": 10,  //确定选择每页展示个数列表和默认每页展示个数设置
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
      "url": "classes/class.ClinicDetail.php",
      "dataType": "json",
      "async":false,
      "data":  function ( d ){
        d.request = json_str
      },
      dataSrc: function(json){

           return json.response.data;
        }
      },

      "columns": [
        {
          "class": "col_0_class",
          "data": null,
          "defaultContent": "<input type='checkbox' id='chk_list' name='chk_list'>"
        },
//        { 
//          "data": "CLINIC_USER_NAME",
//          render: function(data, type, row, meta) {
//              //type 的值  dispaly sort filter
//              //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
//              //这里只处理了类型是显示的，过滤和排序返回原始数据
//              if (type === 'display') {
//                  if (data.length > 10) {
//                      return '<span title="' + data + '">' + data.substr(0, 8) + '...</span>';
//                  } else {
//                    // console.log(data);
//                      // return '<span title="' + data + '>' + data + '</span>';
//                      return data;
//                  }
//              }
//              return data;
//          }
//        },
        { 
          "data": "CLINIC_USER_MAIL",
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
          "class": "text-left",
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
          "class": "text-center",
          "data": null,
          // render: function(data, type, row, meta) {
          //     var opr="";
          //     opr="<img id='img_info' src='img/td_info.png'/><img id='img_upd' src='img/td_upd.png'/><img id='img_reset' src='img/td_reset.png'/>";
          //     return opr;
          // }
          "defaultContent":"<button class='btn btn-primary btn-xs' id='opr_info'>"+$('#Lang0056').html() +"</button><button class='btn btn-danger btn-xs' id='opr_upd'>"+$('#Lang0057').html()+"</button><button class='btn btn-warning btn-xs' id='opr_reset_pwd'>"+$('#Lang0058').html()+"</button>"
          // "defaultContent":"<img id='img_info' src='img/td_info.png'/><img id='img_upd' src='img/td_upd.png'/>"
          // "defaultContent":"<img id='img_info' src='img/td_info.png'><span class='glyphicon glyphicon-search'></span></img>     <img id='img_upd'><span class='glyphicon glyphicon-search'></span></img>     <img id='img_upd'><span class='glyphicon glyphicon-search'></span></img>    <img id='img_upd'><span class='glyphicon glyphicon-search'></span></img>"
        },
        {
          "visible": false,
          "data": "CLINIC_USER_ID"
        }
      ],
      
      
      "oLanguage": { "sUrl": datatable_lang_url },


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
        },
        {
          "orderable": false,
          "targets": 7,
          "sWidth": "5%"
        },
        {
          "orderable": false,
          "targets": 8,
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
          CLINIC_USER_ID: obj_data.CLINIC_USER_ID,
          CLINIC_USER_MAIL: obj_data.CLINIC_USER_MAIL,
          //CLINIC_USER_NAME: obj_data.CLINIC_USER_NAME,
          ACTIVE_STATUS: obj_data.ACTIVE_STATUS,
          CLINIC_POSTCODE: obj_data.CLINIC_POSTCODE,
          CLINIC_SUBURB: obj_data.CLINIC_SUBURB,
          STATE_ID: obj_data.STATE_ID
        };

    if(imgId == "opr_reset_pwd"){
      //发送邮件到地址 
      var reset_pwd=""; 
      for(var i=0;i<6;i++) 
      { 
        reset_pwd+=Math.floor(Math.random()*10); 
      } 
      var email_text = "您的新密码:" + reset_pwd;
      
      if(!obj_data.CLINIC_USER_MAIL){
        alert($("#Lang0020").html()); //请修改个人信息，添加邮箱地址
        return false;
      }
      //alert(obj_data.CLINIC_USER_MAIL +" pwd:"+ reset_pwd);

      //发送邮件 begin
      $.ajax({
          type: "POST",
          url: "classes/PHPMailer/gmail.php",
          dataType: "text",
          async:false,
          data: {
        	  email: obj_data.CLINIC_USER_MAIL,
              pwd: reset_pwd,
              name:obj_data.CLINIC_USER_MAIL
          },
          success: function (msg) {
        	  
        	  
        	  alert($("#Lang0032").html()); //密码重置成功!

              
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            //请求失败之后的操作
            var ret_code = "999999";
            var ret_msg = "失败,请联系管理员!";
            alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
            result=false;
          }
        });

      //发送邮件 end

      //修改密码
      //修改用户密码
///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
      func_code="CU04";
      //form序列化成json
      json_form = {
        action_type:"update",
        CLINIC_USER_ID:obj_data.CLINIC_USER_ID,
        CLINIC_USER_PWD:reset_pwd
      };
      //生成输入参数
      json_str = request_const(json_form,"CU04",1);
      // alert(JSON.stringify(json_str));

      console.log(json_str);

      result = true;
      $.ajax({
            type: "POST",
            url: "classes/class.ClinicDetail.php",
            dataType: "json",
            async: false,
            data:  {
              request:json_str
            },
            success: function (msg) {
              var ret = msg.response;
              if(ret.success){
                if(json_str.sequ != ret.sequ){
                  alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
                  result=false;
                }
              }else{
                alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
                // $('#signin_ok').attr('disabled',false); 
                result=false;
              }
              
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
              //请求失败之后的操作
              var ret_code = "999999";
              var ret_msg = "失败,请联系管理员!";
              alert(func_code+":"+ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
              result=false;
            }
        });
        if(!result){
          return result;
        }


        return false;
    }

    var str = JSON.stringify(data);

    // console.log(str);
    sessionStorage.userinfo = str;

    window.location.href="adminUpdClinicInfo.php"; 

    event.stopImmediatePropagation();
  });


  $('#search_ok').click(function(){

    func_code = "AU02";
    //form序列化成json
    json_form = $('#adminQryClinic_form').serializeObject();

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
    	alert($("#Lang0033").html());  //请选择需要修改的数据
      return false;
    }else{
      
    	
      BootstrapDialog.confirm($('#Lang0018').html(), function(result){
          if(result){
        	  var CLINIC_USER_ID = [];

        	    $.each(rowData,function(key,value){
        	      CLINIC_USER_ID.push(value.CLINIC_USER_ID)
        	    });

        	    func_code = "AU06";
        	    para={
        	      action_type: "update_active",
        	      ACTIVE_STATUS: 0,
        	      CLINIC_USER_ID: CLINIC_USER_ID
        	    }
        	    
        	    json_str = request_const(para, func_code, request_type);

        	    console.log(json_str);

        	    //请求
        	    result=true;
        	    $.ajax({
        	      type: "POST",
        	      url: "classes/class.ClinicDetail.php",
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

        	            func_code = "AU02";
        	            //form序列化成json
        	            json_form = $('#adminQryClinic_form').serializeObject();

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
        	        var ret_msg = "失败,请联系管理员!";
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
    	
    	
      //改confirm方法为bootstrapDialog 2006/09/17 updated by alex
      BootstrapDialog.confirm($('#Lang0018').html(), function(result){
          if(result){
        	  var CLINIC_USER_ID = [];

        	    $.each(rowData,function(key,value){
        	      CLINIC_USER_ID.push(value.CLINIC_USER_ID)
        	    });

        	    func_code = "AU06";
        	    para={
        	      action_type: "update_active",
        	      ACTIVE_STATUS: 1,
        	      CLINIC_USER_ID: CLINIC_USER_ID
        	    }

        	    json_str = request_const(para, func_code, request_type);

        	    console.log(json_str);

        	    //请求
        	    result=true;
        	    $.ajax({
        	      type: "POST",
        	      url: "classes/class.ClinicDetail.php",
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

        	            func_code = "AU02";
        	            //form序列化成json
        	            json_form = $('#adminQryClinic_form').serializeObject();

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
        	        var ret_msg = "失败,请联系管理员!";
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