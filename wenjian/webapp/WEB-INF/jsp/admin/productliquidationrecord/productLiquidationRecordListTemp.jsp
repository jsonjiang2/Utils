<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
 						<td>序号</td>
						<td>平台名称</td>
                        <td>产品编号</td>
 						<td>投资金额</td>
						<td>活动类型</td>
 						<td>清算方式</td>
 						<td>清算人</td>
 						<td>申报人</td>
  						<td>申报时间</td>
 						<td>返利金额</td>
 						<td>清算状态</td>
  						<td>返利档位</td>
   						<td>操作</td>
   					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
 							<td>${status.index+1}</td>
							<td>
								<wdb:getPlatFormInfo pno="${item.pno}" var="platFormInfo">
									${platFormInfo.pname}-${platFormInfo.pno}
								</wdb:getPlatFormInfo>
 							</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty item.productno}">${item.productno}</c:when>
                                    <c:otherwise>无</c:otherwise>
                                </c:choose>
                            </td>
							<wdb:getProductDeclareRecord declareno="${item.declareno}" var="record">
 		 						<td>${record.investoramount}</td>
							<td>
								<c:choose>
									<c:when test="${item.activitytype == 1 }">首投</c:when>
									<c:when test="${item.activitytype == 2}">复投</c:when>
								</c:choose>
 							</td>
	 						<td>
	 							<c:choose>
	 								<c:when test="${item.liqtype == 1 }">线上</c:when>
	 								<c:when test="${item.liqtype == 2 }">线下</c:when>
 	 							</c:choose>
	 						</td>
	 						<td>
	 							<wdb:getUser uid="${item.liqbaseid}" var="user">${user.username}-${empty user.realname ? '无':user.realname}</wdb:getUser>
	 						</td>
	 						<td>
	 							<c:choose>
	 								<c:when test="${record.type == 1}">无</c:when>
	 								<c:when test="${record.type == 2}">
	 									<wdb:getUser uid="${record.baseid}" var="user">${user.username}-${empty user.realname ? '无':user.realname}</wdb:getUser>
	 								</c:when>
	 								
	 							</c:choose>
 	 						</td>
		 					</wdb:getProductDeclareRecord>
	 						<td>
	 							<wdb:formatDate value="${item.dateline}" var="dateline">${dateline}</wdb:formatDate>
							</td>
	 						<td>${item.rebateamount}</td>
	 						<td>
	 							<c:choose>
	 								<c:when test="${item.status == 0}">待清算</c:when>
	 								<c:when test="${item.status == 1}">已清算</c:when>
 	 							</c:choose>
	 						</td>
 	 						<td>${item.gear}</td>
							<td><button type="button" class="btn btn-default" onclick="PreWdbCommon.detail(this)" data-model="productLiquidationRecord" data-opid="${item.id}">详情</button></td>
   						</tr>
 					</c:forEach>
				</tbody>
			</table>
  			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>