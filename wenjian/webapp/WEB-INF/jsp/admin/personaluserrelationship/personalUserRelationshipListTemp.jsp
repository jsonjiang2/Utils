<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
					<!-- 	<td>
							<input type="checkbox" id="all" class="myCheck" onclick="PreForumThread.checkAll()">
						</td> -->
						<td>序号</td>
						<td>用户</td>
						<td>域名</td>
 						<td>设置时间</td>
   						<td>操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<%-- <td>
								<input type="checkbox" name="checkname" class="myCheck" value="${item.id}">
							</td> --%>
							<td>${status.index+1}</td>
						    <td>
						    	<wdb:getUser uid="${item.baseid }" var="baseid">
 						    		${baseid.username}-${empty baseid.realname ? '无' : baseid.realname }
 						    	</wdb:getUser>
 						    </td>
						    <td>${item.domainname }</td>
 						    <td>
 						    	<wdb:formatDate value="${item.settime }" var="settime">
 						    		${settime}
 						    	</wdb:formatDate>
 						    </td>
 						     <td>
 						     	<button class="btn btn-default" onclick="PersonalUserRelationship.insertShow(this)" data-opid="${item.id}">修改</button>
 						     	<button class="btn btn-default" onclick="PersonalUserRelationship.del(this)" data-opid="${item.id}">删除</button>
 						     	
 						     </td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
 			
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>