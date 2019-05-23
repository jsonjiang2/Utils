<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>短信发送记录详情页面</title>
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
    <font class="col-md-4">${smsRecord.id}</font>
    <hr>
</div>
<%--<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名：</font>
    <font class="col-md-4">${smsRecord.username}</font>
    <hr>
</div>--%>
<%--<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">发送号码：</font>
    <font class="col-md-4">${smsRecord.sendno}</font>
    <hr>
</div>--%>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信类型：</font>
    <font class="col-md-4">${smsRecord.smstype}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">接收信息电话：</font>
    <font class="col-md-4">${smsRecord.mobile}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">发送时间：</font>
    <font class="col-md-4">
    		<c:if test="${!empty smsRecord.sendtime}">
           		${sf.format(smsRecord.sendtime)}
           	</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信内容：</font>
    <font class="col-md-7">${smsRecord.smscontent}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信接口公司：</font>
    <font class="col-md-4">${smsRecord.smsccompany}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">发送方式：</font>
    <c:if test="${smsRecord.sendtype==1}"><font class="col-md-4">手工</font></c:if>
    <c:if test="${smsRecord.sendtype==2}"><font class="col-md-4">系统</font></c:if>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">发送状态：</font>
    <c:if test="${!empty smsRecord.status}">
	    <c:if test="${smsRecord.status==1}"><font class="col-md-4" style="color:blue">成功</font></c:if>
	    <c:if test="${smsRecord.status==0}"><font class="col-md-4" style="color:red">失败</font></c:if>
    </c:if>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">补发时间：</font>
    <font class="col-md-4"><fmt:formatDate value="${smsRecord.reissuetime}" type="both"/> </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信发送后返回内容：</font>
    <font class="col-md-6">${smsRecord.smsreturn}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${smsRecord.remark}</font>
</div>
</body>
</html>
