<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <style type="text/css">
        *{margin: 0px;padding: 0px;}
        .laber_from {color: #222;font-weight: normal;}
        .route_bg{ background-color: #E7E7E7; border-radius: 4px; padding: 5px; margin-right: 5px;margin-left: 5px;margin-top: 5px; }
        .route_bg i{ color: #ccc;font-weight: 400;font-size: 12px;padding-right: 5px;line-height: 25px; }
        .route_bg a{ font-size: 12px; color: #666; text-decoration: none;line-height: 1.6;font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif !important; }
        .route_bg a:hover{ color: #888; text-decoration: none;}
        hr{
            margin: 5px;
        }
    </style>


</head>
<body  style="font-family:'微软雅黑'; ">

<script type="text/javascript">

</script>


<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form" id="platformBackground_updateForm">
        <c:if test="${empty platformBackground}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty platformBackground}">
            <input type="hidden" name="id" value="${platformBackground.id}"/>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="background">平台背景</label>
                <div class="col-sm-3">
                    <select name="background" id="background" class="form-control">
                        <option value="1" <c:if test="${platformBackground.background eq '1'}">selected="selected"</c:if>>国资控股</option>
                        <option value="2" <c:if test="${platformBackground.background eq '2'}">selected="selected"</c:if>>国资参股</option>
                        <option value="3" <c:if test="${platformBackground.background eq '3'}">selected="selected"</c:if>>上市控股</option>
                        <option value="4" <c:if test="${platformBackground.background eq '4'}">selected="selected"</c:if>>上市参股</option>
                        <option value="5" <c:if test="${platformBackground.background eq '5'}">selected="selected"</c:if>>风投系</option>
                        <option value="6" <c:if test="${platformBackground.background eq '6'}">selected="selected"</c:if>>银行系</option>
                        <option value="7" <c:if test="${platformBackground.background eq '7'}">selected="selected"</c:if>>民营系</option>
                        <option value="8" <c:if test="${platformBackground.background eq '8'}">selected="selected"</c:if>>知名风投</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">背景说明</label>
                <div class="col-sm-3">
                    <textarea rows="3" class="form-control" name="backgrounddepict" id="backgrounddepict">${platformBackground.backgrounddepict}</textarea>
                    <span id="remarkError" style="color:red"></span>
                </div>
            </div>

        </c:if>
    </form>
</div>

<script>


</script>


</body>
</html>
