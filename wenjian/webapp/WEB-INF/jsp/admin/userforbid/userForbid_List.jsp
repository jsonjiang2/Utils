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
<title>用户禁止列表</title>
<script type="text/javascript">
	$(function(){
        $("#forbidtype").val("${userForbid.forbidtype}");
        $("#typecontent").val("${userForbid.typecontent}");
        $("#forbidcontent").val("${userForbid.forbidcontent}");

	});

    function queryforbidtype(forbidtype){
        $("#forbidtype").val(forbidtype);
        $("#form-select").submit();
    }

    function queryforbidcontent(forbidcontent){
        $("#forbidcontent").val(forbidcontent);
        $("#form-select").submit();
    }
</script>

</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix" id="div1">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-select"
				action="cxList">
				<input type="hidden" id="pageNum" name="pageNum">
				<input type="hidden" id="pageSize" name="pageSize">

                <!--查询条件-->
				<div class="form-group">
					禁止类型： <select id="forbidtype" name="forbidtype" class="form-control" data-status="">
									<option value="">--请选择--</option>
									<option value=2>用户名</option>
									<option value=1>IP</option>
									<option value=3>回复审核</option>
								</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					类型内容：<input class="form-control" type="text" id="typecontent" data-name=""
								name="typecontent" style="text-align: center; line-height: 18px;width:220px;"
								placeholder="IP/用户名/回复关键字">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					禁止内容： <select id="forbidcontent" name="forbidcontent" class="form-control" data-status="">
								<option value="">--请选择--</option>
								<option value="1">登录</option>
								<option value="2">发帖</option>
								<option value="3">回复</option>
								<option value="4">访问</option>
							</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
					<button type="button" class="btn btn-default" style="width: 100px;" id="btn1" onclick="addForbid()">添加禁止</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/userforbid/userForbidTemp.jsp"></jsp:include>
		</div>
	</div>

	<script type="text/javascript">
        function addForbid() {
            $("#div1").load(basePath+"/admin/userForbid/addPage");
        }
	</script>

	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>