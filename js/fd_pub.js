    // var serviceid = "UI01";
    // var json_str = request_const(json_func_form,serviceid,0);
    var request_const=function(para,serviceid,requesttype){
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
         } else {    
             o[this.name] = this.value || '';    
         }    
     });    
     return o;    
  };  