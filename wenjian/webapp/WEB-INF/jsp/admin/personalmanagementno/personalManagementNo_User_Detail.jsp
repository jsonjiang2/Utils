<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>名单匹配</title>
<script type="text/javascript">
	function queryAllPerson2(pageNum, pageSize) {
		var id = "${personalManagementNo.id}";
		var params = {
			"id" : id,
			"pageNum" : pageNum
		};
		$.post("/admin/personalManagementNo/usersDetail/" + id, params,
				function(data) {
					$("#usersjsp").html(data);
				});
	}
</script>
</head>
<body>
	<div class="row" style="line-height: 0px;">
		<div class="col-md-4 col-md-offset-1" style="padding-left: 30px;">
			<font color="red"><b>名单成员详情</b></font>
		</div>
		<hr>
	</div>
	<div class="row" style="line-height: 0px;">
		<div class="col-md-12 col-md-offset-1">
			大名单编号&nbsp;&nbsp;： <label>${personalManagementNo.pmno }</label>
		</div>
	</div>
	<hr>
	<div class="row" style="line-height: 0px;">
		<div class="col-md-12 col-md-offset-1">
			大名单名称&nbsp;&nbsp;： <label>${personalManagementNo.pmname }</label>
		</div>
	</div>
	<hr>
	<div class="col-md-12" id="usersjsp">
		<%@include
			file="/WEB-INF/jsp/admin/personalmanagementno/personalManagementNo_Users.jsp"%>
		<hr>
	</div>
</body>
</html>