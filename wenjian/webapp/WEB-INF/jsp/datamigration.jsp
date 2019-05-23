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
<title>数据迁移操作页面</title>
<style type="text/css">
	.box{width: 600px;margin: 20px auto;}
</style>
<script type="text/javascript">


	//主题回复迁移
 	function threadReply(obj){
 		$("#threadReplySub").attr("onclick","").text("迁移中,请稍后...");
 		var minNum = $("#minNum").val();
 		var maxNum = $("#maxNum").val();
 		var action = basePath+"/dataMigrationTest/migrateThreadReply";
 		var callback = function(data){
 			$("#threadReplySub").attr("onclick","threadReply(this)").text("提交迁移");
 			alert(data);
 		}
 		$.post(action,{"minNum":minNum,"maxNum":maxNum},callback);
 	}
	
	//资讯回复迁移
 	function portalReplyClick(obj){
 		$("#portalReply").attr("onclick","").text("迁移中,请稍后...");
 		var minNum = $("#minNum2").val();
 		var maxNum = $("#maxNum2").val();
 		var action = basePath+"/dataMigrationTest/portalReply";
 		var callback = function(data){
 			$("#portalReply").attr("onclick","portalReplyClick(this)").text("提交迁移");
 			alert(data);
 		}
 		$.post(action,{"minNum":minNum,"maxNum":maxNum},callback);
 	}
	
 	//用户信息迁移
 	function migrateUserClick(obj){
 		$("#migrateUser").attr("onclick","").text("迁移中,请稍后...");
 		var minNum = $("#minNum3").val();
 		var maxNum = $("#maxNum3").val();
 		var action = basePath+"/dataMigrationTest/migrateUser";
 		var callback = function(data){
 			$("#migrateUser").attr("onclick","migrateUserClick(this)").text("提交迁移");
 			alert(data);
 		}
 		$.post(action,{"minNum":minNum,"maxNum":maxNum},callback);
 	}
</script>
</head>
<body>
	 <div class="box threadReplyBox">
		 <h1 style="font-size: 18px">主题回复数据迁移</h1>
		 <br>
		 <form>
		 		<input class="form-control" id="minNum" name="minNum" value="0" placeholder="tid第n条开始"/><br>
		 		<input class="form-control" id="maxNum" name="maxNum" value="10000" placeholder="tid第n条结束"/><br>
		 		<button class="btn btn-default" type="button" onclick="threadReply(this)" id="threadReplySub">提交迁移</button>
		 </form>
 	 </div>
 	 
 	  <div class="box threadReplyBox">
		 <h1 style="font-size: 18px">资讯回复数据迁移</h1>
		 <br>
		 <form>
		 		<input class="form-control" id="minNum2" name="minNum" value="0" placeholder="tid第n条开始"/><br>
		 		<input class="form-control" id="maxNum2" name="maxNum" value="10000" placeholder="tid第n条结束"/><br>
		 		<button class="btn btn-default" type="button" onclick="portalReplyClick(this)" id="portalReply">提交迁移</button>
		 </form>
 	 </div>
 	 
 	   <div class="box threadReplyBox">
		 <h1 style="font-size: 18px">用户数据迁移</h1>
		 <br>
		 <form>
		 		<input class="form-control" id="minNum3" name="minNum" value="0" placeholder="tid第n条开始"/><br>
		 		<input class="form-control" id="maxNum3" name="maxNum" value="10000" placeholder="tid第n条结束"/><br>
		 		<button class="btn btn-default" type="button" onclick="migrateUserClick(this)" id="migrateUser">提交迁移</button>
		 </form>
 	 </div>
 	 
</body>
</html>