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
    <form class="form-horizontal" role="form" id="platformInfoPicture_updateForm">
        <c:if test="${empty platformInfoPicture}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty platformInfoPicture}">
            <input type="hidden" name="id" value="${platformInfoPicture.id}"/>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="display">前端是否显示</label>
                <div class="col-sm-3">
                    <select name="display" id="display" class="form-control">
                        <option value="0" <c:if test="${platformInfoPicture.display eq '0'}">selected="selected"</c:if>>不显示</option>
                        <option value="1" <c:if test="${platformInfoPicture.display eq '1'}">selected="selected"</c:if>>显示</option>
                    </select>
                </div>
            </div>


        </c:if>
    </form>
</div>

</body>
</html>
