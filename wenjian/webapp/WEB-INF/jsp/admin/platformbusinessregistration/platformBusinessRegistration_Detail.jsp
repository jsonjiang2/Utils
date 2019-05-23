<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台工商详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${registration.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${registration.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">法人代表：</font>
    <font class="col-md-4">${registration.legalperson}</font>
    <hr>
</div>

<%--<div class="row" style="line-height: 0px;">--%>
    <%--<font class="col-sm-4 text-right">公司类型：</font>--%>
    <%--<font class="col-md-4">--%>
        <%--${registration.companytype}--%>
    <%--</font>--%>
    <%--<hr>--%>
<%--</div>--%>

<div class="row" style="line-height: 10px;">
    <font class="col-sm-4 text-right">注册地址：</font>
    <font class="col-md-8">${registration.regaddress}</font>
    <hr>
</div>
<%--<div class="row" style="line-height: 0px;">--%>
    <%--<font class="col-sm-4 text-right">登记状态：</font>--%>
    <%--<font class="col-md-4">${registration.regstatus}</font>--%>
    <%--<hr>--%>
<%--</div>--%>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">登记机关：</font>
    <font class="col-md-4">${registration.regauthority}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备案域名：</font>
    <font class="col-md-4">${registration.recorddomain}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备案单位名称：</font>
    <font class="col-md-8">${registration.recordname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">开业时间：</font>
    <font class="col-md-4">
        ${registration.opentime}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">营业期限(开始)：</font>
    <font class="col-md-4">
        ${registration.businesstimelimit}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">营业期限(结束)：</font>
    <font class="col-md-4">
        ${registration.businesstimelimitend}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">核准日期：</font>
    <font class="col-md-4">
        ${registration.approvaldate}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备案日期：</font>
    <font class="col-md-4">
        ${registration.recordtime}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备案单位性质：</font>
    <font class="col-md-4">
        ${registration.companyattribute}
    </font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">ICP经营许可证：</font>
    <font class="col-md-4">${registration.icpauth}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">icp备案号：</font>
    <font class="col-md-4">${registration.icp}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">统一社会信用码：</font>
    <font class="col-md-4">${registration.socialcreditcode}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">营业执照号：</font>
    <font class="col-md-4">${registration.licensenumber}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">注册资本：</font>
    <font class="col-md-4">${registration.capital}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">实缴资本：</font>
    <font class="col-md-4">${registration.paidcapital}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台曾用名：</font>
    <font class="col-md-4">${registration.oldname}</font>
    <hr>
</div>
<div class="row" style="line-height: 20px;">
    <font class="col-sm-4 text-right">经营范围：</font>
    <font class="col-md-8">${registration.operationscope}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">法院官司：</font>
    <font class="col-md-4">${registration.courtcase}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">设置人：</font>
    <font class="col-md-4">${registration.addman}</font>
    <hr>
</div>
<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">设置时间：</font>
    <font class="col-md-4">
        ${empty registration.addtime ? '---':dateUtils.formatDate(registration.addtime)}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${registration.remark}</font>
    <hr>
</div>


</body>
</html>
