<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户域名绑定</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/personaluserrelationship/personalUserRelationship.js"></script>
<script type="text/javascript">
	$(function(){
		funInitParams();
	})
	function findUser(objVal){
		$("#errorMessage").html("");
		$("#baseid").val("");
		var username = $("#username").val();
        var callback = function(data){
        	if(data.code == "88"){
        		$("#baseid").val(data.data);
        	}else{
        		$("#errorMessage").html(data.message);
        	}
        }
		var action = basePath+"/admin/personalUserRelationship/findUser";
		$.post(action,{"username":username},callback);
	}
	
	function funInitParams(){
		var opid = $("#update_opid").data("opid");
		var baseid = $("#update_baseid").data("baseid");
		var domainname = $("#update_domainname").data("domainname");
		var username = $("#update_username").data("username");
		if(!isEmpty(opid)){
 			$("#username").val(username).attr("disabled","disabled");
			$("#domainname").val(domainname);
			$("#submit_id").val(opid);
		}
 	}
 
</script>
</head>
<body>
	<div style="display:none">
		<input type="text" id="update_opid" data-opid="${relationship.id}"/>
		<input type="text" id="update_baseid" data-baseid="${relationship.baseid}"/>
		<input type="text" id="update_domainname" data-domainname="${relationship.domainname}"/>
		<input type="text" id="update_username" data-username="${relationship.username}"/>
	</div>

	<div class="container" style="width: 100%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form id="insert-form" class="form-horizontal bv-form" novalidate="novalidate">
				<input type="text" name="id" id="submit_id" style="display:none">
				<div class="row" style="line-height: 0px;">
					<div class="col-md-4 col-md-offset-3" style="padding-left: 30px;">
						<font color="red">
							<b>用户域名绑定</b>
						</font>
					</div>
				</div>
				<hr>
				
				<!-- 域名 start-->
				<div class="form-group has-feedback">
					<label class="col-md-4 control-label">域名：</label>
					<div class="col-md-2">
						<input class="form-control"  name="domainname"  id="domainname" style="text-align: center; width: 230px; line-height: 18px;"
						 type="text">
   					</div>
 				</div>
				<!-- 域名 end-->
				
				<!-- 用户名 start-->
				<div class="form-group has-feedback">
					<label class="col-md-4 control-label">用户名：</label>
					<div class="col-md-2">
						<input class="form-control"  name="username" id="username" onblur="findUser(this)"
						style="text-align: center; width: 230px; line-height: 18px;" type="text">
						<span id="errorMessage" style="color:red;"></span>
						<input class="form-control"  name="baseid" id="baseid" type="text" style="display: none;">
   					</div>
 				</div>
				<!-- 用户名 end-->
 			 </form> 
			</div>
 		</div>
	</div>
</body>
</html>