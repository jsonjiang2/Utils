<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>邮件发送记录详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">
<div class="row text-center" style="line-height: 0px;">
    <font size="4">详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${resetRecord.id}</font>
    <hr>
</div>


<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">收支记录订单号：</font>
    <font class="col-md-4">${resetRecord.orderNo}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">复位时间：</font>
    <font class="col-md-4">${resetRecord.resetTimeStr}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">添加人：</font>
    <font class="col-md-4">${resetRecord.resetMan}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-8">${resetRecord.remark}</font>
    <hr>
</div>
</body>
</html>
