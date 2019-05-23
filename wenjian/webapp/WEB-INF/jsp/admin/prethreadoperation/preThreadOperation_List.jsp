<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.ganjiangps.wangdaibus.common.util.DateUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<%@ include file="../../common/taglib.jsp"%>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主题操作记录</title>
<%@include file="../../common/public.jsp"%>
<script type="text/javascript" src="/static/js/common.js"></script>
<script type="text/javascript" src="${basePath}/static/js/admin/sheephead/sheephead.js"></script>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}

a:link {
	font-size: 12px;
	color: blue
}

a:visited {
	font-size: 12px;
	color: blue
}

a:hover {
	font-size: 12px;
	color: red
}
</style>

<script>
	
function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

$(function() {

	$("#select-subject-text").val("${preThreadOperation.subject}"); 
	$("#action").val("${preThreadOperation.action}"); 
	$("#status").val("${preThreadOperation.status}"); 
	$("#uid").val("${preThreadOperation.uid}"); 
	
	
});
 

</script>

</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">

			<div style="margin-bottom: 10px;"></div>
			<!--黑羊头曝光搜索start  -->
			<form action="${basePath}/admin/preThreadOperation/list" id="form-select" class="form-inline">
				<input type="hidden" id="pageNum" name="pageNum">
				<input type="hidden" id="pageSize" name="pageSize">
 				<input type="hidden" id="uid" name="uid">
				<div class="form-group">
					主题：<input class="form-control" type="text" id="select-subject-text"
						name="subject"
						style="text-align: center; line-height: 18px; width: 220px;"
						placeholder="主题">
				</div>
				&nbsp;&nbsp; 
				<div class="form-group">
					操作： <select class="form-control" id="action" name="action">
							<option value="">--请选择--</option>
							<option value="DEL">删除</option>
							<option value="MOD">修改</option>
							<option value="AUDPASS">审核通过</option>
							<option value="AUDFAIL">审核失败</option>
							<option value="RESTORE">恢复</option>
 						 </select>
				</div>
				&nbsp;&nbsp; 
				<div class="form-group">
					状态： <select class="form-control" id="status" name="status">
							<option value="">--请选择--</option>
							<option value="1">成功</option>
							<option value="2">失败</option>
  						 </select>
				</div>
				&nbsp;&nbsp; 
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
		<div style="margin-bottom: 20px;"></div>
			<table class="table table-hover table-striped">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						
						<td>序号</td>
						<td>主题</td>
						<td>操作人</td>
						<td>状态</td>
						<td>操作类型</td>
						<td>操作时间</td>
						
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<%-- <td id="sid" style="display: none;">${item.id}</td> --%>
							<%-- <td><input type="checkbox" name="checkname" class="myCheck"
								value="${item.id}"></td> --%>
							<td>${status.count}</td>
							<td>${item.subject}</td>
							<td>
								<a href="${basePath}/admin/preThreadOperation/list?uid=${item.uid}" style="color:blue;">
 									${item.userName}
								</a>
							</td>
							<td>
								<a href="${basePath}/admin/preThreadOperation/list?status=${item.status}" style="color:blue;">
 									<c:choose>
		 								<c:when test="${item.status eq 1}">
											成功
										</c:when>
										
										<c:when test="${item.status eq 2}">
											失败
										</c:when> 
									</c:choose>
								</a>
							</td>
							<td>
								<a href="${basePath}/admin/preThreadOperation/list?action=${item.action}" style="color:blue;">
 									<c:choose> 
		 								<c:when test="${item.action eq 'DEL'}">
											删除
										</c:when>
										
										<c:when test="${item.action eq 'MOD'}">
											修改
										</c:when> 
										
										<c:when test="${item.action eq 'AUDPASS'}">
											审核通过
										</c:when> 
										
										<c:when test="${item.action eq 'AUDFAIL'}">
											审核失败
										</c:when> 
									
										<c:when test="${item.action eq 'RESTORE'}">
											恢复
										</c:when> 
		 							</c:choose>
		 						</a>
							</td>
							<td>${empty item.dateline? '':dateUtils.formatDate(item.dateline)}</td>
							

						</tr>
					</c:forEach>
				</tbody>
			</table>

			
			<!-- 黑羊头曝光列表end -->

			<!-- 分页 -->
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="../../common/pagehelper.jsp"%>
			</div>

		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="../../common/modal.jsp"%>
</body>
</html>