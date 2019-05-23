<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>账户余额列表页面</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
    </style>
    <script>
        //页面查询条件数据回显
        $(function(){
            $(".remark-p").each(function() {
                var num = $(this).html();
                if (num.length > 5) {
                    $(this).html(num.substr(0, 5) + "...");
                }
            });
            $("#userName_search").val("${username}");
        });

        //全局的pageNum与pageSize
        var pageNum = '${pagehelper.pageNum}';
        var pageSize = '${pagehelper.pageSize}';

        function insetU() {
            $("#inBtn").removeAttr("onclick").text("添加中...");
            var startId = $("#startId").val();
            var endId = $("#endId").val();
            var action = "${pageContext.request.contextPath}/admin/userAccount/insert";
            var param = {"startId":startId,"endId":endId};
            var callback = function (data) {
                $("#inBtn").attr("onclick","insetU()").text("添加");
                alert(JSON.stringify(data.message));
            }
            $.post(action, param, callback);
        }

    </script>
</head>

<body>
<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="margin-bottom:10px;"></div>
            <form action="" method="post" role="form"
                  id="conditionForm" class="form-inline">

                <div class="form-group">
                    <label>用户开始ID:</label>
                    <input type="text" class="form-control" name="startId" id="startId" value="" placeholder="用户开始ID">&nbsp;&nbsp;
                </div>
                <div class="form-group">
                    <label>用户结束ID:</label>
                    <input type="text" class="form-control" name="endId" id="endId" value="" style="width:213px;" placeholder="用户结束ID">&nbsp;&nbsp;
                </div>
                &nbsp;&nbsp;
                <div class="form-group">
                    <button type="button" class="btn btn-default" style="width: 100px;" id="inBtn" onclick="insetU()">添加</button>
                </div>
                &nbsp;&nbsp;
            </form>

        </div>
    </div>
</div>
</body>
</html>
