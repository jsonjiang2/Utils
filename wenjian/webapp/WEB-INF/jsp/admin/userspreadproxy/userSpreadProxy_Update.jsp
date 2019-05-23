<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div align="center">
		<form class="form-horizontal" role="form"  id="userSpreadQuery_updateForm">
		
			<input type="hidden" name="id"  id="id_update" value="${userSpreadQuery.id}">
			<input type="hidden" name="recommendstatus" id="recommendstatus_update" value="${userSpreadQuery.recommendstatus}">
		</form>
		<c:if test="${userSpreadQuery.recommendstatus eq 1}">
			是否确定<span style="color: red;">关闭</span>推荐
		</c:if>
		<c:if test="${userSpreadQuery.recommendstatus eq 0}">
			是否确定<span style="color: red;">开启</span>推荐
		</c:if>
	</div>
</body>
</html>