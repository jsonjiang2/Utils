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
            <span id="tenderidlb">
				<c:if test="${empty data[0].adNumber}">
                    --
                </c:if>
				<c:if test="${!empty data[0].adNumber}">
                    ${data[0].adNumber}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">板块&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${data[0].moduleName==1}">
                    首页
                </c:if>
				<c:if test="${data[0].moduleName==2}">
                    资源主列表
                </c:if>
                <c:if test="${data[0].moduleName==3}">
                    平台数据列表
                </c:if>
                <c:if test="${data[0].moduleName==4}">
                    巴士茶馆
                </c:if>
                <c:if test="${data[0].moduleName==5}">
                    网贷资讯
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">标题&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].title}">
                    --
                </c:if>
				<c:if test="${!empty data[0].title}">
                    ${data[0].title}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">广告位&nbsp;:</span>
            <span id="tenderidlb">
                <wdb:getUser uid="${data[0].uid}" var="user">
                     ${user.username}
                </wdb:getUser>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">广告主&nbsp;:</span>
            <span id="tenderidlb">
                <wdb:getUser uid="${data[0].adHostUid}" var="user">
                    ${user.username}
                </wdb:getUser>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">广告费&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].adTotalAllPrice}">
                    --
                </c:if>
				<c:if test="${!empty data[0].adTotalAllPrice}">
                    ${data[0].adTotalAllPrice}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">状态&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].isValid}">
                    --
                </c:if>
				<c:if test="${!empty data[0].isValid}">
                    <c:if test="${data[0].isValid==1}">
                        展示中
                    </c:if>
                    <c:if test="${data[0].isValid==2}">
                        已完成
                    </c:if>
                    <c:if test="${data[0].isValid==3}">
                        已暂停
                    </c:if>
                    <c:if test="${data[0].isValid==4}">
                        已下架
                    </c:if>
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">购买时间&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].adPurchaseDate}">
                    --
                </c:if>
				<c:if test="${!empty data[0].adPurchaseDate}">
                    ${dateUtils.formatDate(data[0].adPurchaseDate)}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">到期时间&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].adExpiredDate}">
                    --
                </c:if>
				<c:if test="${!empty data[0].adExpiredDate}">
                    ${dateUtils.formatDate(data[0].adExpiredDate)}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">手机广告编号&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].appImageNumber or data[0].appImageNumber==null}">
                    --
                </c:if>
				<c:if test="${!empty data[0].appImageNumber and data[0].appImageNumber!=null}">
                    ${data[0].pcImageNumber}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">PC广告编号&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].pcImageNumber or data[0].pcImageNumber==null}">
                    --
                </c:if>
				<c:if test="${!empty data[0].pcImageNumber and data[0].pcImageNumber !=null}} ">
                    ${data[0].pcImageNumber}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">支付流水号&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].payNumber}">
                    --
                </c:if>
				<c:if test="${!empty data[0].payNumber}">
                    ${data[0].payNumber}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">支付方式&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].payWay}">
                    --
                </c:if>
				<c:if test="${!empty data[0].payWay}">
                    <c:if test="${data[0].payWay==1}">
                        巴士余额
                    </c:if>
                    <c:if test="${data[0].payWay==2}">
                        支付宝
                    </c:if>
                    <c:if test="${data[0].payWay==3}">
                        微信
                    </c:if>
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">操作人&nbsp;:</span>
            <span id="tenderidlb">
                <wdb:getAdminUser uid="${data[0].operatorId}" var="admin">
                    ${admin.username}
                </wdb:getAdminUser>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">操作时间&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].operatorDate}">
                    --
                </c:if>
				<c:if test="${!empty data[0].operatorDate}">
                    ${dateUtils.formatDate(data[0].operatorDate)}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">操作备注&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].operatorRemark}">
                    --
                </c:if>
				<c:if test="${!empty data[0].operatorRemark}">
                    ${data[0].operatorRemark}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

</div>