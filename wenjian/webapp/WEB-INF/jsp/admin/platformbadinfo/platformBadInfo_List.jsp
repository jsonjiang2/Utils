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
<title>平台负面列表</title>
<script type="text/javascript">
	$(function(){
        $("#select-name-text").val("${platformBadInfo.pname}");
        $("#select-elitestatus-text").val("${platformBadInfo.elitestatus}");
        $("#select-clearstatus-text").val("${platformBadInfo.clearstatus}");
        $("#select-status-text").val("${platformBadInfo.status}");
	});
    function querypname(pname){
        $("#select-name-text").val(pname);
        $("#form-select").submit();
    }
    function queryelitestatus(elitestatus){
        $("#select-elitestatus-text").val(elitestatus);
        $("#form-select").submit();
    }
    function queryclearstatus(clearstatus){
        $("#select-clearstatus-text").val(clearstatus);
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
		<div class="row clearfix" id="div1">
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
					是否显示： <select id="select-status-text" name="status" class="form-control" data-status="">
					<option value="">--请选择--</option>
					<option value=0>不显示</option>
					<option value=1>显示</option>
				</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					精华状态： <select id="select-elitestatus-text" name="elitestatus" class="form-control" data-status="">
								<option value="">--请选择--</option>
								<option value=0>普通</option>
								<option value=1>精华</option>
				              </select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					澄清状态： <select id="select-clearstatus-text" name="clearstatus" class="form-control" data-status="">
								<option value="">--请选择--</option>
								<option value=0>未澄清</option>
								<option value=1>已澄清</option>
							</select>
				</div>

				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
					<button type="button" class="btn btn-default" style="width: 100px;" id="btn1" onclick="addBadInfo()">新增负面</button>
					<%--<button class="btn btn-default" style="width: 100px;" type="button" id="repeat">查询重复</button>--%>
					<%--<button type="button" class="btn btn-default" style="width: 100px;" id="btn2" onclick="collect()">一键导入</button>--%>
				</div>
			</form>         <!--添加button的type为button，这样防止它直接执行 提交当前form-->

			<script type="text/javascript">
                // function addBadInfo() {
                //     $("#div1").load(basePath+"/admin/platformBadInfo/addList");   这两个写法都可以
                // }
                $(document).ready(function(){  // 局部刷新 点击btn1按钮，让div1更新为需要显示的内容(这里显示新增页面)
                    $("#btn1").click(function(){
                        $('#div1').load('${pageContext.request.contextPath}/admin/platformBadInfo/addPage');
                    });

                    <%--$("#repeat").click(function(){--%>
                         <%--&lt;%&ndash;$('#div1').load('${pageContext.request.contextPath}/admin/platformBadInfo/repeatList');&ndash;%&gt;--%>
                         <%--window.location.href('${pageContext.request.contextPath}/admin/platformBadInfo/repeatList');--%>
                    <%--});--%>
                })


			</script>

			<div style="margin-top: 20px;"></div>
			<div id="queryall_list" style="margin-top: 30px;">
				<jsp:include page="/WEB-INF/jsp/admin/platformbadinfo/platformBadInfoTemp.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>


</html>