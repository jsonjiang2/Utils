<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/loanproductinfo/loanProductInfo.js"></script>
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
<title>贷款平台列表</title>
<script type="text/javascript">
	$(function(){
		$("#select-type-text").val($("#select-type-text").data("type"));
	})
</script>
 </head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-select"
				action="list">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
 				&nbsp;&nbsp;
 				<div class="form-group">
					平台名称：<input class="form-control" type="text" id="select-pname-text" data-pname="${pname}"
						name="pname" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="平台名称">
				</div>
  				&nbsp;&nbsp;
  				<div class="form-group">
					类型：  
						<select class="form-control" name="type" id="select-type-text" data-type="${loanProductView.type}">
							<option value="">--请选择--</option>
							<option value="1">首页</option>
							<option value="2">理财列表</option>
							<option value="3">贷款列表</option>
							<option value="4">配资列表</option>
							<option value="5">理财详情</option>
							<option value="6">贷款详情</option>
							<option value="7">配资详情</option>
 						</select>
				</div>
  				&nbsp;&nbsp;
 				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
					<button type="button" class="btn btn-default" style="width: 100px;" onclick="loanProductInfo.show_setting(this)">新增</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/loanproductview/loanProductViewListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>