<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>银行编码名称新增页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
</head>
<body>
<div class="container">
    <form id="insertForm" action="" method="post" class="form-horizontal">


        <div class="form-group">
            <label class="col-sm-2 control-label">银行名称</label>
            <div class="col-sm-3">
                <input type="text" name="bankname" id="bankname" class="form-control"/>
                <span id="banknameError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">银行编码</label>
            <div class="col-sm-3">
                <input type="text" name="bankcode" id="bankcode" class="form-control" />
                <span id="bankcodeError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark" id="remark"></textarea>
                <span id="remarkError" style="color:red"></span>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    //验证
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            //支付通道编号
            bankcode: {
                validators: {
                    notEmpty: {
                        message: "银行编码不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"银行编码长度不能大于100"
                    }
                }
            },
            //支付通道名称
            bankname: {
                validators: {
                    notEmpty: {
                        message: "银行名称不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"银行名称长度不能大于100"
                    }
                }
            },
            //备注
            remark: {
                validators: {
                    stringLength:{
                        max:1000,
                        message:"备注长度不能大于1000"
                    }
                }
            }
        }
    };

    //客户端验证
    function checkForm() {

        //给表单字段定义验证规则
        $("#insertForm").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#insertForm").data("bootstrapValidator");
        //手动触发验证
        bv.validate();
        if(bv.isValid()){
            return true;
        }
    }
</script>
</body>
</html>