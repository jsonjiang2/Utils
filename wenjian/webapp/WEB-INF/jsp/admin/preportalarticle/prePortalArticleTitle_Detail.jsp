<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主题详情</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
 </head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
		
				<!-- 版块start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">版块:</label>
 					<span class="col-md-6">
 						网贷资讯
   					</span>
  				</div>
 				<!-- 版块  end--> 
 				
 				<!-- 标题start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">标题:</label>
 					<span class="col-md-8">
 						${prePortalArticleTitle.title}
   					</span>
  				</div>
 				<!-- 标题  end--> 
 				
 				<!-- 发布时间start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">发布时间:</label>
 					<span class="col-md-8">
						<wdb:formatDate value="${prePortalArticleTitle.dateline}" var="dateline">
  					 		${dateline}
  					 	</wdb:formatDate>
   					</span>
  				</div>
 				<!--发布时间  end--> 
 				
 				<!-- 发布人start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">发布人时间:</label>
 					<span class="col-md-8">
						<wdb:getUser uid="${prePortalArticleTitle.uid}" var="uid">
	  					 		${uid.username }-${uid.realname ? '无' :uid.realname}
	  					 	</wdb:getUser>
   					</span>
  				</div>
 				<!--发布人时间  end--> 
 				
 				<!-- 状态start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">状态:</label>
 					<span class="col-md-6">
 							<c:choose>
									<c:when test="${prePortalArticleTitle.status == -1}">审核中</c:when>
									<c:when test="${prePortalArticleTitle.status == -2}">审核失败</c:when>
									<c:when test="${prePortalArticleTitle.status == -3}">已删除</c:when>
									<c:when test="${prePortalArticleTitle.status == 0}">审核通过</c:when>
 									<c:otherwise>
 										未知
 									</c:otherwise>								
 							</c:choose>
   					</span>
  				</div>
 				<!-- 状态 end-->

				<!-- 新数据start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">是否老数据:</label>
					<span class="col-md-6">
								<c:choose>
									<c:when test="${prePortalArticleTitle.isold == 1}">是</c:when>
									<c:when test="${prePortalArticleTitle.isold == 0}">否</c:when>
									<c:otherwise>
										未知
									</c:otherwise>
								</c:choose>
						</span>
				</div>
				<!-- 新数据 end-->
			<!-- 排序tart-->
			<div class="col-md-12" style="margin-top:10px;">
				<label class="col-md-3 text-right">排序:</label>
				<span class="col-md-6">
					${prePortalArticleTitle.sort}
				</span>
			</div>
			<!-- 排序 end-->

			<c:if test="${not empty prePortalArticleTitle.auid}">
 	 				<!-- 审核人 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-3 text-right">审核人:</label>
	 					<span class="col-md-6">
	  					 	<wdb:getAdminUser uid="${prePortalArticleTitle.auid}" var="auid">
	  					 		${auid.username }-${auid.fullname ? '无' :auid.fullname}
	  					 	</wdb:getAdminUser>
	   					</span>
	  				</div>
	 				<!-- 审核人 end--> 
	 				
	 				<!-- 审核人时间 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-3 text-right">审核时间:</label>
	 					<span class="col-md-6">
	  					 	<wdb:formatDate value="${prePortalArticleTitle.adateline}" var="adateline">
	  					 		${adateline}
	  					 	</wdb:formatDate>
	   					</span>
	  				</div>
	 				<!-- 审核人时间  end--> 
 				</c:if>

				<!-- 管理员留言start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">管理员留言:</label>
					<span class="col-md-8">
						${prePortalArticleTitle.amessage}
					</span>
				</div>
				<!--管理员留言  end-->

				<!-- 备注start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">备注:</label>
					<span class="col-md-8">
						${prePortalArticleTitle.remark}
						</span>
				</div>
				<!--备注  end-->
		</div>
 </div>
</body>
</html>