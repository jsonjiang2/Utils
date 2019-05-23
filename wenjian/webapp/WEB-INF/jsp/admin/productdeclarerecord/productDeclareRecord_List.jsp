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
		$("#select-resourceno-text").val($("#select-resourceno-text").data("resourceno"));
		$("#select-productno-text").val($("#select-productno-text").data("productno"));
		$("#select-declareno-text").val($("#select-declareno-text").data("declareno"));
		$("#select-orideclareno-text").val($("#select-orideclareno-text").data("orideclareno"));
 		$("#select-auditstatus-text").val($("#select-auditstatus-text").data("auditstatus"));
		$("#select-type-text").val($("#select-type-text").data("type"));
		$("#select-declaretype-text").val($("#select-declaretype-text").data("declaretype"));
		
		 
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
					承接资源编号：<input class="form-control" type="text" id="select-resourceno-text" data-resourceno="${productDeclareRecord.resourceno}"
						name="resourceno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="承接资源编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					产品编号：<input class="form-control" type="text" id="select-productno-text" data-productno="${productDeclareRecord.productno}"
						name="productno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="产品编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					申报编号：<input class="form-control" type="text" id="select-declareno-text" data-declareno="${productDeclareRecord.declareno}"
						name="declareno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="申报编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					原始申报编号：<input class="form-control" type="text" id="select-orideclareno-text" data-orideclareno="${productDeclareRecord.orideclareno}"
						name="orideclareno" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="原始申报编号">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
  				<div class="form-group">
					审核状态： <select id="select-auditstatus-text" name="auditstatus" class="form-control" data-auditstatus="${productDeclareRecord.auditstatus}">
							<option value="">--请选择状态--</option>
							<option value=0>待审核</option>
							<option value=1>合格</option>
							<option value=2>不合格</option>
      					</select>
				</div>
				&nbsp;&nbsp;
				<div style="margin-bottom: 25px;"></div>
				<div class="form-group">
					申报方式： <select id="select-type-text" name="type" class="form-control" data-type="${productDeclareRecord.type}">
							<option value="">--请选择状态--</option>
 							<option value=1>游客申报</option>
							<option value=2>会员申报</option>
      					</select>
				</div>
				 
				&nbsp;&nbsp;
				<div class="form-group">
					申报审核人： <select id="select-declaretype-text" name="declaretype" class="form-control" data-decauditid="${productDeclareRecord.declaretype}">
							<option value="">--请选择状态--</option>
	 						<option value=1>平台官方</option>
							<option value=2>一级资源方</option>
       					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
 				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/productdeclarerecord/productDeclareRecordListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>