<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台维权详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${safeguardingRights.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${safeguardingRights.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权状态：</font>
    <font class="col-md-4">
        <c:if test="${safeguardingRights.status==1}">开启</c:if>
        <c:if test="${safeguardingRights.status==2}">关闭</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权进展：</font>
    <font class="col-md-4">
        <c:if test="${safeguardingRights.progress==1}">未立案</c:if>
        <c:if test="${safeguardingRights.progress==2}">已立案</c:if>
        <c:if test="${safeguardingRights.progress==3}">已结案</c:if>
        <c:if test="${safeguardingRights.progress==4}">已清退</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">爆雷时间：</font>
    <font class="col-md-4">${dateUtils.formatDate(safeguardingRights.thunderstormtime)}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权律师：</font>
    <font class="col-md-4">${safeguardingRights.lawer}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权天数：</font>
    <font class="col-md-4">${safeguardingRights.days}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权人数：</font>
    <font class="col-md-4">${safeguardingRights.number}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权QQ群1：</font>
    <font class="col-md-4">${safeguardingRights.qq}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权QQ群2：</font>
    <font class="col-md-4">${safeguardingRights.qq2}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权QQ群3：</font>
    <font class="col-md-4">${safeguardingRights.qq3}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">带头大哥：</font>
    <font class="col-md-4">${safeguardingRights.leader}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">带头人手机：</font>
    <font class="col-md-4">${safeguardingRights.mobile}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">带头人微信：</font>
    <font class="col-md-4">${safeguardingRights.wechat}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">维权公告：</font>
    <font class="col-md-8">${safeguardingRights.notice}</font>
    <hr><hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${safeguardingRights.remark}</font>
    <hr>
</div>


</body>
</html>
