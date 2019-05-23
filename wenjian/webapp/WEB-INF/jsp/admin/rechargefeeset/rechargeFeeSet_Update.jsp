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
                        lowamount:{
                            validators:{
                                notEmpty:{
                                    message:"请输入单笔最低充值额"
                                },
                            }
                        },
                        highamount:{
                            validators:{
                                notEmpty:{
                                    message:"请输入单笔最高充值额"
                                },
                            }
                        },
                        feerate:{
                            validators:{
                                notEmpty:{
                                    message:"请输入充值定额"
                                },
                            }
                        },
                        minfee:{
                            validators:{
                                notEmpty:{
                                    message:"请输入手续费最低"
                                },
                            }
                        },
                        maxfee:{
                            validators:{
                                notEmpty:{
                                    message:"请输入手续费最高"
                                },
                            }
                        },
                    }
                });
            });
        });

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

        //根据手续费类型，填写不同的内容
        $("#feetype").click(function(){
            $("#minfeeDiv").hide();
            $("#maxfeeDiv").hide();
        });
        $("#feetype3").click(function(){
            $("#minfeeDiv").hide();
            $("#maxfeeDiv").hide();
        });
        $("#feetype2").click(function(){
            $("#minfeeDiv").show();
            $("#maxfeeDiv").show();
        });
        $("#feetype4").click(function(){
            $("#minfeeDiv").show();
            $("#maxfeeDiv").show();
        });

        //手续费类型---等额时
        var feeTypese = $("#feetypese").val();
        if(feeTypese == 1){
            $("#minfeeDiv").hide();
            $("#maxfeeDiv").hide();
        }

        /*if($('#feetype').is(':checked')){
         $("#minfeeDiv").hide();
         $("#maxfeeDiv").hide();
         }*/

        //根据手续费类型，填写不同的内容
        $("#feetype").click(function(){
            $("#danwei").val("元");
            $("#minfeeDiv").hide();
            $("#maxfeeDiv").hide();
        });
        $("#feetype2").click(function(){
            $("#danwei").val("%");
            $("#minfeeDiv").show();
            $("#maxfeeDiv").show();
        });
        $("#feetype3").click(function(){
            $("#danwei2").val("元");
            $("#minfeeDiv").hide();
            $("#maxfeeDiv").hide();
        });
        $("#feetype4").click(function(){
            $("#danwei2").val("%");
            $("#minfeeDiv").show();
            $("#maxfeeDiv").show();
        });
    </script>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="updateForm">
        <input type="hidden" name="id" id="id" value="${rechargeFeeSet.id}"/>
        <input type="hidden" id="feetypese" value="${rechargeFeeSet.feetype}"/>
        <input type="hidden" id="rechargesetid" name="rechargesetid" value="${reid}"/>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">支付公司类型：</label>
            <div class="col-sm-3">
                <c:if test="${rechargeFeeSet.paycompanytype eq 1}">
                    <input value="双乾" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="paycompanytype" id="paycompanytype" value="1" class="form-control" />
                </c:if>
                <span id="errorpaycompanytype" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <c:choose>
                <c:when test="${rechargeFeeSet.bankname == '微信' or rechargeFeeSet.bankname == '支付宝'}">
                    <label class="col-sm-2 control-label laber_from" for="banknameid">通道名称：</label>
                </c:when>
                <c:otherwise>
                    <label class="col-sm-2 control-label laber_from" for="banknameid">银行名称：</label>
                </c:otherwise>
            </c:choose>
            <div class="col-sm-3">
                <input type="text" name="bankname" id="banknameid" class="form-control" value="${rechargeFeeSet.bankname}" disabled="disabled"/>
                <input type="hidden" name="bankname" id="bankname" value="${rechargeFeeSet.bankname}" class="form-control" />
                <span id="errorbankname" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">单笔最低充值额(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="lowamount" id="lowamount" onkeyup="checkNum(this)" class="form-control" value="${rechargeFeeSet.lowamount}"/>
                <span id="lowamountError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">单笔最高充值额(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="highamount" id="highamount" onkeyup="checkNum(this)" class="form-control" value="${rechargeFeeSet.highamount}"/>
                <span id="highamountError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">手续费类型：</label>
            <div class="col-sm-3">
                <input type="hidden" id="feetypeHidden" value="${rechargeFeeSet.bankname}"/>
                <c:if test="${rechargeFeeSet.feetype == 1}">
                    <label style="font-size:12px"><input name="feetype" type="radio" id="feetype" value="1" checked="checked" style="width:15px;height:15px"/>定额 </label>&nbsp;&nbsp;&nbsp;
                    <label style="font-size:12px"><input name="feetype" type="radio" id="feetype2" value="2" style="width:15px;height:15px"/>百分比 </label>
                </c:if>
                <c:if test="${rechargeFeeSet.feetype == 2}">
                    <label style="font-size:12px"><input name="feetype" type="radio" id="feetype3" value="1" style="width:15px;height:15px"/>定额 </label>&nbsp;&nbsp;&nbsp;
                    <label style="font-size:12px"><input name="feetype" type="radio" id="feetype4" value="2" checked="checked" style="width:15px;height:15px"/>百分比 </label>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">充值定额(百分比)：</label>
            <div class="col-sm-2">
                <c:if test="${rechargeFeeSet.feetype eq 1}">
                    <input type="text" name="feerate" id="feerate" onkeyup="checkNum(this)" class="form-control" value="${rechargeFeeSet.feerate}"/>
                </c:if>
                <c:if test="${rechargeFeeSet.feetype eq 2}">
                    <input type="text" name="feerate" id="feerate" onkeyup="checkNum(this)" class="form-control" value="${rechargeFeeSet.feerate}"/>
                </c:if>
                <span id="feerateError" style="color:red"></span>
            </div>
            <div class="col-sm-1">
                <c:if test="${rechargeFeeSet.feetype eq 1}">
                    <input type="text" id="danwei"  value="元" class="form-control" disabled="disabled"/>
                </c:if>
                <c:if test="${rechargeFeeSet.feetype eq 2}">
                    <input type="text" id="danwei2" value="%" class="form-control" disabled="disabled"/>
                </c:if>
            </div>
        </div>

        <div class="form-group" id="minfeeDiv">
            <label class="col-sm-2 control-label laber_from">手续费最低(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="minfee" id="minfee" onkeyup="checkNum(this)" class="form-control" value="${rechargeFeeSet.minfee}"/>
                <span id="minfeeError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group" id="maxfeeDiv">
            <label class="col-sm-2 control-label laber_from">手续费最高(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="maxfee" id="maxfee" onkeyup="checkNum(this)" class="form-control" value="${rechargeFeeSet.maxfee}"/>
                <span id="maxfeeError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label id="remarke" class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark">${rechargeFeeSet.remark}</textarea>
            </div>
        </div>
        <div class="form-group" style="margin-left: 11%">
            <span style="color: red">注意:1.已添加了的银行不可以重复添加。</span><br/>
            <span style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.当银行名称已存在所有银行时，就不可以添加其他任何银行。</span>
        </div>
    </form>
</div>

</body>
</html>
