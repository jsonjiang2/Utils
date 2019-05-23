<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
 						<td>序号</td>
						<td>产品编号</td>
						<td>预约码编号</td>
						<td>预约码</td>
 						<td>状态</td>
 						<td>产品名称</td>
 						<td>购买人</td>
 						<td>购买金额</td>
 						<td>购买方式</td>
 						<td>购买时间</td>
   					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
 							<td>${status.index+1}</td>
							<td>${item.productno}</td>
							<td>${item.codeno}</td>
							<td>${item.code}</td>
 	 						<td>
 	 							<c:choose>
								 	<c:when test="${item.status == 0}">未使用</c:when>
								 	<c:when test="${item.status == 1}">已购买</c:when>
								 	<c:when test="${item.status == 2}">已使用</c:when>
 								 	<c:otherwise>
								 		未知
								 	</c:otherwise>
								 </c:choose>
 	 						</td>
							<td>产品名称</td>
							<td>${item.username}</td>
							<td>${item.amount}</td>
							<td>
								<c:choose>
									 <c:when test="${item.buytype == 1}">支付宝</c:when>
									 <c:when test="${item.buytype == 2}">微信</c:when>
									 <c:when test="${item.buytype == 3}">账户余额</c:when>
									 <c:when test="${item.buytype == 4}">网银</c:when>
									 <c:when test="${item.buytype == 5}">线下转账</c:when>
									 <c:otherwise>
									 	未知
									 </c:otherwise>
 								</c:choose>
							</td>
							<td>${item.buytimestr}</td>
   						</tr>
 					</c:forEach>
				</tbody>
			</table>
  			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>