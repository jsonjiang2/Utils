<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>入账审核详情</title>

    <style type="text/css">
        #rechargei label{
            font-weight:normal;
        }
    </style>
</head>

<body style="font-family:'微软雅黑'; ">
<div class="col-md-12" id="rechargei">
    <div class="row text-center" style="line-height: 0px;">
        <font size="5" style="font-weight:500;">承接记录详情</font>
    </div><br>
    <div class="form-group ">
        <label class="col-sm-4 text-right">承接流水号：</label>
        <label class="col-md-4">${entity.receptserialnum}</label>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">承接人：</lable>
        <lable class="col-md-4">${entity.receptman}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">承接金额：</lable>
        <lable class="col-md-4">${entity.receptamount}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">承接时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.recepttime}" var="recepttime">
                ${empty recepttime ? '无' : recepttime}
            </wdb:formatDate>
        </lable>
    </div><br>
    <div class="form-group" >
        <lable class="col-sm-4 text-right">平台编号：</lable>
        <lable class="col-md-4">${entity.platformnum}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">出让流水号：</lable>
        <lable class="col-md-4">${entity.transferserialnum}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">承接状态：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.receptstatus==1 }"><span style="color: blue">取消</span></c:if>
            <c:if test="${entity.receptstatus==2 }"><span style="color: blue">待处理</span></c:if>
            <c:if test="${entity.receptstatus==3 }"><span style="color: blue">成功</span></c:if>
            <c:if test="${entity.receptstatus==4 }"><span style="color: blue">失败</span></c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">承接状态：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.auditstatus eq 1}"><span style="color: blue">待审核</span></c:if>
            <c:if test="${entity.auditstatus eq 2}"><span style="color: blue">审核通过</span></c:if>
            <c:if test="${entity.auditstatus eq 3}"><span style="color: blue">审核退回</span></c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">备注：</lable>
        <lable class="col-md-4">${entity.remark}</lable>
    </div><br>

</div>
</body>
</html>