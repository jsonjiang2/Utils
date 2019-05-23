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
    <title>平台负面导入</title>
    <script type="text/javascript">

    </script>

</head>
<body>
<div class="container" style="width: 85%;">
    <div class="row clearfix" id="div1">
        <div style="margin-bottom: 10px;"></div>
        <br>
        <form method="post" class="form-inline" id="form-select"
              action="collect">
            <div class="form-group">
                从网贷资讯导入---
            </div>
            <div class="form-group">
                平台最小Id：<input class="form-control" type="text" id="select-name-text" data-name=""
                            name="minId" style="text-align: center; line-height: 18px;width:220px;"
                            placeholder="">
            </div>
            &nbsp;&nbsp;
            <div class="form-group">
                平台最大Id：<input class="form-control" type="text" id="select-name-text1" data-name=""
                            name="maxId" style="text-align: center; line-height: 18px;width:220px;"
                            placeholder="">
            </div>

            &nbsp;&nbsp;
            <div class="form-group">
                <button type="button" class="btn btn-default" style="width: 100px;" id="btn2" onclick="collect()">一键导入</button>
                <button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
            </div>
        </form>         <!--添加button的type为button，这样防止它直接执行 提交当前form-->
        <br><br><br>
        <form method="post" class="form-inline" id="form-select1"
              action="collect">
            <div class="form-group">
                第三方数据处理---
            </div>
            <div class="form-group">
                平台最小Id：<input class="form-control" type="text" id="select-name" data-name=""
                              name="minId" style="text-align: center; line-height: 18px;width:220px;"
                              placeholder="">
            </div>
            &nbsp;&nbsp;
            <div class="form-group">
                平台最大Id：<input class="form-control" type="text" id="select-name1" data-name=""
                              name="maxId" style="text-align: center; line-height: 18px;width:220px;"
                              placeholder="">
            </div>

            &nbsp;&nbsp;
            <div class="form-group">
                <button type="button" class="btn btn-default" style="width: 100px;" id="btn4" onclick="collect1()">一键导入</button>
                <button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
            </div>
        </form>

        <script type="text/javascript">
           function collect() {
               var action ="/admin/platformBadInfo/collect";
               var dataObj = {};
               dataObj.minId = $("#select-name-text").val();
               dataObj.maxId = $("#select-name-text1").val();
               $.post(action,dataObj,function(data){
                   alert(data.meta.message);
                   <%--window.location.href="${pageContext.request.contextPath}/admin/platformBadInfo/lists";--%>
               });
           }
           function collect1() {
               var action ="/admin/platformBadInfo/dealBadInfo";
               var dataObj = {};
               dataObj.minId = $("#select-name").val();
               dataObj.maxId = $("#select-name1").val();
               $.post(action,dataObj,function(data){
                   alert(data.message);
                   <%--window.location.href="${pageContext.request.contextPath}/admin/platformBadInfo/lists";--%>
               });
           }

        </script>

        <div style="margin-top: 20px;"></div>

    </div>
</div>
<!-- 引入模态框 -->
<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>


</html>