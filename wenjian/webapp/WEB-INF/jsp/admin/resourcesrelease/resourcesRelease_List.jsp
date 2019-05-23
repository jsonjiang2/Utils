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

.myCheck{
    background-color: white;
    border-radius: 5px;
    border:1px solid #d3d3d3;
    width:16px;
    height:16px;
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    line-height: 16px;
}

.myCheck:checked{
    background-color: #eee;
}
 

</style>
<title>发布资源列表</title>
<script type="text/javascript">
	$(function(){
		$("#select-username-text").val("${resourcesRelease.username}");
		$("#select-pname-text").val("${resourcesRelease.pname}");
		$("#select-type-text").val("${resourcesRelease.type}");
	})
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
					用户名：<input class="form-control" type="text" id="select-username-text" data-name=""
						name="username" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="用户名">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					平台名称：<input class="form-control" type="text" id="select-pname-text" data-name=""
						name="pname" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="平台名称">
				</div>
				&nbsp;&nbsp;
 				<div class="form-group">
					资源类型： <select id="select-type-text" name="type" class="form-control" data-status="">
						<option value="">--请选择--</option>
						<option value=1>首投</option>
						<option value=2>复投</option>
  					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/resourcesrelease/resourcesReleaseTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%-- <%@ include file="/WEB-INF/jsp/common/modal.jsp"%> --%>
	<!-- 查看详情模态框 -->
	<div class="modal fade" id="detailsModal" tabindex="-1" role="dialog"
		aria-labelledby="detailsModalLabel">
		<div id="detail-modal" class="modal-dialog" style="width:1000px" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="detailsModalLabel">
						<span class="glyphicon glyphicon-info-sign"></span>提示：正在进行查看详情操作
					</h4>
				</div>
				<div id="detail-modal-body" class="modal-body"></div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>