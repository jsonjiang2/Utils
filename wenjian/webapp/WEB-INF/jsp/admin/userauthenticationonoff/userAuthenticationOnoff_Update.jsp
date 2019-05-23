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
    <script type="text/javascript">
        //修改数据校验
        $(function(){
            $("#Modal").on("shown.bs.modal",function(){
                $("#updateForm").bootstrapValidator({
                    icon: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields:{
                        name:{
                            validators:{
                                notEmpty:{
                                    message:"请输入接口名称"
                                },
                            }
                        },
                        company:{
                            validators:{
                                notEmpty:{
                                    message:"请输入接口公司"
                                },
                            }
                        }
                    }
                });
            });
        });

    </script>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="updateForm">
        <input type="hidden" name="id" id="id" value="${userAuthenticationOnoff.id}"/>
        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">接口名称：</label>
            <div class="col-sm-3">
                <input type="text" name="name" id="nameD" disabled="disabled" value="${userAuthenticationOnoff.name}" class="form-control"/>
                <input type="hidden" name="name" id="name" value="${userAuthenticationOnoff.name}" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">认证类型：</label>
            <div class="col-sm-3">
                <input value="${userAuthenticationOnoff.type}" type="hidden" class="form-control" name="type"/>
                <c:if test="${userAuthenticationOnoff.type eq 1}">
                    <input value="实名" disabled="disabled" class="form-control"/>
                </c:if>
                <c:if test="${userAuthenticationOnoff.type eq 2}">
                    <input value="银行卡4要素" disabled="disabled" class="form-control"/>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">接口公司：</label>
            <div class="col-sm-3">
                <input type="text" name="company" id="companyD" disabled="disabled" value="${userAuthenticationOnoff.company}" class="form-control"/>
                <input type="hidden" name="company" id="company" value="${userAuthenticationOnoff.company}" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否开启：</label>
            <div class="col-sm-3">
                <select class="form-control" id="isuse" name="isuse">
                    <option value="1" <c:if test="${userAuthenticationOnoff.isuse eq 1}">selected="selected"</c:if>>开</option>
                    <option value="0" <c:if test="${userAuthenticationOnoff.isuse eq 0}">selected="selected"</c:if>>关</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label id="remarke" class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark">${userAuthenticationOnoff.remark}</textarea>
            </div>
        </div>
    </form>
</div>

</body>
</html>
