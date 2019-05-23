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
    <form class="form-horizontal" role="form" id="platformManage_updateForm">
        <c:if test="${empty platformManageVO}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty platformManageVO}">
            <input type="hidden" name="id" id="id" value="${platformManageVO.id}"/>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="operatingstatus">运营状态</label>
                <div class="col-sm-3">
                    <select name="operatingstatus" id="operatingstatus" class="form-control">
                        <option value="1" <c:if test="${platformManageVO.operatingstatus eq '1'}">selected="selected"</c:if>>正常</option>
                        <option value="2" <c:if test="${platformManageVO.operatingstatus eq '2'}">selected="selected"</c:if>>跑路</option>
                        <option value="3" <c:if test="${platformManageVO.operatingstatus eq '3'}">selected="selected"</c:if>>清盘</option>
                        <option value="4" <c:if test="${platformManageVO.operatingstatus eq '4'}">selected="selected"</c:if>>高风险</option>
                        <option value="5" <c:if test="${platformManageVO.operatingstatus eq '5'}">selected="selected"</c:if>>有争议</option>
                        <option value="6" <c:if test="${platformManageVO.operatingstatus eq '6'}">selected="selected"</c:if>>延期兑付</option>
                        <option value="7" <c:if test="${platformManageVO.operatingstatus eq '7'}">selected="selected"</c:if>>停业</option>
                        <option value="8" <c:if test="${platformManageVO.operatingstatus eq '8'}">selected="selected"</c:if>>经侦介入</option>
                        <option value="9" <c:if test="${platformManageVO.operatingstatus eq '9'}">selected="selected"</c:if>>提现困难</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="investidea">投资建议</label>
                <div class="col-sm-3">
                    <select name="investidea" id="investidea" class="form-control">
                        <option value="0">请选择</option>
                        <option value="1" <c:if test="${platformManageVO.investidea eq '1'}">selected="selected"</c:if>>不宜投资</option>
                        <option value="2" <c:if test="${platformManageVO.investidea eq '2'}">selected="selected"</c:if>>建议投资</option>
                        <option value="3" <c:if test="${platformManageVO.investidea eq '3'}">selected="selected"</c:if>>警方介入</option>
                        <option value="4" <c:if test="${platformManageVO.investidea eq '4'}">selected="selected"</c:if>>已跑路</option>
                        <option value="5" <c:if test="${platformManageVO.investidea eq '5'}">selected="selected"</c:if>>有争议</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="remark">管理员备注</label>
                <div class="col-sm-3">
                    <input type="text" name="remark" id="remark" value="${platformManageVO.remark}" class="form-control" />
                </div>
            </div>

        </c:if>
    </form>
</div>

<script type="text/javascript">
    $("#btn-update").click(function(){
        var action="/admin/platformInfo/updManage";
        $.post(action,$("#platformManage_updateForm").serialize(),function(data){
            alert(data.meta.message);
            window.location.href="${pageContext.request.contextPath}/admin/platformInfo/manageList";
        });
    });
</script>

</body>
</html>
