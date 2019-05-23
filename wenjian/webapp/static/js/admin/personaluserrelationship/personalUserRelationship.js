var PersonalUserRelationship = {
 		//添加页面展示
		insertShow:function(obj){
			var opid = $(obj).data("opid");
			var url = basePath+"/admin/personalUserRelationship/setting";
			var callback = function(data){
 				 $("#btn-update").attr("onclick","PersonalUserRelationship.insertSubmit(this)");
				 $("#update-modal-body").html(data);
 				 $("#updateModal").modal('show');
			}
			$.get(url,{"opid":opid},callback);
  		},
  		//添加提交
  		insertSubmit:function(obj){
  			var parsm = $("#insert-form").serialize();
 			var url = basePath+"/admin/personalUserRelationship/insert";
 			var opid = $("#submit_id").val();
 			if(opid > 0){
 	 			 url = basePath+"/admin/personalUserRelationship/update";
 			}
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					 $("#updateModal").modal({
						 hide:true
					 });
					window.location.href = basePath+"/admin/personalUserRelationship/list";
				}
			}
			$.post(url,parsm,callback);
  		},
		//删除
		del:function(obj){
 			var opid = $(obj).data("opid");
 			var ff = confirm("您确定要删除吗？");
			if(!ff){
				return ;
			}
 			var url = basePath+"/admin/personalUserRelationship/delete";
			var callback = function(data){
				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href = basePath+"/admin/personalUserRelationship/list";
				}
			}
			$.post(url,{"id":opid},callback);
		},
 		//全选
		checkAll:function(){
 			var all=document.getElementById('all');//获取到点击全选的那个复选框的id  
			var one=document.getElementsByName('checkname');//获取到复选框的名称  
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

 