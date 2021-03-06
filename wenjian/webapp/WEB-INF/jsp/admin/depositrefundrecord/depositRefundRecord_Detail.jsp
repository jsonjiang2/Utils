<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
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
    <font size="4">押金退款记录详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">退款流水号：</font>
    <font class="col-md-8">${entity.drno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">押金类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.deposittype==1 }">骗返押金</c:if>
        <c:if test="${entity.deposittype==2 }">平台押金</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名-姓名：</font>
    <font class="col-md-4">
        <wdb:getUser uid="${entity.baseid}" var="user">
            ${user.username}-${empty user.realname? "无" : user.realname}
        </wdb:getUser>
    </font>
    <hr>
</div>
<c:if test="${entity.deposittype == 2}">
    <div class="row" style="line-height: 0px;">
        <font class="col-sm-4 text-right">平台编号-平台名称：</font>
        <font class="col-md-4">${entity.pno}-${entity.ptname}</font>
        <hr>
    </div>
</c:if>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">退款金额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.refundamount }" pattern="0.00" maxFractionDigits="2"/>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">退款状态：</font>
    <font class="col-md-4">
        <c:if test="${entity.status==1 }">待审核</c:if>
        <c:if test="${entity.status==2 }"><span style="color:blue;">退款成功</span></c:if>
        <c:if test="${entity.status==3 }"><span style="color:red;">退款失败</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申请时间：</font>
    <font class="col-md-4">
        <wdb:formatDate value="${entity.applytime}" var="applytime">
            ${empty applytime ? '无' : applytime}
        </wdb:formatDate>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核人：</font>
    <font class="col-md-4">
        <wdb:getAdminUser uid="${entity.auditid}" var="auid">
            ${auid.username}-${auid.fullname ? '无' : auid.fullname}
        </wdb:getAdminUser>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核时间：</font>
    <font class="col-md-4">
        <wdb:formatDate value="${entity.audittime}" var="audittime">
            ${empty audittime ? '无' : audittime}
        </wdb:formatDate>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核备注：</font>
    <font class="col-md-4">${entity.auditremark}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">退款备注：</font>
    <font class="col-md-4">${entity.remark}</font>
    <hr>
</div>
</body>
</html>
