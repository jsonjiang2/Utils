<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/productreservationcode/productReservationCode.js"></script>
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
<title>主题回复列表</title>
<script type="text/javascript">
	$(function(){
		$("#select-productno-text").val($("#select-productno-text").data("productno"));
		$("#select-status-text").val($("#select-status-text").data("status"));
		$("#select-buytype-text").val($("#select-buytype-text").data("buytype"));
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
				<div class="form-group">
					产品编号：<input class="form-control" type="text" id="select-productno-text" data-productno="${productReservationCode.productno}"
						name="productno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="产品编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
  				<div class="form-group">
					状态： <select id="select-status-text" name="status" class="form-control" data-status="${productReservationCode.status}">
							<option value="">--请选择状态--</option>
							<option value=0>未使用</option>
							<option value=1>已购买</option>
							<option value=2>已使用 </option>
    					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					状态： <select id="select-buytype-text" name="buytype" class="form-control" data-buytype="${productReservationCode.buytype}">
							<option value="">--请选择状态--</option>
	 						<option value=1>支付宝</option>
							<option value=2>微信 </option>
							<option value=3>账户余额 </option>
							<option value=4>网银 </option>
							<option value=5>线下转账 </option>
      					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
 				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/productreservationcode/productReservationCodeListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>