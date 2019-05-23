<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>短信通道管理新增页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>
</head>
<body>
<div class="container">
    <form id="form" action="" method="post" class="form-horizontal">
        <input type="hidden" name="formtoken" id="formTokenId" value="${formtoken}"/>

        <div class="form-group">
            <label class="col-sm-2 control-label">短信接口名称</label>
            <div class="col-sm-3">
                <input type="text" name="smscname" id="smscname" class="form-control"/>
                <span id="smscnameError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">短信接口公司</label>
            <div class="col-sm-3">
                <input type="text" name="smsccompany" id="smsccompany" class="form-control"/>
                <span id="smsccompanyError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">短信接口版本</label>
            <div class="col-sm-3">
                <input type="text" name="smsvertion" id="smsvertion" class="form-control"/>
                <span id="smsvertionError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">短信接口URL</label>
            <div class="col-sm-3">
                <input type="text" name="smsurl" id="smsurl" class="form-control"/>
                <span id="smsurlError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">软件序列号</label>
            <div class="col-sm-3">
                <input type="text" name="serialno" id="serialno" class="form-control"/>
                <span id="serialnoError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">短信终端标识</label>
            <div class="col-sm-3">
                <input type="text" name="keyno" id="keyno" class="form-control"/>
                <span id="keynoError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">终端密码</label>
            <div class="col-sm-3">
                <input type="text" name="pass" id="pass" class="form-control"/>
                <span id="passError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">标识信息</label>
            <div class="col-sm-3">
                <input type="text" name="action" id="action" class="form-control"/>
                <span id="actionError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">扩展号</label>
            <div class="col-sm-3">
                <input type="text" name="extno" id="extno" class="form-control"/>
                <span id="extnoError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">平台登录名</label>
            <div class="col-sm-3">
                <input type="text" name="pusername" id="pusername" class="form-control"/>
                <span id="pusernameError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">登录密码</label>
            <div class="col-sm-3">
                <input type="text" name="ppassword" id="ppassword" class="form-control"/>
                <span id="ppasswordError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">是否可使用</label>
            <div class="col-sm-3">
                <select name="isuse" id="isuse" class="form-control">
                    <option value="">请选择</option>
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
                <span id="isuseError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">通道注册详情</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="channelremark" id="channelremark"></textarea>
                <span id="channelremarkError" style="color:red"></span>
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

            //短信接口编号
            smscno: {
                validators: {
                    notEmpty: {
                        message: "短信接口编号不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"短信接口编号长度不能大于50"
                    }
                }
            },
            //短信接口名称
            smscname: {
                validators: {
                    notEmpty: {
                        message: "短信接口名称不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"短信接口名称长度不能大于50"
                    }
                }
            },
            //短信接口公司
            smsccompany: {
                validators: {
                    notEmpty: {
                        message: "短信接口公司不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"短信接口公司长度不能大于50"
                    }
                }
            },
            //短信接口版本
            smsvertion: {
                validators: {
                    notEmpty: {
                        message: "短信接口版本不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"短信接口版本长度不能大于50"
                    }
                }
            },
            //短信接口URL
            smsurl: {
                validators: {
                    notEmpty: {
                        message: "短信接口URL不能为空"
                    },
                    stringLength:{
                        max:200,
                        message:"短信接口URL长度不能大于200"
                    }
                }
            },
            //软件序列号
            serialno: {
                validators: {
                    notEmpty: {
                        message: "软件序列号不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"软件序列号长度不能大于50"
                    }
                }
            },
            //短信终端标识
            keyno: {
                validators: {
                    notEmpty: {
                        message: "短信终端标识不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"短信终端标识长度不能大于50"
                    }
                }
            },
            //终端密码
            pass: {
                validators: {
                    notEmpty: {
                        message: "终端密码不能为空"
                    },
                    stringLength:{
                        max:100,
                        message:"终端密码长度不能大于100"
                    }
                }
            },
            //标识信息
            action: {
                validators: {
                    notEmpty: {
                        message: "标识信息不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"标识信息长度不能大于50"
                    }
                }
            },
            //扩展号
            extno: {
                validators: {
                    notEmpty: {
                        message: "扩展号不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"扩展号长度不能大于50"
                    }
                }
            },
            //平台登录名
            pusername: {
                validators: {
                    notEmpty: {
                        message: "平台登录名不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"平台登录名长度不能大于50"
                    }
                }
            },
            //登录密码
            ppassword: {
                validators: {
                    notEmpty: {
                        message: "登录密码不能为空"
                    },
                    stringLength:{
                        max:50,
                        message:"登录密码长度不能大于50"
                    }
                }
            },
            //是否开通
            isuse: {
                validators: {
                    notEmpty: {
                        message: "是否开通不能为空"
                    },
                    between:{
                        max:1,
                        min:0
                    }
                }
            },

            //通道注册详情
            channelremark: {
                validators: {
                    stringLength:{
                        max:2000,
                        message:"备注长度不能大于2000"
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