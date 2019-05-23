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
<script type="text/javascript" src="${basePath}/static/js/admin/pre_common.js"></script>
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
<title>产品发布记录列表</title>
<script type="text/javascript">
	$(function(){
		$("#select-liqno-text").val($("#select-liqno-text").data("liqno"));
		$("#select-declareno-text").val($("#select-declareno-text").data("declareno"));
		$("#select-orideclareno-text").val($("#select-orideclareno-text").data("orideclareno"));
		$("#select-productno-text").val($("#select-productno-text").data("productno"));
		$("#select-resourceno-text").val($("#select-resourceno-text").data("resourceno"));
 		$("#select-activitytype-text").val($("#select-type-activitytype").data("activitytype"));
 		$("#select-liqtype-text").val($("#select-liqtype-text").data("liqtype"));
 		$("#select-status-text").val($("#select-status-text").data("status"));
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
					清算编号：<input class="form-control" type="text" id="select-liqno-text" data-liqno="${productLiquidationRecord.liqno}"
						name="liqno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="清算编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					申报编号：<input class="form-control" type="text" id="select-declareno-text" data-declareno="${productLiquidationRecord.declareno}"
						name="declareno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="申报编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					原始申报编号：<input class="form-control" type="text" id="select-orideclareno-text" data-orideclareno="${productLiquidationRecord.orideclareno}"
						name="orideclareno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="原始申报编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					产品编号：<input class="form-control" type="text" id="select-productno-text" data-productno="${productLiquidationRecord.productno}"
						name="productno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="产品编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div style="margin-bottom: 25px;"></div>
				<div class="form-group">
					承接资源编号：<input class="form-control" type="text" id="select-resourceno-text" data-resourceno="${productLiquidationRecord.resourceno}"
						name="resourceno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="产品编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
  				<div class="form-group">
					活动类型： <select id="select-activitytype-text" name="activitytype" class="form-control" data-activitytype="${productLiquidationRecord.activitytype}">
							<option value="">--请选择状态--</option>
							<option value=1>首投</option>
							<option value=2>复投</option>
     					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					清算状态： <select id="select-status-text" name="status" class="form-control" data-status="${productLiquidationRecord.status}">
							<option value="">--请选择状态--</option>
	 						<option value=0>待清算 </option>
							<option value=1>已清算</option>
       					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					清算方式： <select id="select-liqtype-text" name="liqtype" class="form-control" data-liqtype="${productLiquidationRecord.liqtype}">
							<option value="">--请选择状态--</option>
	 						<option value=1>线上</option>
							<option value=2>线下</option>
       					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
 				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/productliquidationrecord/productLiquidationRecordListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>