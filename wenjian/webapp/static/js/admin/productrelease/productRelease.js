var ProductRelease = {
	 detail:function(obj){
		 var opid = $(obj).data("opid");
  			var url = basePath+"/admin/productRelease/detail/"+opid;
			var callback = function(data){
				 $("#detailsModal").modal({
					 show:true
 				 });
 				 $("#detail-modal-body").html(data);
			}
			$.post(url,callback);
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

