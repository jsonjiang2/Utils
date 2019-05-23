<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主题回复详情</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/preforumreply/preForumReply.js"></script>
</head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
				<!-- 版块名称 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">版块名称：</label>
 					<span class="col-md-4">${preForumReply.fname}</span>
  				</div>
 				<!-- 版块名称 end-->
 				
 				<!-- 主题 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">主题：</label>
 					<span class="col-md-4">
						 ${preForumReply.tname}
					</span>
  				</div>
 				<!-- 主题 end-->
 			 
				<!-- 用户名 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">用户名 ：</label>
					<div class="col-md-4">
						${preForumReply.username}
					</div>
				</div>
				<!-- 用户名  end-->
 
				<!-- 内容 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">内容：</label>
					<div class="col-md-8">
						${preForumReply.message}
					</div>
				</div>
				<!-- 内容 end-->

				<!-- 帖子数量 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">帖子时间：</label>
					<div class="col-md-4">
 					 	${preForumReply.datetimestr}
					</div>
				</div>
				<!-- 帖子数量 end-->
 				
				<!-- 状态 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">状态：</label>
					<div class="col-md-4">
						<c:choose>
							<c:when test="${preForumReply.status == -1}">审核中</c:when>
							<c:when test="${preForumReply.status == -2}">审核失败</c:when>
							<c:when test="${preForumReply.status == -3}">已删除</c:when>
							<c:when test="${preForumReply.status == 0}">审核成功</c:when>
							<c:when test="${preForumReply.status == 1}">已恢复 </c:when>
 							<c:otherwise>
 								  未知
 							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- 状态 end-->

				<!-- 操作人 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">操作人 ：</label>
					<div class="col-md-4">
						${preForumReply.operman}
					</div>
				</div>
				<!-- 操作人  end-->

 				<!-- 操作时间 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">操作时间 ：</label>
					<div class="col-md-4">
						 ${preForumReply.operdatetiemstr}
 					</div>
				</div>
				<!-- 操作时间  end-->
 
<!--  				操作时间 start -->
<!-- 					<div class="col-md-12" style="margin-top:15px;"> -->
<!-- 						<label class="col-md-4 text-right">操作时间 ：</label> -->
<!-- 						<div class="col-md-4"> -->
<%-- 							${preForumReply.yesterdayposts} --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				操作时间  end -->
    		</div>
	</div>
</body>
</html>