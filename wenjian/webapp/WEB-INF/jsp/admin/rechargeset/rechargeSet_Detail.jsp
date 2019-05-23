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
    <font size="4">充值设置详情</font>
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
    <font class="col-sm-4 text-right">对象属性：</font>
    <font class="col-md-4">
        <c:if test="${entity.objectproperties==1 }">所有用户</c:if>
        <c:if test="${entity.objectproperties==2 }">用户组</c:if>
        <c:if test="${entity.objectproperties==3 }">用户名</c:if>
    </font>
    <hr>
</div>
<c:if test="${entity.objectproperties==3 }">
    <div class="row" style="line-height: 0px;">
        <font class="col-sm-4 text-right">用户ID：</font>
        <font class="col-md-4">${entity.baseid}</font>
        <hr>
    </div>
</c:if>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">对象名称：</font>
    <font class="col-md-8">
        <c:choose>
            <c:when test="${entity.objectproperties eq 1}">
                所有用户
            </c:when>
            <c:when test="${entity.objectproperties eq 2}">
                用户组
            </c:when>
            <c:otherwise>
                <wdb:getUser uid="${entity.baseid}" var="user">
                    ${user.username}-${user.realname}
                </wdb:getUser>
            </c:otherwise>
        </c:choose>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">充值方式：</font>
    <font class="col-md-4">
        <c:if test="${entity.rechargetype==1 }">二维码</c:if>
        <%--<c:if test="${entity.rechargetype==2 }">快捷</c:if>
        <c:if test="${entity.rechargetype==3 }">网银</c:if>--%>
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
    <font class="col-sm-4 text-right">优先级：</font>
    <font class="col-md-4">
        <c:choose>
            <c:when test="${not empty entity.priority}">
                ${entity.priority}
            </c:when>
            <c:otherwise>
                无
            </c:otherwise>
        </c:choose>
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
        <wdb:formatDate value="${entity.addtime}" var="addtime">
            ${empty addtime ? '无' : addtime}
        </wdb:formatDate>
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
