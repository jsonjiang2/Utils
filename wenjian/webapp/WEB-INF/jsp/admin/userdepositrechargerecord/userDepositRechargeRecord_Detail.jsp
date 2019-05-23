<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>押金充值记录详情</title>

    <style type="text/css">
        #rechargei label{
            font-weight:normal;
        }
    </style>
</head>

<body style="font-family:'微软雅黑'; ">
<div class="col-md-12" id="rechargei">
    <div class="row text-center" style="line-height: 0px;">
        <font size="5" style="font-weight:500;">押金充值记录详情</font>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">商户号：</lable>
        <lable class="col-md-4">${entity.merno}</lable>
    </div><br>
    <div class="form-group ">
        <c:choose>
            <c:when test="${entity.derechargetype == 1}">
                <font class="col-sm-4 text-right">用户名-姓名：</font>
                <font class="col-md-4">
                    <wdb:getUser uid="${entity.baseid}" var="user">
                        ${user.username}-${user.realname}
                    </wdb:getUser>
                </font>
            </c:when>
            <c:otherwise>
                <font class="col-sm-4 text-right">平台编号-平台名称：</font>
                <font class="col-md-4">${entity.pno}-${entity.pname}</font>
            </c:otherwise>
        </c:choose>
    </div><br>

    <div class="form-group ">
        <lable class="col-sm-4 text-right">押充流水号：</lable>
        <lable class="col-md-6">${entity.derechargeno}</lable>
    </div><br>

    <div class="form-group ">
        <lable class="col-sm-4 text-right">支付流水号：</lable>
        <lable class="col-md-6">
            ${entity.qmmorderno}
        </lable>
    </div><br>

    <div class="form-group ">
        <lable class="col-sm-4 text-right">押充类型：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.derechargetype==1}">骗返押金</c:if>
            <c:if test="${entity.derechargetype==2}">平台押金</c:if>
        </lable>
    </div><br>

    <div class="form-group ">
        <lable class="col-sm-4 text-right">付款方式：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.paymenttype==1}">支付宝</c:if>
            <c:if test="${entity.paymenttype==2}">微信</c:if>
        </lable>
    </div><br>

    <div class="form-group ">
        <lable class="col-sm-4 text-right">押充金额：</lable>
        <lable class="col-md-4">
            <fmt:formatNumber value="${entity.derechargeamount}" pattern="0.00" maxFractionDigits="2" />元
        </lable>
    </div><br>

    <div class="form-group ">
        <lable class="col-sm-4 text-right">押充时间：</lable>
        <lable class="col-md-4">
            <c:if test="${not empty entity.derechargetime}">
                ${sf.format(entity.derechargetime)}
            </c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">押充状态：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.status==1 }">取消</c:if>
            <c:if test="${entity.status==2 }"><span style="color: red;">押充失败</span></c:if>
            <c:if test="${entity.status==3 }"><span style="color: blue;">押充成功</span></c:if>
        </lable>
    </div><br>

    <div class="form-group ">
        <lable class="col-sm-4 text-right">响应码：</lable>
        <lable class="col-md-4">${entity.respcode}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">响应信息：</lable>
        <lable class="col-md-4">${entity.respmess}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">提交数据签名：</lable>
        <lable class="col-md-8">${entity.requestsignature}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">返回数据签名：</lable>
        <lable class="col-md-8">${entity.responsesignature}</lable>
    </div><br><br><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">异步返回数据：</lable>
        <lable class="col-md-8">${entity.responsedata}</lable>
    </div><br><br><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">应答时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.responsetime}" var="responsetime">
                ${empty responsetime ? '无' : responsetime}
            </wdb:formatDate>
        </lable>
    </div><br><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">勾兑查询返回数据：</lable>
        <lable class="col-md-8">
            <c:out value="${entity.gouduirespdata}" escapeXml="true"/>
        </lable>
    </div><br><br><br><br><br><br><br><br><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">是否人工勾兑：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.isgoudui==0 }">否</c:if>
            <c:if test="${entity.isgoudui==1 }">是</c:if>
        </lable>
    </div><br><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">勾兑人：</lable>
        <lable class="col-md-4">
            <wdb:getAdminUser uid="${entity.gouduimanid}" var="auid">
                ${auid.username}-${auid.fullname ? '无' : auid.fullname}
            </wdb:getAdminUser>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">勾兑时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.gouduitime}" var="gouduitime">
                ${empty gouduitime ? '无' : gouduitime}
            </wdb:formatDate>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">是否系统勾兑：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.issystemgoudui==0 }">否</c:if>
            <c:if test="${entity.issystemgoudui==1 }">是</c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">系统勾兑时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.gouduisyetemtime}" var="gouduisyetemtime">
                ${empty gouduisyetemtime ? '无' : gouduisyetemtime}
            </wdb:formatDate>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">勾兑状态：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.gouduistatus==0 }"><span style="color: red;">未勾兑</span></c:if>
            <c:if test="${entity.gouduistatus==1 }"><span style="color: blue;">勾兑成功</span></c:if>
            <c:if test="${entity.gouduistatus==2 }"><span style="color: red;">勾兑异常</span></c:if>
            <c:if test="${entity.gouduistatus==3 }"><span style="color: red;">勾兑未返回</span></c:if>
            <c:if test="${entity.gouduistatus==4 }"><span style="color: red;">勾兑中</span></c:if>
        </lable>
    </div><br>

    <div class="form-group ">
        <label class="col-sm-4 text-right">备注：</label>
        <label class="col-md-4">${entity.remark}</label>
    </div>

</div>
</body>
</html>