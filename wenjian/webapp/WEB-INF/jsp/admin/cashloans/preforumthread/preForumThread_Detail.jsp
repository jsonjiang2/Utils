<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<wdb:getPreForumForum fid="${preForumThread.fid }" var="preForumForum" />
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
				<!-- 主题IDstart-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">主题ID:</label>
 					<span class="col-md-6">
 						${ preForumThread.tid}
   					</span>
  				</div>
 				<!-- 主题ID  end--> 
		
				<!-- 版块start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">版块:</label>
 					<span class="col-md-6">
 						${ preForumForum.name}
   					</span>
  				</div>
 				<!-- 版块  end--> 
 				
 				<!--主题 前缀 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">主题前缀:</label>
 					<span class="col-md-8">
 						${ preForumThread.presubject == null ? '无' : preForumThread.presubject}
   					</span>
  				</div>
 				<!-- 主题 前缀  end--> 
 				
 				<!--主题 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">主题:</label>
 					<span class="col-md-8">
 						${ preForumThread.subject}
   					</span>
  				</div>
 				<!-- 主题  end--> 
 				
 				<!-- 发布人start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">发布人:</label>
 					<span class="col-md-6">
 						<wdb:getUser uid="${preForumThread.authorid}" var="user">
								${user.username}-${empty user.realname ? '无' : user.realname}
						</wdb:getUser>
   					</span>
  				</div>
 				<!-- 发布人  end--> 
 				
 				<!-- 发布时间start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">发布时间:</label>
 					<span class="col-md-6">
  						<wdb:formatDate value="${ preForumThread.dateline}" var="dateline">
 							${dateline }
 						</wdb:formatDate>
   					</span>
  				</div>
 				<!-- 发布时间 end--> 
 				
 				<!-- 浏览次数start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">浏览次数:</label>
 					<span class="col-md-6">
 						${ preForumThread.views}
   					</span>
  				</div>
 				<!-- 浏览次数 end--> 
 				
 				<!-- 回复次数start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">回复次数:</label>
 					<span class="col-md-6">
 						${ preForumThread.replies}
   					</span>
  				</div>
 				<!-- 回复次数  end--> 
 				
 				<!-- 状态start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">状态:</label>
 					<span class="col-md-6">
 						<c:choose>
 							<c:when test="${preForumThread.displayorder == -1 }">不合格</c:when>
 							<c:when test="${preForumThread.displayorder == -2 }">审核中</c:when>
 							<c:when test="${preForumThread.displayorder == -3 }">已删除</c:when>
 							<c:when test="${preForumThread.displayorder == -4 }">草稿</c:when>
  							<c:when test="${preForumThread.displayorder == 0 }">审核通过</c:when>
 							<c:otherwise>
 								未知
 							</c:otherwise>
 						</c:choose>
   					</span>
  				</div>
 				<!-- 状态  end--> 
 				
 				<!-- 是否精华start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">是否精华:</label>
 					<span class="col-md-6">
  						<c:choose>
 							<c:when test="${preForumThread.digest == 1 }">是</c:when>
 							<c:when test="${preForumThread.digest == 0 }">否</c:when>
  							<c:otherwise>
 								未知
 							</c:otherwise>
 						</c:choose>
   					</span>
  				</div>
 				<!-- 是否精华  end--> 
 				
 				<!-- 精华排位start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">精华排位:</label>
 					<span class="col-md-6">
 						${preForumThread.dsort}
    				</span>
  				</div>
 				<!-- 精华排位  end--> 
 				
 				<!-- 普通排位start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">普通排位:</label>
 					<span class="col-md-6">
   					 	${preForumThread.csort}
   					</span>
  				</div>
 				<!-- 普通排位 end-->
 				
 				<!-- 是否被管理员改动 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">是否被管理员改动:</label>
 					<span class="col-md-6">
  						<c:choose>
 							<c:when test="${preForumThread.moderated == 1 }">是</c:when>
 							<c:when test="${preForumThread.moderated == 0 }">否</c:when>
  							<c:otherwise>
 								未知
 							</c:otherwise>
 						</c:choose>
   					</span>
  				</div>
 				<!-- 是否被管理员改动  end-->
 				 
 				<!-- 管理员留言 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">管理员留言:</label>
 					<span class="col-md-6">
  					 	${preForumThread.amessage}
   					</span>
  				</div>
 				<!-- 管理员留言  end--> 
 				<c:if test="${not empty preForumThread.abaseid}">
 	 				<!-- 审核人 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-3 text-right">审核人:</label>
	 					<span class="col-md-6">
	  					 	<wdb:getAdminUser uid="${preForumThread.abaseid}" var="abaseid">
	  					 		${abaseid.username }
	  					 	</wdb:getAdminUser>
	   					</span>
	  				</div>
	 				<!-- 审核人 end--> 
	 				
	 				<!-- 审核人时间 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-3 text-right">审核人时间:</label>
	 					<span class="col-md-6">
	  					 	<wdb:formatDate value="${preForumThread.adateline}" var="adateline">
	  					 		${adateline}
	  					 	</wdb:formatDate>
	   					</span>
	  				</div>
	 				<!-- 审核人时间  end--> 
 				</c:if>
 				
 				<!-- 备注 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">删除备注:</label>
 					<span class="col-md-6">
  					 	${preForumThread.remark}
   					</span>
  				</div>
 				 
 	</div>
 </div>
</body>
</html>