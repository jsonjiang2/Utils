<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<form>
	<table class="table table-hover" id="personList_table">
		<thead>
			<tr class="text-center" style="background: #ccc;">
				<td>序号</td>
				<td>用户名</td>
				<td>真实姓名</td>
			
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pagehelper.list}" var="item" varStatus="status">

				<tr class="text-center">
					<td>${status.count}</td>
					<td>${item.username}</td>
					<td>${item.realname}</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="c-page">
		<%@include file="/WEB-INF/jsp/common/pagehelper2.jsp"%>
	</div>
</form>