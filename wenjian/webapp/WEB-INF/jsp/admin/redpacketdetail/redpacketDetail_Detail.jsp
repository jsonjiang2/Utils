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
    <font size="4">红包明细详情</font>
    <hr/>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ID：</font>
    <font class="col-md-4">${entity.id}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">用户名-姓名：</font>
    <font class="col-md-4">
        <wdb:getUser uid="${entity.baseid}" var="user">
            ${user.username}-${user.realname}
        </wdb:getUser>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">帖子ID：</font>
    <font class="col-md-4">
        ${entity.pfttid}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">红包编号：</font>
    <font class="col-md-4">
        ${entity.redpacketno}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">冻结编号：</font>
    <font class="col-md-4">
        ${entity.freezeno}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">红充流水号：</font>
    <font class="col-md-6">
        <c:choose>
            <c:when test="${not empty entity.redpacketrno}">${entity.redpacketrno}</c:when>
            <c:otherwise>无</c:otherwise>
        </c:choose>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">红包类型：</font>
    <font class="col-md-4">
        <c:if test="${entity.redpackettype==1 }">发帖红包</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">付款方式：</font>
    <font class="col-md-4">
        <c:if test="${entity.paymenttype==1}">支付宝</c:if>
        <c:if test="${entity.paymenttype==2}">微信</c:if>
        <c:if test="${entity.paymenttype==3}">巴士余额</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">红包口令：</font>
    <font class="col-md-8 remark-kl" title="${entity.rpacketcommand }">
        ${entity.rpacketcommand}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">红包单个金额：</font>
    <font class="col-md-4">
        <fmt:formatNumber value="${entity.rpacketamount}" pattern="0.00" maxFractionDigits="2" />
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">剩余份数：</font>
    <font class="col-md-4">
        ${entity.remaindernumber}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">红包剩余金额：</font>
    <font class="col-md-4">
        <fmt:formatNumber value="${entity.rpackebalance}" pattern="0.00" maxFractionDigits="2" />
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">红包总金额：</font>
    <font class="col-md-4">
        <fmt:formatNumber value="${entity.rpackettotalamount}" pattern="0.00" maxFractionDigits="2" />
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">总份数：</font>
    <font class="col-md-4">
        ${entity.totalnumber}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">单人领取次数：</font>
    <font class="col-md-4">
        ${entity.singlegetnumber}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">发起时间：</font>
    <font class="col-md-4">
        <wdb:formatDate value="${entity.sendtime}" var="sendtime">
            ${empty sendtime ? "无" : sendtime}
        </wdb:formatDate>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">领取状态：</font>
    <font class="col-md-4">
        <c:if test="${entity.status==1}"><span style="color: blue;">待领取</span></c:if>
        <c:if test="${entity.status==2}"><span style="color: #6A6AFF">已领完</span></c:if>
        <c:if test="${entity.status==3}"><span style="color: #7C7C7C;">已过期</span></c:if>
        <c:if test="${entity.status==-1}">审核中</c:if>
        <c:if test="${entity.status==-2}"><span style="color: red;">审核失败</span></c:if>
        <c:if test="${entity.status==-3}">取消</c:if>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">过期日期：</font>
    <font class="col-md-4">
        <wdb:formatDate value="${entity.expirationdate}" var="expirationdate">
            ${empty expirationdate ? "无" : expirationdate}
        </wdb:formatDate>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">领完日期：</font>
    <font class="col-md-4">
        <wdb:formatDate value="${entity.finishdate}" var="finishdate">
            ${empty finishdate ? "无" : finishdate}
        </wdb:formatDate>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">添加人：</font>
    <font class="col-md-4">
        <wdb:getUser uid="${entity.addid}" var="user">
            ${user.username}-${empty user.realname? "无":user.realname}
        </wdb:getUser>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">添加时间：</font>
    <font class="col-md-4">
        <wdb:formatDate value="${entity.addtime}" var="addtime">
            ${empty addtime ? '无' : addtime}
        </wdb:formatDate>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核人：</font>
    <font class="col-md-4">
        <wdb:getAdminUser uid="${entity.updateid}" var="auid">
            ${auid.username}-${auid.fullname ? '无' : auid.fullname}
        </wdb:getAdminUser>
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">审核时间：</font>
    <font class="col-md-4">
        <wdb:formatDate value="${entity.updatetime}" var="updatetime">
            ${empty updatetime ? '无' : updatetime}
        </wdb:formatDate>
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${entity.remark}</font>
    <hr>
</div>

</body>

<script>
    $(function () {
        $(".remark-kl").each(function (i) {
            var num = $(this).text().trim();
            if (num.length > 20) {
                $(this).text(num.substr(0, 20) + "...");
            }
        });
    });
</script>
</html>
