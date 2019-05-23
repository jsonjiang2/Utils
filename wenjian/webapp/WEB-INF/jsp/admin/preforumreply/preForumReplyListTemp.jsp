<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="allDel" class="myCheck" onclick="PreForumReply.checkDelAll()">
						</td>
						<td>序号</td>
						<td>版块</td>
						<td>发布人</td>
						<td>回复内容</td>
 						<td>帖子主题</td>
						<td>发布时间</td>
						<td>状态</td>
 						<td>操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<c:choose>
									<c:when test="${item.status != -3}">
 										<input type="checkbox" name="checkdelname" class="myCheck" value="${item.id}">
									</c:when>
									<c:otherwise>
 									</c:otherwise>
								</c:choose>
							</td>
							<td>${status.index+1}</td>
							<td>${item.fname}</td>
							<td>${item.username}</td>
							<td title="${item.message}">
								 <c:choose>
								 	<c:when test="${not empty item.message and item.message.length() >= 20}">
								 		${fn:escapeXml(fn:substring(item.message,0,20))}...
								 	</c:when>
								 	<c:otherwise>
								 		${fn:escapeXml(item.message)}
								 	</c:otherwise>
								 </c:choose>
 							</td>
 	 						<td title="${item.tname}">
 	 							<c:choose>
								 	<c:when test="${not empty item.tname and item.tname.length() >= 20}">
								 		${fn:substring(item.tname,0,20)}
								 	</c:when>
								 	<c:otherwise>
								 		${item.tname}
								 	</c:otherwise>
								 </c:choose>
 	 						</td>
							<td>${item.datetimestr}</td>
							<td>
								<c:choose>
									 <c:when test="${item.status == -1}">审核中</c:when>
									 <c:when test="${item.status == -2}">审核失败</c:when>
									 <c:when test="${item.status == -3}">已删除</c:when>
									 <c:when test="${item.status == 0}">审核成功</c:when>
									 <c:when test="${item.status == 1}">已恢复</c:when>
									 <c:otherwise>
									 	未知
									 </c:otherwise>
 								</c:choose>
							</td>
 							<td>
 								<c:choose>
 									<c:when test="${item.status != -3}">
 			 							<button class="btn btn-danger"  onclick="PreForumReply.del(this)" data-opid="${item.id}">删除</button>
 									</c:when>
 									<c:when test="${item.status == -3}">
 										<button class="btn btn-default"  onclick="PreForumReply.restore(this)" data-opid="${item.id}" >恢复</button>
 									</c:when>
 								</c:choose>
  	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
 			<button class="btn btn-default"  onclick="PreForumReply.delBatch(this)" data-audit="1">批量删除</button>
 			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>