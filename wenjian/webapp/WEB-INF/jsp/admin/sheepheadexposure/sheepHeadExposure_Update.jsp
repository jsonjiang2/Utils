<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>

	<form id="update-form" class="form-horizontal"> 
		<hr>
		<div class="form-group">
			<label class="col-md-4 control-label">黑羊头标题 ：</label>
			<div class="col-md-5">
				<textarea rows="3" cols="20" class="form-control" type="text" name="title"
					style="text-align: center;width: 230px;">${sheepHeadExposure.title}</textarea>
			</div> 
			<br>

			<label class="col-md-4 control-label">管理员公告 ：</label>
			<div class="col-md-5"> 
				<textarea rows="3" cols="20" class="form-control" name="affiche"
					style="width: 230px; line-height: 18px;">${sheepHeadExposure.affiche}</textarea>
			</div>
			
			<label class="col-md-4 control-label">黑羊头公告消息设置 ：</label>
			<div class="col-md-5"> 
				<textarea rows="3" cols="20" class="form-control" name="sheepmessage"
					style="width: 230px; line-height: 18px;">${sheepHeadExposure.sheepmessage}</textarea>
			</div>
 
			<div class="col-md-5">
				<input class="form-control" type="text" name="id"
					style="text-align: center; width: 230px; line-height: 18px; display: none;"
					value="${sheepHeadExposure.id}">
			</div>
		</div> 
	</form> 
</body>
</html>