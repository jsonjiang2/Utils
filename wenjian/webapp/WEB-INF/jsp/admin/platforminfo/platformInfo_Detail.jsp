<%@ page import="java.math.BigDecimal" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台信息详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformInfo.pno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformInfo.pname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">logo详情页(大)：</font>
    <a target="_blank" href="${fdfsurl}${platformInfo.logo1}">
        <img src="${fdfsurl}${platformInfo.logo1}" height="100px" width="100px" />
    </a>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">logo列表页(小)：</font>
    <a target="_blank" href="${fdfsurl}${platformInfo.logo2}">
        <img src="${fdfsurl}${platformInfo.logo2}" height="100px" width="100px" />
    </a>
    <hr>
</div>
<div class="row" style="line-height: 15px;">
    <font class="col-sm-4 text-right">运营公司名称：</font>
    <font class="col-md-8">${platformInfo.recordname}</font>
    <hr>
</div><div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台账号：</font>
    <font class="col-md-4">${platformInfo.paccount}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台首字母：</font>
    <font class="col-md-4">${platformInfo.pfirstletter}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台上线时间：</font>
    <font class="col-md-4">${empty platformInfo.online ? '---':dateUtils.formatDate(platformInfo.online)}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台爆雷时间：</font>
    <font class="col-md-4">${empty platformInfo.thunderstormtime ? '---':dateUtils.formatDate(platformInfo.thunderstormtime)}</font>
    <hr>
</div>

<c:set var="profitmin" value="${platformInfo.profitmin}" />
<%
    BigDecimal p = (BigDecimal) pageContext.findAttribute("profitmin");
    String profitmin = "";
    if (p != null){
        String pmax = (p.multiply(new BigDecimal(100))).toString();
        profitmin = pmax.substring(0, pmax.indexOf("."));
    }
%>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">大致收益：</font>
    <font class="col-md-4"><%= profitmin %>%</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">存管方式：</font>
    <font class="col-md-4">
            <c:if test="${empty platformInfo.depositorytype}">---</c:if>
            <c:if test="${platformInfo.depositorytype==1}">资金池</c:if>
            <c:if test="${platformInfo.depositorytype==2}">支付公司存管</c:if>
            <c:if test="${platformInfo.depositorytype==3}">银行存管</c:if>
            &nbsp; ${platformInfo.depositoryagency}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">运营状态：</font>
    <font class="col-md-4">
            <c:if test="${empty platformInfo.operatingstatus}}">---</c:if>
            <c:if test="${platformInfo.operatingstatus==1}">正常</c:if>
            <c:if test="${platformInfo.operatingstatus==2}">跑路</c:if>
            <c:if test="${platformInfo.operatingstatus==3}">清盘</c:if>
            <c:if test="${platformInfo.operatingstatus==4}">高风险</c:if>
            <c:if test="${platformInfo.operatingstatus==5}">有争议</c:if>
            <c:if test="${platformInfo.operatingstatus==6}">延期兑付</c:if>
            <c:if test="${platformInfo.operatingstatus==7}">停业</c:if>
            <c:if test="${platformInfo.operatingstatus==8}">经侦介入</c:if>
            <c:if test="${platformInfo.operatingstatus==9}">提现困难</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">是否认证：</font>
    <font class="col-md-4">
        <c:if test="${empty platformInfo.isauthentication}">---</c:if>
        <c:if test="${platformInfo.isauthentication==1}">是</c:if>
        <c:if test="${platformInfo.isauthentication==0}">否</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">保证金：</font>
    <font class="col-md-4">${platformInfo.bail}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">省：</font>
    <font class="col-md-4">${platformInfo.province}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">市：</font>
    <font class="col-md-4">${platformInfo.city}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">区：</font>
    <font class="col-md-4">${platformInfo.district}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">总部地址：</font>
    <font class="col-md-8">${platformInfo.address}</font>
    <hr><hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">客服电话：</font>
    <font class="col-md-4">${platformInfo.customerphone}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">客服QQ：</font>
    <font class="col-md-4">${platformInfo.qq}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">公司简介：</font>
    <font class="col-md-8">${platformInfo.pbrief}</font>
    <hr><hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认领号：</font>
    <font class="col-md-4">${platformInfo.claimno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">被查看次数：</font>
    <font class="col-md-4">${platformInfo.viewtimes}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维护人姓名：</font>
    <font class="col-md-4">${platformInfo.maintanceman}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维护人职位：</font>
    <font class="col-md-4">${platformInfo.maintanceposition}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维护人手机：</font>
    <font class="col-md-4">${platformInfo.maintancemobile}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">维护人微信：</font>
    <font class="col-md-4">${platformInfo.maintancewechat}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核状态：</font>
    <font class="col-md-4">
        <c:if test="${empty platformInfo.auditstatus}">---</c:if>
        <c:if test="${platformInfo.auditstatus==0}">待审核</c:if>
        <c:if test="${platformInfo.auditstatus==1}">审核通过</c:if>
        <c:if test="${platformInfo.auditstatus==2}">审核失败</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核人：</font>
    <font class="col-md-4">${platformInfo.auditman}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核时间：</font>
    <font class="col-md-4">
        ${empty platformInfo.audittime ? '---':dateUtils.formatDate(platformInfo.audittime)}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">特殊说明：</font>
    <font class="col-md-4">${platformInfo.specialdesc}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">设置时间：</font>
    <font class="col-md-4">
        ${empty platformInfo.addtime ? '---':dateUtils.formatDate(platformInfo.addtime)}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${platformInfo.remark}</font>
    <hr>
</div>


</body>
</html>
