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
    <!-- 注意文件的引入顺序 -->

</head>
<body>
<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form" id="insertTForm">
        <input type="hidden" id="rechargesetid" name="rechargesetid" value="${reid}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">支付公司类型：</label>
            <div class="col-sm-3">
                <select class="form-control" id="paycompanytype" name="paycompanytype">
                    <option value="">--请选择--</option>
                    <c:forEach items="${paymodes}" var="paymode">
                        <option value="${paymode.key}">${paymode.value}</option>
                    </c:forEach>
                </select>
                <span id="errorpaycompanytype" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">通道名称：</label>
            <div class="col-sm-3">
                <select class="form-control" id="banknameid" name="bankAndCode" onchange="fillCodeByBank(this)">
                    <option value="">--请选择--</option>
                    <option value="支付宝,AliPay">支付宝</option>
                    <option value="微信,WeChat">微信</option>
                </select>
                <span id="errorbankname" style="color:red"></span>
            </div>
        </div>

        <div class="form-group" style="display:none">
            <label class="col-sm-2 control-label">支付银行名称</label>
            <div class="col-sm-3">
                <input type="text" name="bankname" id="bankname" class="form-control" readonly/>
                <span id="banknameError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group" style="display:none">
            <label class="col-sm-2 control-label">支付银行编号</label>
            <div class="col-sm-3">
                <input type="text" name="bankcode" id="bankcode" class="form-control" readonly/>
                <span id="bankcodeError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">单笔最低充值额(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="lowamount" id="lowamount" onkeyup="checkNum(this)" class="form-control"/>
                <span id="errorlowamount" style="color:red;font-weight:bold;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">单笔最高充值额(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="highamount" id="highamount" onkeyup="checkNum(this)" class="form-control"/>
                <span id="errorhighamount" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">手续费类型：</label>
            <div class="col-sm-3">
                <label><input name="feetype" type="radio" id="feetype" value="1" checked="checked" />定额 </label>&nbsp;&nbsp;&nbsp;
                <label><input name="feetype" type="radio" id="feetype2" value="2" />百分比 </label>
                <span id="errorfeetype" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="feerate">充值定额(百分比)：</label>
            <div class="col-sm-2">
                <input type="text" name="feerate" id="feerate" class="form-control" onkeyup="checkNum(this)" />
                <span id="errorfeerate" style="color:red;font-weight:bold;"></span>
            </div>
            <div class="col-sm-1">
                <input type="text" id="danwei" value="元" class="form-control" disabled="disabled"/>
            </div>
        </div>

        <div class="form-group" id="minfeeDiv" hidden>
            <label class="col-sm-2 control-label laber_from">手续费最低(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="minfee" id="minfee" onkeyup="checkNum(this)" class="form-control"/>
                <span id="errorminfee" style="color:red;font-weight:bold;"></span>
            </div>
        </div>
        <div class="form-group" id="maxfeeDiv" hidden>
            <label class="col-sm-2 control-label laber_from">手续费最高(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="maxfee" id="maxfee" onkeyup="checkNum(this)" class="form-control"/>
                <span id="errormaxfee" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark"></textarea>
            </div>
        </div>

        <div class="form-group" style="margin-left: 11%">
            <span style="color: red">注意:1.已添加了的银行不可以重复添加。</span><br/>
            <span style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.当银行名称已存在所有银行时，就不可以添加其他任何银行。</span>
        </div>

    </form>
</div>

<script type="text/javascript">
    $(function(){
        $("#Modal").on("shown.bs.modal",function(){
            $("#insertTForm").bootstrapValidator({
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    paycompanytype:{
                        validators:{
                            notEmpty:{
                                message:"请选择支付公司"
                            },
                        }
                    },
                    bankAndCode:{
                        validators:{
                            notEmpty:{
                                message:"请选择银行名称"
                            },
                        }
                    },
                    lowamount:{
                        validators:{
                            notEmpty:{
                                message:"请输入单笔最低额"
                            },
                        }
                    },
                    highamount:{
                        validators:{
                            notEmpty:{
                                message:"请输入单笔最高额"
                            },
                        }
                    },
                    feetype:{
                        validators:{
                            notEmpty:{
                                message:"请输入手续费类型"
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
                                message:"请输入手续费最低额"
                            },
                        }
                    },
                    maxfee:{
                        validators:{
                            notEmpty:{
                                message:"请输入手续费最高额"
                            },
                        }
                    },
                }
            });
        });
    });

    //得到银行名称和银行编码
    function fillCodeByBank(t) {
        //获取银行名称bankname
        var bankname = $(t).val().split(",")[0];
        //获取银行编号bankcode
        var bankcode = $(t).val().split(",")[1];
        $("#bankname").val(bankname);
        $("#bankcode").val(bankcode);
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
</script>

</body>
</html>