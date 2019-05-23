<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台股东变更记录详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformOwnershipChangeRecordVO.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformOwnershipChangeRecordVO.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">股东信息：</font>
    <font class="col-md-4">${platformOwnershipChangeRecordVO.shareholder}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">变更时间：</font>
    <font class="col-md-4">${empty platformOwnershipChangeRecordVO.changetime ? '---':dateUtils.formatDate(platformOwnershipChangeRecordVO.changetime)}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">股权变更前：</font>
    <font class="col-md-4">${platformOwnershipChangeRecordVO.aheadamount}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">股权变更后：</font>
    <font class="col-md-4">${platformOwnershipChangeRecordVO.afteramount}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">公示时间：</font>
    <font class="col-md-4">${empty platformOwnershipChangeRecordVO.publicity ? '---':dateUtils.formatDate(platformOwnershipChangeRecordVO.publicity)}
    </font>
    <hr>
</div>

</body>
</html>
