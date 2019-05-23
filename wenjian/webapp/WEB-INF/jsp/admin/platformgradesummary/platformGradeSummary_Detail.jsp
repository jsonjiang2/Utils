<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台评价详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformEvaluate.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformEvaluate.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">评价内容：</font>
    <font class="col-md-4">${platformEvaluate.evaluationcontent}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">评价时间：</font>
    <font class="col-md-4">${dateUtils.formatDate(platformEvaluate.evaluationtime)}</font>
    <hr>
</div>
</body>
</html>
