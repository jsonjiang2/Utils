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
    <font size="4">用户账户冻结解冻详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名-姓名：</font>
    <font class="col-md-4">
        <wdb:getUser uid="${entity.baseid}" var="user">
            ${user.username}-${empty user.realname? "无":user.realname}
        </wdb:getUser>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">冻结解冻流水号：</font>
    <font class="col-md-8">${entity.ftorderno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">关联流水号：</font>
    <font class="col-md-4">${entity.orderno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">金额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.amount }" pattern="0.00" maxFractionDigits="2"/>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">业务类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.type==1 }">提现</c:if>
        <c:if test="${entity.type==2 }">差错</c:if>
        <c:if test="${entity.type==3 }">产品预约</c:if>
        <c:if test="${entity.type==4 }">手动冻结</c:if>
        <c:if test="${entity.type==5 }">手动解冻</c:if>
        <c:if test="${entity.type==6 }">红包帖</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资金来源（用途）：</font>
    <font class="col-md-4">${entity.description}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户可用余额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.balance }" pattern="0.00" maxFractionDigits="2"/>元
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户冻结余额：</font>
    <font class="col-md-4">
        <fmt:formatNumber type="number" value="${entity.freebalance }" pattern="0.00" maxFractionDigits="2"/>元
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
    <font class="col-sm-4 text-right">状态：</font>
    <font class="col-md-4">
        <c:if test="${entity.status==1 }"><span style="color:red;">冻结</span></c:if>
        <c:if test="${entity.status==2 }"><span style="color:blue;">解冻</span></c:if>
        <c:if test="${entity.status==3 }"><span style="color:blue;">划出</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">操作时间：</font>
    <font class="col-md-4">
        ${sdf.format(entity.freezetime)}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">操作人：</font>
    <font class="col-md-4">
        <c:choose>
            <c:when test="${entity.adminoperate == 0}">
                <wdb:getUser uid="${entity.addid}" var="user">
                    ${user.username}-${empty user.realname? "无":user.realname}
                </wdb:getUser>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${not empty entity.addid}">
                        <wdb:getAdminUser uid="${entity.addid}" var="auid">
                            ${auid.username}-${auid.fullname ? '无' : auid.fullname}
                        </wdb:getAdminUser>
                    </c:when>
                    <c:otherwise>
                        系统
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-8">${entity.remark}</font>
    <hr>
</div>

</body>
</html>
