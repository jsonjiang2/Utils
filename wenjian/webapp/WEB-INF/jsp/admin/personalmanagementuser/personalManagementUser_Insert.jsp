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
		$("#insert-pmno-text").change(function() {
			var pmno = $(this).val();
			$.post("/admin/personalManagement/getPersonalManagement", {
				"pmno" : pmno
			}, function(data) {
				$("#insert-remark-text").val(data.remark);
			});
		});
	});

	function createUser(obj) {
		var no = $("#insert-pmno-text").val();
		if (no == null || no == "") {
			alert("请选择小名单");
			return;
		}

		var username = $("#insert-username-text").val();
		if (username == null || username == "") {
			alert("请填写用户名");
			return;
		}

		var action = 'insertUname';
		var parames = {
			"pmno" : no,
			"username" : username
		};

		$.post(action,parames,function(data) {//处理Controller返回的结果
			if (data.result == "success") {

				var member = data.member;

				var arr = $("input[name='baseids']");
				for (var i = 0; i < arr.length; i++) {
					var obj = arr[i];
					if (obj.value == member.uid) {
						alert("提示：请勿重复设置成员：" + member.username);
						return;
					}
				}

				var $div = $("#username-div");

				var $userInput = "<div class='form-group'> <label class='col-md-4 control-label'>成员:</label>"
						+"<div class='col-md-5'> <input type='hidden' class='form-control' name='baseids' value="
						+member.uid +"> <input type='test' name='' class='form-control' style='text-align: center;'value="
						+member.username+"-"+member.realname +" disabled='disabled'> </div> <div class='col-md-2'>"
						+"<button style='color:red;' class='btn btn-default' onclick='removeUser(this);'>删除</button> </div> </div>";

				$div.append($userInput);

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
			<div class="col-md-4 col-md-offset-1" style="padding-left: 30px;">
				<font style="color: red;">添加成员</font>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-4 control-label">小名单:</label>
			<div class="col-md-5">
				<select id="insert-pmno-text" name="pmno" class="form-control">
					<option value="">-----请选择小名单-----</option>
					<c:forEach items="${noList}" var="item">
						<option value="${item.pmno}">${item.pmname}</option>
					</c:forEach>

				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-4 control-label">成员:</label>
			<div class="col-md-5">
				<input type="text" name="username" id="insert-username-text" style="text-align: center;"
					class="form-control">
			</div>
			<div class="col-md-2">
				<button style="color: blue;" type="button"
					onclick="createUser(this);" class="btn btn-default">添加</button>
			</div>
		</div>

		<div id="username-div"></div>

		<div class="form-group">
			<label for="insert-remark-text" class="col-md-4 control-label">备注:</label>
			<div class="col-md-5">
				<textarea rows="3" cols="" id="insert-remark-text" name="remark"
					class="form-control"></textarea>
			</div>

		</div>
	</form>
</body>
</html>