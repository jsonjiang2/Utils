<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>列表页设置详情</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>

<style type="text/css">
	#img_box{
		width: 400px;
		padding-bottom: 100px;
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
				<!-- 类型  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">首页位置 ：</label>
 					<span class="col-md-4">
 						<c:choose>
							<c:when test="${settings.type == 1}">热门帖子</c:when>
							<c:when test="${settings.type == 2}">网贷资讯</c:when>
 	  					 	<c:otherwise>
						 		未知
					 		</c:otherwise>
 					</c:choose>
 					</span>
  				</div>
 				<!-- 类型  end-->
 				
 				<!-- 链接start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">链接：</label>
 					<span class="col-md-6">
  						<c:choose>
						<c:when test="${not empty settings.link }">
							 ${settings.link}
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
 						
 					</span>
  				</div>
 				<!-- 链接end-->
 				
 				<!-- 排序号start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">排序号：</label>
 					<span class="col-md-6">
 						${settings.sort}
 					</span>
  				</div>
 				<!-- 排序号end-->
 				
 				<!-- 标题start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">标题/平台名称：</label>
 					<span class="col-md-8">
  						<c:choose>
						<c:when test="${not empty settings.subject }">
							 ${settings.subject}
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
 					</span>
  				</div>
 				<!-- 标题end-->
 				
 				<!-- 概述start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">概述：</label>
 					<span class="col-md-8">
  						<c:choose>
						<c:when test="${not empty settings.message }">
							 ${settings.message}
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
 					</span>
  				</div>
 				<!-- 概述end-->
 				
 				<!-- 颜色start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">字体颜色：</label>
 					<span class="col-md-6">
 						<c:choose>
						<c:when test="${not empty settings.color }">
							<div style="color:${settings.color};">颜色</div>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
 					</span>
  				</div>
 				<!-- 颜色end-->
 				
 				<!-- 链接start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">链接：</label>
 					<span class="col-md-6">
  						<c:choose>
						<c:when test="${not empty settings.link }">
							 ${settings.link}
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
 					</span>
  				</div>
 				<!-- 链接end-->
 				 
 				<!-- 设置时间start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">设置时间：</label>
 					<span class="col-md-6">
 						<wdb:formatDate value="${settings.dateline}" var="datetime">
 							${datetime }
 						</wdb:formatDate>
 					</span>
  				</div>
 				<!-- 设置时间end-->
 				
 				<!-- 主题发布时间start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">主题发布时间：</label>
 					<span class="col-md-6">
 						<wdb:formatDate value="${settings.tdateline}" var="tdateline">
 							${tdateline }
 						</wdb:formatDate>
 					</span>
  				</div>
 				<!-- 主题发布时间end-->
 				
 				<!-- 设置人start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">设置人：</label>
 					<span class="col-md-6">
 						<wdb:getAdminUser uid="${ settings.baseid}" var="baseid">
 							${baseid.username }
 						</wdb:getAdminUser>
 					</span>
  				</div>
 				<!-- 设置人end-->
 				
 				 <!-- 备注信息start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">备注信息：</label>
 					<span class="col-md-6">
  							<c:choose>
						<c:when test="${not empty settings.remark }">
							 ${settings.remark}
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
 					</span>
  				</div>
 				<!-- 备注信息end-->
 
 				<!-- 图片start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">封面：</label>
 					<span class="col-md-6">
  					 <c:choose>
						<c:when test="${not empty settings.img }">
							<div id="img_box">
 								 <img src="${settings.img}" />
							</div>
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
 					</span>
  				</div>
 				<!-- 图片end-->
    		</div>
	</div>
</body>
</html>