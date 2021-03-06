<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>论坛基础版块修改</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/preforumforum/preForumForum.js"></script>
</head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form id="update-form" class="form-horizontal bv-form" novalidate="novalidate">
				<div class="row" style="line-height: 0px;">
					<div class="col-md-4 col-md-offset-3" style="padding-left: 30px;">
						<font color="red">
							<b>论坛基础版块修改</b>
						</font>
					</div>
				</div>
				<hr>
				
				<!-- 论坛基础版块名称 start-->
				<div class="form-group has-feedback">
					<label class="col-md-4 control-label">论坛基础版块名称：</label>
					<div class="col-md-2">
						<input class="form-control"  name="name"  value="${preForumForum.name}" style="text-align: center; width: 230px; line-height: 18px;"
						 type="text">
						 <input class="form-control" value="${preForumForum.fid}" name="fid" type="hidden" readonly="readonly">
  					</div>
 				</div>
				<!-- 论坛基础版块名称 end-->
				
				<!-- 显示顺序 start-->
				<div class="form-group has-feedback">
					<label class="col-md-4 control-label">显示顺序：</label>
					<div class="col-md-2">
						<input class="form-control"  name="displayorder" value="${preForumForum.displayorder}" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" style="text-align: center; width: 230px; line-height: 18px;"
						 type="text">
   					</div>
 				</div>
				<!-- 显示顺序 end-->
				
				<!-- 显示状态 start-->
				<div class="form-group has-feedback">
					<label class="col-md-4 control-label">显示状态：</label>
					<div class="col-md-2">
						<select name="status" id="status" class="form-control" style="width: 230px;">
 								<option value="1">显示</option>
 								<option value="0">不显示<option>
 						</select>
     				</div>
 				</div>
				<!-- 显示状态 end-->
 		  
				<!-- 备注 start-->
				<div class="form-group has-feedback">
					<label class="col-md-4 control-label">备注：</label>
					<div class="col-md-2">
						<textarea class="form-control" name="remark" style="text-align: center; width: 230px; line-height: 18px;max-width: 500px;">${preForumForum.remark }</textarea>
						<i class="form-control-feedback" data-bv-icon-for="remark" style="display: none;"></i>
						<small class="help-block" data-bv-validator="notEmpty" data-bv-for="remark" data-bv-result="NOT_VALIDATED" style="display: none	;">* 请填写序号</small>
					</div>
				</div>
				<!-- 备注 end-->
			</form>
 				
			<div class="form-group">
				<label class="col-md-4 control-label"></label>
				<div class="col-md-2">
					<button class="btn btn-default" type="button" onclick="preForumForum.pre_update(this)">保存</button>
					&nbsp;&nbsp;&nbsp;
					<a class="btn btn-default" href="${basePath}/admin/preForumForum/list">返 回</a>
				</div>
			</div>
 		</div>
	</div>
</body>
</html>