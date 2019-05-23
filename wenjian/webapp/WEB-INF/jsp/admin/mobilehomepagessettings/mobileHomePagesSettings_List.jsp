<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/mobilehomesettings/mobileHomePagesSettings.js"></script>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}
</style>
<title>h5 首页设置</title>
 </head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-select"
				action="list">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
 				<div class="form-group">
					标题：<input class="form-control" type="text" id="select-subject-text" data-subject="${ mobileHomePagesSettings.subject}"
						name="subject" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="标题">
				</div>
				&nbsp;&nbsp;
 				<div class="form-group">
					来源： <select id="select-type-text" name="type" class="form-control" data-type="${ mobileHomePagesSettings.type}">
						<option value="">--请选择状态--</option>
						<option value=1>茶馆</option>
						<option value=2>资讯</option>
  					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					位置： <select id="select-ftype-text" name="ftype" class="form-control" data-ftype="${ mobileHomePagesSettings.ftype}">
							<option value="">--请选择状态--</option>
							<option value=1>h5-首页</option>
    					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
 			<div class="col-md-12" style="margin-bottom: 15px;">
 				<div class="col-md-2 col-md-offset-10" >
					<a type="button" class="btn btn-default" onclick="mobileHomePagesSettings.settingShow(this)">新增</a>
				</div>
			</div>
			<jsp:include page="/WEB-INF/jsp/admin/mobilehomepagessettings/mobileHomePagesSettingsListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>