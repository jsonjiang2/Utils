<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台评价详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformEvaluate.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformEvaluate.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">评价流水号：</font>
    <font class="col-md-4">${platformEvaluate.orderno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">评价用户：</font>
    <font class="col-md-4">${platformEvaluate.username}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">评价倾向：</font>
    <font class="col-md-4">
        <c:if test="${empty platformEvaluate.evaluationtendency}">----</c:if>
        <c:if test="${platformEvaluate.evaluationtendency==1}">好评</c:if>
        <c:if test="${platformEvaluate.evaluationtendency==2}">一般</c:if>
        <c:if test="${platformEvaluate.evaluationtendency==3}">差评</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">星值评分：</font>
    <font class="col-md-4">${platformEvaluate.pevaluatenum}</font>
    <hr>
</div>

<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">评价内容：</font>
    <font class="col-md-8">${platformEvaluate.evaluationcontent}</font>
    <hr><hr>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">评价时间：</font>
    <font class="col-md-4">${dateUtils.formatDate(platformEvaluate.evaluationtime)}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">是否显示：</font>
    <font class="col-md-4">
        <c:if test="${empty platformEvaluate.display}">----</c:if>
        <c:if test="${platformEvaluate.display==0}">不显示</c:if>
        <c:if test="${platformEvaluate.display==1}">显示</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">是否精华：</font>
    <font class="col-md-4">
        <c:if test="${empty platformEvaluate.display}">----</c:if>
        <c:if test="${platformEvaluate.display==0}">非精华</c:if>
        <c:if test="${platformEvaluate.display==1}">精华</c:if>
    </font>
    <hr>
</div>


<%--<div class="row" style="line-height: 0px;">--%>
    <%--<font class="col-sm-4 text-right">评价来源：</font>--%>
    <%--<font class="col-md-4">--%>
        <%--<c:if test="${empty platformEvaluate.source}">----</c:if>--%>
        <%--<c:if test="${platformEvaluate.source==1}">安卓</c:if>--%>
        <%--<c:if test="${platformEvaluate.source==2}">苹果</c:if>--%>
        <%--<c:if test="${platformEvaluate.source==3}">PC</c:if>--%>
    <%--</font>--%>
    <%--<hr>--%>
<%--</div>--%>

<%--<div class="row" style="line-height: 0px;">--%>
    <%--<font class="col-sm-4 text-right">发布人ip：</font>--%>
    <%--<font class="col-md-4">${platformEvaluate.ip}</font>--%>
    <%--<hr>--%>
<%--</div>--%>


<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${platformEvaluate.remark}</font>
    <hr>
</div>


</body>
</html>
