<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
 						<td>序号</td>
						<td>平台名称</td>
						<td>申报方式</td>
						<td>产品编号</td>
 						<td>原始申报人</td>
 						<td>申报时间</td>
 						<td>审核状态</td>
 						<td>投资人姓名</td>
 						<td>投资人手机</td>
  						<td>投标期</td>
 						<td>投资时间</td>
 						<td>投资金额</td>
 						<td>投资档位</td>
						<td>级别</td>
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
									<c:when test="${item.type == 1}">游客申报</c:when>
									<c:when test="${item.type == 2}">会员申报</c:when>
									<c:otherwise>未知</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${not empty item.productno}">${item.productno}</c:when>
 									<c:otherwise>无</c:otherwise>
								</c:choose>
 							</td>
	 						<td>
	 							<c:choose>
									<c:when test="${item.type == 1}">
										无
									</c:when>
									<c:when test="${item.type == 2}">
										<wdb:getUser uid="${item.baseid}" var="user">
											${user.username}-${empty user.realname ? '无':user.realname}
										</wdb:getUser>
									</c:when>
									<c:otherwise>未知</c:otherwise>
								</c:choose>
	 						</td>
	 						<td>
	 							<wdb:formatDate value="${item.dateline}" var="dateline">${dateline}</wdb:formatDate>
	 						</td>
	 						<td>
	 							<c:choose>
									<c:when test="${item.auditstatus == 0}">待审核</c:when>
									<c:when test="${item.auditstatus == 1}">合格</c:when>
									<c:when test="${item.auditstatus == 2}">不合格</c:when>
 									<c:otherwise>未知</c:otherwise>
								</c:choose>
	 						</td>
	 						<td>${item.investorname}</td>
	 						<td>${item.investormobile}</td>
 	 						<td>
									<c:choose>
										 <c:when test="${item.tendertype == 1 }">${item.tenderperiod}--天</c:when>
										 <c:when test="${item.tendertype == 2 }">${item.tenderperiod}--月</c:when>
										 <c:when test="${item.tendertype == 3 }">${item.tenderperiod}--年</c:when>
 									</c:choose>

							</td>
	 						<td>	 							
	 							 <wdb:formatYYMMDDDate value="${item.investortime}" var="investortime">${investortime}</wdb:formatYYMMDDDate>
							</td>
	 						<td>${item.investoramount}</td>
	 						<td>${item.gear}</td>
							<td>${item.level}</td>
 							<td><button type="button" class="btn btn-default" onclick="PreWdbCommon.detail(this)" data-opid="${item.id}" data-model="productDeclareRecord">详情</button></td>
   						</tr>
 					</c:forEach>
				</tbody>
			</table>
  			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>