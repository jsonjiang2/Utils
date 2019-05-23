<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	//动态添加小名单
	function createNo(obj) {
		var pmno=$("#pmno-update").val();
		var no=$("#update-no-text").val();
		if(no==null||no==""){
			alert("提示：请填写小名单");
			return;
		}
	
		var arr=$("input[name='nos']");
		for(var i=0;i<arr.length;i++){
			var obj=arr[i];
			if(obj.value==no){
				alert("提示：请勿重复设置名单编号："+no);
				return;
			}
		}
		
		var action="insertNo";
		var params={"pmno":pmno,"no":no};
		$.post(action,params,function(data){
			var personalManagement = data.personalManagement;
			if (data.result == "success") {
				var $div = $("#no-div");
				var $noInput = "<div class='form-group'><label class='col-md-3 control-label'>小名单 ：</label>"
					+"<input type='hidden' name='nos' value="+personalManagement.pmno+"> <input type='hidden' name='pmnames' value="
					+personalManagement.pmname
					+"> <div class='col-md-4'> <input class='form-control' type='text' disabled='disabled' value="
					+personalManagement.pmno+" style='text-align: center; width: 185px; line-height: 18px;'> </div>"
					+"<div class='col-md-3'> <input class='form-control' type='text'  disabled='disabled' value="
					+personalManagement.pmname+" style='text-align: center;width: 135px; line-height: 18px;'></div> <div class='col-md-2'>"
					+"<button type='button' style='color:red;' onclick='removeNo(this)' class='btn btn-default'>删除</button></div></div>";
				$div.append($noInput);
			}else{
				alert(data.Msg);
			}
		});
	}
</script>
</head>
<body>

	<form id="update-form" class="form-horizontal">
		<div class="row" style="line-height: 0px;">
			<div class="col-md-4 col-md-offset-1" style="padding-left: 30px;">
				<font color="red"><b>大小名单匹配</b></font>
				<input type="hidden" name="id" value="${personalManagementNo.id}">
				<input type="hidden" name="pmno" id="pmno-update" value="${personalManagementNo.pmno }">
			</div>
		</div>
		<hr>
		<div class="form-group">
			<label class="col-md-3 control-label">大名单名称 ：</label>
			<div class="col-md-5">
			<input class="form-control" style="text-align: center; line-height: 18px;"
			disabled="disabled"  value="${personalManagementNo.pmname}">
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">小名单：</label>
			<div class="col-md-5">
				<input type="text" class="form-control" id="update-no-text">
			</div>

			<div class="col-md-2">
				<button type="button" style="color: blue;" class="btn btn-default" onclick="createNo(this);">添加</button>
			</div>
		</div>
		
		
		<div id="no-div">

			<c:forEach items="${noList }" var="item">
				<div class='form-group'>
					<label class='col-md-3 control-label'>小名单 ：</label><input
						type='hidden' name='nos' value="${item.pmno}"> <input
						type='hidden' name='pmnames' value="${item.pmname}">
					<div class='col-md-4'>
						<input class='form-control' type='text' disabled='disabled'
							value=" ${item.pmno}"
							style='text-align: center; width: 185px; line-height: 18px;'>
					</div>

					<div class='col-md-3'>
						<input class='form-control' type='text' disabled='disabled'
							value="${item.pmname}"
							style='text-align: center; width: 135px; line-height: 18px;'>
					</div>
					<div class='col-md-2'>

						<button type='button' style="color: red;" onclick='removeNo(this)'
							class='btn btn-default'>删除</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="form-group">
			<label for="update-remark-text" class="col-md-3 control-label">备注
				：</label>
			<div class="col-md-5">
				<textarea rows="3"  class="form-control"
					name="remark" id="update-remark-text"></textarea>
			</div>
		</div>


	</form>



</body>
</html>