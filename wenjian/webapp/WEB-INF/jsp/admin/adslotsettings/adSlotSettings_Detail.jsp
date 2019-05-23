<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				<c:if test="${empty data[0].moduleName}">
                    --
                </c:if>
				<c:if test="${!empty data[0].moduleName}">
                    ${data[0].moduleName}
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
				<c:if test="${empty data[0].adOwnUserName}">
                    --
                </c:if>
				<c:if test="${!empty data[0].adOwnUserName}">
                    ${data[0].adOwnUserName}
                </c:if>
			 </span>
        </div>
        <hr/>
    </div>

    <div class="row" style="margin-top: 10px;">
        <div class="col-md-10 col-md-offset-1">
            <span class="col-sm-4 text-right">广告主&nbsp;:</span>
            <span id="tenderidlb">
				<c:if test="${empty data[0].adBuyUserName}">
                    --
                </c:if>
				<c:if test="${!empty data[0].adBuyUserName}">
                    ${data[0].adBuyUserName}
                </c:if>
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
				<c:if test="${empty data[0].appImageNumber or data[0].appImageNumber==0}">
                    --
                </c:if>
				<c:if test="${!empty data[0].appImageNumber and data[0].appImageNumber!=0}">
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
				<c:if test="${empty data[0].pcImageNumber or data[0].pcImageNumber==0}">
                    --
                </c:if>
				<c:if test="${!empty data[0].pcImageNumber and data[0].pcImageNumber !=0}} ">
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