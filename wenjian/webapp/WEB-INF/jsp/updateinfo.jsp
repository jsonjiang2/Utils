<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<title>平台数据修改操作页面</title>
<style type="text/css">
	.box{width: 600px;margin: 20px auto;}
</style>
<script type="text/javascript">
$(function () {
    //按回车登录
   $(document).keydown(function (e) {
       if (e.keyCode == 13) {
    	   updateInfo();
       }
   });
    
 });
  	//平台数据修改
 	function updateInfo(obj){
 		$("#updateInfo").attr("onclick","").text("修改中,请稍后...");
 		var pname = $("#pname").val();
 		var status = $("#status").val();
 		var action = basePath+"/admin23/updatePlatformInfo/updateInfo";
 		var callback = function(data){
 			$("#updateInfo").attr("onclick","updateInfo(this)").text("提交修改");
 			alert(data+"=="+JSON.stringify(data));
 		}
 		$.post(action,{"pname":pname,"status":status},callback);
 	}
</script>
</head>
<body>
	 <div class="box threadReplyBox">
		 <h1 style="font-size: 18px">平台数据修改</h1>
		 <br>
 		 		平台名称：<input class="form-control" id="pname" name="pname" placeholder="请输入平台名称"/><br><br>
		 		运营状态  1正常 2跑路 3清盘 4高风险 5有争议 6延期兑付  7停业  8经侦介入   9提现困难 ：
		 		<select class="form-control" id="status" name="status">
		 			<option value="1">正常</option>
		 			<option value="2">跑路</option>
		 			<option value="3">清盘</option>
		 			<option value="4">高风险</option>
		 			<option value="5">有争议</option>
		 			<option value="6">延期兑付</option>
		 			<option value="7" selected="selected">停业</option>
		 			<option value="8">经侦介入</option>
		 			<option value="9">提现困难</option>
 		 		</select><br><br>
 		 		<button class="btn btn-default" type="button" onclick="updateInfo(this)" id="updateInfo">提交修改</button>
  	 </div>
 	  
</body>
</html>