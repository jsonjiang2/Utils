<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>短信通道管理详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">
<div class="row text-center" style="line-height: 0px;">
    <font size="4">详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${smsChannel.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信接口编号：</font>
    <font class="col-md-4">${smsChannel.smscno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信接口名称：</font>
    <font class="col-md-4">${smsChannel.smscname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信接口公司：</font>
    <font class="col-md-4">${smsChannel.smsccompany}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信接口版本：</font>
    <font class="col-md-4">${smsChannel.smsvertion}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信接口URL：</font>
    <font class="col-md-8">${smsChannel.smsurl}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">软件序列号：</font>
    <font class="col-md-4">${smsChannel.serialno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信终端标识：</font>
    <font class="col-md-4">${smsChannel.keyno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">终端密码：</font>
    <font class="col-md-4">${smsChannel.pass}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">标识信息：</font>
    <font class="col-md-4">${smsChannel.action}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">扩展号：</font>
    <font class="col-md-4">${smsChannel.extno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台登录名：</font>
    <font class="col-md-4">${smsChannel.pusername}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">登录密码：</font>
    <font class="col-md-4">${smsChannel.ppassword}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">是否可使用：</font>
    <c:if test="${smsChannel.isuse==1}"><font class="col-md-4" style="color:blue">可用</font></c:if>
    <c:if test="${smsChannel.isuse==0}"><font class="col-md-4" style="color: red;">不可用</font></c:if>
    <hr>
</div>




<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">添加人：</font>
    <font class="col-md-4">${smsChannel.addman}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">添加时间：</font>
    <font class="col-md-4">
   <%--  <fmt:formatDate value="${smsChannel.addtime}" type="both"/>  --%>
    	<c:if test="${empty smsChannel.addtime}">                     		
			Don't have the time
        </c:if>
        <c:if test="${!empty smsChannel.addtime}">                     		
			${sf.format(smsChannel.addtime)}
        </c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">通道注册详情：</font>
    <font class="col-md-4">${smsChannel.channelremark}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${smsChannel.remark}</font>
   
</div>
</body>
</html>
