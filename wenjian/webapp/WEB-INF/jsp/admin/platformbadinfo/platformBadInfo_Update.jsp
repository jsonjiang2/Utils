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
    <form class="form-horizontal" role="form"  id="platformBadInfo_updateForm">
        <c:if test="${empty platformBadInfo}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty platformBadInfo}">
            <input type="hidden" name="id" value="${platformBadInfo.id}"/>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="title">标题</label>
                <div class="col-sm-3">
                    <input type="text" name="title" id="title" value="${platformBadInfo.title}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="badlink">负面链接</label>
                <div class="col-sm-3">
                    <input type="text" name="badlink" id="badlink" value="${platformBadInfo.badlink}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="status">页面显示</label>
                <div class="col-sm-3">
                    <select name="status" id="status" class="form-control">
                        <option value="0" <c:if test="${platformBadInfo.status eq '0'}">selected="selected"</c:if>>不显示</option>
                        <option value="1" <c:if test="${platformBadInfo.status eq '1'}">selected="selected"</c:if>>显示</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="elitestatus">精华状态</label>
                <div class="col-sm-3">
                    <select name="elitestatus" id="elitestatus" class="form-control">
                        <option value="0" <c:if test="${platformBadInfo.elitestatus eq '0'}">selected="selected"</c:if>>普通</option>
                        <option value="1" <c:if test="${platformBadInfo.elitestatus eq '1'}">selected="selected"</c:if>>精华</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="clearstatus">澄清状态</label>
                <div class="col-sm-3">
                    <select name="clearstatus" id="clearstatus" class="form-control">
                        <option value="0" <c:if test="${platformBadInfo.clearstatus eq '0'}">selected="selected"</c:if>>未澄清</option>
                        <option value="1" <c:if test="${platformBadInfo.clearstatus eq '1'}">selected="selected"</c:if>>已澄清</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="remark">备注</label>
                <div class="col-sm-3">
                    <input type="text" name="remark" id="remark" value="${platformBadInfo.remark}" class="form-control" />
                </div>
            </div>

        </c:if>
    </form>
</div>

<script type="text/javascript">
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            title: {
                validators: {
                    notEmpty: {
                        message: "请输入标题"
                    }
                }
            },
            badlink: {
                validators: {
                    notEmpty: {
                        message: "请输入负面链接"
                    }
                }
            }

        }
    };

    $("#btn-update").click(function(){
        $("#platformBadInfo_updateForm").bootstrapValidator(validate);
        var bv = $("#platformBadInfo_updateForm").data("bootstrapValidator");
        bv.validate();
        if (bv.isValid()) {
            var action="/admin/platformBadInfo/update";
            $.post(action,$("#platformBadInfo_updateForm").serialize(),function(data){
                alert(data.meta.message);
                window.location.href="${pageContext.request.contextPath}/admin/platformBadInfo/lists";
            });
        }
    });

</script>

</body>
</html>
