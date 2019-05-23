<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>贷款产品设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript">
$(function(){
	 var opid = $("#u_id").val();
	 if(opid > 0){
 		 var u_pid = $("#u_pid").val();
   
	 }
 })
</script>
</head>
<body>
	<form class="form-horizontal">
 		<input type="text" id="u_id" value="" style="display:none;">
    		
		<div id="main_box">
  			<div class="setting_box setting_type_box_1" id="paramsBox">
 				<input type="text" class="form-control" name="opid" style="display:none;">
  				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">菜单类型</label>
					<div class="col-sm-6 subject">
						<select name="type" class="form-control">
							<option value="1">菜单</option>
						</select>
					</div>
 				</div>
 				
 				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">菜单名称</label>
					<div class="col-sm-6 subject">
						<input type="text" class="form-control" name="name" placeholder="菜单名称">
					</div>
 				</div>
 				
 				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">id名称</label>
					<div class="col-sm-6 subject">
						<input type="text" class="form-control" name="classname" placeholder="id名称 ">
					</div>
 				</div>
 				
 				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">类名称 </label>
					<div class="col-sm-6 subject">
						<input type="text" class="form-control" name="classname" placeholder="类名称">
					</div>
 				</div>
 				
 				<div class="form-group">
					<label class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link" placeholder="链接">
					</div>
   				</div>
  				
				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="100">--未选择排名--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
  						</select>
					</div>
				</div>
 				
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="remark" style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
				</div>
				
 			</div>
  
 		</div>
	</form>
 </body>
</html>