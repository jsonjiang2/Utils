<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <font size="4">用户绑卡详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名：</font>
    <font class="col-md-8">${entity.username}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">姓名：</font>
    <font class="col-md-8">${entity.realname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认证类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.cardtype == 1}">信用卡</c:if>
        <c:if test="${entity.cardtype == 2}">借记卡</c:if>
        <c:if test="${entity.cardtype == 3}">企业账户</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">银行编号：</font>
    <font class="col-md-8">${entity.bankcode}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">银行数字编号：</font>
    <font class="col-md-8">${entity.banknum}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">账户：</font>
    <font class="col-md-8">${entity.cardno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">银行名称：</font>
    <font class="col-md-8">${entity.bankname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">开户行省：</font>
    <font class="col-md-8">${entity.province}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">开户行市：</font>
    <font class="col-md-8">${entity.city}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">开户行区：</font>
    <font class="col-md-8">${entity.area}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">分支行：</font>
    <font class="col-md-8">${entity.subbranch}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">开卡手机号：</font>
    <font class="col-md-8">${entity.bankmobile}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">绑卡时间：</font>
    <font class="col-md-4">
        ${sf.format(entity.bindtime)}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">是否默认取现卡：</font>
    <font class="col-md-4">
        <c:if test="${entity.isdefaultcard == 1}"><span style="color:blue;">是</span></c:if>
        <c:if test="${entity.isdefaultcard == 0}"><span style="color:red;">否</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">绑定状态：</font>
    <font class="col-md-4">
        <c:if test="${entity.bindstatus == 1}"><span style="color:blue;">已绑定</span></c:if>
        <c:if test="${entity.bindstatus == 2}"><span style="color:red;">已解绑</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-8">${entity.remark}</font>
</div>

</body>
</html>
