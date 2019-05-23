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
			<span class="col-sm-4 text-right">商户号&nbsp;:</span> 
			<span id="tenderidlb"> 
				<c:if test="${!empty businessManagement.merchants}">
					${businessManagement.merchants} 
				</c:if>
			 </span>
		</div>
	<hr/>
	</div>
	
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">真实姓名&nbsp;:</span> 
			<span id="tenderidlb">
				<c:if test="${!empty businessManagement.username}">
					${businessManagement.username}
				</c:if>
			</span>
		</div>
		<hr/>
	</div>

	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">属性&nbsp;:</span> 
			<span id="tenderidlb"> 
				<c:if test="${!empty businessManagement.merchantattribute}">
					<c:if test="${businessManagement.merchantattribute eq '1'}">线上</c:if>
					<c:if test="${businessManagement.merchantattribute eq '2'}">线下</c:if>
				</c:if>
			</span>
		</div>
		<hr/>
	</div>
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">业务员&nbsp;:</span> 
			<span id="tenderidlb"> 
				<c:if test="${!empty businessManagement.salesmanusername}">
					${businessManagement.salesmanusername}-${businessManagement.salesmanrealname}
				</c:if>
			</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">业务员分润&nbsp;:</span> 
			<span id="tenderidlb">
				<c:if test="${!empty businessManagement.salesmanshare}">
					${businessManagement.salesmanshare}%
				</c:if>
			</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">巴士分润&nbsp;:</span> 
			<span id="tenderidlb">
				<c:if test="${!empty businessManagement.busshare}">
					${businessManagement.busshare}%
				</c:if>
			</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">商户网址&nbsp;:</span> 
			<span id="tenderidlb">
				<c:if test="${!empty businessManagement.merchanturl}">
					${businessManagement.merchanturl}
				</c:if>
			</span>
		</div>
		<hr/>
	</div>
		
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">商户地址&nbsp;:</span> 
			<span id="tenderidlb"> 
				<c:if test="${!empty businessManagement.merchantaddress}">
					${businessManagement.merchantaddress} 
				</c:if>
			</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">操作人&nbsp;:</span> 
			<span id="tenderidlb"> 
				<c:if test="${!empty businessManagement.addmanusername}">
					${businessManagement.addmanusername}- ${businessManagement.addmanrealname}
				</c:if>
			</span>
		</div>
	</div>

</div>
