<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回复详情</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>

<style type="text/css">
	.message img{
		max-width:100%; 
	}
</style>
 </head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
				<!-- 主题IDstart-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">ID:</label>
 					<span class="col-md-6">
 						${ preReply.id}
   					</span>
  				</div>
 				<!-- 主题ID  end--> 
 				
 				<!-- 版块start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">版块ID:</label>
 					<span class="col-md-6">
 						${preReply.cid} 
   					</span>
  				</div>
 				<!-- 版块  end--> 
		
				<!-- 版块start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">版块:</label>
 					<span class="col-md-6">
 						 <c:choose>
 							 	<c:when test="${preReply.typeid == 1 }">巴士茶馆</c:when>
 							 	<c:when test="${preReply.typeid == 2 }">网贷资讯</c:when>
 							 	<c:when test="${preReply.typeid == 3 }">黑羊头</c:when>
								 <c:when test="${preReply.typeid == 4 }">曝光台</c:when>
								 <c:when test="${preReply.typeid == 5 }">需求撮合</c:when>
 							 	<c:otherwise>
 							 		未知
 							 	</c:otherwise>
		 				 </c:choose>
   					</span>
  				</div>
 				<!-- 版块  end--> 
 			 
 				
 				<!--主题 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">主题:</label>
 					<span class="col-md-8">
 						${preReply.subject}
   					</span>
  				</div>
 				<!-- 主题  end--> 
 				
 				<!-- 发布人start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">发布人:</label>
 					<span class="col-md-6">
 						<wdb:getUser uid="${preReply.uid}" var="user">
								${user.username}
						</wdb:getUser>
   					</span>
  				</div>
 				<!-- 发布人  end--> 
 				
 				<!-- 发布时间start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">发布时间:</label>
 					<span class="col-md-6">
  						<wdb:formatDate value="${preReply.dateline}" var="dateline">
 							${dateline }
 						</wdb:formatDate>
   					</span>
  				</div>
 				<!-- 发布时间 end--> 
   				
 				<!-- 状态start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">状态:</label>
 					<span class="col-md-6">
 						<c:choose>
							<c:when test="${preReply.status == -1 }"><span style="color:#666;">审核中</span></c:when>
							<c:when test="${preReply.status == -2 }"><span style="color:red;">不合格</span></c:when>
							<c:when test="${preReply.status == -3 }"><span style="color:#DA70D6;">已删除</span></c:when>
							<c:when test="${preReply.status == 0 }">合格</c:when>
						</c:choose>
   					</span>
  				</div>
 				<!-- 状态  end--> 
 		 
 				<c:if test="${not empty preReply.auid}">
 	 				<!-- 审核人 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-3 text-right">审核人:</label>
	 					<span class="col-md-6">
	  					 	<wdb:getAdminUser uid="${preReply.auid}" var="auid">
	  					 		${auid.username }
	  					 	</wdb:getAdminUser>
	   					</span>
	  				</div>
	 				<!-- 审核人 end--> 
	 				
	 				<!-- 审核人时间 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-3 text-right">审核人时间:</label>
	 					<span class="col-md-6">
	  					 	<wdb:formatDate value="${preReply.adateline}" var="adateline">
	  					 		${adateline}
	  					 	</wdb:formatDate>
	   					</span>
	  				</div>
	 				<!-- 审核人时间  end--> 
 				</c:if>
 				
 				<!-- 备注 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">备注:</label>
 					<span class="col-md-6">
  					 	${preReply.remark }
   					</span>
  				</div>
 				<!-- 备注 end--> 
 				
 				<!-- 回复内容 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">回复内容:</label>
 					<span class="col-md-8 message">
  					 	${preReply.message}
   					</span>
  				</div>
 				<!-- 回复内容 end--> 
 				
			 
 				 
 	</div>
 </div>
</body>
</html>