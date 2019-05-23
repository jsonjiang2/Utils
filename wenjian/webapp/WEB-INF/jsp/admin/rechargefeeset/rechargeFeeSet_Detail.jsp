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
    <font size="4">充值手续费设置详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">充值设置ID：</font>
    <font class="col-md-4">${entity.rechargesetid}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <c:choose>
        <c:when test="${entity.bankname == '微信' or entity.bankname == '支付宝'}">
            <font class="col-sm-4 text-right">通道名称：</font>
        </c:when>
        <c:otherwise>
            <font class="col-sm-4 text-right">银行名称：</font>
        </c:otherwise>
    </c:choose>
    <font class="col-md-4">${entity.bankname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <c:choose>
        <c:when test="${entity.bankname == '微信' or entity.bankname == '支付宝'}">
            <font class="col-sm-4 text-right">通道编码：</font>
        </c:when>
        <c:otherwise>
            <font class="col-sm-4 text-right">银行编码：</font>
        </c:otherwise>
    </c:choose>
    <font class="col-md-4">${entity.bankcode}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">单笔最低充值额：</font>
    <font class="col-md-4">${entity.lowamount}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">单笔最高充值额：</font>
    <font class="col-md-4">${entity.highamount}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">收费方式：</font>
    <font class="col-md-4">
        <c:if test="${entity.feetype==1 }"><span style="color: blue;">定额</span></c:if>
        <c:if test="${entity.feetype==2 }"><span style="color: red;">百分比</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">
        <c:choose>
            <c:when test="${entity.feetype==1 }">
                充值定额：
            </c:when>
            <c:otherwise>
                充值百分比：
            </c:otherwise>
        </c:choose>
    </font>
    <font class="col-md-4">
        <c:if test="${entity.feetype==1 }">
            <fmt:formatNumber value="${entity.feerate}" pattern="0.00" maxFractionDigits="2" />元
        </c:if>
        <c:if test="${entity.feetype==2 }">${entity.feerate}%</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">手续费最低：</font>
    <font class="col-md-4">${entity.minfee}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">手续费最高：</font>
    <font class="col-md-4">${entity.maxfee}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">支付公司类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.paycompanytype == 1 }">双乾</c:if>
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
