<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<div>
    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">广告编号&nbsp;:</span>
            <span >
				<c:if test="${empty idImage.imageNumber}">
                    --
                </c:if>
				<c:if test="${!empty idImage.imageNumber}">
                    ${idImage.imageNumber}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>
    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">展示端&nbsp;:</span>
            <c:choose>
                <c:when test="${idImage.imageType == 1}"><span >PC端</span></c:when>
                <c:when test="${idImage.imageType == 2}"><span >手机端</span></c:when>
            </c:choose>
        </div>
        <hr/>
    </div>
    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">申请时间&nbsp;:</span>
            <span >
				<c:if test="${empty idImage.dateline}">
                    --
                </c:if>
				<c:if test="${!empty idImage.dateline}">
                    ${dateUtils.formatDate(idImage.dateline)}
                </c:if>
			</span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">广告主&nbsp;:</span>
            <span >
                <c:if test="${idImage.uid!=null or idImage.uid!=''}">
                    <c:if test="${idImage.usermark==1}">
                        <wdb:getAdminUser uid="${idImage.uid}" var="imageDetailAdminUser">
                                ${imageDetailAdminUser.username}
                        </wdb:getAdminUser>
                    </c:if>
                    <c:if test="${idImage.usermark==2}">
                        <wdb:getUser uid="${idImage.uid}" var="imageDetailUser">
                                ${imageDetailUser.username}
                        </wdb:getUser>
                    </c:if>
                </c:if>
			</span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">广告链接&nbsp;:</span>
            <span >
				<c:if test="${empty idImage.imageHyperlink}">
                    --
                </c:if>
				<c:if test="${!empty idImage.imageHyperlink}">
                    ${idImage.imageHyperlink}
                </c:if>
			</span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">尺寸&nbsp;:</span>
            <span >
				<c:if test="${empty idImage.imageSize}">
                    --
                </c:if>
				<c:if test="${!empty idImage.imageSize}">
                    ${idImage.imageSize}
                </c:if>
			</span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">状态&nbsp;:</span>
            <span >
				<c:if test="${empty  idImage.reviewStatus}">
                    --
                </c:if>
				<c:if test="${!empty  idImage.reviewStatus}">
                    <c:choose>
                        <c:when test="${idImage.reviewStatus == 1}">待审核</c:when>
                        <c:when test="${idImage.reviewStatus == 2}">已合格</c:when>
                        <c:when test="${idImage.reviewStatus == 3}">不合格</c:when>
                        <c:when test="${idImage.reviewStatus == 4}">已下架</c:when>
                    </c:choose>
                </c:if>
			</span>
        </div>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">引用次数&nbsp;:</span>
            <span >
				<c:if test="${empty idImage.reference}">
                    --
                </c:if>
				<c:if test="${!empty idImage.reference}">
                    ${idImage.reference}
                </c:if>
			</span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">操作人&nbsp;:</span>
            <span >
                <wdb:getAdminUser uid="${idImage.operatorId}" var="admin">
                    ${admin.username}
                </wdb:getAdminUser>
			</span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">操作时间&nbsp;:</span>
            <span >
				<c:if test="${empty idImage.operatorDate}">
                    --
                </c:if>
				<c:if test="${!empty idImage.operatorDate}">
                    ${dateUtils.formatDate(idImage.operatorDate)}
                </c:if>
			</span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">上传备注&nbsp;:</span>
            <span >
				<c:if test="${empty idImage.remark}">
                    --
                </c:if>
				<c:if test="${!empty idImage.remark}">
                    ${idImage.remark}
                </c:if>
			</span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">操作备注&nbsp;:</span>
            <span >
				<c:if test="${empty idImage.operatorremark}">
                    --
                </c:if>
				<c:if test="${!empty idImage.operatorremark}">
                    ${idImage.operatorremark}
                </c:if>
			</span>
        </div>
        <hr/>
    </div>
