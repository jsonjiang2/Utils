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
			<td>更新方式</td>
   			<td>操作</td>
  			<td>详情</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
			<tr class="text-center">
				<td>${status.index+1}</td>
				<td>
					<a href="${basePath}/admin/threadShowSettings/list?type=${item.type}" style="color:#0060FF;">
					<c:choose>
						<c:when test="${item.type == 1}">头条</c:when>
						<c:when test="${item.type == 2}">次头条</c:when>
						<c:when test="${item.type == 3}">轮播图</c:when>
						<c:when test="${item.type == 4}">热门平台</c:when>
						<c:when test="${item.type == 5}">网贷资讯</c:when>
						<c:when test="${item.type == 6}">资源主推荐</c:when>
						<c:when test="${item.type == 7}">巴士-最新</c:when>
						<c:when test="${item.type == 8}">巴士-最热</c:when>
						<c:when test="${item.type == 9}">巴士-精华</c:when>
						<c:when test="${item.type == 10}">平台推荐</c:when>
						<c:when test="${item.type == 11}">今日收录</c:when>
						<c:when test="${item.type == 12}">h5轮播图</c:when>
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
 					<c:choose>
						<c:when test="${item.status == 1 }">
							  自更
						</c:when>
						<c:otherwise>手更</c:otherwise>
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
