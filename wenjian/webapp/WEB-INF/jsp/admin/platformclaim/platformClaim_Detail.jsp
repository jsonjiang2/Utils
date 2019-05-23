<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台认领详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${platformClaim.pno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${platformClaim.pname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认领号：</font>
    <font class="col-md-4">${platformClaim.claimno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认领人：</font>
    <font class="col-md-4">${platformClaim.claimname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认领人手机号：</font>
    <font class="col-md-4">${platformClaim.claimmobile}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认领人微信：</font>
    <font class="col-md-4">${platformClaim.claimwechat}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认领时间：</font>
    <font class="col-md-4">${empty platformClaim.claimdate ? '---':dateUtils.formatDate(platformClaim.claimdate)}</font></font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">识别图：</font>
    <a target="_blank" href="http://image.wangdaibus.com/${platformClaim.claimphoto}">
        <img src="http://image.wangdaibus.com/${platformClaim.claimphoto}" height="100px" width="100px" />
    </a>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认领状态：</font>
    <font class="col-md-4">
        <c:if test="${empty platformClaim.status}">---</c:if>
        <c:if test="${platformClaim.status==1}">待处理</c:if>
        <c:if test="${platformClaim.status==3}">已认领</c:if>
        <c:if test="${platformClaim.status==4}">认领失败</c:if>
        <c:if test="${platformClaim.status==5}">已撤销</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核人：</font>
    <font class="col-md-4">${platformClaim.payman}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核时间：</font>
    <font class="col-md-4">${empty platformClaim.paytime ? '---':dateUtils.formatDate(platformClaim.paytime)}</font></font>
    <hr>
</div>


<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">管理员备注：</font>
    <font class="col-md-4">${platformClaim.claimremark}</font>
    <hr>
</div>

</body>
</html>
