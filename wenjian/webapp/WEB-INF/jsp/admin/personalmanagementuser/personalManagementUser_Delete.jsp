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
		<input type="hidden" id="del-id" value="${personalManagementUser.id}">
		是否删除<span style="color: red;">${personalManagementUser.pmname}</span>中的<span style="color: red;">${personalManagementUser.username}</span>
	</div>
</body>
</html>