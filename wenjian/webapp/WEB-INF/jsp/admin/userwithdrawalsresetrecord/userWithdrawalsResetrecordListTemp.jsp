<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
 <table class="table table-hover" id="personList_table" style="margin-top:25px;">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>提现流水号</td>
 						<td>操作人</td>
      					<td>操作时间</td>
     					<td>详情</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.index+1}</td>
							<td>
								<a href="${basePath}/admin/userWithdrawalsHistory/lists?uworderno=${item.uworderno}" style="color:blue;">${item.uworderno}</a>
 									 
							</td>
 							<td>
								<c:if test="${not empty item.addid}">
									<wdb:getAdminUser uid="${item.addid}" var="auid">
										${auid.username}-${auid.fullname ? '无' : auid.fullname}
									</wdb:getAdminUser>
								</c:if>
							</td>
 							<td>
								<wdb:formatDate value="${item.addtime}" var="addtime">
									${empty addtime ? '无' : addtime}
								</wdb:formatDate>
							</td>
  	 						<td>
	 							<button class="btn btn-default" onclick="userWithdrawalsResetrecordObject.detail('${item.id}')">详情</button>
	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper2.jsp"%>
			</div>