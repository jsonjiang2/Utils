<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台审核详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformAuditVO.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformAuditVO.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台网址：</font>
    <font class="col-md-4">${platformAuditVO.website}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申报人：</font>
    <font class="col-md-4">${platformAuditVO.realname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申报时间：</font>
    <font class="col-md-4">${empty platformAuditVO.addtime ? '':dateUtils.formatDate(platformAuditVO.addtime)}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申报人手机号：</font>
    <font class="col-md-4">${platformAuditVO.mobile}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核状态：</font>
    <font class="col-md-4">
        <c:if test="${empty platformAuditVO.auditstatus}">---</c:if>
        <c:if test="${platformAuditVO.auditstatus==0}">待审核</c:if>
        <c:if test="${platformAuditVO.auditstatus==1}">审核通过</c:if>
        <c:if test="${platformAuditVO.auditstatus==2}">审核失败</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核人：</font>
    <font class="col-md-4">${platformAuditVO.auditman}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核时间：</font>
    <font class="col-md-4">${empty platformAuditVO.audittime ? '':dateUtils.formatDate(platformAuditVO.audittime)}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核备注：</font>
    <font class="col-md-4">${platformAuditVO.remark}</font>
    <hr>
</div>

</body>
</html>
