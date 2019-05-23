<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
 						<td>序号</td>
 						<td>贷款平台</td>
						<td>cookie</td>
 						<td>ip</td>
						<td>登录用户</td>
						<td>类型</td>
 						<td>时间</td>
						<td>链接</td>
   					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.index+1}</td>
							<td>
								<c:choose>
									<c:when test="${item.type == 5 }">
 										${item.platforminfo.pname}
									</c:when>
									<c:when test="${item.type == 6 }">
 										${item.loanPlatformInfo.pname}
									</c:when>
									<c:otherwise>
										无
									</c:otherwise>
								</c:choose>
							</td>
 							<td>${item.cookie}</td>
							<td>${item.ip}</td>
	 						<td>
	 							<c:choose>
	 								<c:when test="${item.baseid > 0}">
	 									<wdb:getUser uid="${item.baseid}" var="baseid">
	 										${baseid.username}
	 									</wdb:getUser>
	 								</c:when>
	 								<c:otherwise>游客</c:otherwise>
	 							</c:choose>
	 						</td>
	 						<td>
	 							<c:choose>
	 								<c:when test="${item.type == 1}">
	 									 首页
	 								</c:when>
	 								<c:when test="${item.type == 2}">
	 									 理财列表
	 								</c:when>
	 								<c:when test="${item.type == 3}">
	 									 贷款列表
	 								</c:when>
	 								<c:when test="${item.type == 4}">
	 									 配资列表
	 								</c:when>
	 								<c:when test="${item.type == 5}">
	 									  理财详情
	 								</c:when>
	 								<c:when test="${item.type == 6}">
	 									 贷款详情
	 								</c:when>
	 								<c:when test="${item.type == 7}">
	 									 配资详情
	 								</c:when>
	 								<c:otherwise>其他</c:otherwise>
	 							</c:choose>
	 						</td>
	 						<td>
	 							<wdb:formatDate value="${item.dateline}" var="dateline">
	 								${dateline}
	 							</wdb:formatDate>
	 						</td>
							<td>${item.link}</td>
   						</tr>
 					</c:forEach>
				</tbody>
			</table>
 			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>