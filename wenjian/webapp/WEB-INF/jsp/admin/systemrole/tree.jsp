<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="IE=7;IE=9" />
<title>权限树页面</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${basePath}/static/tree/tm_tree.css">
<script type="text/javascript"
	src="${basePath}/static/tree/tm_tree.js"></script>

</head>
<body>
	<div id="gj_tree"></div>
	<script type="text/javascript">
 	//展示权限树
   	function tree(callback){
 		 $.ajax({
			 type:"post",
			 url:basePath+"/admin/resource/loadTreeMenu.action",
			 success:function(obj){
				 	var root = obj.root;
			 		var children = obj.children;
					$("#gj_tree").tmTree({root:root,children:children,type:"checkbox",onclick:function($obj,data){
 						opids = data.checkArr.opid;
 	  				  }
			 	});
				//回调已经赋予角色的权限
				if(callback)callback();
			 } 
		});
	}
   	
   	var opids = "";
   	//保存角色授权方法
 	function saveRoleAndResources(roleId,$dialog,opts){
   		if(isEmpty(opids)){
   			loading("请选中一个权限进行操作...",4);
   			return;
   		}
  		 $.ajax({
 			 type:"post",
 			 data:{"opids":opids,"roleid":roleId},
 			 url:basePath+"/admin/resource/saveAuthor.action",
 			 success:function(obj){
  				 if(obj.result =="success"){
 					 alert("授权成功");
  					window.location.href=basePath+"/admin/systemrole/list.action";
  					$dialog.next().remove();
  					$dialog.remove();
  				 }else if(obj.result =="fail"){
  					loading("授权失败,请重新操作",4);
  				 }
 			 }
 		 });
 	} 
 </script>
</body>
</html>