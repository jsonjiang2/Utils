<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.ganjiangps.wangdaibus.common.util.TimeDifferUtil,com.ganjiangps.wangdaibus.common.util.DateUtils,java.lang.Math"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>平台爆雷详情</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
 </head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
	
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">平台名称:</label>
 					<span class="col-md-8">
 						${platformSafeguardingRights.pname}
   					</span>
  				</div>
  				
  				
  				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">平台所在城市:</label>
 					<span class="col-md-8">
 						${platformInfo.province}-${platformInfo.city}
   					</span>
  				</div>
  				
  				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">维权时间:</label>
 					<span class="col-md-8">
 						${Math.round(platformSafeguardingRights.days/30)}个月
   					</span>
  				</div>
  				
  				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">维权qq群:</label>
 					<span class="col-md-8">
 						${explodeRay.qqgroup}
   					</span>
  				</div>
  				
  				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">维权进展:</label>
 					<span class="col-md-8">
 					
 						<c:choose>
 							<c:when test="${platformSafeguardingRights.progress eq 1}">
 								<span>未立案</span>
 							</c:when>
 							
 							<c:when test="${platformSafeguardingRights.progress eq 2}">
 								<span>已立案</span>
 							</c:when>
 							
 							<c:when test="${platformSafeguardingRights.progress eq 3}">
 								<span>已结案</span>
 							</c:when>
 							
 							<c:when test="${platformSafeguardingRights.progress eq 4}">
 								<span>已清退</span>
 							</c:when>
 						</c:choose>
   					</span>
  				</div>
  				
  				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">是否热门:</label> 
					<c:choose>
						<c:when test="${explodeRay.ishot eq 1}">
							<span class="col-md-8"> 是</span>
						</c:when>
						
						<c:otherwise>
							<span class="col-md-8"> 否 </span>
						</c:otherwise>
					</c:choose> 
  				</div>
  				 
  				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">设置时间:</label>
 					<span class="col-md-8">
 						${empty explodeRay.hotsetTime ? '-':DateUtils.formatDate(explodeRay.hotsetTime)}
   					</span>
  				</div>
  				
  				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">最新公告:</label>
 					<span class="col-md-8">
 						${platformSafeguardingRights.notice}
   					</span>
  				</div>
  				
  				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">运营时间:</label>
 					<span class="col-md-8"> 						
 						${empty platformInfo.online ? '':TimeDifferUtil.getTime(DateUtils.formatYY_MM_DD(platformInfo.online),DateUtils.formatYY_MM_DD(System.currentTimeMillis()))}
   					</span>
  				</div>
  				
  				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">银行存管:</label>
 					<span class="col-md-8">
 						${platformInfo.depositoryagency}
   					</span>
  				</div>
  				
  			
		
		</div>
 </div>
</body>
</html>