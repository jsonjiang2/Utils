<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
 <table class="table table-hover" id="personList_table">
	<thead>
		<tr class="text-center" style="background: #ccc;">
			<td>序号</td>
			<td>位置</td>
			<td>排名</td>
			<td>标题</td>
			<td>图片</td>
			<td>来源</td>
			<td title="主题/资讯发布时间">发布时间</td>
			<td>添加时间</td>
			<td>操作人</td>
			<td>操作</td>
			<td>详情</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
			<tr class="text-center">
				<td>${status.index+1}</td>
				<td>
					<c:choose>
						<c:when test="${item.ftype == 1 }">h5-首页</c:when>
					</c:choose>
				</td>
				<td>${item.sort}</td>
				<td>${item.subject}</td>
					<td>
						<c:choose>
						<c:when test="${item.imgtype == 0 }">0图</c:when>
						<c:when test="${item.imgtype == 1 }">1大图</c:when>
						<c:when test="${item.imgtype == 4 }">1小图</c:when>
						<c:when test="${item.imgtype == 2 }">2图</c:when>
						<c:when test="${item.imgtype == 3 }">3图</c:when>
						</c:choose>
					</td>
				<td>
					<c:choose>
						<c:when test="${item.type == 1 }">茶馆</c:when>
						<c:when test="${item.type == 2 }">资讯</c:when>
					</c:choose>
				</td>
				<td>
					<wdb:formatDate value="${item.tdateline }" var="tdateline">
						${tdateline }
					</wdb:formatDate>
				</td>
				<td>
					<wdb:formatDate value="${item.dateline }" var="dateline">
						${dateline }
					</wdb:formatDate>
				</td>
				<td>
					<wdb:getAdminUser uid="${item.ubaseid }" var="ubaseid">
						${ubaseid.username}
					</wdb:getAdminUser>
				</td>
				<td>
					<button type="button" class="btn btn-default" onclick="mobileHomePagesSettings.settingShow(this)" data-opid="${item.id}">修改</button>
					<button type="button" class="btn btn-default" onclick="mobileHomePagesSettings.del(this)" data-opid="${item.id}">删除</button>
 				</td>
				<td>
					<button type="button" class="btn btn-default" onclick="mobileHomePagesSettings.detail('${item.id }')">详情</button>
				</td>
				</tr>
			</c:forEach>
	</tbody>
</table>
<div id="page_div" style="margin-top: 20px;">
	<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div>