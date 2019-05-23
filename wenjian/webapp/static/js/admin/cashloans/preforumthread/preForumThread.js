var PreForumThread = {
		//审核
		auditPass:function(obj){
			var opid = $(obj).data("opid");
			var audit = $(obj).data("audit");
			var ismobile = $(obj).data("ismobile");
			var url = basePath+"/admin/preForumThread/auditPass";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/cashloans/preForumThread/list";
				}
			}
			$.post(url,{"tid":opid,"audit":audit,"ismobile":ismobile},callback);
		},
		//批量审核
		auditBatchPass:function(obj){
			var number = "";
			$("input:checkbox[name=checkname]:checked").each(function(k){
			    if(k == 0){
			        number = $(this).val();
			    }else{
			        number += ","+$(this).val();
			    }
			});
			if(isEmpty(number)){
				alert("请至少选择一个主题操作");
				return ;
			}
			var audit = $(obj).data("audit");
			var ismobile = $(obj).data("ismobile");
 			var url = basePath+"/admin/cashloans/preForumThread/auditBatchPass";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/cashloans/preForumThread/list";
				}
			}
			$.post(url,{"tids":number,"audit":audit,"ismobile":ismobile},callback);
		},
		//删除弹框展示
		delShow:function(obj){
			 var opid = $(obj).data("opid");
			 $("#del-btn").attr("data-opid",opid);
			 $("#del-btn").attr("onclick","PreForumThread.del(this)");
			 var data = "<label class='col-sm-2 control-label laber_from' for='presubject'>备注：</label>" +
			 		"<textarea rows='3' style='max-width:350px;' class='form-control' name='remark'></textarea>";
			 $("#del-modal-body").html(data);
			 $("#delModal").modal('show');
    	},
		//删除
		del:function(obj){
			var remark = $("#del-modal-body").find("textarea[name='remark']").val();
			var opid = $(obj).data("opid");
 			var url = basePath+"/admin/preForumThread/del";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/cashloans/preForumThread/delList";
				}
			}
			$.post(url,{"tid":opid,"remark":remark},callback);
		},
		//批量删除
		delBatch:function(obj){
			
			var number = "";
			$("input:checkbox[name=checkDelName]:checked").each(function(k){
			    if(k == 0){
			        number = $(this).val();
			    }else{
			        number += ","+$(this).val();
			    }
			});
			if(isEmpty(number)){
				alert("请至少选择一个主题操作");
				return ;
			}
			
			var ff = confirm("您确定要批量删除吗？");
			if(!ff){
				return ;
			}
			var url = basePath+"/admin/preForumThread/delBatch";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/cashloans/preForumThread/delList";
				}
			}
			$.post(url,{"tids":number},callback);
		},
		//恢复
		restoreThread:function(obj){
			var ff = confirm("您确定要恢复该主题吗？");
			if(!ff){
				return ;
			}
			var opid = $(obj).data("opid");
 			var url = basePath+"/admin/cashloans/preForumThread/restoreThread";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/cashloans/preForumThread/restoreList";
				}
			}
			$.post(url,{"tids":opid},callback);
		},
		//批量恢复
		delRestoreThread:function(obj){
 			var tids = "";
			$("input:checkbox[name=checkRestorename]:checked").each(function(k){
			    if(k == 0){
			    	tids = $(this).val();
			    }else{
			    	tids += ","+$(this).val();
			    }
			});
			if(isEmpty(tids)){
				alert("请至少选择一个主题操作");
				return ;
			}
			
			var ff = confirm("您确定要批量恢复吗？");
			if(!ff){
				return ;
			}
			var url = basePath+"/admin/cashloans/preForumThread/restoreThread";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/cashloans/preForumThread/restoreList";
				}
			}
			$.post(url,{"tids":tids},callback);
		},
		//操作页面展示
		updShow:function(obj){
			var opid = $(obj).data("opid");
			var url = basePath+"/admin/cashloans/preForumThread/updShow";
			var callback = function(data){
 				 $("#btn-update").attr("onclick","PreForumThread.upd(this)");
				 $("#update-modal-body").html(data);
 				 $("#updateModal").modal('show');
			}
			$.get(url,{"tid":opid},callback);
  		},
  		//操作提交
  		upd:function(obj){
  			var parsm = $("#threadUpdateForm").serialize();
 			var url = basePath+"/admin/cashloans/preForumThread/upd";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					 $("#updateModal").modal({
						 hide:true
					 });
					window.location.href = basePath+"/admin/cashloans/preForumThread/delList";
				}
			}
			$.post(url,parsm,callback);
  		},
 		//详情
 		detail:function(opid){
  			var action = basePath+"/admin/cashloans/preForumThread/detail/"+opid;
 			var callback = function(data){
 				 $("#detailsModal").modal({
 					 show:true
 				  });
 				 $("#detail-modal-body").html(data);
 			}
 			$.get(action,{},callback);
 		},
 		//操作页面展示
 		addMobileH5:function(obj){
 			var ff = confirm("您确定要添加到h5吗？");
			if(!ff){
				return ;
			}
			var opid = $(obj).data("opid");
			var url = basePath+"/admin/cashloans/preForumThread/addMobileH5";
			var callback = function(data){
				  alert(data.message);
 				  if(data.code =="88"){
 					 window.location.href = basePath+"/admin/cashloans/preForumThread/delList";
 				  } 
			}
			$.get(url,{"tids":opid},callback);
  		},
 		//Del全选
		checkDelAll:function(){
 			var all=document.getElementById('allDel');//获取到点击全选的那个复选框的id  
			var one=document.getElementsByName('checkDelName');//获取到复选框的名称  
			//因为获得的是数组，所以要循环 为每一个checked赋值  
			for(var i=0;i<one.length;i++){  
				one[i].checked=all.checked; 
			}  
 		},
 		//审核全选
		checkAll:function(){
 			var all=document.getElementById('all');//获取到点击全选的那个复选框的id  
			var one=document.getElementsByName('checkname');//获取到复选框的名称  
			//因为获得的是数组，所以要循环 为每一个checked赋值  
			for(var i=0;i<one.length;i++){  
				one[i].checked=all.checked; 
			}  
 		},
 		//恢复全选
 		checkRestoreDelAll:function(){
 			var all=document.getElementById('allRestore');//获取到点击全选的那个复选框的id  
			var one=document.getElementsByName('checkRestorename');//获取到复选框的名称  
			//因为获得的是数组，所以要循环 为每一个checked赋值  
			for(var i=0;i<one.length;i++){  
				one[i].checked=all.checked; 
			}  
 		}
}

