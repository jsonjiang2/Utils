var preForumForum = {
		pre_detail:function(opid){
 			$.post(basePath+"/admin/preForumForum/detail/"+opid,function(data){
	    		 $("#detailsModal").modal({
	                 backdrop: 'static',
	                 keyboard: false
	             });
	    		$("#detail-modal-body").html(data);
	    	});
		},
		pre_del:function(opid){
			if(!confirm("您确定删除吗?"))return;
 			$.post(basePath+"/admin/preForumForum/delete",{"id":opid},function(data){
 				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href=basePath+"/admin/preForumForum/list"
				}
			})
		},
		pre_insert:function(obj){
			$("#insert-form").bootstrapValidator(validate);
			var bv = $("#insert-form").data("bootstrapValidator");
 			bv.validate();
			if (bv.isValid()) {
				// 手动触发验证
				var bodyParams = $("#insert-form").serialize();
				var url = basePath + "/admin/preForumForum/insert";
				var callback = function(data) {
					alert(data.meta.message);
					if (data.meta.code == "88") {
						window.location.href = basePath + "/admin/preForumForum/list";
					}
				}
				$.post(url, bodyParams, callback);
			}
		},
		pre_update:function(obj){
			var bodyParams = $("#update-form").serialize();
			var url = basePath + "/admin/preForumForum/update";
			var callback = function(data) {
				alert(data.meta.message);
				if (data.meta.code == "88") {
					window.location.href = basePath + "/admin/preForumForum/list";
				}
			}
			$.post(url, bodyParams, callback);
 		}
}


//验证
var validate = {
		icon : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			name : {
				validators : {
					notEmpty : {
						message : "* 请输入论坛版块名称"
					} 
				}
			},
			displayorder : {
				validators : {
					notEmpty : {
						message : "* 请输入显示顺序"
					} 
				}
			},
			status : {
				validators : {
					callback:{
						message:"* 请选择是否显示",
						callback:function(value,validator){
  							if(isEmpty(value)){
 								 return false;
							}else{
 								 return true;
							}
						}
					}
				}
			}
 		} 
}

function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}