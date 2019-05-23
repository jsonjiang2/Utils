$(function(){
		$("#select-subject-text").val($("#select-subject-text").data("subject"));
		$("#select-type-text").val($("#select-type-text").data("type"));
		$("#select-ftype-text").val($("#select-ftype-text").data("ftype"));
})

var mobileHomePagesSettings = {
 		//删除
		del:function(obj){
			var ff = confirm("您确定要删除吗？");
			if(!ff){
				return ;
			}
			var opid = $(obj).data("opid");
 			var url = basePath+"/admin/mobileHomePagesSettings/delete";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/mobileHomePagesSettings/list";
				}
			}
			$.post(url,{"id":opid},callback);
		},
		//操作页面展示
		settingShow:function(obj){
			var opid = $(obj).data("opid");
			var url = basePath+"/admin/mobileHomePagesSettings/settingShow";
			var callback = function(data){
 				 $("#btn-update").attr("onclick","mobileHomePagesSettings.upd(this)");
				 $("#update-modal-body").html(data);
 				 $("#updateModal").modal('show');
			}
			$.get(url,{"opid":opid},callback);
  		},
  		//操作提交
  		upd:function(obj){
  			 var type = $("#setting_type").val();
  			 var obj = $(".setting_type_box_"+type);
  			 var params = {};
  			 params.ftype = type;
  			 params.remark = $("#main_box").find("textarea[name='remark']").val();
  			 params.color = $("#main_box").find("input[name='color']").val();
  			 params.id = $("#main_box").find("input[name='id']").val();
  			 params.tid = $(obj).find("input[name='tid']").val();
  			 params.type = $(obj).find("select[name='type']").val();
  			 
  			 params.link = $(obj).find("input[name='link']").val();
  			 params.subject = $(obj).find("textarea[name='subject']").val();
  			 params.message = $(obj).find("textarea[name='message']").val();
  			 params.sort = $(obj).find("select[name='sort']").val();
  			 params.imgtype = $(obj).find("select[name='imgtype']").val();
  			 params.attachment1 = $(obj).find("input[name='attachment1']").val();
  			 params.attachment2 = $(obj).find("input[name='attachment2']").val();
  			 params.attachment3 = $(obj).find("input[name='attachment3']").val();
  			 
  			 params.img = $(obj).find("input[name='img']").val();
  			 params.pid = $(obj).find("input[name='pid']").val();
  			 params.pno = $(obj).find("input[name='pno']").val();
  			 params.aid = $(obj).find("input[name='aid']").val();
  	 		 params.tdateline = $("#tdateline").val();
  	 		 params.status = $(obj).find("select[name='status']").val();
  	 		 console.log(JSON.stringify(params));
  			 var callback = function(data){
  				 alert(data.message);
  				 if(data.code =="88"){
   					 window.location.href=basePath+"/admin/mobileHomePagesSettings/list";
  				 }
  			 }
  			 var insertUrl = basePath+"/admin/mobileHomePagesSettings/setting";
  			 $.post(insertUrl,params,callback);  
  		},
 		//详情
 		detail:function(opid){
  			var action = basePath+"/admin/mobileHomePagesSettings/detail/"+opid;
 			var callback = function(data){
 				 $("#detailsModal").modal({
 					 show:true
 				  });
 				 $("#detail-modal-body").html(data);
 			}
 			$.get(action,{},callback);
 		},
 		//审核全选
		checkAll:function(){
 			var all=document.getElementById('all');//获取到点击全选的那个复选框的id  
			var one=document.getElementsByName('checkname');//获取到复选框的名称  
			//因为获得的是数组，所以要循环 为每一个checked赋值  
			for(var i=0;i<one.length;i++){  
				one[i].checked=all.checked; 
			}  
 		}
}
 
function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

//View 分页
function queryAllPerson2(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

//Del 分页
function queryAllPerson3(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-del-select").submit();
}

//恢复 分页
function queryAllPerson4(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-Restore-select").submit();
}
