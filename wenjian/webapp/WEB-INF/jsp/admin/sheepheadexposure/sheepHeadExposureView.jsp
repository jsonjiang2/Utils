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
<title>黑羊头曝光记录</title>

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

<title>黑羊头曝光记录</title>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">

			<div style="margin-bottom: 10px;"></div>
			<!--黑羊头曝光条件搜索开始  -->
			<form action="sheepView" id="form-select" class="form-inline">
				<input type="hidden" id="pageNum" name="pageNum"> <input
					type="hidden" id="pageSize" name="pageSize">
					
				<div class="form-group">
					黑羊头曝光标题：<input class="form-control" type="text"
						id="select-title-text" name="title"
						data-title="${sheepHeadExposure.title}"
						style="text-align: center; line-height: 18px; width: 220px;"
						placeholder="黑羊头曝光标题">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					显示状态： <select id="select-statu-text" name="statu"
						class="form-control" data-statu="${sheepHeadExposure.statu}">
						<option value="">--请选择发布状态--</option>
						<option value=-1>审核中</option>
						<option value=-2>不合格</option>
						<option value=-3>已删除</option>
						<option value=0>合格</option>
					</select>
				</div>
				&nbsp;&nbsp; 
				<input type="text" style="display: none;" name="id"
					id="select-id-text" data-id="${sheepHeadExposure.id}"> 
				<input
					type="text" style="display: none;" name="baseid"
					id="select-baseid-text" data-baseid="${sheepHeadExposure.baseid}">
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<!--黑羊头曝光条件搜索结束  -->

			<!-- 黑羊头曝光列表start -->
			<table class="table table-hover table-striped">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>发布人</td>
						<td>黑羊头标题</td>
						<td>发布状态</td>
						<td>发布时间</td>
						<td>操作</td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.count}</td>

							<td>
								<a href="${basePath}/admin/sheepHead/sheepView?baseid=${item.baseid}"
								   style="color: blue;"> 
									<wdb:getUser uid="${item.baseid}"
										var="user">
										${user.username}-${user.realname == null ? "无" :user.realname }
									</wdb:getUser>
								</a>
							</td>
							<td>
								<a target="_blank"
									href="${url}detail?id=${item.id}&wdaikey=fb9f74ac80fbf0d35ba2fcec10c93bff"
									style="font-size: 14px;">${item.title}</a>
							</td>

							<td>
								<a href="${basePath}/admin/sheepHead/sheepView?statu=${item.statu}"
								style="color: blue;"> 
									<c:choose>
										<c:when test="${item.statu == -1}">
											<span style="color: orange;">审核中</span>
										</c:when>	
										<c:when test="${item.statu == -2}">
											<span style="color: red;">不合格</span>
										</c:when>
										<c:when test="${item.statu == -3}">
											<span style="color: blue;">已删除</span>
										</c:when>
										<c:when test="${item.statu == 0}">
											<span style="color: green;">合格</span>
										</c:when>
										<c:otherwise>
	 										未知
	 									</c:otherwise>
									</c:choose>
								</a>
							</td>

							<td>${empty item.exposureTime? '':dateUtils.formatDate(item.exposureTime)}</td>
							<td> 
								<button type="button" class="btn btn-default" onclick="SheepHeadExposure.detail('${item.id}')">详情</button>
								<button class="btn btn-default" onclick="edit(this);" data-opid="${item.id}">编辑</button>							
							</td>
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