//特殊审核
var PreForumThreadFocu = {
		//审核
		auditPass:function(obj){
			var opid = $(obj).data("opid");
			var audit = $(obj).data("audit");
			var ismobile = $(obj).data("ismobile");
			var url = basePath+"/admin/cashloans/preForumThread/auditPass";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/cashloans/preForumThread/focuList";
				}
			}
			$.post(url,{"tid":opid,"audit":audit,"ismobile":ismobile},callback);
		},
		//批量审核
		auditBatchPass:function(obj){
			var number = "";
			$("input:checkbox[name=checknameFocu]:checked").each(function(k){
			    if(k == 0){
			        number = $(this).val();
			    }else{
			        number += ","+$(this).val();
			    }
			});
			if(isEmpty(number)){
				alert("请至少选择一个主题操作");
				return ;
			}
			var audit = $(obj).data("audit");
			var ismobile = $(obj).data("ismobile");
 			var url = basePath+"/admin/cashloans/preForumThread/auditBatchPass";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/cashloans/preForumThread/focuList";
				}
			}
			$.post(url,{"tids":number,"audit":audit,"ismobile":ismobile},callback);
		},
  		//审核全选
		checkAll:function(){
 			var all=document.getElementById('allFocu');//获取到点击全选的那个复选框的id  
			var one=document.getElementsByName('checknameFocu');//获取到复选框的名称  
			//因为获得的是数组，所以要循环 为每一个checked赋值  
			for(var i=0;i<one.length;i++){  
				one[i].checked=all.checked; 
			}  
 		}
}

//审核分页
function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

//特殊审核分页
function queryFocuAllPerson(pageNum,pageSize){
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
