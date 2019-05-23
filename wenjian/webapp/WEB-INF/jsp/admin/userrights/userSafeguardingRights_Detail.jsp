<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>用户维权详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${rights.pname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台用户名：</font>
    <font class="col-md-4">${rights.username}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">真实姓名：</font>
    <font class="col-md-4">${rights.realname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">投资手机号：</font>
    <font class="col-md-4">${rights.mobile}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">登记时间：</font>
    <font class="col-md-4">${empty rights.time ? '---':dateUtils.formatDate(rights.time)}</font></font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">待收金额：</font>
    <font class="col-md-4">${rights.pendingamount}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">债权出售：</font>
    <font class="col-md-4">
        <c:if test="${empty rights.debts}">---</c:if>
        <c:if test="${rights.debts==0}">否</c:if>
        <c:if test="${rights.debts==1}">是</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">出售折扣：</font>
    <font class="col-md-4">${rights.discount}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">所在省：</font>
    <font class="col-md-4">${rights.province}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">所在市：</font>
    <font class="col-md-4">${rights.city}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">登记备注：</font>
    <font class="col-md-8">${rights.desc}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">证据图片：</font>
</div>
<c:forEach items="${rights.imgList}" var="i">
    <div class="row" style="line-height: 0px;">
        <font class="col-sm-4 text-right"></font>
        <a target="_blank" href="http://image.wangdaibus.com/${i.evidenceimg}">
            <img src="http://image.wangdaibus.com/${i.evidenceimg}" height="120px" width="120px" />
        </a>
    </div>
</c:forEach>
</body>
</html>
