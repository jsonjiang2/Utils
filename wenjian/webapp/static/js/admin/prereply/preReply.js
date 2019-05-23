var PreReply = {
		//审核
		auditPass:function(obj){
			var opid = $(obj).data("opid");
			var audit = $(obj).data("audit");
			var url = basePath+"/admin/preReply/auditBatchPass";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/preReply/list";
				}
			}
			$.post(url,{"ids":opid,"audit":audit},callback);
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
				alert("请至少选择一个回复操作");
				return ;
			}
			var audit = $(obj).data("audit");
			var url = basePath+"/admin/preReply/auditBatchPass";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/preReply/list";
				}
			}
			$.post(url,{"ids":number,"audit":audit},callback);
		},
		//删除
		del:function(obj){
			var ff = confirm("您确定要删除吗？");
			if(!ff){
				return ;
			}
			var opid = $(obj).data("opid");
 			var url = basePath+"/admin/preReply/delBatch";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/preReply/operationList";
				}
			}
			$.post(url,{"ids":opid},callback);
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
				alert("请至少选择一个回复操作");
				return ;
			}
			
			var ff = confirm("您确定要批量删除吗？");
			if(!ff){
				return ;
			}
			var url = basePath+"/admin/preReply/delBatch";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/preReply/operationList";
				}
			}
			$.post(url,{"ids":number},callback);
		},
		//恢复
		restorePreReply:function(obj){
			var ff = confirm("您确定要恢复该回复吗？");
			if(!ff){
				return ;
			}
			var opid = $(obj).data("opid");
 			var url = basePath+"/admin/preReply/restorePreReply";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/preReply/restoreList";
				}
			}
			$.post(url,{"ids":opid},callback);
		},
		//批量恢复
		restoreBatchPreReply:function(obj){
 			var number = "";
			$("input:checkbox[name=checkRestorename]:checked").each(function(k){
			    if(k == 0){
			    	number = $(this).val();
			    }else{
			    	number += ","+$(this).val();
			    }
			});
			if(isEmpty(number)){
				alert("请至少选择一个回复操作");
				return ;
			}
			
			var ff = confirm("您确定要批量恢复吗？");
			if(!ff){
				return ;
			}
			var url = basePath+"/admin/preReply/restorePreReply";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/preReply/restoreList";
				}
			}
			$.post(url,{"ids":number},callback);
		},
		//操作页面展示
		updShow:function(obj){
			var opid = $(obj).data("opid");
			var url = basePath+"/admin/preReply/updShow";
			var callback = function(data){
				 $("#updateModal").modal({
					 show:true
				 });
				 $("#btn-update").attr("onclick","preReply.upd(this)");
				 $("#update-modal-body").html(data);
			}
			$.get(url,{"tid":opid},callback);
  		},
  		//操作提交
  		upd:function(obj){
  			var parsm = $("#threadUpdateForm").serialize();
 			var url = basePath+"/admin/preReply/upd";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					 $("#updateModal").modal({
						 hide:true
					 });
					window.location.href = basePath+"/admin/preReply/delList";
				}
			}
			$.post(url,parsm,callback);
  		},
 		//详情
 		detail:function(opid){
  			var action = basePath+"/admin/preReply/detail/"+opid;
 			var callback = function(data){
 				 $("#detailsModal").modal({
 					 show:true
 				  });
 				 $("#detail-modal-body").html(data);
 			}
 			$.get(action,{},callback);
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
 
function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

//View 分页
function queryAllPerson2(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-view-select").submit();
}

//操作列表 分页
function queryAllPerson3(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-operation-select").submit();
}

//恢复 分页
function queryAllPerson4(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-restore-select").submit();
}
