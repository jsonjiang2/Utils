<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<table class="table table-hover" id="personList_table">
	<thead>
		<tr class="text-center" style="background: #ccc;">
			<td>序号</td>
			<td>位置</td>
			<td>排名</td>
			<td>标题</td>
			<td>概述</td>
			<td>图片</td>
    		<td>操作</td>
  			<td>详情</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
			<tr class="text-center">
				<td>${status.index+1}</td>
				<td>
					<a href="${basePath}/admin/insidePagesSettings/list?type=${item.type}" style="color:#0060FF;">
					<c:choose>
						<c:when test="${item.type == 1}">热门帖子</c:when>
						<c:when test="${item.type == 2}">网贷资讯</c:when>
						<c:when test="${item.type == 3}">现金贷</c:when>
   					 	<c:otherwise>
					 		未知
					 	</c:otherwise>
 					</c:choose>
 					</a>
				</td>
				<td>${item.sort}</td>
				<td>
					<c:choose>
						<c:when test="${not empty item.subsubject }">
							<span title="${item.subject }">${item.subsubject}</span>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
				</td>
				<td>
  					<c:choose>
						<c:when test="${not empty item.submessage }">
							<span title="${item.message }">${item.submessage}</span>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${not empty item.img }">
							<button class="btn btn-default" onclick="imgEye('${item.img }')">查看</button>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
 				</td>
   				<td>
					<button class="btn btn-default" data-opid="${item.id}" onclick="settingShow(this)">修改</button>
				</td>
  				<td>
					<button class="btn btn-default" data-opid="${item.id}" onclick="detailShow(this)">详情</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%-- <div id="page_div" style="margin-top: 20px;">
	<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div> --%>