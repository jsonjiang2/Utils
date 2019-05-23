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
			<span class="col-sm-4 text-right">主链接&nbsp;:</span> 
			<span id="tenderidlb"> ${frontContent.href} </span>
		</div>
	<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">次链接&nbsp;:</span> 
			<span id="tenderidlb"> ${frontContent.subHref}</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">定时发布&nbsp;:</span> 
			<span id="tenderidlb"> ${frontContent.publicTimeStr}</span>
		</div>
		<hr/>
	</div>
	
<%-- 	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">证件类型&nbsp;:</span> 
			<span id="tenderidlb"> 
				<c:if test="${preCommonMember.certtype eq '1'}">身份证</c:if>
				<c:if test="${preCommonMember.certtype eq '2'}">个人护照</c:if>
			</span>
		</div>
		<hr/>
	</div> --%>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">操作人&nbsp;:</span> 
			<span id="tenderidlb"> ${frontContent.updateMan}</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">操作时间&nbsp;:</span> 
			<span id="tenderidlb"> ${frontContent.updateTimeStr}</span>
		</div>
	
	</div>
	
	<%-- <div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">注册日期&nbsp;:</span> 
			<span id="tenderidlb"> 
				<c:if test="${!empty preCommonMember.regdate}">${sf.format(preCommonMember.regdate)}</c:if>
				<c:if test="${empty preCommonMember.regdate}">暂无时间</c:if>
			</span>
		</div>
		
	</div> --%>
	
<%-- 	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">注册IP&nbsp;:</span> 
			<span id="tenderidlb"> ${preCommonMember.regip}</span>
		</div>
		<hr/>
	</div> --%>
	
<%-- 	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">注册COOKIE&nbsp;:</span> 
			<span id="tenderidlb"> ${preCommonMember.regcookie}</span>
		</div>
		<hr/>
	</div> --%>
	
<%-- 	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">角色&nbsp;:</span> 
			<span id="tenderidlb"> ${preCommonMember.role}</span>
		</div>
		<hr/>
	</div> --%>
	
<%-- 	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">验证日期（邮件）&nbsp;:</span> 
			<span id="tenderidlb"> ${preCommonMember.everifydate}</span>
		</div>
		<hr/>
	</div> --%>
	
<%-- 	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">修改日期（手机）&nbsp;:</span> 
			<span id="tenderidlb"> ${preCommonMember.mverifydate}</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">推荐码&nbsp;:</span> 
			<span id="tenderidlb"> ${preCommonMember.recommendcode}</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">推荐人&nbsp;:</span> 
			<span id="tenderidlb"> ${preCommonMember.recommend}</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">关联账户数&nbsp;:</span> 
			<span id="tenderidlb"> ${preCommonMember.linkacccount}个</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">备注&nbsp;:</span> 
			<span id="tenderidlb"> ${preCommonMember.remark}</span>
		</div>
	</div> --%>

</div>
