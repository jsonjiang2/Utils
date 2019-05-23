<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html>
<html>
<head>
<title>黑羊头标题事件修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="p2p网贷,网贷资讯,互联网金融,互联网理财">
<meta name="description" content="网贷巴士努力为投资人提供最新最有价值最客观的p2p网贷资讯 ">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${basePath}/static/subjectrelease/dist/bootstrap.css">
<link href="${basePath}/static/subjectrelease/dist/summernote.css"
	rel="stylesheet">
<script src="${basePath}/static/subjectrelease/js/jquery.min.js"></script>
<script src="${basePath}/static/subjectrelease/js/bootstrap.min.js"></script>
<script src="${basePath}/static/subjectrelease/dist/summernote.js"></script>
<script
	src="${basePath}/static/subjectrelease/dist/lang/summernote-zh-CN.js"></script>
<!-- 中文-->
<style>
.m {
	width: 760px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<style type="text/css">
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container"> 
		<div style="display: none;">
			曝光人id： <span id="baseid">${sheepHeadExposure.baseid}</span> 
		</div>

		<div style="display: none;">
			黑羊头曝光id： <span id="id">${sheepHeadExposure.id}</span> 
		</div>

		<div>
			<div id="wdbmessage" style="display: none;">
				${sheepHeadExposure.baseid}</div>
		</div>
 
		<div><h3>
			黑羊头曝光标题：<span>${sheepHeadExposure.title}</span></h3>
		</div>
		
		<div>
			<h3> 曝光人：<span>
						<wdb:getUser uid="${sheepHeadExposure.baseid}" var="user">
							${user.username}
						</wdb:getUser>
					  </span>
			</h3>
		</div> 
		<br><br><br>

		<div>
			<h3>事情经过：</h3><br>
			<span>${sheepHeadExposure.incident}</span>
		</div> 
	</div>
</body>
</html>