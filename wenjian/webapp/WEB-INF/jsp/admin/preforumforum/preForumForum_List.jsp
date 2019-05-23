<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/preforumforum/preForumForum.js"></script>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}
</style>
<title>论坛基础版块</title>
<script type="text/javascript">
	$(function(){
		$("#select-name-text").val($("#select-name-text").data("name"));
		$("#select-status-text").val($("#select-status-text").data("status"));
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
					论坛名称：<input class="form-control" type="text" id="select-name-text" data-name="${preForumForum.name }"
						name="name" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="论坛名称">
				</div>
				&nbsp;&nbsp;
 				<div class="form-group">
					显示状态： <select id="select-status-text" name="status" class="form-control" data-status="${preForumForum.status }">
						<option value="">--请选择状态--</option>
						<option value=1>显示</option>
						<option value=0>不显示</option>
  					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
 			<div class="col-md-12" style="margin-bottom: 15px;">
 				<div class="col-md-2 col-md-offset-10" >
					<a type="button" class="btn btn-default" href="${basePath}/admin/preForumForum/insertView">新增</a>
				</div>
			</div>
			<jsp:include page="/WEB-INF/jsp/admin/preforumforum/preForumForumListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>