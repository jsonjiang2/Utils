<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>h5首页设置详情</title>
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
					<label class="col-md-3 text-right">位置 ：</label>
 					<span class="col-md-4">
 						<c:choose>
							<c:when test="${settings.ftype == 1}">头条</c:when>
 	  					 	<c:otherwise>
						 		未知
					 		</c:otherwise>
 					</c:choose>
 					</span>
  				</div>
 				<!-- 类型  end-->
 				
 			   <!--  来源 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">来源  ：</label>
 					<span class="col-md-4">
 						<c:choose>
							<c:when test="${settings.type == 1}">头条</c:when>
							<c:when test="${settings.type == 2}">资讯</c:when>
							
 	  					 	<c:otherwise>
						 		未知
					 		</c:otherwise>
 					</c:choose>
 					</span>
  				</div>
 				<!-- 来源   end-->
 				
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
					<label class="col-md-3 text-right">标题：</label>
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
  				 
 				<!-- 设置时间start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">设置时间：</label>
 					<span class="col-md-6">
 						<wdb:formatDate value="${settings.dateline}" var="dateline">
 							${dateline }
 						</wdb:formatDate>
 					</span>
  				</div>
 				<!-- 设置时间end-->
 				
 				<!-- 设置人start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">设置人：</label>
 					<span class="col-md-6">
 						<wdb:getAdminUser uid="${settings.baseid}" var="baseid">
 							${baseid.username }
 						</wdb:getAdminUser>
 					</span>
  				</div>
 				<!-- 设置人end-->
 				
 				<!-- 修改人start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">修改人：</label>
 					<span class="col-md-6">
 						<wdb:getAdminUser uid="${settings.ubaseid}" var="ubaseid">
 							${ubaseid.username }
 						</wdb:getAdminUser>
 					</span>
  				</div>
 				<!-- 修改人end-->
 				 
 				<!-- 修改时间start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">修改时间：</label>
 					<span class="col-md-6">
 						<wdb:formatDate value="${settings.udateline}" var="udateline">
 							${udateline }
 						</wdb:formatDate>
 					</span>
  				</div>
 				<!-- 修改时间end-->
 				
 				<!-- 图片图1start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">图片模式：</label>
 					<span class="col-md-6">
  					 <c:choose>
						<c:when test="${settings.imgtype == 0}">
							 无图模式
						</c:when>
						<c:when test="${settings.imgtype == 1}">
							 1大图模式
						</c:when>
						<c:when test="${settings.imgtype == 2}">
							 2图模式
						</c:when>
						<c:when test="${settings.imgtype == 3}">
							 3图模式
						</c:when>
						<c:when test="${settings.imgtype == 4}">
							 1小图模式
						</c:when>
						<c:otherwise>无</c:otherwise>
					</c:choose>
 					</span>
  				</div>
 				<!-- 图片图1end-->
 				 
 				<c:if test="${not empty  settings.attachment1}">
	 				<!-- 图片图1start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-3 text-right">图1：</label>
	 					<span class="col-md-6">
  								<div id="img_box">
	 								 <img src="${settings.attachment1}" />
								</div>
 	 					</span>
	  				</div>
	 				<!-- 图片图1end-->
 				</c:if>
 				
 				<c:if test="${not empty  settings.attachment2}">
	 				<!-- 图片图2start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-3 text-right">图2：</label>
	 					<span class="col-md-6">
 							<div id="img_box">
 								 <img src="${settings.attachment2}" />
							</div>
 	 					</span>
	  				</div>
	 				<!-- 图片图2end-->
 				</c:if>
 				
 				<c:if test="${not empty  settings.attachment3}">
 				<!-- 图片图3start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">图3：</label>
 					<span class="col-md-6">
  							<div id="img_box">
 								 <img src="${settings.attachment3}" />
							</div>
  					</span>
  				</div>
 				<!-- 图片图3end-->
 				</c:if>
    		</div>
	</div>
</body>
</html>