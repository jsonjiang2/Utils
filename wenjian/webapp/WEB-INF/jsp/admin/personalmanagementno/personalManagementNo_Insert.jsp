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

	function createNo(obj) {
		var pmno = $("#insert-pmno-text").val();
		if (pmno == null || pmno == "") {
			alert("请选择大名单");
			return;
		}

		var no = $("#insert-no-text").val();
		if (no == null || no == "") {
			alert("请填写小名单编号");
			return;
		}

		var action = "insertNo";
		var parames = {
			"pmno" : pmno,
			"no" : no
		};

		$.post( action,parames,function(data) {//处理Controller返回的结果
			var personalManagement = data.personalManagement;
			if (data.result == "success") {
				var $div = $("#no-div");
				var $noInput = "<div class='form-group'><label class='col-md-3 control-label'>小名单:</label>"
					+ "<input type='hidden' name='nos' value="
					+personalManagement.pmno+"> <input type='hidden' name='pmnames' value="
					+personalManagement.pmname
					+"> <div class='col-md-4'> <input class='form-control' type='text' disabled='disabled' value="
					+personalManagement.pmno+" style='text-align: center; width: 180px; line-height: 18px;'> </div>"
					+ "<div class='col-md-3'> <input class='form-control' type='text'  disabled='disabled' value="
					+personalManagement.pmname+" style='text-align: center;width: 135px; line-height: 18px;'></div> <div class='col-md-2'>"
					+ "<button type='button' style='color:red;' onclick='removeNo(this)' class='btn btn-default'>删除</button></div></div>";
				$div.append($noInput);
			} else {
				alert(data.Msg);
			}
		});
	}
</script>
</head>
<body>
	<form id="insert-form" class="form-horizontal">
		<div class="row">
			<div class="col-md-3 col-md-offset-1" style="padding-left: 30px;">
				<font style="color: red;">大小名单匹配</font>
			</div>
		</div>
		<hr>

		<div class="form-group">
			<label class="col-md-3 control-label">大名单名称:</label>
			<div class="col-md-5"> 
				<select id="insert-pmno-text" name="pmno" style="width: 230px;" class="form-control">
					<option value="">--------请选择名单--------</option>
					<c:forEach items="${noList}" var="item">
						<option value="${item.pmno}">${item.pmname}</option>
					</c:forEach>
				</select>
				
			</div>
			&nbsp;
			<div class="col-md-4">
				<p style="line-height:0px;color: red;">若无名单选择,请新建大名单</p>
			</div>

		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">输入小名单编号:</label>
			<div class="col-md-5">
				<input class="form-control" type="text" id="insert-no-text"
					style="text-align: center; line-height: 18px;width: 230px;">
			</div>

			<div class="col-md-3" style="margin-left: 5px;">
				<button type="button" style="color: blue;" class="btn btn-default"
					onclick="createNo(this);">添加</button>
			</div>

		</div>
		<div id="no-div"></div>

		<div class="form-group">
			<label class="col-md-3 control-label">备注:</label>
			<div class="col-md-5">
				<textarea rows="3" id="insert-remark-text" style="width: 230px;" name="remark"
					class="form-control"></textarea>
			</div>

		</div>

	</form>
</body>
</html>