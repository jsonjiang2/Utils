<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
 						<td>序号</td>
 						<td>贷款平台</td>
						<td>产品编号</td>
 						<td>贷款额度</td>
						<td>利息</td>
						<td>是否默认</td>
						<td>关联用户</td>
    					<td>操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.index+1}</td>
							<td>${item.loanPlatformInfo.pname}</td>
 							<td>${item.productno}</td>
							<td>${item.loanminamout} - ${item.loanmaxamout}</td>
	 						<td>${item.loaninterest}</td>
	 						<td>
	 							<c:choose>
	 								<c:when test="${item.isdefault == 1 }">是</c:when>
	 								<c:when test="${item.isdefault == 0 }">否</c:when>
 	 							</c:choose>
	 						</td>
							<td>
								<c:choose>
 	 								<c:when test="${item.userlinkcount == 0 }">无</c:when>
 	 								<c:otherwise>
 	 									${item.userlinkcount}名
 	 								</c:otherwise>
 	 							</c:choose></td>
 	   						<td>
 	   							<button class="btn btn-default" onclick="loanProductInfo.show_setting(this)" data-opid="${item.id}">修改</button>
 	   							<button class="btn btn-default" onclick="loanProductInfo.pre_detail('${item.id}')">详情</button>
 	   							<button class="btn btn-default">删除</button>
   	   						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
 			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>