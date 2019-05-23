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
<title>黑羊头曝光审核</title>
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

</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">

			<div style="margin-bottom: 10px;"></div>
			<!--黑羊头曝光搜索start  -->
			<form action="auditList" id="form-select" class="form-inline">
				<input type="hidden" id="pageNum" name="pageNum"> <input
					type="hidden" id="pageSize" name="pageSize">

				<div class="form-group">
					黑羊头曝光标题：<input class="form-control" type="text" id="select-title-text"
						name="title" data-title="${sheepHeadExposure.title}"
						style="text-align: center; line-height: 18px; width: 220px;"
						placeholder="黑羊头曝光标题">
				</div>
				&nbsp;&nbsp;

				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<!--黑羊头曝光搜索start  -->

			<!-- 黑羊头曝光列表start -->
			<table class="table table-hover table-striped">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="all" class="myCheck"
							onclick="SheepHeadExposure.checkAll()">
						</td>
						<td>序号</td>
						<td>发布人</td>
						<td>黑羊头曝光标题</td>
						<td>发布时间</td>
						<td>操作</td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<%-- <td id="sid" style="display: none;">${item.id}</td> --%>
							<td>
								<input type="checkbox" name="checkname" class="myCheck"
									value="${item.id}">
							</td>
							<td>${status.count}</td>
							<td>
								<a href="${basePath}/admin/sheepHead/auditList?baseid=${item.baseid}"
									style="color: blue;"> 
									<wdb:getUser uid="${item.baseid}" var="user">
										${user.username}-${user.realname == null ? "无" :user.realname }
									</wdb:getUser>
								</a>
							</td>
							<td>
								<a target="_blank"								
									href="${url}detail?id=${item.id}&wdaikey=fb9f74ac80fbf0d35ba2fcec10c93bff"
									style="font-size: 14px;" >${item.title}</a>
							</td>
						
							<td>${empty item.exposureTime? '':dateUtils.formatDate(item.exposureTime)}</td>
							<td>							
								<button class="btn btn-default" onclick="edit(this);" data-opid="${item.id}">编辑</button> 
								<button class="btn btn-default"
									onclick="SheepHeadExposure.auditPass(this);"
									data-opid="${item.id}" data-audit="1">合格</button>
								<button class="btn btn-default" style="color: red;"
									onclick="SheepHeadExposure.auditPass(this)"
									data-opid="${item.id}" data-audit="0">不合格</button> 
								<button type="button" class="btn btn-default"
									onclick="SheepHeadExposure.detail('${item.id}')">详情</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<button type="button" class="btn btn-default" style="width: 100px;"
				onclick="SheepHeadExposure.auditBatchPass(this)" data-audit="1">批量合格</button>
			<button type="button" class="btn btn-danger" style="width: 100px;"
				onclick="SheepHeadExposure.auditBatchPass(this)" data-audit="0">批量不合格</button>

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