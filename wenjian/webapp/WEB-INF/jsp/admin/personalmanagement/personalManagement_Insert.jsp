<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function() {
		$("#insert-form").bootstrapValidator(insertValidate);
	});
</script>
</head>
<body>
	<div>
		<form id="insert-form" class="form-horizontal">
			<div class="row">
				<div class="col-md-4 col-md-offset-1" style="padding-left: 30px;">
					<font style="color: red;">大小名单录入</font>

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-4">名单类型： </label>
				<div class="col-md-5">
					<select id="insert-pmtype-select" name="pmtype"
						class="form-control" style="width: 230px;">
						<option value="">-----请选择名单类型-----</option>
						<option value="1">大名单</option>
						<option value="2">小名单</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-4">名单名称：</label>
				<div class="col-md-5">
					<input type="text" class="form-control" name="pmname"
						style="text-align: center; width: 230px;" placeholder="请填写名单名称">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-4">备注：</label>
				<div class="col-md-5">
					<textarea rows="3" id="insert-remark-text" name="remark"
						style="width: 230px;" class="form-control"></textarea>
				</div>
			</div>

		</form>
	</div>
</body>
</html>