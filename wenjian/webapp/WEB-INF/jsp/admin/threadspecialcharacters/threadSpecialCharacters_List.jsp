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
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}

.myCheck{
    background-color: white;
    border-radius: 5px;
    border:1px solid #d3d3d3;
    width:16px;
    height:16px;
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    line-height: 16px;
}

.myCheck:checked{
    background-color: #eee;
}
 

</style>
<title>主题平台名称设置列表</title>
<script type="text/javascript">
	$(function(){
		$("#select-type-text").val($("#select-type-text").data("type"));
  	})
 	
 	//显示设置/修改页面
 	function settingShow(obj){
		var opid = $(obj).data("opid");
  		var url = basePath+"/admin/threadSpecialCharacters/settingShow";
		var callback = function(data){
 		   $("#insert-modal-body").html(data)
  		   $("#insertModal").modal('show');
 		}
		$.get(url,{"opid":opid},callback);
	}
	
	//详情
	function detailShow(obj){
		var opid = $(obj).data("opid");
		var url = basePath+"/admin/threadShowSettings/detail";
		var callback = function(data){
		   $("#detail-modal-body").html(data)
		   $("#detailsModal").modal('show');
		}
		$.get(url,{"opid":opid},callback);
	}
 	
 	//保存设置
 	function insert(){
 	 	 var $box = $("#settings_main_box");
 	 	 var pname = $box.find("input[name='pname']").val();
 	 	 var remark = $box.find("textarea[name='remark']").val();
 	 	 var opid = $box.find("input[name='opid']").val();
 		 var params = {};
		 params.remark = remark;
		 params.pname = pname;
		 params.opid = opid;
  		 console.log(JSON.stringify(params));
		 var callback = function(data){
			 alert(data.message);
			 if(data.code =="88"){
				 window.location.href=basePath+"/admin/threadSpecialCharacters/list";
			 }
		 }
		 var insertUrl = basePath+"/admin/threadSpecialCharacters/setting"
		 $.post(insertUrl,params,callback);  
	}
 	
 	function del(obj){
 		var opid = $(obj).data("opid");
 		var pname = $(obj).data("pname");
  		var params = {};
		params.status = 0;
 		params.opid = opid;
 		params.pname = pname;
		var callback = function(data){
			 alert(data.message);
			 if(data.code =="88"){
				 window.location.href=basePath+"/admin/threadSpecialCharacters/list";
			 }
		}
		var insertUrl = basePath+"/admin/threadSpecialCharacters/setting"
		$.post(insertUrl,params,callback); 
 	}
  
</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-select"
				action="list">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
				<input type="text" name="pname" id="pname" class="form-control"/>
 				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
					<button type="button" class="btn btn-default" style="width: 100px;" onclick="settingShow(this)">添加</button>
  				</div>
			</form>
			<div style="margin-top: 20px;"></div>
  			<jsp:include page="/WEB-INF/jsp/admin/threadspecialcharacters/threadSpecialCharactersListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>