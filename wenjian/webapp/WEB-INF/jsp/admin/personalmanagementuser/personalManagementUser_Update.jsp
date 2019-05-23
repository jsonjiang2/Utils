<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function() {
		$("#update-form").bootstrapValidator(updateValidate);
	});
</script>
</head>
<body>

	<form id="update-form" class="form-horizontal">
		<div class="row" style="line-height: 0px;">
			<div class="col-md-4 col-md-offset-1" style="padding-left: 30px;">
				<font color="red"><b>成员编辑</b></font> 
				<input type="hidden" name="id" value="${personalManagementUser.id}"> 
				<input type="hidden" id="update-pmno-text" value="${personalManagementUser.pmno}">
			</div>
		</div>
		<hr> 
		<div class="form-group">
			<label class="col-md-4 control-label">小名单编号 ：</label>
			<div class="col-md-5">
				<input class="form-control" type="text" disabled="disabled"
					style="text-align: center; width: 230px; line-height: 18px;"
					value="${personalManagementUser.pmno}">
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-4 control-label">小名单名称 ：</label>
			<div class="col-md-5">
				<input class="form-control" type="text" disabled="disabled"
					style="text-align: center; width: 230px; line-height: 18px;"
					value="${personalManagementUser.pmname}">
			</div>
		</div>


		<div class="form-group">
			<label class="col-md-4 control-label">成员 ：</label>
			<div class="col-md-5">
				<input class="form-control" type="text" name="username"
					value="${personalManagementUser.username}"
					style="text-align: center; width: 230px; line-height: 18px;">
			</div>

		</div>

	</form>

</body>
</html>