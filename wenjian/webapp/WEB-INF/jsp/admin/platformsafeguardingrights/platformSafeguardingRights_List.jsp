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
    <title>平台维权列表</title>
    <script type="text/javascript">
        $(function(){
            $("#select-name-text").val("${platformInfo.pname}");
        })

        function querypname(pname){
            $("#select-name-text").val(pname);
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
                <button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
                <button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
                <button type="button" class="btn btn-default" style="width: 100px;" id="btn1" onclick="addSafeguard()">新增维权</button>
            </div>
        </form>
        <div style="margin-top: 20px;"></div>
        <jsp:include page="/WEB-INF/jsp/admin/platformsafeguardingrights/platformSafeguardingRightsTemp.jsp"></jsp:include>
    </div>
</div>

<script type="text/javascript">
    function addSafeguard() {
        $("#div1").load(basePath+"/admin/platformSafeguardingRights/addPage");
    }
    <%--$(document).ready(function(){    // 局部刷新  点击btn1按钮，让div1更新为需要显示的内容(这里显示新增页面)--%>
    <%--$("#btn1").click(function(){--%>
    <%--$('#div1').load('${pageContext.request.contextPath}/admin/platformBadInfo/addList');--%>
    <%--})--%>
    <%--})--%>
</script>

<!-- 引入模态框 -->
<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>