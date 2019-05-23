<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台高管详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformExecutivesVO.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformExecutivesVO.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">序号：</font>
    <font class="col-md-4">${platformExecutivesVO.serialno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">高管名称：</font>
    <font class="col-md-4">${platformExecutivesVO.name}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">职位：</font>
    <font class="col-md-4">${platformExecutivesVO.position}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">个人学历：</font>
    <font class="col-md-4">
        <c:if test="${empty platformExecutivesVO.education}">---</c:if>
        <c:if test="${platformExecutivesVO.education==0}">无</c:if>
        <c:if test="${platformExecutivesVO.education==1}">小学</c:if>
        <c:if test="${platformExecutivesVO.education==2}">初中</c:if>
        <c:if test="${platformExecutivesVO.education==3}">高中</c:if>
        <c:if test="${platformExecutivesVO.education==4}">专科</c:if>
        <c:if test="${platformExecutivesVO.education==5}">本科</c:if>
        <c:if test="${platformExecutivesVO.education==6}">研究生</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">个人图片：</font>
    <font class="col-md-4">
        <img src="${fdfsurl}${platformExecutivesVO.pic}" alt="" height="100px" width="100px"/>
    </font>
    <hr>
</div>
<br><br><br>
<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">个人简介：</font>
    <font class="col-md-8">${platformExecutivesVO.brief}</font>
    <hr>
</div>


</body>
</html>
