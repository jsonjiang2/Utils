<%@ page import="java.math.BigDecimal" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>贷款平台信息详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${loanPlatformInfo.pno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${loanPlatformInfo.pname}</font>
    <hr>
</div>
<div class="row" style="line-height: 15px;">
    <font class="col-sm-4 text-right">运营公司名称：</font>
    <font class="col-md-8">${loanPlatformInfo.recordname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台上线时间：</font>
    <font class="col-md-4">${empty loanPlatformInfo.online ? '---':dateUtils.formatDate(loanPlatformInfo.online)}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台爆雷时间：</font>
    <font class="col-md-4">${empty loanPlatformInfo.thunderstormtime ? '---':dateUtils.formatDate(loanPlatformInfo.thunderstormtime)}</font>
    <hr>
</div>

<%--<c:set var="profitmin" value="${platformInfo.profitmin}" />--%>
<%--<%
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
</div>--%>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">运营状态：</font>
    <font class="col-md-4">
            <c:if test="${empty loanPlatformInfo.operatingstatus}}">---</c:if>
            <c:if test="${loanPlatformInfo.operatingstatus==1}">正常</c:if>
            <c:if test="${loanPlatformInfo.operatingstatus==2}">停业</c:if>
            <c:if test="${loanPlatformInfo.operatingstatus==3}">有投诉</c:if>
            <c:if test="${loanPlatformInfo.operatingstatus==4}">黑名单</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">诚信押金：</font>
    <font class="col-md-4">${loanPlatformInfo.bailstr}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台首字母：</font>
    <font class="col-md-4">${loanPlatformInfo.pfirstletter}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">安卓APP下载地址：</font>
    <font class="col-md-4">${loanPlatformInfo.androidlink}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">苹果APP下载地址：</font>
    <font class="col-md-4">${loanPlatformInfo.ioslink}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">省：</font>
    <font class="col-md-4">${loanPlatformInfo.province}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">市：</font>
    <font class="col-md-4">${loanPlatformInfo.city}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">区：</font>
    <font class="col-md-4">${loanPlatformInfo.district}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">总部地址：</font>
    <font class="col-md-8">${loanPlatformInfo.address}</font>
    <hr><hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">客服电话：</font>
    <font class="col-md-4">${loanPlatformInfo.customerphone}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">客服QQ：</font>
    <font class="col-md-4">${loanPlatformInfo.qq}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">公司简介：</font>
    <font class="col-md-8">${loanPlatformInfo.pbrief}</font>
    <hr><hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">添加时间：</font>
    <font class="col-md-4">
        ${empty loanPlatformInfo.addtime ? '---':dateUtils.formatDate(loanPlatformInfo.addtime)}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">修改时间：</font>
    <font class="col-md-4">
        ${empty loanPlatformInfo.updatetime ? '---':dateUtils.formatDate(loanPlatformInfo.updatetime)}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">修改人uid：</font>
    <font class="col-md-8">${loanPlatformInfo.updateuid}</font>
    <hr><hr>
</div>
<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">投资印象1：</font>
    <font class="col-md-8">${loanPlatformInfo.loanimpress1}</font>
    <hr><hr>
</div>
<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">投资印象2：</font>
    <font class="col-md-8">${loanPlatformInfo.loanimpress2}</font>
    <hr><hr>
</div>
<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">投资印象3：</font>
    <font class="col-md-8">${loanPlatformInfo.loanimpress3}</font>
    <hr><hr>
</div>
<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">投资印象4：</font>
    <font class="col-md-8">${loanPlatformInfo.loanimpress4}</font>
    <hr><hr>
</div>
<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">投资印象5：</font>
    <font class="col-md-8">${loanPlatformInfo.loanimpress5}</font>
    <hr><hr>
</div>
<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">投资印象6：</font>
    <font class="col-md-8">${loanPlatformInfo.loanimpress6}</font>
    <hr><hr>
</div>


<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${loanPlatformInfo.remark}</font>
    <hr>
</div>


</body>
</html>
