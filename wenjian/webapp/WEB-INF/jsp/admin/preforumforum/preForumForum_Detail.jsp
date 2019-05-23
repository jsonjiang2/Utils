<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预约产品新增</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/preforumforum/preForumForum.js"></script>
</head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
				<!-- 论坛名称 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">版块名称：</label>
 					<span class="col-md-4">${preForumReply.fname }</span>
  				</div>
 				<!-- 论坛名称 end-->
 				
 				<!-- 显示状态 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">显示状态：</label>
 					<span class="col-md-4">
						<c:choose>
							<c:when test="${preForumForum.status == 0 }">不显示 </c:when>
							<c:when test="${preForumForum.status == 1 }">显示 </c:when>
						</c:choose>
					</span>
  				</div>
 				<!-- 显示状态 end-->
 			 
				<!-- 显示顺序  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">显示顺序 ：</label>
					<div class="col-md-4">
						${preForumForum.displayorder}
					</div>
				</div>
				<!-- 显示顺序  end-->
 
				<!-- 主题数量 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">主题数量：</label>
					<div class="col-md-4">
						${preForumForum.threads}
					</div>
				</div>
				<!-- 主题数量 end-->

				<!-- 帖子数量 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">帖子数量：</label>
					<div class="col-md-4">
						${preForumForum.posts}
					</div>
				</div>
				<!-- 帖子数量 end-->
 				
				<!-- 今日发帖数量 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">今日发帖数量：</label>
					<div class="col-md-4">
						${preForumForum.todayposts}
					</div>
				</div>
				<!-- 今日发帖数量 end-->

				<!-- 今年发帖数量 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">今年发帖数量 ：</label>
					<div class="col-md-4">
						${preForumForum.yesterdayposts}
					</div>
				</div>
				<!-- 今年发帖数量  end-->

 				<!-- 今年发帖数量 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">今年发帖数量 ：</label>
					<div class="col-md-4">
						${preForumForum.yesterdayposts}
					</div>
				</div>
				<!-- 今年发帖数量  end-->
 
    		</div>
	</div>
</body>
</html>