<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/subscribeproduct/subscribeproduct.js"></script>
<script type="text/javascript">
$(function(){
	$("#selectView-status").val($("#selectView-status").data("status"));
	$("#selectView-displaystatus").val($("#selectView-displaystatus").data("displaystatus"));
	$("#selectView-ppno-text").val($("#selectView-ppno-text").data("ppno"));
	$("#selectView-subsno-text").val($("#selectView-subsno-text").data("subsno"));
 });
</script>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}
</style>
<title>预约产品管理</title>

</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 20px;"></div>
			<form method="post" class="form-inline" id="form-selectView"
				action="viewList">
				<input type="hidden" id="pageNumView" name="pageNum"> 
				<input type="hidden" id="pageSizeView" name="pageSize">
 				<div class="form-group">
					产品编号：<input class="form-control" data-ppno="${subscribeProduct.ppno }" type="text" id="selectView-ppno-text"
						name="ppno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="填写产品编号">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					预约品号：<input class="form-control" data-subsno="${subscribeProduct.subsno }" type="text" id="selectView-subsno-text"
						name="subsno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="填写预约品号">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					状态开关： <select id="selectView-status" name="status" class="form-control" data-status="${subscribeProduct.status}">
						<option value="">--请选择状态--</option>
						<option value=1>预约中</option>
						<option value=2>成功</option>
						<option value=3>失败</option>
 					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					上架状态： <select id="selectView-displaystatus" name="displaystatus" class="form-control" data-displaystatus="${subscribeProduct.displaystatus}">
						<option value="">--请选择状态--</option>
						<option value=1>上架</option>
						<option value=0>下架</option>
  					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<div class="col-md-12" style="height:45px;margin:15px 10px;font-size:16px;">
					<span>预约金额：</span><span>${ha.subamount}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span>预约定金：</span><span>${ha.earnestmoney}</span>
			</div>
 			<jsp:include page="/WEB-INF/jsp/admin/preforumforum/preForumForumViewListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="../../common/modal.jsp"%>
</body>
</html>