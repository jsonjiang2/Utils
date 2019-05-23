<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
 						<td>序号</td>
						<td>普通用户</td>
						<td>管理用户</td>
 						<td>绑定时间 </td>
 						<td>解绑时间 </td>
 						<td>是否解绑</td>
						<td>绑定人</td>
  						<td>操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
 							<td>${status.index+1}</td>
							<td>
 								<wdb:getUser uid="${item.uid }" var="user">
									${user.username}-${user.realname == null ? "无" :user.realname }
								</wdb:getUser>
 							</td>
 							<td>
								<wdb:getAdminUser uid="${item.auid }" var="auid">
									${auid.username}-${auid.fullname == null ? "无" :auid.fullname }
								</wdb:getAdminUser>
 							</td>
							<td>
								<wdb:formatDate value="${item.dateline }" var="dateline">
									${dateline }
								</wdb:formatDate>
							</td>
							<td>
								<wdb:formatDate value="${item.udateline }" var="udateline">
									${udateline }
								</wdb:formatDate>
							</td>
							<td>
								<c:choose>
									<c:when test="${item.status == 1}">否</c:when>
									<c:when test="${item.status == 0}">是</c:when>
 								</c:choose>
 							</td>
	 						<td>	
	 							<wdb:getAdminUser uid="${item.binduid }" var="binduid">
									${binduid.username}-${binduid.fullname == null ? "无" :binduid.fullname }
								</wdb:getAdminUser>
		 					</td>
  							<td>
  								<c:if test="${item.status == 1}">
 	 								<a class="btn btn-default" onclick="ubindUser(this)" data-opid="${item.id}">解除绑定</a>
  								</c:if>
     	 					</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
 			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>