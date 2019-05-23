<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>小蜜蜂渠道申请详情</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>

    <style type="text/css">
        #img_box{
            width: 300px;
            padding-bottom: 23px;
        }
        #img_box img{
            max-height:100%;
            width:100%;
        }
    </style>
</head>
<body>
<div class="container" style="width: 100%;">
    <div class="row clearfix">
        <!-- ID start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">ID:</label>
            <span class="col-md-6">
                ${ entity.id}
            </span>
        </div>
        <!-- ID   end-->

        <!-- 发布人姓名 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">发布人姓名:</label>
            <span class="col-md-6">
                ${ entity.username}
            </span>
        </div>
        <!-- 发布人姓名   end-->

        <!-- 手机号 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">手机号:</label>
            <span class="col-md-6">
                ${ entity.mobile}
            </span>
        </div>
        <!-- 手机号   end-->

        <!-- 需求标题 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">需求标题:</label>
            <span class="col-md-6">
                ${ entity.title}
            </span>
        </div>
        <!-- 需求标题   end-->

        <!-- 公司名称 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">公司名称:</label>
            <span class="col-md-6">
                ${ entity.companyname}
            </span>
        </div>
        <!-- 公司名称   end-->

        <!-- 公司网址 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">公司网址:</label>
            <span class="col-md-6">
                ${ entity.website}
            </span>
        </div>
        <!-- 公司网址   end-->

        <!-- 微信二维码 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">微信二维码:</label>
            <span class="col-md-6">
                <div id="img_box">
                     <img src="${entity.wqrcode}" />
                </div>
            </span>
        </div>
        <!-- 微信二维码   end-->

        <!-- 公司上线日期 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">公司上线日期:</label>
            <span class="col-md-6">
                <wdb:formatDate value="${entity.clinedate}" var="clinedate">
                    ${empty clinedate ? '无' : clinedate}
                </wdb:formatDate>
            </span>
        </div>
        <!-- 公司上线日期   end-->

        <!-- 公司职务 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">公司职务:</label>
            <span class="col-md-6">
                ${ entity.cduty}
            </span>
        </div>
        <!-- 公司职务   end-->

        <!-- 合作方式 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">合作方式:</label>
            <span class="col-md-6">
                <c:choose>
                    <c:when test="${entity.cmethod == 1 }">注册收费 </c:when>
                    <c:when test="${entity.cmethod == 2 }">下款收费 </c:when>
                    <c:when test="${entity.cmethod == 3 }">其他 </c:when>
                </c:choose>
            </span>
        </div>
        <!-- 合作方式   end-->

        <!-- 审核状态 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">审核状态:</label>
            <span class="col-md-6">
                <c:if test="${entity.status == -1 }">审核中</c:if>
                <c:if test="${entity.status == 1 }"><span style="color:blue;">审核通过</span></c:if>
                <c:if test="${entity.status == -2 }"><span style="color:red;">审核失败</span></c:if>
            </span>
        </div>
        <!-- 审核状态   end-->

        <!-- 制表时间 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">制表时间:</label>
            <span class="col-md-6">
                <wdb:formatDate value="${entity.dateline}" var="dateline">
                    ${empty dateline ? '无' : dateline}
                </wdb:formatDate>
            </span>
        </div>
        <!-- 制表时间   end-->

        <!-- 我们提供 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">我们提供:</label>
            <span class="col-md-6">
                ${ entity.weprovide}
            </span>
        </div>
        <!-- 我们提供   end-->

        <!-- 我们需求 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">我们需求:</label>
            <span class="col-md-6">
                ${ entity.wedemand}
            </span>
        </div>
        <!-- 我们需求   end-->

        <!-- 审核人 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">审核人:</label>
            <span class="col-md-6">
                <wdb:getAdminUser uid="${entity.audituid}" var="auid">
                    ${auid.username}-${auid.fullname ? '无' : auid.fullname}
                </wdb:getAdminUser>
            </span>
        </div>
        <!-- 审核人   end-->

        <!-- 审核时间 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">审核时间:</label>
            <span class="col-md-6">
                <wdb:formatDate value="${entity.auditdline}" var="auditdline">
                    ${empty auditdline ? '无' : auditdline}
                </wdb:formatDate>
            </span>
        </div>
        <!-- 审核时间   end-->

        <!-- 备注 start-->
        <div class="col-md-12" style="margin-top:10px;">
            <label class="col-md-3 text-right">备注:</label>
            <span class="col-md-6">
                ${ entity.remark}
            </span>
        </div>
        <!-- 备注   end-->
    </div>
</div>
</body>
</html>