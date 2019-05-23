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
			<span id="tenderidlb"> ${logLogin.username} </span>
		</div>
		<hr/>
	</div>
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">真实姓名&nbsp;:</span> 
			<span id="tenderidlb"> ${logLogin.useraccountinforealname} </span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">用户类型&nbsp;:</span> 
			<c:if test="${!empty logLogin.usertype}">
				<c:if test="${logLogin.usertype eq 1}">管理员</c:if>
				<c:if test="${logLogin.usertype eq 2}">普通用户</c:if>
			</c:if>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">登录状态&nbsp;:</span> 
			<c:if test="${!empty logLogin.status}">
				<c:if test="${logLogin.status eq 0}">失败</c:if>
				<c:if test="${logLogin.status eq 1}">成功</c:if>
			</c:if>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">IP&nbsp;:</span> 
			<c:if test="${!empty logLogin.ip}">
				<span id="tenderidlb"> ${logLogin.ip}</span>
			</c:if>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">IP城市&nbsp;:</span> 
			 <c:if test="${!empty logLogin.ipcity}">
				<span id="tenderidlb"> ${logLogin.ipcity}</span>
			</c:if> 
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">cookie&nbsp;:</span> 
			<c:if test="${!empty logLogin.cookie}">
				<span id="tenderidlb"> ${logLogin.cookie}</span>
			</c:if>
		</div>
		<hr/>
	</div>
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">主机信息&nbsp;:</span> 
			<c:if test="${!empty logLogin.hostinfo}">
				<span id="tenderidlb"> ${logLogin.hostinfo}</span>
			</c:if>
		</div>
		<hr/>
	</div>
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">浏览器信息&nbsp;:</span> 
			<c:if test="${!empty logLogin.browserinfo}">
				<span id="tenderidlb"> ${logLogin.browserinfo}</span>
			</c:if>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">登录时间&nbsp;:</span> 
			<c:if test="${!empty logLogin.logintime}">
				<span id="tenderidlb">${sf.format(logLogin.logintime)}</span>
			</c:if>
			
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">经度&nbsp;:</span> 
			<c:if test="${!empty logLogin.longitude}">
				<span id="tenderidlb">${logLogin.longitude}</span>
			</c:if>
			
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">登录来源&nbsp;:</span> 
			<c:if test="${!empty logLogin.loginsource}">
				<span id="tenderidlb">
					<c:if test="${logLogin.loginsource eq 1}">
						PC
					</c:if>
					<c:if test="${logLogin.loginsource eq 2}">
						H5
					</c:if>
					<c:if test="${logLogin.loginsource eq 3}">
						APP
					</c:if>
					<c:if test="${logLogin.loginsource eq 4}">
						小蜜蜂
					</c:if>
				</span>
			</c:if>
			
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">纬度&nbsp;:</span> 
			<c:if test="${!empty logLogin.latitude}">
				<span id="tenderidlb">${logLogin.latitude}</span>
			</c:if>
			
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">备注&nbsp;:</span> 
			<c:if test="${!empty logLogin.remark}">
				<span id="tenderidlb"> ${logLogin.remark}</span>
			</c:if>
		</div>
	</div>

</div>
