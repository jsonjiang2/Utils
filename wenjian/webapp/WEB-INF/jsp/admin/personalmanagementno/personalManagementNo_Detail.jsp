<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="row">
		<div class="col-md-5">
			<font style="color: red;">小名单列表</font>
		</div>
	</div>

	<div class="row">
		<div class="col-md-5">
			大名单编号：<span>${personalManagementNo.pmno}</span>
		</div>
	</div>

	<div class="row">
		<div class="col-md-5">
			大名单名称：<span>${personalManagementNo.pmname}</span>
		</div>
	</div>


	<table class="table table-hover">
		<thead>
			<tr>
				<td>序号</td>
				<td>名单编号</td>
				<td>名单名称</td>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${noList}" var="item" varStatus="status">
				<tr class="text-center">
					<td>${status.count}</td>
					<td>${item.pmno }</td>
					<td>${item.pmname }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



</body>
</html>