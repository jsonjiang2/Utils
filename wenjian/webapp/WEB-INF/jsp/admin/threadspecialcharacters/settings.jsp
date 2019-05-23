<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>主题平台名称设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<style type="text/css">
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}

.myCheck {
	background-color: white;
	border-radius: 5px;
	border: 1px solid #d3d3d3;
	width: 16px;
	height: 16px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	line-height: 16px;
}
 
</style> 
<script type="text/javascript">
$(function(){
	$("#settings-pname").val($("#updateSetting_remark").val());
	$("#settings-pname").val($("#updateSetting_pname").val());
 })
</script>
</head>
<body>
	<form class="form-horizontal">
		<div id="settings_main_box">
			<input type="text" name="opid" id="updateSetting_id" value="${characters.id}" style="display:none;">
 			<input type="text" name="opid" id="updateSetting_pname" value="${characters.pname}" style="display:none;">
  			
			<div class="form-group">
				<label for="setting_type" class="col-sm-2 control-label">平台名称</label>
				<div class="col-sm-6">
				 	<input name="pname" type="text" id="settings-pname" class="form-control"/>
				</div>
			</div>
 
		   <div class="form-group">
				<label for="setting_tid" class="col-sm-2 control-label">备注</label>
				<div class="col-sm-6">
					<textarea class="form-control" name="remark"style="max-width: 270px;min-height: 120px;min-width: 270px;">${characters.remark}</textarea>
				</div>
			</div>
 		</div>
	</form>
 </body>
</html>