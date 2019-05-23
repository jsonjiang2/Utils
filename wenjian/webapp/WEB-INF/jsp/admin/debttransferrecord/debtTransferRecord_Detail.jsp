<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>出让记录详情</title>

    <style type="text/css">
        #rechargei label{
            font-weight:normal;
        }
    </style>
</head>

<body style="font-family:'微软雅黑'; ">
<div class="col-md-12" id="rechargei">
    <div class="row text-center" style="line-height: 0px;">
        <font size="5" style="font-weight:500;">出让记录详情</font>
    </div><br>
    <div class="form-group ">
        <label class="col-sm-4 text-right">出让流水号：</label>
        <label class="col-md-4">${entity.transferserialnum}</label>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">出让人：</lable>
        <lable class="col-md-4">${entity.transferman}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">出让时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.transfertime}" var="transfertime">
                ${empty transfertime ? '无' : transfertime}
            </wdb:formatDate>
        </lable>
    </div><br>
    <div class="form-group" >
        <lable class="col-sm-4 text-right">平台编号：</lable>
        <lable class="col-md-4">${entity.platformnum}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">投标流水号：</lable>
        <lable class="col-md-4">${entity.tenderserialnum}</lable>
    </div><br>

    <div class="form-group ">
        <lable class="col-sm-4 text-right">标号：</lable>
        <lable class="col-md-4">${entity.tendernum}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">出让状态：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.transferstatus==1 }"><span style="color: blue">部分出让</span></c:if>
            <c:if test="${entity.transferstatus==2 }"><span style="color: blue">全部出让</span></c:if>
        </lable>
    </div><br>
    <div class="form-group ">
    <lable class="col-sm-4 text-right">上架状态：</lable>
    <lable class="col-md-4">
        <c:if test="${entity.shelvesstatus==1 }"><span style="color: blue">上架中</span></c:if>
        <c:if test="${entity.shelvesstatus==2 }"><span style="color: blue">已下架</span></c:if>
    </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">交易状态：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.tradestatus==1 }"><span style="color: blue">可交易</span></c:if>
            <c:if test="${entity.tradestatus==2 }"><span style="color: blue">不可交易</span></c:if>
        </lable>
    </div><br>




</div>
</body>
</html>