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
    <font size="4">打赏设置详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">设置类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.type==1 }">通用设置</c:if>
        <c:if test="${entity.type==2 }">特殊设置</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名-姓名：</font>
    <font class="col-md-4">
        <c:choose>
            <c:when test="${empty entity.baseid}">所有</c:when>
            <c:when test="${not empty entity.baseid}">
                <wdb:getUser uid="${entity.baseid}" var="user">
                    ${user.username}-${user.realname}
                </wdb:getUser>
            </c:when>
        </c:choose>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">最低打赏额：</font>
    <font class="col-md-4">
        <fmt:formatNumber value="${entity.lowamount}" pattern="0.00" maxFractionDigits="2" />元
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">最高打赏额：</font>
    <font class="col-md-4">
        <fmt:formatNumber value="${entity.highamount}" pattern="0.00" maxFractionDigits="2" />元
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">是否开启：</font>
    <font class="col-md-4">
        <c:if test="${entity.onoff==0 }"><span style="color: red;">关</span></c:if>
        <c:if test="${entity.onoff==1 }"><span style="color: blue;">开</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">操作人：</font>
    <font class="col-md-4">
        <wdb:getAdminUser uid="${entity.addid}" var="auid">
            ${auid.username}-${auid.fullname ? '无' : auid.fullname}
        </wdb:getAdminUser>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">操作时间：</font>
    <font class="col-md-4">
        <c:if test="${not empty entity.addtime}">
            ${sf.format(entity.addtime)}
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
