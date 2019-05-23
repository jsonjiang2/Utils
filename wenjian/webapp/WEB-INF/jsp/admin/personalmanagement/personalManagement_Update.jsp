<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	//大小名单编辑验证
	var updateValidate = {
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},

		fields : {
			pmname : {
				validators : {
					notEmpty : {
						message : "* 请输入名单名称"

					},

					remote : {
						message : "* 该名单名称已存在",
						url : 'validatePmname',
						type : 'POST',
						data : function(validators) {
							return {
								pmname : $("input[name='pmname']").val()
							};
						}
					}
				}
			}
		}
	}

	$(function() {
		$("#update-form").bootstrapValidator(updateValidate);
	});
</script>
</head>
<body>

	<form id="update-form" class="form-horizontal">
		<div class="row">
			<div class="col-md-4 col-md-offset-1" style="padding-left: 30px;">
				<font style="color: red;">大小名单编辑</font> 
				<input type="hidden" name="id" value="${personalManagement.id}" />
			</div>
		</div>
		<hr>
		<div class="form-group">
			<label class="col-md-4 control-label">名单类型：</label>
			<div class="col-md-5">
				<select id="update-pmtype-text" name="pmtype" class="form-control"
					disabled="disabled">

					<option>
						<c:choose>
							<c:when test="${personalManagement.pmtype eq 1}">大名单</c:when>
							<c:when test="${personalManagement.pmtype eq 2}">小名单</c:when>
						</c:choose>
					</option>

				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-4 control-label">名单编号：</label>
			<div class="col-md-5" style="height: 30px;">
				<input class="form-control"
					style="line-height: 18px; text-align: center;" type="text" name=""
					id="" value="${personalManagement.pmno}" disabled="disabled" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-4 control-label">名单名称：</label>
			<div class="col-md-5" style="height: 30px;">
				<input class="form-control"
					style="line-height: 18px; text-align: center;" type="text"
					name="pmname" id="" value="${personalManagement.pmname}"
					placeholder="请填写名单名称" />
			</div>
		</div>
		<br>
		<div class="form-group">
			<label class="col-md-4 control-label">备注：</label>
			<div class="col-md-5" style="height: 30px;">
				<textarea rows="2" class="form-control" name="remark"
					id="update-remark-text">${personalManagement.remark}</textarea>
			</div>
		</div>
	</form>
</body>
</html>