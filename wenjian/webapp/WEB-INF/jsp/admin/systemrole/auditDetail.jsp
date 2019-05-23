<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>审核页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${systemRoleAudit.id}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名：</font>
    <font class="col-md-4">${systemRoleAudit.userName}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申请人姓名：</font>
    <font class="col-md-4">${systemRoleAudit.realName}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申请时间：</font>
    <font class="col-md-4"><fmt:formatDate value="${systemRoleAudit.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申请人角色：</font>
    <font class="col-md-4">${systemRoleAudit.roleName}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核状态：</font>
    <font class="col-md-4">
        <c:choose>
            <c:when test="${systemRoleAudit.isAudit==1}">
                通过审核
            </c:when>
            <c:when test="${systemRoleAudit.isAudit==0}">
                待审核
            </c:when>
            <c:when test="${systemRoleAudit.isAudit==2}">
                不通过
            </c:when>
        </c:choose>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">银行卡：</font>
    <font class="col-md-4">
        <c:choose>
            <c:when test="${systemRoleAudit.bindStatus==1}">
                已绑定
            </c:when>

            <c:otherwise>
                未绑定
            </c:otherwise>
        </c:choose>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核人：</font>
    <font class="col-md-4">${systemRoleAudit.auditMan}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核时间：</font>
    <font class="col-md-4"><fmt:formatDate value="${systemRoleAudit.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
    </font>
    <hr>
</div>


<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">巴士特殊备注：</font>
    <font class="col-md-4">${systemRoleAudit.busRemark}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核备注：</font>
    <font class="col-md-4">${systemRoleAudit.auditRemark}</font>
</div>


</body>
</html>
