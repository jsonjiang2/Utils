<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
 						<td>序号</td>
						<td>平台名称</td>
						<td>产品名称</td>
						<td>发布时间</td>
 						<td>产品发布人</td>
 						<td>产品状态</td>
 						<td>产品类型</td>
  						<td>操作</td>
   					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
 							<td>${status.index+1}</td>
							<td>${item.pname}</td>
							<td>${item.productname}</td>
							<td>
								<wdb:formatDate value="${item.release }" var="datetime">${datetime}</wdb:formatDate>
							</td>
 	 						<td>
 	 							<wdb:getUser uid="${item.uid }" var="user">
 	 								${user.username}--${user.realname == null ? '无' : user.realname}
 	 							</wdb:getUser>
 	 						</td>
							<td>
								<c:choose>
									<c:when test="${item.onoff == 0}">暂停投资</c:when>
									<c:when test="${item.onoff == 1 }">正常投资</c:when>
									<c:otherwise>
										其他
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${item.type == 1 }">首投</c:when>
									<c:when test="${item.type == 2 }">复投</c:when>
									<c:otherwise>
										其他
									</c:otherwise>
								</c:choose>
							</td>
							<td><button type="button" class="btn btn-default" onclick="ProductRelease.detail(this)" data-opid="${item.id}">详情</button></td>
   						</tr>
 					</c:forEach>
				</tbody>
			</table>
  			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>