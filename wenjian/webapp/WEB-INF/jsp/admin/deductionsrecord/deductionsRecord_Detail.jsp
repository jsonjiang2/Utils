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
    <font size="4">充扣记录详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名：</font>
    <font class="col-md-4">${entity.username}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">姓名：</font>
    <font class="col-md-4">${entity.realname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">充扣金额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.dramount }" pattern="0.00" maxFractionDigits="2"/>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">充扣流水号：</font>
    <font class="col-md-8">${entity.drno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">关联流水号：</font>
    <font class="col-md-4">
        <c:choose>
            <c:when test="${not empty entity.relevanceno}">
                ${entity.relevanceno}
            </c:when>
            <c:otherwise>
                无
            </c:otherwise>
        </c:choose>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">业务类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.type==1 }"><span style="color:blue;">预约扣款</span></c:if>
        <c:if test="${entity.type==2 }"><span style="color:blue;">手动扣款</span></c:if>
        <c:if test="${entity.type==3 }"><span style="color:blue;">手充成功</span></c:if>
        <c:if test="${entity.type==4 }"><span style="color:red;">手充失败</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户总金额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.balance }" pattern="0.00" maxFractionDigits="2"/>元
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户可用余额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.avlbalance }" pattern="0.00" maxFractionDigits="2"/>元
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户冻结余额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.freezebalance }" pattern="0.00" maxFractionDigits="2"/>元
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
        <c:if test="${not empty entity.audittime}">
            ${sf.format(entity.audittime)}
        </c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核备注：</font>
    <font class="col-md-4">${entity.auditremark}</font>
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
        ${sf.format(entity.addtime)}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">充扣备注：</font>
    <font class="col-md-4">${entity.remark}</font>
    <hr>
</div>

</body>
</html>
