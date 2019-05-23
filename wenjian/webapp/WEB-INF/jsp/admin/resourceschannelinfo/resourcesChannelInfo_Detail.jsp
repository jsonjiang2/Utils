<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>资源主详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主微信：</font>
    <font class="col-md-4">
    	<img alt="" width="300px" height="200px" src="${domain}${resourcesChannelInfo.wxqrcode}">
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">身份证正面：</font>
    <font class="col-md-4">
    	<img alt="" width="300px" height="200px" src="${domain}${resourcesChannelInfo.certnopath1}">
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">身份证反面：</font>
    <font class="col-md-4">
    	<img alt=""  width="300px" height="200px" src="${domain}${resourcesChannelInfo.certnopath2}">
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">手持身份证照片：</font>
    <font class="col-md-4">
    	<img alt=""  width="300px" height="200px" src="${domain}${resourcesChannelInfo.picture}">
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">个人半身照片：</font>
    <font class="col-md-4">
    	<img alt=""  width="300px" height="200px" src="${domain}${resourcesChannelInfo.holdpicture}">
    </font>
    <hr>
</div>
<br/>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主ID：</font>
    <font class="col-md-4">${resourcesChannelInfo.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主uid：</font>
    <font class="col-md-4">${resourcesChannelInfo.uid}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主微信：</font>
    <font class="col-md-4">${resourcesChannelInfo.wechat}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主手机：</font>
    <font class="col-md-4">${resourcesChannelInfo.mobile}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主QQ：</font>
    <font class="col-md-4">${resourcesChannelInfo.qq}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主二级域名：</font>
    <font class="col-md-4">${resourcesChannelInfo.sldomain}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申请时间：</font>
    <font class="col-md-4">${empty resourcesChannelInfo.applytime ? '--':dateUtils.formatDate(resourcesChannelInfo.applytime)}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">申请状态：</font>
    <font class="col-md-4">
    <c:if test="${resourcesChannelInfo.status==1}">待审核</c:if>
	<c:if test="${resourcesChannelInfo.status==2}"><font color="blue">合格</font></c:if>
	<c:if test="${resourcesChannelInfo.status==3}"><font color="red">不合格</font></c:if>
	<c:if test="${resourcesChannelInfo.status==4}"><font color="red">黑名单</font></c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主状态：</font>
    <font class="col-md-4">
    <c:if test="${resourcesChannelInfo.manstatus==1}"><font color="blue">正常</font></c:if>
	<c:if test="${resourcesChannelInfo.manstatus==2}">有争议</c:if>
	<c:if test="${resourcesChannelInfo.manstatus==3}"><font color="red">黑名单</font></c:if>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主公告：</font>
    <font class="col-md-4">${resourcesChannelInfo.announcement}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主推荐：</font>
    <font class="col-md-4">
    <c:if test="${resourcesChannelInfo.recommend==0}">否</c:if>
	<c:if test="${resourcesChannelInfo.recommend==1}"><font color="blue">是</font></c:if>
    </font>
    <hr>
</div>


<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核人：</font>
    <font class="col-md-4">${resourcesChannelInfo.auditman}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核时间：</font>
    <font class="col-md-4">${empty resourcesChannelInfo.audittime ? '--':dateUtils.formatDate(resourcesChannelInfo.audittime)}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">操作人：</font>
    <font class="col-md-4">${resourcesChannelInfo.dealman}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">操作时间：</font>
    <font class="col-md-4">${empty resourcesChannelInfo.dealtime  ? '--':dateUtils.formatDate(resourcesChannelInfo.dealtime)}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">操作备注：</font>
    <font class="col-md-4">${resourcesChannelInfo.dealremark}</font>
    <hr>
</div>


<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源主更新时间：</font>
    <font class="col-md-4">${empty resourcesChannelInfo.updatetime ? '--':dateUtils.formatDate(resourcesChannelInfo.updatetime)}</font>
    <hr>
</div>



</body>
</html>
