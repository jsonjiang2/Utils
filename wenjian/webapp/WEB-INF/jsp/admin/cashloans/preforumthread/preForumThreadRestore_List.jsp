<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/cashloans/preforumthread/preForumThread.js"></script>
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
<title>主题审核列表</title>
<script type="text/javascript">
	$(function(){
		$("#select-subject-text").val($("#select-subject-text").data("subject"));
		$("#select-displayorder-text").val($("#select-displayorder-text").data("displayorder"));
		$("#select-orderByType-text").val($("#select-orderByType-text").data("orderbytyype"));
		$("#select-authorid-text").val($("#select-authorid-text").data("authorid"));
		$("#select-fid-text").val($("#select-fid-text").data("fid"));
 	})
</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-Restore-select"
				action="restoreList">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
 				<div class="form-group">
					主题：<input class="form-control" type="text" id="select-subject-text" data-subject="${preForumThread.subject}"
						name="subject" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="主题">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					主题ID：<input class="form-control" type="number" 
						name="tid" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="主题ID">
				</div>
				&nbsp;&nbsp;
 				<div class="form-group" style="display: none;" >
					显示状态： <select id="select-displayorder-text" name="displayorder" class="form-control" data-displayorder="${preForumThread.displayorder}">
						<option value="">--请选择发布状态--</option>
						<option value=-1>不合格</option>
						<option value=-2>审核中</option>
						<option value=-3>已删除</option>
 						<option value=0>合格</option>
   					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					排序方式： <select id="select-orderByType-text" name="orderByType" class="form-control" data-orderbytyype="${orderByType}">
						<option value="">--请选择排序方式--</option>
						<option value="1">普通定位</option>
						<option value="2">精华定位</option>
						<option value="3">发布时间</option>
   					</select>
				</div>
				<input type="text" style="display: none;" name="fid" id="select-fid-text" data-fid="${preForumThread.fid}">
				<input type="text" style="display: none;" name="authorid" id="select-authorid-text" data-authorid="${preForumThread.authorid}">
 				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/cashloans/preforumthread/preForumThreadRestoreListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>