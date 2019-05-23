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
<title>平台信息列表</title>
<script type="text/javascript">
	$(function(){
		$("#select-name-text").val("${platformInfo.pname}");
		$("#select-status-text").val("${platformInfo.operatingstatus}");
	})

    function querypname(pname){
        $("#select-name-text").val(pname);
        $("#form-select").submit();
    }
    function querystatus(status){
        $("#select-status-text").val(status);
        $("#form-select").submit();
    }

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
					平台名称：<input class="form-control" type="text" id="select-name-text" data-name=""
						name="pname" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="平台名称">
				</div>
				&nbsp;&nbsp;
 				<div class="form-group">
					运营状态： <select id="select-status-text" name="operatingstatus" class="form-control" data-status="">
						<option value="">--请选择状态--</option>
						<option value=1>正常</option>
						<option value=2>跑路</option>
						<option value=3>清盘</option>
						<option value=4>高风险</option>
						<option value=5>有争议</option>
					    <option value=6>延期兑付</option>
						<option value=7>停业</option>
						<option value=8>经侦介入</option>
						<option value=9>提现困难</option>
  					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/platforminfo/platformInfoTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>