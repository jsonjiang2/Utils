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

	<div align="center">
		<input type="hidden" id="del-id" value="${personalManagementNo.id}">
		确认删除大名单<span style="color: red;">${personalManagementNo.pmname}</span>下的匹配信息
	</div>

</body>
</html>