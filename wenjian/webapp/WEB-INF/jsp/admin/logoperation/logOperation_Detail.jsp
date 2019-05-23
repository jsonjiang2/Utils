<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">用户名&nbsp;:</span> 
			<span id="tenderidlb"> ${logOperation.username} </span>
		</div>
		<hr/>
	</div>
	
 <div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">姓名&nbsp;:</span> 
			<span id="tenderidlb"> ${logOperation.useraccountinforealname} </span>
		</div>
		<hr/>
	</div> 
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">用户类型&nbsp;:</span> 
			<c:if test="${!empty logOperation.usertype}">
				<c:if test="${logOperation.usertype eq 1}">管理员</c:if>
				<c:if test="${logOperation.usertype eq 2}">普通用户</c:if>
			</c:if>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">业务类型&nbsp;:</span> 
			<c:if test="${!empty logOperation.biztype}">
					<c:if test="${logOperation.biztype eq 1}">添加</c:if>
					<c:if test="${logOperation.biztype eq 2}">修改</c:if>
					<c:if test="${logOperation.biztype eq 3}">删除</c:if>
					<c:if test="${logOperation.biztype eq 4}">查询</c:if>
					<c:if test="${logOperation.biztype eq 5}">其他</c:if>
			</c:if>
		</div>
		<hr/>
	</div>
	
	 <div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">状态&nbsp;:</span> 
			<c:if test="${!empty logOperation.status}">
					<c:if test="${logOperation.status eq 0}">失败</c:if>
					<c:if test="${logOperation.status eq 1}">成功</c:if>
			</c:if>
		</div>
		<hr/>
	</div> 
	
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">操作时间&nbsp;:</span> 
			<c:if test="${!empty logOperation.opertime}">
				<span id="tenderidlb">${sf.format(logOperation.opertime)}</span>
			</c:if>
			
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">操作内容&nbsp;:</span> 
			<c:if test="${!empty logOperation.opercontent}">
				<span id="tenderidlb" > </span>
				<span style="width:80%;word-break:normal;display:block;white-space:pre-wrap;overflow:hidden;">${logOperation.opercontent}</span>
			</c:if>
		</div>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<hr/>
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">备注&nbsp;:</span> 
			<c:if test="${!empty logOperation.remark}">
				<span id="tenderidlb"> ${logOperation.remark}</span>
			</c:if>
		</div>
	</div>

</div>
