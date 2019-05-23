<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网贷巴士角色添加页面</title>

<script type="text/javascript">
    function gj_role_save(){
       var roleName = $("#roleName").val();
       var roleId = $("#roleId").val();
       var action = basePath+"/admin/systemrole/save.action";
       if(isEmpty(roleName)){
    	   $("#roleName").select();
    	   loading("请输入角色名称",4);
    	   return false;
       }

       $.ajax({
    	   type:"post",
    	   url:action,
    	   data:{"roleName":roleName,"roleId":roleId},
    	   success:function(data){
    		   var obj = $.parseJSON(data);
     		   if(obj.result=="success"){
     			   alert("保存成功");
    			    window.location.href=basePath+"/admin/systemrole/list.action";
    		   }else if(obj.result=="fail"){
    			   $("#roleName").select();
    			   loading("操作失败",4);
    		   }
    	   }
       });
    }
  </script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<form id="inputForm" class="form-horizontal">
						<!--control-group 开始  -->
						<div class="form-group">
							<label  class="col-sm-2 control-label">角色名称</label>
							<div class="col-sm-4">
								<input type="hidden" class="form-control" id="roleId" name="roleId"
									value="${systemRole.roleId}"> <input type="text"
									class="form-control" id="roleName" name="roleName"
									value="${systemRole.roleName}" placeholder="请输入角色名称">
							</div>
						</div>
						<!--control-group 结束  -->
						<div class="form-actions">
							<input id="btnSubmit" class="btn btn-primary" type="button"
								onclick="gj_role_save(this)" value="保 存" />&nbsp;&nbsp; <a
								href="${basePath}/admin/systemrole/list.action"
								class="btn btn-primary">返回</a>
						</div>
					</form>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>
</body>
</html>