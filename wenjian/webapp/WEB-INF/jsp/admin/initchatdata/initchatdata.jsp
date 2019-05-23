<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>全局配置</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <link href="<%=basePath%>/static/plugin/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
    </style>
    <script>
        function initChatData(){
            alert("初始化数据需要时间长，请耐心等待！")
            var action ="${basePath}/admin/initChatRedisData";
            $.ajax({
                type: "post",
                url: action,
                data: {},
                dataType: "json",
                async:false,
                success: function(data){
                    alert(data.meta.message);
                },
                error: function (data) {
                    alert(data.meta.message)
                }
            });
        }
    </script>
</head>

<body>

<div class="container" style="width:100%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="margin-bottom:10px;"></div>
            <button type="button" class="btn btn-default"
                    onclick="initChatData()">初始化聊天室数据--用户数据
            </button>
            <%@ include file="../../common/modal.jsp" %>
        </div>
    </div>
</div>
</body>
</html>
