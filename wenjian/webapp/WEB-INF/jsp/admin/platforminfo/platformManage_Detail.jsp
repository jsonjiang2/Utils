<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台管理详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformManageVO.pno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformManageVO.pname}</font>
    <hr>
</div>
<%--<div class="row" style="line-height: 0px;">--%>
    <%--<font class="col-sm-4 text-right">平台网站：</font>--%>
    <%--<font class="col-md-4">${platformManageVO.website}</font>--%>
    <%--<hr>--%>
<%--</div>--%>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">运营状态：</font>
    <font class="col-md-4">
        <c:if test="${empty platformManageVO.operatingstatus}}">---</c:if>
        <c:if test="${platformManageVO.operatingstatus==1}">正常</c:if>
        <c:if test="${platformManageVO.operatingstatus==2}">跑路</c:if>
        <c:if test="${platformManageVO.operatingstatus==3}">清盘</c:if>
        <c:if test="${platformManageVO.operatingstatus==4}">高风险</c:if>
        <c:if test="${platformManageVO.operatingstatus==5}">有争议</c:if>
        <c:if test="${platformManageVO.operatingstatus==6}">延期兑付</c:if>
        <c:if test="${platformManageVO.operatingstatus==7}">停业</c:if>
        <c:if test="${platformManageVO.operatingstatus==8}">经侦介入</c:if>
        <c:if test="${platformManageVO.operatingstatus==9}">提现困难</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">关注人数：</font>
    <font class="col-md-4">
        ${empty platformManageVO.attentionrate ? '0':platformManageVO.attentionrate}
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">点击查看数：</font>
    <font class="col-md-4">
        ${empty platformManageVO.viewtimes ? '0':platformManageVO.viewtimes}
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主数：</font>
    <font class="col-md-4">${platformManageVO.rManCount}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">产品数：</font>
    <font class="col-md-4">${platformManageVO.productAmount}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申报审核人：</font>
    <font class="col-md-4">
        <c:if test="${empty platformManageVO.applyauditman}">---</c:if>
        <c:if test="${platformManageVO.applyauditman==1}">官方号</c:if>
        <c:if test="${platformManageVO.applyauditman==2}">一级资源人</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权状态：</font>
    <font class="col-md-4">
        <c:if test="${empty platformManageVO.safeguardstatus}">---</c:if>
        <c:if test="${platformManageVO.safeguardstatus==1}">开启</c:if>
        <c:if test="${platformManageVO.safeguardstatus==2}">关闭</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维权关注人数：</font>
    <font class="col-md-4">
        ${empty platformManageVO.safeguardAmount ? '0':platformManageVO.safeguardAmount}
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">返利申报：</font>
    <font class="col-md-4">
        ${empty platformManageVO.declareAmount ? '0':platformManageVO.declareAmount}笔---
        ${empty platformManageVO.declareMoney ? '0.00' : platformManageVO.declareMoney}元
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认领状态：</font>
    <font class="col-md-4">
        <c:if test="${empty platformManageVO.claimstatus}">---</c:if>
        <c:if test="${platformManageVO.claimstatus==1}">待处理</c:if>
        <c:if test="${platformManageVO.claimstatus==2}">待激活</c:if>
        <c:if test="${platformManageVO.claimstatus==3}">已认领</c:if>
        <c:if test="${platformManageVO.claimstatus==4}">认领失败</c:if>
        <c:if test="${platformManageVO.claimstatus==5}">已撤销</c:if>
        <c:if test="${platformManageVO.claimstatus==6}">打款失败</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认领人：</font>
    <font class="col-md-4">${platformManageVO.claimname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台押金：</font>
    <font class="col-md-4">
        ${empty platformManageVO.deposit ? '0.00' : platformManageVO.deposit}元
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">设置时间：</font>
    <font class="col-md-4">
        ${empty platformManageVO.addtime ? '---':dateUtils.formatDate(platformManageVO.addtime)}
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">设置人：</font>
    <font class="col-md-4">${platformManageVO.realname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">负面曝光数：</font>
    <font class="col-md-4">${platformManageVO.badInfoAmount}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">评价数：</font>
    <font class="col-md-4">${platformManageVO.evaluateAmount}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">管理员备注：</font>
    <font class="col-md-4">${platformManageVO.remark}</font>
    <hr>
</div>

</body>
</html>
