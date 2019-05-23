<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/preforumthread/preForumThread.js"></script>
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
<title>用户绑定解绑列表</title>
<script type="text/javascript">
	$(function(){
		$("#select-subject-text").val($("#select-subject-text").data("subject"));
    })
     
//新增绑定
function bindUserShow(){
	$("#bindModal").modal({
		backdrop:"static",
		show:"show"
	});	
}

function bindUser(){
	var uusername = $("#uusername").val();
	var ausername = $("#ausername").val();
	
	var url = basePath+"/admin/userBindAdmin/bindUser";
	var callback = function(data){
		alert(data.message);
		if(data.code == "88"){
			$("#bindModal").modal("hide");	
			window.location.href = basePath+"/admin/userBindAdmin/list";
		}
	}
	$.post(url,{"ausename":ausername,"uusename":uusername},callback);
}    

function ubindUser(obj){
	var ff = confirm("您确定要解绑吗？");
	if(!ff){
		return ;
	}
 	var opid = $(obj).data("opid");
 	var url = basePath+"/admin/userBindAdmin/ubindUser";
	var callback = function(data){
		alert(data.message);
		if(data.code == "88"){
 			window.location.href = basePath+"/admin/userBindAdmin/list";
		}
	}
	$.post(url,{"opid":opid},callback);
}
 
//分页查询
function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
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
 				<div class="form-group">
					用户名：<input class="form-control" type="text" id="select-subject-text" data-subject="${preForumThread.subject}"
						name="subject" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="主题">
				</div>
				&nbsp;&nbsp;
  			<%-- 	<div class="form-group">
					显示状态： <select id="select-displayorder-text" name="displayorder" class="form-control" data-displayorder="${preForumThread.displayorder}">
						<option value="">--请选择发布状态--</option>
						<option value=-1>不合格</option>
						<option value=-2>审核中</option>
						<option value=-3>已删除</option>
 						<option value=0>合格</option>
   					</select>
				</div>
				&nbsp;&nbsp; --%>
  				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
					<button type="button" class="btn btn-default" style="width: 100px;" onclick="bindUserShow(this)">绑定新用户</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/userbindadmin/userBindAdminListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
	
	
	<!-- 设置模态框  -->
	<div class="modal fade" id="bindModal" tabindex="-1" role="dialog"
		aria-labelledby="addModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addModalLabel">
						<span class="glyphicon glyphicon-info-sign"></span>提示：正在进行设置操作
					</h4>
				</div>
				<div id="insert-modal-body" class="modal-body">
					<div class="container">
					    <form class="form-horizontal" role="form" id="threadUpdateForm">
 					        <div class="form-group">
					            <label class="col-sm-2 control-label laber_from" for="presubject">普通用户名/手机号：</label>
					            <div class="col-sm-3">
					                     <input type="text" name="uusername" id="uusername" class="form-control" />
					             </div>
					        </div>
					      
					         <div class="form-group">
					            <label class="col-sm-2 control-label laber_from" for="presubject">管理员用户名：</label>
					            <div class="col-sm-3">
					                     <input type="text" name="ausername" id="ausername" class="form-control"/>
					             </div>
					        </div>
 					    </form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="btn-insert" class="btn btn-primary"
						onclick="bindUser()">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!--  -->
</body>
</html>