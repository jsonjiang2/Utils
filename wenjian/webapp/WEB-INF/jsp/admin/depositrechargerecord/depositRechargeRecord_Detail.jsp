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
    <font size="4">押金手充记录详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <c:choose>
        <c:when test="${entity.type == 1}">
            <font class="col-sm-4 text-right">用户名-姓名：</font>
            <font class="col-md-4">
                <wdb:getUser uid="${entity.baseid}" var="user">
                    ${user.username}-${user.realname}
                </wdb:getUser>
            </font>
        </c:when>
        <c:otherwise>
            <font class="col-sm-4 text-right">平台编号-平台名称：</font>
        <font class="col-md-4">${entity.pno}-${entity.ptname}</font>
        </c:otherwise>
    </c:choose>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">押充金额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.dramount }" pattern="0.00" maxFractionDigits="2"/>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">押充流水号：</font>
    <font class="col-md-8">${entity.drno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">业务类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.type==1 }">骗返押金</c:if>
        <c:if test="${entity.type==2 }">平台押金</c:if>
    </font>
    <hr>
</div>
<%--<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-8">
        <c:choose>
            <c:when test="${entity.type==2 }">${entity.ptname}</c:when>
            <c:otherwise>无</c:otherwise>
        </c:choose>
    </font>
    <hr>
</div>--%>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">充值状态：</font>
    <font class="col-md-4">
        <c:if test="${entity.status==1 }">待审核</c:if>
        <c:if test="${entity.status==2 }"><span style="color:blue;">手充成功</span></c:if>
        <c:if test="${entity.status==3 }"><span style="color:red;">手充失败</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户总金额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.totalbalance }" pattern="0.00" maxFractionDigits="2"/>元
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
    <font class="col-sm-4 text-right">审核状态：</font>
    <font class="col-md-4">
        <c:if test="${entity.auditstatus==0 }">未审核</c:if>
        <c:if test="${entity.auditstatus==1 }">已审核</c:if>
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
    <font class="col-sm-4 text-right">押充备注：</font>
    <font class="col-md-4">${entity.remark}</font>
    <hr>
</div>

</body>
</html>
