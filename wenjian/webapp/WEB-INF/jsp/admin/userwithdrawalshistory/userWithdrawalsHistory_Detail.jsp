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
    <font size="4">提现历史记录详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">提现批次号：</font>
    <font class="col-md-4">${entity.uwbatchno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">提现流水号：</font>
    <font class="col-md-4">${entity.uworderno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">订单号（乾多多）：</font>
    <font class="col-md-4">${entity.qmmorderno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户ID：</font>
    <font class="col-md-4">${entity.baseid}</font>
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
    <font class="col-sm-4 text-right">银行：</font>
    <font class="col-md-4">${entity.bankname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">银行卡号：</font>
    <font class="col-md-4">${entity.cardno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">卡类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.cardtype==1 }">信用卡</c:if>
        <c:if test="${entity.cardtype==2 }">借记卡</c:if>
        <c:if test="${entity.cardtype==3 }">企业账户</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">银行数字编号：</font>
    <font class="col-md-4">${entity.banknum}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">打款金额：</font>
    <font class="col-md-4">${entity.transferamount}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">提现金额：</font>
    <font class="col-md-4">${entity.withdrawalsamount}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">提现时间：</font>
    <font class="col-md-4">
        <c:if test="${not empty entity.withdrawalstime}">
            ${sf.format(entity.withdrawalstime)}
        </c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">打款方式：</font>
    <font class="col-md-4">${entity.transfertype}</font>
    <hr>
</div>
<%--<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">打款银行：</font>
    <font class="col-md-4">${entity.transferbank}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">打款账号：</font>
    <font class="col-md-4">${entity.transfercardno}</font>
    <hr>
</div>--%>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">提现状态：</font>
    <font class="col-md-4">
        <c:if test="${entity.status==1 }">待处理</c:if>
        <c:if test="${entity.status==2 }">打款中</c:if>
        <c:if test="${entity.status==3 }"><span style="color:red;">提现失败</span></c:if>
        <c:if test="${entity.status==4 }"><span style="color:blue;">已打款</span></c:if>
        <c:if test="${entity.status==5 }"><span style="color:#761c19;">审核失败</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">手续费：</font>
    <font class="col-md-4">${entity.fee}</font>
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
    <font class="col-sm-4 text-right">审核时间：</font>
    <font class="col-md-4">
        <c:if test="${not empty entity.audittime}">
            ${sf.format(entity.audittime)}
        </c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核人：</font>
    <font class="col-md-4">
        <c:if test="${not empty entity.auditid}">
            <wdb:getAdminUser uid="${entity.auditid}" var="auid">
                ${auid.username}-${auid.fullname ? '无' : auid.fullname}
            </wdb:getAdminUser>
        </c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">勾兑时间：</font>
    <font class="col-md-4">
        <c:if test="${not empty entity.gouduitime}">
            ${sf.format(entity.gouduitime)}
        </c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">勾兑人：</font>
    <font class="col-md-4">
        <c:if test="${not empty entity.gouduitime }">
            <c:choose>
                <c:when test="${not empty entity.gouduiid}">
                    <wdb:getAdminUser uid="${entity.gouduiid}" var="auid">
                        ${auid.username}-${auid.fullname ? '无' : auid.fullname}
                    </wdb:getAdminUser>
                </c:when>
                <c:otherwise>系统</c:otherwise>
            </c:choose>
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
