<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>收支记录详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">
<div class="row text-center" style="line-height: 0px;">
    <font size="4">详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${userInExRecord.id}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名-姓名：</font>
    <font class="col-md-4">
        <wdb:getUser uid="${userInExRecord.baseid}" var="user">
            ${user.username}--${user.realname}
        </wdb:getUser>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">收支记录流水号：</font>
    <font class="col-md-8">${userInExRecord.orderno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">业务流水号：</font>
    <font class="col-md-8">${userInExRecord.borderno}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">收入：</font>
    <font class="col-md-4">
        <c:choose>
            <c:when test="${userInExRecord.inamount > 0}">
                ${userInExRecord.inamount}
            </c:when>
            <c:otherwise>
                --
            </c:otherwise>
        </c:choose>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">支出：</font>
    <font class="col-md-4">

        <c:choose>
            <c:when test="${userInExRecord.outamount > 0}">
                ${ userInExRecord.outamount}
            </c:when>
            <c:otherwise>
                --
            </c:otherwise>
        </c:choose>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">业务类型：</font>
    <font class="col-md-4">
        <c:forEach items="${typeMap}" var="type">
            <c:if test="${userInExRecord.type==type.key }">${type.value}</c:if>
        </c:forEach>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资金来源：</font>
    <font class="col-md-8">${userInExRecord.description}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户可用余额：</font>
    <font class="col-md-4">${userInExRecord.balance}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户冻结余额：</font>
    <font class="col-md-4">${userInExRecord.freebalance}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户总金额：</font>
    <font class="col-md-4">${userInExRecord.totalbalance}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">发生时间：</font>
    <font class="col-md-4">
   		<c:if test="${!empty userInExRecord.recordtime}">
            ${sf.format(userInExRecord.recordtime)}
        </c:if> 
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">判断1：</font>
    <font class="col-md-4"><c:choose>
        <c:when test="${userInExRecord.judge1 eq 1}">
            <font color="blue">正常</font>
        </c:when>
        <c:when test="${userInExRecord.judge1 eq 0}">
            <font color="red">异常</font>
        </c:when>
        <c:otherwise>
            <font color="gray">未验证</font>
        </c:otherwise>
    </c:choose> </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">判断2：</font>
    <font class="col-md-4"><c:choose>
        <c:when test="${userInExRecord.judge2 eq 1}">
            <font color="blue">正常</font>
        </c:when>
        <c:when test="${userInExRecord.judge2 eq 0}">
            <font color="red">异常</font>
        </c:when>
        <c:otherwise>
            <font color="gray">未验证</font>
        </c:otherwise>
    </c:choose> </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">判断3：</font>
    <font class="col-md-4"><c:choose>
        <c:when test="${userInExRecord.judge3 eq 1}">
            <font color="blue">正常</font>
        </c:when>
        <c:when test="${userInExRecord.judge3 eq 0}">
            <font color="red">异常</font>
        </c:when>
        <c:otherwise>
            <font color="gray">未验证</font>
        </c:otherwise>
    </c:choose> </font>
    <hr>
</div>


<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">判断4：</font>
    <font class="col-md-4"><c:choose>
        <c:when test="${userInExRecord.judge4 eq 1}">
            <font color="blue">正常</font>
        </c:when>
        <c:when test="${userInExRecord.judge4 eq 0}">
            <font color="red">异常</font>
        </c:when>
        <c:otherwise>
            <font color="gray">未验证</font>
        </c:otherwise>
    </c:choose> </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">全部验证通过：</font>
    <font class="col-md-8"><c:choose>
        <c:when test="${userInExRecord.ischeck eq 1}">
            <font color="green">已验证</font>
        </c:when>
        <c:when test="${userInExRecord.ischeck eq 2}">
            <font color="green">已复位</font>
        </c:when>
        <c:otherwise>
            <font color="gray">未验证通过</font>
        </c:otherwise>
    </c:choose></font>
    <hr>
</div>


<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-8">${userInExRecord.remark}</font>
    <hr>
</div>
</body>
</html>
