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
        $(function() {
            $("#Modal").on("shown.bs.modal",function(){
                $("#updateForm").bootstrapValidator({
                    icon: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        platformnum: {
                            validators: {
                                notEmpty: {
                                    message: "请输入平台名"
                                },
                            }
                        },
                        transferway: {
                            validators: {
                                notEmpty: {
                                    message: "请选择出让方式"
                                },
                            }
                        },
                        receptway: {
                            validators: {
                                notEmpty: {
                                    message: "请选择承接方式"
                                },
                            }
                        },
                        recordedway: {
                            validators: {
                                notEmpty: {
                                    message: "请选择入账方式"
                                },
                            }
                        },
                        transferfee: {
                            validators: {
                                notEmpty: {
                                    message: "请输入出让人手续费"
                                },

                            }
                        },
                        recepterfee: {
                            validators: {
                                notEmpty: {
                                    message: "请输入承接人手续费"
                                },

                            }
                        },
                        debtstatus: {
                            validators: {
                                notEmpty: {
                                    message: "请选择债转状态"
                                },

                            }
                        },
                    }
                });
            });
        });
        function findUserName() {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/platformDebtCessionSet/findByPlatformNum",
                data: {
                    platformnum: function () {
                        return $("#platformnumss").val();
                    }
                },
                success: function (data) {
                    document.getElementById('errorplatformnum').innerHTML = "";
                    if (data.false != undefined) {
                        document.getElementById('errorplatformnum').innerHTML = data.false;
                        document.getElementById('platformInfo').innerHTML ="";
                    } else if (data.true != undefined) {
                        document.getElementById('platformInfo').innerHTML = data.platformInfo.pname;
                        document.getElementById('errorplatformnum').innerHTML = "";
                    } else if (data.pnonull != undefined) {
                        document.getElementById('errorplatformnum').innerHTML = data.pnonull;
                        document.getElementById('platformInfo').innerHTML ="";
                    } else if (data.notexist != undefined) {
                        document.getElementById('errorplatformnum').innerHTML = data.notexist;
                        document.getElementById('platformInfo').innerHTML ="";
                    }
                }
            });
        }

        function checkNum(obj){
            //处理第一个字符是小数点的情况.
            if (obj.value != '' && obj.value.substr(0, 1) == '.') {
                obj.value = "";
            }
            obj.value = obj.value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符
            obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
            obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");//禁止输入33.3.3.3
            obj.value = obj.value.replace(/^(\-)*(\d+)\d*\.(\d\d).*$/, '$1$2.$3');//只能输入两位小数
            if (obj.value.indexOf(".") < 0 && obj.value != "") {//如果没有小数点，首位不能为类似于 01、02的金额
                if (obj.value.substr(0, 1) == '0' && obj.value.length == 2) {
                    obj.value = obj.value.substr(1, obj.value.length);
                }
            }
        }



    </script>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="updateForm">
        <input type="hidden" name="id" id="id" value="${platformDebtCessionSet.id}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="platformnumss">平台编号：</label>
            <div class="col-sm-3">
                <input type="text" name="platformnum" id="platformnumss" class="form-control" value="${platformDebtCessionSet.platformnum}" onblur="findUserName();"/>
                <span id="platformInfo" style="color:red;font-weight:bold;"></span>
                <span id="errorplatformnum" style="color:red;font-weight:bold;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">出让方式：</label>
            <div class="col-sm-3">
                <select class="form-control" id="transferwayId" name="transferway">
                    <option value="">--选择出让方式--</option>
                    <option value="1" <c:if test="${platformDebtCessionSet.transferway eq 1}">selected="selected"</c:if>>部分</option>
                    <option value="2" <c:if test="${platformDebtCessionSet.transferway eq 2}">selected="selected"</c:if>>全额</option>
                </select>
                <span id="errortransferway" style="color:red;font-weight:bold;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">承接方式：</label>
            <div class="col-sm-3">
                <select class="form-control" id="receptwayId" name="receptway">
                    <option value="">--选择承接方式--</option>
                    <option value="1" <c:if test="${platformDebtCessionSet.receptway eq 1}">selected="selected"</c:if>>部分</option>
                    <option value="2" <c:if test="${platformDebtCessionSet.receptway eq 2}">selected="selected"</c:if>>全额</option>
                </select>
                <span id="errorreceptway" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">折扣范围：</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="discountmin"
                       placeholder="填写最小折扣" onblur="checkNum(this)"
                       onkeyup="clearNoNum(event,this)" value="${platformDebtCessionSet.discountmin*100}"
                       style="text-align: center; width: 150px; line-height: 18px;display: inline;"/>
                -
                <input type="text" class="form-control" name="discountmax"
                       placeholder="填写最大折扣" onblur="checkNum(this)"
                       onkeyup="clearNoNum(event,this)"value="${platformDebtCessionSet.discountmax*100}"
                       style="text-align: center; width: 150px; line-height: 18px;display: inline;"/>
                <span id="errordiscountmax" style="color:red;font-weight:bold;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">入账方式：</label>
            <div class="col-sm-3">
                <select class="form-control" id="recordedwayId" name="recordedway">
                    <option value="">--选择承接方式--</option>
                    <option value="1" <c:if test="${platformDebtCessionSet.recordedway eq 1}">selected="selected"</c:if>>部分</option>
                    <option value="2" <c:if test="${platformDebtCessionSet.recordedway eq 2}">selected="selected"</c:if>>全额</option>
                </select>
                <span id="errorrecordedway" style="color:red;font-weight:bold;"></span>
            </div>
        </div>
        <div class="form-group" id="minfeeDiv" >
            <label class="col-sm-2 control-label laber_from">出让人手续费率：</label>
            <div class="col-sm-3">
                <input type="text" name="transferfee" id="transferfeeId" onkeyup="checkNum(this)" value="<fmt:formatNumber value="${platformDebtCessionSet.transferfee *100}" pattern="0.00" maxFractionDigits="2"/> "class="form-control" />
                <span id="errortransferfee" style="color:red;font-weight:bold;"></span>
            </div>
            <div class="col-sm-1">
                <input type="text" id="danwei1" value="%" class="form-control" disabled="disabled"/>
            </div>
        </div>
        <div class="form-group" id="maxfeeDiv" >
            <label class="col-sm-2 control-label laber_from">承接人手续费率：</label>
            <div class="col-sm-3">
                <input type="text" name="recepterfee" id="recepterfeeId"  onkeyup="checkNum(this)" class="form-control" value="<fmt:formatNumber value="${platformDebtCessionSet.recepterfee *100}" pattern="0.00" maxFractionDigits="2"/> "/>
                <span id="errorrecepterfee" style="color:red;font-weight:bold;"></span>
            </div>
            <div class="col-sm-1">
                <input type="text" id="danwei2" value="%" class="form-control" disabled="disabled"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">债转状态：</label>
            <div class="col-sm-3">
                <select class="form-control" id="debtstatusId" name="debtstatus">
                    <option value="">--选择债转状态--</option>
                    <option value="1" <c:if test="${platformDebtCessionSet.debtstatus eq 1}">selected="selected"</c:if>>开启</option>
                    <option value="2" <c:if test="${platformDebtCessionSet.debtstatus eq 2}">selected="selected"</c:if>>关闭</option>
                </select>
                <span id="errordebtstatus" style="color:red;font-weight:bold;"></span>
            </div>
        </div>
        <div class="form-group">
            <label id="remarke" class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark">${platformDebtCessionSet.remark}</textarea>
            </div>
        </div>
        <div class="form-group" style="margin-left: 11%">
            <span style="color: red">注意:1.修改平台编号必须为已存在。</span><br/>
        </div>
    </form>
</div>

</body>
</html>
