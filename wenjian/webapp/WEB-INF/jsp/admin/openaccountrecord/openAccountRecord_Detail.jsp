<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>开户记录详情</title>

    <style type="text/css">
        #rechargei label{
            font-weight:normal;
        }
    </style>
</head>

<body style="font-family:'微软雅黑'; ">
<div class="col-md-12" id="rechargei">
    <div class="row text-center" style="line-height: 0px;">
        <font size="5" style="font-weight:500;">开户记录详情</font>
    </div><br>
    <div class="form-group ">
        <label class="col-sm-4 text-right">开户平台：</label>
        <label class="col-md-4">${entity.platformnum}--${entity.platformname}</label>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">开户人：</lable>
        <lable class="col-md-4"> <wdb:getUser uid="${entity.baseid}" var="user">
            ${user.username}-${user.realname}
        </wdb:getUser></lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">平台用户名：</lable>
        <lable class="col-md-4"> ${entity.platformusername}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">开户时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.registertime}" var="registertime">
                ${empty registertime ? '无' : registertime}
            </wdb:formatDate>
        </lable>
    </div><br>
    <div class="form-group" >
        <lable class="col-sm-4 text-right">平台手机号：</lable>
        <lable class="col-md-4">${entity.platformnum}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">平台手机号：</lable>
        <lable class="col-md-4">${entity.platformmobile}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">开户方式：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.openaccountway==1 }"><span style="color: blue">正开户</span></c:if>
            <c:if test="${entity.openaccountway==2 }"><span style="color: blue">反开户</span></c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">开户状态：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.openaccountstatus==1 }"><span style="color: blue">待审核</span></c:if>
            <c:if test="${entity.openaccountstatus==2 }"><span style="color: blue">成功</span></c:if>
            <c:if test="${entity.openaccountstatus==3 }"><span style="color: blue">失败</span></c:if>
        </lable>
    </div><br>
</div>
</body>
</html>