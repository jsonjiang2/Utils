<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <title></title>
</head>
<body style="font-family:'微软雅黑'; ">
<div class="row text-center" style="line-height: 0px;">
    <font size="4">骗返押金余额详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">关联流水号：</font>
    <font class="col-md-4">${entity.borderno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${entity.pno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">押金类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.deposittype==1 }">平台押金</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-8">${entity.ptname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">押金金额：</font>
    <font class="col-md-8">
        <c:if test="${entity.type==1 || entity.type==3 || entity.type==4}">
            <span style="color:blue;">${entity.depositamount}</span>
        </c:if>
        <c:if test="${entity.type==2}">
            <span style="color:red;">${entity.depositamount}</span>
        </c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">业务类型：</font>
    <font class="col-md-8">
        <c:if test="${entity.type==1}">缴纳</c:if>
        <c:if test="${entity.type==2}">退款</c:if>
        <c:if test="${entity.type==3}">手充</c:if>
        <c:if test="${entity.type==4}">充值</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">冻结余额：</font>
    <font class="col-md-4">
        <fmt:formatNumber value="${entity.freezebalance}" pattern="0.00" maxFractionDigits="2" />
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">可用余额：</font>
    <font class="col-md-4">
        <fmt:formatNumber value="${entity.avlbalance}" pattern="0.00" maxFractionDigits="2" />
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">总余额：</font>
    <font class="col-md-4">
        <fmt:formatNumber value="${entity.totalbalance}" pattern="0.00" maxFractionDigits="2" />
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">发生时间：</font>
    <font class="col-md-4">
        <c:if test="${not empty entity.happentime}">
            ${sf.format(entity.happentime)}
        </c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${entity.remark}</font>
    <hr>
</div>

</body>
</html>
