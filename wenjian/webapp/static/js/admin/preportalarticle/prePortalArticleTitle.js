var PrePortalArticleTitle = {
		//审核
		auditPass:function(obj){
			var opid = $(obj).data("opid");
			var audit = $(obj).data("audit");
			var ismobile = $(obj).data("ismobile");
 			var url = basePath+"/admin/prePortalArticle/auditPass";
			var callback = function(data){
				alert(data.message);
				if(data.code == "88"){
					window.location.href = basePath+"/admin/prePortalArticle/list";
				}
			}
			$.post(url,{"aids":opid,"audit":audit,"ismobile":ismobile},callback);
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
				alert("请至少选择一个资讯操作");
				return ;
			}
			var audit = $(obj).data("audit");
			var ismobile = $(obj).data("ismobile");
			var url = basePath+"/admin/prePortalArticle/auditPass";
			var callback = function(data){
				alert(data.message);
				if(data.code == "88"){
					window.location.href = basePath+"/admin/prePortalArticle/list";
				}
			}
			$.post(url,{"aids":number,"audit":audit,"ismobile":ismobile},callback);
		},
		//修改页面展示
		updShow:function(obj){
			var opid = $(obj).data("opid");
            var updlist = $(obj).data("updlist");
            var url = basePath+"/admin/prePortalArticle/updShow";
			var callback = function(data){
				 $("#updateModal").modal({
					 show:true
				 });
				 $("#btn-update").attr("onclick","PrePortalArticleTitle."+updlist+"(this)");
				 $("#update-modal-body").html(data);
			}
			$.get(url,{"aid":opid},callback);
  		},
		//修改提交[审核列表]
		updlist:function(obj){
			var parsm = $("#threadUpdateForm").serialize();
			var url = basePath+"/admin/prePortalArticle/upd";
			var callback = function(data){
				alert(data.message);
				if(data.code == "88"){
					$("#updateModal").modal({
						hide:true
					});
					window.location.href = basePath+"/admin/prePortalArticle/list";
				}
			}
			$.post(url,parsm,callback);
		},
  		//修改提交【操作列表】
  		upd:function(obj){
  			var parsm = $("#threadUpdateForm").serialize();
 			var url = basePath+"/admin/prePortalArticle/upd";
			var callback = function(data){
				alert(data.message);
				if(data.code == "88"){
					 $("#updateModal").modal({
						 hide:true
					 });
					window.location.href = basePath+"/admin/prePortalArticle/operationlist";
				}
			}
			$.post(url,parsm,callback);
  		},
		//删除
		del:function(obj){
			var ff = confirm("您确定要删除吗？");
			if(!ff){
				return ;
			}
			var opid = $(obj).data("opid");
 			var url = basePath+"/admin/prePortalArticle/del";
			var callback = function(data){
				alert(data.message);
				if(data.code == "88"){
					window.location.href = basePath+"/admin/prePortalArticle/operationlist";
				}
			}
			$.post(url,{"aids":opid},callback);
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
				alert("请至少选择一个资讯操作");
				return ;
			}
			
			var ff = confirm("您确定要批量删除吗？");
			if(!ff){
				return ;
			}
			var url = basePath+"/admin/prePortalArticle/del";
			var callback = function(data){
				alert(data.message);
				if(data.code == "88"){
					window.location.href = basePath+"/admin/prePortalArticle/operationlist";
				}
			}
			$.post(url,{"aids":number},callback);
		},
		//恢复
		restore:function(obj){
			var ff = confirm("您确定要恢复吗？");
			if(!ff){
				return ;
			}
			var opid = $(obj).data("opid");
 			var url = basePath+"/admin/prePortalArticle/restoreBatch";
			var callback = function(data){
				alert(data.message);
				if(data.code == "88"){
					window.location.href = basePath+"/admin/prePortalArticle/restorelist";
				}
			}
			$.post(url,{"aids":opid},callback);
		},
		//批量恢复
		restoreBatch:function(obj){
 			var number = "";
			$("input:checkbox[name=checkRestoreName]:checked").each(function(k){
			    if(k == 0){
			        number = $(this).val();
			    }else{
			        number += ","+$(this).val();
			    }
			});
			if(isEmpty(number)){
				alert("请至少选择一个资讯操作");
				return ;
			}
			
			var ff = confirm("您确定要批量恢复吗？");
			if(!ff){
				return ;
			}
			var url = basePath+"/admin/prePortalArticle/restoreBatch";
			var callback = function(data){
				alert(data.message);
				if(data.code == "88"){
					window.location.href = basePath+"/admin/prePortalArticle/restorelist";
				}
			}
			$.post(url,{"aids":number},callback);
		},
 		//详情
 		detail:function(opid){
  			var action = basePath+"/admin/prePortalArticle/detail/"+opid;
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
 		//全选
		checkAll:function(){
 			var all=document.getElementById('all');//获取到点击全选的那个复选框的id  
			var one=document.getElementsByName('checkname');//获取到复选框的名称  
			//因为获得的是数组，所以要循环 为每一个checked赋值  
			for(var i=0;i<one.length;i++){  
				one[i].checked=all.checked; 
			}  
 		},
 		//恢复 全选
		checkRestoreAll:function(){
 			var all=document.getElementById('allRestore');//获取到点击全选的那个复选框的id  
			var one=document.getElementsByName('checkRestoreName');//获取到复选框的名称  
			//因为获得的是数组，所以要循环 为每一个checked赋值  
			for(var i=0;i<one.length;i++){  
				one[i].checked=all.checked; 
			}  
 		}
}
 
//審核分頁
function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

//操作列表 分页
function queryAllPerson2(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-operation-select").submit();
}

//删除 列表分页
function queryAllPerson3(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-del-select").submit();
}

//恢復 分页
function queryAllPerson4(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-restore-select").submit();
}

//查看列表 分页
function queryAllPerson5(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-view-select").submit();
}
