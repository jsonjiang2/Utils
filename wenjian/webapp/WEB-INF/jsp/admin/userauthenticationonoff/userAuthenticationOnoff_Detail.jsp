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
    <font size="4">实名认证接口开关详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">接口名称：</font>
    <font class="col-md-8">${entity.name}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">认证类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.type==1 }">实名</c:if>
        <c:if test="${entity.type==2 }">银行卡4要素</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">接口公司：</font>
    <font class="col-md-4">${entity.company}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">是否启用：</font>
    <font class="col-md-4">
        <c:if test="${entity.isuse==0 }"><span style="color:red;">关闭</span></c:if>
        <c:if test="${entity.isuse==1 }"><span style="color:blue;">开启</span></c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">操作时间：</font>
    <font class="col-md-4">
        ${sf.format(entity.modifytime)}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">操作人：</font>
    <font class="col-md-4">
        <wdb:getAdminUser uid="${entity.modifyid}" var="auid">
            ${auid.username}-${auid.fullname ? '无' : auid.fullname}
        </wdb:getAdminUser>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-8">${entity.remark}</font>
    <hr>
</div>

</body>
</html>
