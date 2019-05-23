<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台证件图片详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformInfoPictureVO.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformInfoPictureVO.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">证件图片类型：</font>
    <font class="col-md-4">
        <c:if test="${empty platformInfoPictureVO.pictype}">---</c:if>
        <c:if test="${platformInfoPictureVO.pictype==1}">现场办公</c:if>
        <c:if test="${platformInfoPictureVO.pictype==2}">公司证件</c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">图片：</font>
    <font class="col-md-4">
        <img src="${fdfsurl}${platformInfoPictureVO.picpath}" alt="" height="60px" width="60px"/>
    </font>
    <hr><hr><hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">图片名称：</font>
    <font class="col-md-4">${platformInfoPictureVO.picname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">前端是否显示：</font>
    <font class="col-md-4">
        <c:if test="${empty platformInfoPictureVO.display}">---</c:if>
        <c:if test="${platformInfoPictureVO.display==1}">显示</c:if>
        <c:if test="${platformInfoPictureVO.display==0}">不显示</c:if>
    </font>
    <hr>
</div>


</body>
</html>
