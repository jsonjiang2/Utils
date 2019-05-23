//通用js  这里主要放通用的方法 比如 分页,详情
 var PreWdbCommon = {
	 detail:function(obj){
		var opid = $(obj).data("opid");
		var model = $(obj).data("model");//  示例：模块
		if(!isEmpty(model) && !isEmpty(opid)){
 			var actionUrl = basePath+"/admin/"+model+"/detail/"+opid;
			var callback = function(data){
				$("#detailsModal").modal({
					show:true
				});
				$("#detail-modal-body").html(data);
			}
			$.post(actionUrl,callback);
		}
	 }
}
 
 
function isEmpty(val){
	val = $.trim(val);
	if (val == null)
		return true;
	if (val == undefined || val == 'undefined')
		return true;
	if (val == "")
		return true;
	if (val.length == 0)
		return true;
	if (!/[^(^\s*)|(\s*$)]/.test(val))
		return true;
	return false;
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

