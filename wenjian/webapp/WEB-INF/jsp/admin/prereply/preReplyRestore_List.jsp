<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>回复恢复列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/prereply/preReply.js"></script>
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
<script type="text/javascript">
	$(function(){
		$("#select-username-text").val($("#select-username-text").data("username"));
		$("#select-cid-text").val($("#select-cid-text").data("cid"));
		$("#select-typeid-text").val($("#select-typeid-text").data("typeid"));
		$("#select-status-text").val($("#select-status-text").data("status"));
		$("#select-message-text").val($("#select-message-text").data("message"));

		
		$("#select-hid-uid-text").val($("#select-hid-uid-text").data("uid"));
		$("#select-hid-typeid-text").val($("#select-hid-typeid-text").data("typeid"));
 
  	})
</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-restore-select"
				action="restoreList">
							<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
 				<div class="form-group">
					用户名：<input class="form-control" type="text" id="select-username-text" data-username="${username}"
						name="username" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="用户名">
				</div>
				&nbsp;&nbsp;
					<div class="form-group">
					回复内容：<input class="form-control" type="text" id="select-message-text" data-message="${preReply.message}"
						name="message" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="回复内容">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					标题ID：<input class="form-control" type="number" id="select-cid-text" data-cid="${preReply.cid}"
						name="cid" style="text-align: center; line-height: 18px;width:120px;"
						placeholder="标题ID">
				</div>
				&nbsp;&nbsp;
 			<div class="form-group">
					所属板块： <select id="select-typeid-text" name="typeid" class="form-control" data-typeid="${preReply.typeid}">
						<option value="">--请选择板块--</option>
						<option value=1>网贷茶馆</option>
						<option value=2>网贷资讯</option>
						<option value=3>羊头黑名单</option>
				<option value=4>曝光台</option>
				<option value=5>需求撮合</option>
   					</select>
				</div>
				&nbsp;&nbsp; 
			<%-- 	<div class="form-group">
					状态： <select id="select-status-text" name="status" class="form-control" data-status="${preReply.status}">
						<option value="">--请选择排序方式--</option>
						<option value="0">合格</option>
						<option value="-1">审核中</option>
						<option value="-2">不合格</option>
						<option value="-3">已删除</option>
    					</select>
				</div> --%>
				<input type="text" style="display: none;" name="uid" data-uid="${preReply.uid}" id="select-hid-uid-text">
				<input type="text" style="display: none;" name="typeid" data-typeid="${preReply.typeid}" id="select-hid-typeid-text">
				<input type="text" style="display: none;" name="cid" data-cid="${preReply.cid}" id="select-hid-cid-text">
  				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/prereply/preReplyRestoreListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>