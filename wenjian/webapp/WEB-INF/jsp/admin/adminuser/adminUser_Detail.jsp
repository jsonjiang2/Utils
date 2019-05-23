<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
    <title>管理员用户详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">
<div class="row text-center" style="line-height: 0px;">
    <font size="4">详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${adminUser.id}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名：</font>
    <font class="col-md-4">${adminUser.username}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">密码：</font>
    <font class="col-md-8">${adminUser.password}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">全名：</font>
    <font class="col-md-4">${adminUser.fullname}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">邮箱地址：</font>
    <font class="col-md-4">${adminUser.email}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">电话：</font>
    <font class="col-md-4">${adminUser.mobile}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">U盾编号：</font>
    <font class="col-md-4">${adminUser.pin}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">短信发送次数：</font>
    <font class="col-md-4">${adminUser.smstimes}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">登录错误次数：</font>
    <font class="col-md-4">${adminUser.errorcount}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">最后登录时间：</font>
    <font class="col-md-4"><wdb:formatDate value="${adminUser.logintime}" var="logintime">
        ${empty logintime ? '无' : logintime}
    </wdb:formatDate> </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">最后修改时间：</font>
    <font class="col-md-4"><wdb:formatDate value="${adminUser.modifypwdtime}" var="modifypwdtime">
        ${empty modifypwdtime ? '无' : modifypwdtime}
    </wdb:formatDate></font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">最后一次登录IP：</font>
    <font class="col-md-4">${adminUser.lastloginip}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">禁止状态：</font>
    <font class="col-md-4">${adminUser.forbid}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">最后一次登录cookie：</font>
    <font class="col-md-8">${adminUser.lastlogincookie}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">注册时间：</font>
    <font class="col-md-4">
        <wdb:formatDate value="${adminUser.regdate}" var="regdate">
            ${empty regdate ? '无' : regdate}
        </wdb:formatDate>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">登录验证：</font>
    <font class="col-md-8">${adminUser.loginTye} &nbsp;&nbsp;(1U盾，2短信)</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">IP限制：</font>
    <font class="col-md-8">${adminUser.ipRestrict} &nbsp;&nbsp;(0不限制，1限制)</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">IP1限制：</font>
    <font class="col-md-8">${adminUser.ip1} &nbsp;&nbsp;</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">IP2限制：</font>
    <font class="col-md-8">${adminUser.ip2} &nbsp;&nbsp;</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">IP3限制：</font>
    <font class="col-md-8">${adminUser.ip3} &nbsp;&nbsp;</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">手机登录限制：</font>
    <font class="col-md-8">${adminUser.ismobilelogin} &nbsp;&nbsp;(0限制，1不限制)</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${adminUser.remark}</font>
    <hr>
</div>
</body>
</html>
