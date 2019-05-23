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
			<span class="col-sm-4 text-right">类型&nbsp;:</span> 
			<span id="tenderidlb"> 
				<c:if test="${entity.type eq 1}">
             		<span style="color: blue;">QQ</span>
                </c:if>
                <c:if test="${entity.type eq 2}">
                	<span style="color: green;">微信</span>
                </c:if>
                <c:if test="${entity.type eq 3}">
                	<span style="color: red;">微博</span>
                </c:if>
			 </span>
		</div>
	<hr/>
	</div>
	
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">openId&nbsp;:</span> 
			<span id="tenderidlb">
				<c:if test="${empty entity.uin}">
					--
				</c:if>
				<c:if test="${!empty entity.uin}">
					${entity.uin}
				</c:if>
			</span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">唯一标识&nbsp;:</span> 
			<span id="tenderidlb">
				<c:if test="${empty entity.unionid}">
					--
				</c:if>
				<c:if test="${!empty entity.unionid}">
					${entity.unionid}
				</c:if>
			</span>
		</div>
		<hr/>
	</div>

</div>
