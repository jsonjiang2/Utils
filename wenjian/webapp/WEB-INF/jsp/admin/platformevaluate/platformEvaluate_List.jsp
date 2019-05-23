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
<title>平台评价列表</title>
<script type="text/javascript">
	$(function(){
        $("#select-name-text").val("${platformEvaluate.pname}");
        $("#evaluationtendency").val("${platformEvaluate.evaluationtendency}");
        $("#display").val("${platformEvaluate.display}");
        $("#digest").val("${platformEvaluate.digest}");
	});

    function querypname(pname){
        $("#select-name-text").val(pname);
        $("#form-select").submit();
    }
    function queryevaluationtendency(evaluationtendency){
        $("#evaluationtendency").val(evaluationtendency);
        $("#form-select").submit();
    }
    function querydisplay(display){
	    $("#display").val(display);
        $("#form-select").submit();
	}

</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-select"
				action="cxList">
				<input type="hidden" id="pageNum" name="pageNum">
				<input type="hidden" id="pageSize" name="pageSize">

				<div class="form-group">
					平台名称：<input class="form-control" type="text" id="select-name-text" data-name=""
						name="pname" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="平台名称">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					评价倾向：<select id="evaluationtendency" name="evaluationtendency" class="form-control" data-status="">
					<option value="">--请选择--</option>
					<option value="1">好评</option>
					<option value="2">一般</option>
					<option value="3">差评</option>
				</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					是否显示：<select id="display" name="display" class="form-control" data-status="">
					<option value="">--请选择--</option>
					<option value="0">不显示</option>
					<option value="1">显示</option>
				</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					是否精华：<select id="digest" name="digest" class="form-control" data-status="">
					<option value="">--请选择--</option>
					<option value="0">否</option>
					<option value="1">是</option>
				</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/platformevaluate/platformEvaluateTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>