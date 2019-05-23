<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
 
	<script type="text/javascript">
		$("#del-btn").attr("disabled", "disabled");//禁用删除按钮,防止删除有匹配信息的名单
	</script>
	<div align="center">
		<c:if test="${empty isDel }">

			<input type="hidden" id="del-id" value="${personalManagement.id}">
				是否删除<span style="color: red;"><label> <c:choose>
						<c:when test="${personalManagement.pmtype eq 1}">大名单</c:when>
						<c:when test="${personalManagement.pmtype eq 2}">小名单</c:when>
					</c:choose>
			</label></span>中的<span style="color: red;"><label>${personalManagement.pmname}</label></span>?
				
				<script type="text/javascript">
					$("#del-btn").removeAttr("disabled");
				</script>


		</c:if>
		<c:if test="${not empty isDel }">
			<span style="color: red;"><label>${personalManagement.pmname }</label></span>存在匹配信息，无法删除。</c:if>
	</div>
</body>
</html>