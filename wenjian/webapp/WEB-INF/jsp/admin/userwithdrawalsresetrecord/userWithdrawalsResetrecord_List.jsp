<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}
</style>
<title>提现复位记录管理</title>
<script type="text/javascript">
	/*
	 全局的pageNum与pageSize
	 */
	var pageNum='${pagehelper.pageNum}';
	var pageSize='${pagehelper.pageSize}';

	$(function(){
		$("#select-uworderno-text").val($("#select-uworderno-text").data("uworderno"));
	 })

var userWithdrawalsResetrecordObject = {
	getUrlPath:function(){
		return basePath+"/admin/userWithdrawalsResetrecord/";
	},
	detail:function(obj){
		$.post(this.getUrlPath()+"detail/"+obj,function(data){
			$("#detailsModal").modal({
				backdrop: 'static',
				keyboard: false
			});
			$("#detail-modal-body").html(data);
		});
	}
}

//分页
function queryAllPerson2(pageNum, pageSize) {
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-select"
				action="list">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
 				<div class="form-group">
					提现流水号：<input class="form-control" data-uworderno="${userWithdrawalsResetrecord.uworderno }" type="text" id="select-uworderno-text"
						name="uworderno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="填写提现流水号">
				</div>
  				&nbsp;&nbsp;
				<div class="form-group" >
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
		 
 			<jsp:include page="/WEB-INF/jsp/admin/userwithdrawalsresetrecord/userWithdrawalsResetrecordListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="../../common/modal.jsp"%>
	
</body>
</html>