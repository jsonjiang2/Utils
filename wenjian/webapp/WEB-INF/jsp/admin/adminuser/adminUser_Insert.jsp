<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>银行编码名称新增页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
</head>
<body>
<div class="container">
    <form id="form" action="" method="post" class="form-horizontal">


        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-3">
                <input type="text" name="username" id="username" class="form-control"/>
                <span id="usernameError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-3">
                <input type="text" name="email" id="email" class="form-control" />
                <span id="emailError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">密码</label>
            <div class="col-sm-3">
                <input type="text" name="password" id="password" class="form-control" />
                <span id="passwordError" style="color:red"></span>
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
            fullname: {
                validators: {
                    notEmpty: {
                        message: "全名不能为空"
                    }
                }
            },
            //支付通道名称
            email: {
                validators: {
                    notEmpty: {
                        message: "邮箱不能为空"
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
        $("#form").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#form").data("bootstrapValidator");
        //手动触发验证
        bv.validate();
        if(bv.isValid()){
            return true;
        }
    }
</script>
</body>
</html>