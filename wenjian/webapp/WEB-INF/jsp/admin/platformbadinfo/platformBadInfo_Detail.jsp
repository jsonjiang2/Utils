<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台负面详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformBadInfo.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformBadInfo.pname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">曝光流水号：</font>
    <font class="col-md-4">${platformBadInfo.orderno}</font>
    <hr>
</div>

<div class="row" style="line-height: 10px;">
    <font class="col-sm-4 text-right">标题：</font>
    <font class="col-md-8">${platformBadInfo.title}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">负面链接：</font>
    <font class="col-md-8">${platformBadInfo.badlink}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">采集时间：</font>
    <font class="col-md-4">
        ${empty platformBadInfo.collectiontime ? '---':dateUtils.formatDate(platformBadInfo.collectiontime)}
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">采集人：</font>
    <font class="col-md-4">${platformBadInfo.collector}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">精华状态：</font>
    <font class="col-md-4">
        <c:if test="${empty platformBadInfo.elitestatus}">----</c:if>
        <c:if test="${platformBadInfo.elitestatus==0}">普通</c:if>
        <c:if test="${platformBadInfo.elitestatus==1}">精华</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">澄清状态：</font>
    <font class="col-md-4">
        <c:if test="${empty platformBadInfo.clearstatus}">----</c:if>
        <c:if test="${platformBadInfo.clearstatus==0}">未澄清</c:if>
        <c:if test="${platformBadInfo.clearstatus==1}">已澄清</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">是否显示：</font>
    <font class="col-md-4">
        <c:if test="${empty platformBadInfo.status}">----</c:if>
        <c:if test="${platformBadInfo.status==0}">不显示</c:if>
        <c:if test="${platformBadInfo.status==1}">显示</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${platformBadInfo.remark}</font>
    <hr>
</div>




</body>
</html>
