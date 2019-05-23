$(function(){
	$(".tzui-tips").tzTip();
});
var PreForumReply = {
 		//删除
		del:function(obj){
			var ff = confirm("您确定要删除吗？");
			if(!ff){
				return ;
			}
			var opid = $(obj).data("opid");
 			var url = basePath+"/admin/preForumReply/del";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/preForumReply/list";
				}
			}
			$.post(url,{"opid":opid},callback);
		},
		//批量删除
		delBatch:function(obj){
 			var number = "";
			$("input:checkbox[name=checkdelname]:checked").each(function(k){
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
			var url = basePath+"/admin/preForumReply/delBatch";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/preForumReply/list";
				}
			}
			$.post(url,{"opids":number},callback);
		},
		//恢复
 		restore:function(obj){
 			var ff = confirm("您确定要恢复该条回复吗？");
			if(!ff){
				return ;
			}
			var opid = $(obj).data("opid");
 			var url = basePath+"/admin/preForumReply/restore";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/preForumReply/list";
				}
			}
			$.post(url,{"opid":opid},callback);
 		},
 		//详情
 		detail:function(obj){
  			var opid = $(obj).data("opid");
  			var url = basePath+"/admin/preForumReply/detail/"+opid;
			var callback = function(data){
				 $("#detailsModal").modal({
					 show:true
 				 });
 				 $("#detail-modal-body").html(data);
			}
			$.post(url,callback);
 		},
  		//Del全选
		checkDelAll:function(){
 			var all=document.getElementById('allDel');//获取到点击全选的那个复选框的id  
			var one=document.getElementsByName('checkdelname');//获取到复选框的名称  
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

