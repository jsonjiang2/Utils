<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台工商变更记录详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformBusinessChangeRecordVO.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformBusinessChangeRecordVO.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">变更类型：</font>
    <font class="col-md-4">${platformBusinessChangeRecordVO.changetype}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">变更时间：</font>
    <font class="col-md-4">${platformBusinessChangeRecordVO.changetime}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">变更前信息：</font>
    <font class="col-md-8">${platformBusinessChangeRecordVO.aheadinfo}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">变更后信息：</font>
    <font class="col-md-8">${platformBusinessChangeRecordVO.afterinfo}</font>
    <hr>
</div>

</body>
</html>
