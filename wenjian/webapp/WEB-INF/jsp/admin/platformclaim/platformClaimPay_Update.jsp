
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
    <form class="form-horizontal" role="form" id="pay_updateForm">
        <input type="hidden" name="id" id="id" value="${platformClaim.id}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
            <div class="col-sm-3">
                <input type="text" name="pname" id="pname" value="${platformClaim.pname}" readonly="readonly" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="status">认领状态</label>
            <div class="col-sm-3">
                <select name="status" id="status" class="form-control">
                    <option value="1" >待处理</option>
                    <option value="2" >待激活</option>
                    <option value="3" >已认领</option>
                    <option value="4" >认领失败</option>
                    <option value="5" >已撤销</option>
                    <option value="6" >打款失败</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="payamount">打款金额</label>
            <div class="col-sm-3">
                <input type="text" name="payamount" id="payamount" value="${platformClaim.payamount}"
                       placeholder="0-1之间的两位小数" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="remark">打款备注</label>
            <div class="col-sm-3">
                <input type="text" name="remark" id="remark" class="form-control" />
            </div>
        </div>

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
            payamount: {
                validators: {
                    notEmpty: {
                        message: "请输入打款金额"
                    },
                    stringLength: {
                        max: 4,
                        message: "请输入0-1之间的两位小数"
                    },
                    numeric:{
                        message: "该值只能包含数字"
                    },
                    greaterThan: {
                        value: 0.01,
                        message: "请输入0-1之间的小数"
                    },
                    lessThan: {
                        value: 0.99,
                        message: "请输入0-1之间的小数"
                    }
                }
            }
        }
    };

    $("#btn-update").click(function(){
        $("#pay_updateForm").bootstrapValidator(validate);
        var bv = $("#pay_updateForm").data("bootstrapValidator");
        bv.validate();
        if (bv.isValid()) {
            var action="/admin/platformClaim/upd";
            $.post(action,$("#pay_updateForm").serialize(),function(data){
                alert(data.meta.message);
                window.location.href="${pageContext.request.contextPath}/admin/platformClaim/payList";
            });
        }
    });
</script>

</body>
</html>
