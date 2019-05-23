<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.ganjiangps.wangdaibus.common.util.DateUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<div class="form-group"> 
		<div class="row">
			<label class="col-md-4 control-label">黑羊头标题 ：</label>
			<div class="col-md-5"> 
				<span>${sheepHeadExposure.title}</span> 
			</div>
		</div> 

		<div class="row">
			<label class="col-md-4 control-label">曝光人调解qq号 ：</label>
			<div class="col-md-5"> 
				<span>${sheepHeadExposure.exposurePeopleQQ}</span> 
			</div>
		</div> 

		<div class="row">
			<label class="col-md-4 control-label">曝光人被骗平台 ：</label>
			<div class="col-md-5"> 
				<c:forEach items="${sheepHeadInvolPlatformList}" var="sheepHeadInvolPlatform">
					<span>${sheepHeadInvolPlatform.involPlatform}</span> 
				</c:forEach> 
			</div>
		</div>
 
		<div class="row">
			<label class="col-md-4 control-label">黑羊头名称 ：</label>
			<div class="col-md-5"> 
				<span>${sheepHeadExposure.sheepheadname}</span> 
			</div>
		</div>
 
		<div class="row">
			<label class="col-md-4 control-label">黑羊头微信号 ：</label>
			<div class="col-md-5"> 
				<c:if test="${not empty sheepHeadContact.wxNo}">
					<span>${sheepHeadContact.wxNo}</span> 
				</c:if>
				
				<c:if test="${empty sheepHeadContact.wxNo}">
					<span>无</span> 
				</c:if> 
			</div>
		</div>

		<div class="row">
			<label class="col-md-4 control-label">黑羊头qq号 ：</label>
			<div class="col-md-5">
				<c:forEach items="${sheepHeadQQList}" var="sheepHeadQQ"> 
					<c:if test="${not empty sheepHeadQQ.qq}"> 
						<span>${sheepHeadQQ.qq}</span>
					</c:if>
					
					<c:if test="${empty sheepHeadQQ.qq}"> 
						<span>无</span>
					</c:if> 
				</c:forEach>

			</div>
		</div>

		<div class="row">
			<label class="col-md-4 control-label">黑羊头所在qq群 ：</label>
			<div class="col-md-5"> 
				<span>${sheepHeadQQgroup.qqGroupNo}</span> 
			</div>
		</div>

		<div class="row">
			<label class="col-md-4 control-label">黑羊头手机号 ：</label>
			<div class="col-md-5">
				<c:if test="${not empty sheepHeadContact.mobile}">
					<span>${sheepHeadContact.mobile}</span> 
				</c:if>
				
				<c:if test="${empty sheepHeadContact.mobile}">
					<span>无</span> 
				</c:if>
				
			</div>
		</div>
		
		<div class="row">
			<label class="col-md-4 control-label">发布时间 ：</label>
			<div class="col-md-5"> 
				<span>${empty sheepHeadExposure.exposureTime? '':dateUtils.formatDate(sheepHeadExposure.exposureTime)}</span> 
			</div>
		</div>

		<div class="row">
			<label class="col-md-4 control-label">发布状态 ：</label>
			<div class="col-md-5"> 
				<c:choose>
					<c:when test="${sheepHeadExposure.statu == -1}">审核中</c:when>
					<c:when test="${sheepHeadExposure.statu == -2}">不合格</c:when>
					<c:when test="${sheepHeadExposure.statu == -3}">已删除</c:when>
					<c:when test="${sheepHeadExposure.statu == 0}">合格</c:when>
					<c:otherwise>未知</c:otherwise>
				</c:choose> 
			</div>
		</div>
		
		<div class="row">
			<label class="col-md-4 control-label">浏览次数 ：</label>
			<div class="col-md-5"> 
				<c:if test="${not empty sheepHeadExposure.views}">
					<span>${sheepHeadExposure.views}</span>
				</c:if>
				
				<c:if test="${empty sheepHeadExposure.views}">
					<span>0</span>
				</c:if> 
			</div>
		</div>
		
		<div class="row">
			<label class="col-md-4 control-label">回复次数 ：</label>
			<div class="col-md-5">
				<c:if test="${not empty sheepHeadExposure.replies}"> 
					<span>${sheepHeadExposure.replies}</span>
				</c:if>
				
				<c:if test="${empty sheepHeadExposure.replies}"> 
					<span>0</span>
				</c:if> 
			</div>
		</div>
		
		<div class="row">
			<label class="col-md-4 control-label">管理员公告 ：</label>
			<div class="col-md-5">
				<c:if test="${not empty sheepHeadExposure.affiche}"> 
					<span>${sheepHeadExposure.affiche}</span>
				</c:if>
				
				<c:if test="${empty sheepHeadExposure.affiche}"> 
					<span>无</span>
				</c:if> 
			</div>
		</div>
	</div>
</body>
</html>