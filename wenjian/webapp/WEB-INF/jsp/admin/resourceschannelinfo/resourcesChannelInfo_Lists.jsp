<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}

.myCheck{
    background-color: white;
    border-radius: 5px;
    border:1px solid #d3d3d3;
    width:16px;
    height:16px;
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    line-height: 16px;
}

.myCheck:checked{
    background-color: #eee;
}
 

</style>
<title>资源主查看</title>
<script type="text/javascript">
	$(function(){
		$("#select-username-text").val("${resourcesChannelInfo.username}");
		$("#select-mobile-text").val("${resourcesChannelInfo.mobile}");
		$("#select-status-text").val("${resourcesChannelInfo.manstatus}");
		
	})
</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-select"
				action="lists">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
 				<div class="form-group">
					用户名：<input class="form-control" type="text" id="select-username-text" data-name=""
						name="username" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="用户名">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					手机号：<input class="form-control" type="text" id="select-mobile-text" data-name=""
						name="mobile" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="手机号">
				</div>
				&nbsp;&nbsp;
 				<div class="form-group">
					个人状态： <select id="select-status-text" name="manstatus" class="form-control" data-status="">
						<option value="">--请选择--</option>
						<option value=1>正常</option>
						<option value=2>高风险</option>
						<option value=3>有争议</option>
						<option value=4>黑名单</option>
  					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/resourceschannelinfo/resourcesChannelInfoTemps.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
	
</body>
</html>