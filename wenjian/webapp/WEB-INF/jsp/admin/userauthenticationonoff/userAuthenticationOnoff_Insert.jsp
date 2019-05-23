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
<body>
<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="userAuthenticationOnoff_insertForm">

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="type">接口名称</label>
            <div class="col-sm-3">
                <select name="name" class="form-control" id="name">
                    <option value="实名认证">实名认证</option>
                    <option value="银行卡四要素">银行卡四要素</option>
                </select>
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">认证类型</label>
            <div class="col-sm-3">
                <select name="type" class="form-control" id="type">
                    <option value="1">实名</option>
                    <option value="2">银行卡四要素</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="type">接口公司</label>
            <div class="col-sm-3">
                <select name="company" class="form-control" id="company">
                    <option value="亿美">亿美</option>
                    <option value="云亿互通">云亿互通</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="type">是否启用</label>
            <div class="col-sm-3">
                <select name="isuse" class="form-control" id="isuse">
                    <option value="0">关闭</option>
                    <!-- <option value="1">启用</option> -->
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">备注</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark"></textarea>
            </div>
        </div>

    </form>
</div>
</body>
</html>