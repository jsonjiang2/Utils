<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--
<%@include file="/WEB-INF/jsp/common/public.jsp"%>--%>
<script type="text/javascript" src="${basePath}/static/js/jscolor.js"></script>

<div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">广告位置&nbsp;:</span>
            <span >
				<c:if test="${empty data.adplacement}">
                    --
                </c:if>
				<c:if test="${!empty data.adplacement}">
                    ${data.adplacement}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">广告图主题&nbsp;:</span>
            <span >
				<c:if test="${empty data.adtheme}">
                    --
                </c:if>
				<c:if test="${!empty data.adtheme}">
                    ${data.adtheme}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">图片尺寸&nbsp;:</span>
            <span >
				<c:if test="${empty data.adsize}">
                    --
                </c:if>
				<c:if test="${!empty data.adsize}">
                    ${data.adsize}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">属性&nbsp;:</span>
            <span >
				<c:if test="${data.attributes==1}">
                    文字广告
                </c:if>
                <c:if test="${data.attributes==2}">
                    图片广告
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">字体&nbsp;:</span>
            <span >
				<%--<c:if test="${empty data.font_color}">
                    <input name="ss" readonly="readonly" value="#000000">
                </c:if>
				<c:if test="${!empty data.font_color}">
                    &lt;%&ndash;<input name="ss" readonly="readonly" style="background-color: ${data.font_color}">&ndash;%&gt;
                    <span style="color:${data.font_color}">颜色</span>
                </c:if>--%>
                 <span style="color:${data.font_color}">颜色</span>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">链接&nbsp;:</span>
            <span >
				<c:if test="${empty data.ad_link}">
                    --
                </c:if>
				<c:if test="${!empty data.ad_link}">
                    ${data.ad_link}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">到期时间&nbsp;:</span>
            <span id="expire_date">
				<c:if test="${empty data.expire_date}">
                    --
                </c:if>
				<c:if test="${!empty data.expire_date}">
                    ${dateUtils.formatDate(data.expire_date)}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">设置人&nbsp;:</span>
            <span >
                <wdb:getAdminUser uid="${data.set_people}" var="admin">
                    ${admin.username}
                </wdb:getAdminUser>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">设置时间&nbsp;:</span>
            <span >
				<c:if test="${empty data.set_time}">
                    --
                </c:if>
				<c:if test="${!empty data.set_time}">
                    ${dateUtils.formatDate(data.set_time)}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">备注&nbsp;:</span>
            <span class="col-sm-6 text-left"  id="remarkPosition">
                <textarea rows="2" id="_remark" class="form-control" name="remark">${data.remark}</textarea>
			 </span>
        </div>
        <hr/>
    </div>

    <style>
        #remarkPosition{
            position: relative;
            left: -12px;
        }
    </style>

</div>