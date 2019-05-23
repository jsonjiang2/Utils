<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>管理员用户修改页面</title>
</head>
<body>
<div class="container">
    <form id="form" action="" method="post" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-3">
                <input type="text" id="username" readonly="readonly" class="form-control" value="${adminUser.username}" />
                <span id="usernameError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-3">
                <input type="text" name="fullname" id="fullname" class="form-control" value="${adminUser.fullname}" />
                <span id="fullnameError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">邮箱地址</label>
            <div class="col-sm-3">
                <input type="text" name="email" id="email" class="form-control" value="${adminUser.email}" />
                <span id="emailError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">电话</label>
            <div class="col-sm-3">
                <input type="text" name="mobile" id="mobile" class="form-control" value="${adminUser.mobile}" />
                <span id="mobileError" style="color:red"></span>
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label">u盾编号</label>
            <div class="col-sm-3">
                <input type="text" name="pin" id="pin" class="form-control" value="${adminUser.pin}" />
                <span id="pinError" style="color:red"></span>
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label">登录验证</label>
            <div class="col-sm-3">
                <select id="loginTye" name="loginTye" style="width: 230px;"
                        class="form-control">
                    <c:choose>
                        <c:when test="${adminUser.loginTye eq 1}">
                            <option value="1" selected="selected">u盾登录</option>
                            <option value="2">短信登录</option>
                        </c:when>
                        <c:when test="${adminUser.loginTye eq 2}">
                            <option value="1">u盾登录</option>
                            <option value="2" selected="selected">短信登录</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1" selected="selected">u盾登录</option>
                            <option value="2">短信登录</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">是否限制手机登录</label>
            <div class="col-sm-3">
                <select id="ismobilelogin" name="ismobilelogin" style="width: 230px;"
                        class="form-control">
                    <c:choose>
                        <c:when test="${adminUser.ismobilelogin eq 1}">
                            <option value="1" selected="selected">不限制</option>
                            <option value="0">限制</option>
                        </c:when>
                        <c:when test="${adminUser.ismobilelogin eq 0}">
                            <option value="1">不限制</option>
                            <option value="0" selected="selected">限制</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0" selected="selected">不限制</option>
                            <option value="1">限制</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
        </div>


       <%-- <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否限制手机登录：</label>
            <div class="col-sm-3">
                <c:if test="${adminUser.ismobilelogin eq 1}">
                    <select class="form-control" id="ismobilelogin" name="ismobilelogin" >
                        <option value="1" <c:if test="${adminUser.ismobilelogin eq 1}">selected="selected"</c:if>>不限制</option>
                        <option value="0" <c:if test="${adminUser.ismobilelogin eq 0}">selected="selected"</c:if>>限制</option>
                    </select>
                </c:if>
                <c:if test="${adminUser.ismobilelogin eq 2}">
                    <select class="form-control" id="ismobilelogin" name="ismobilelogin">
                        <option value="1" <c:if test="${adminUser.ismobilelogin eq 1}">selected="selected"</c:if>>不限制</option>
                        <option value="0" <c:if test="${adminUser.ismobilelogin eq 0}">selected="selected"</c:if>>限制</option>
                    </select>
                </c:if>
            </div>
        </div>--%>
        
        <div class="form-group">
            <label class="col-sm-2 control-label">限制IP</label>
            <div class="col-sm-3">
            	<c:choose>
	                <c:when test="${adminUser.ipRestrict eq 0}">
	                	<input type="radio" name="ipRestrict"  value="0" checked="checked"/>不限制
            			<input type="radio" name="ipRestrict"  value="1" />限制
            		</c:when>
            		<c:when test="${adminUser.ipRestrict eq 1}">
            			<input type="radio" name="ipRestrict"  value="0" />不限制
            			<input type="radio" name="ipRestrict"  value="1" checked="checked"/>限制
            		</c:when>
            		<c:otherwise>
            			<input type="radio" name="ipRestrict"  value="0" />不限制
            			<input type="radio" name="ipRestrict"  value="1" />限制
            		</c:otherwise>
	                
                </c:choose>
                <span id="ipRestrictError" style="color:red"></span>
                
            </div>
        </div>

        <div id="ipDiv" style="display:block">
		        <div class="form-group">
		            <label class="col-sm-2 control-label">限制IP1</label>
		            <div class="col-sm-3">
		                <input type="text" name="ip1" id="ip1" class="form-control" value="${adminUser.ip1}" />
		                <span id="ip1Error" style="color:red"></span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-sm-2 control-label">限制IP2</label>
		            <div class="col-sm-3">
		                <input type="text" name="ip2" id="ip2" class="form-control" value="${adminUser.ip2}" />
		                <span id="ip2Error" style="color:red"></span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-sm-2 control-label">限制IP3</label>
		            <div class="col-sm-3">
		                <input type="text" name="ip3" id="ip3" class="form-control" value="${adminUser.ip3}" />
		                <span id="ip3Error" style="color:red"></span>
		            </div>
		        </div>
	    </div>
		
        <div class="form-group">
            <label class="col-sm-2 control-label">禁止状态</label>
            <div class="col-sm-3">
                <select id="forbid" name="forbid" style="width: 230px;"
                        class="form-control">
                    <c:choose>
                        <c:when test="${adminUser.forbid eq 1}">
                            <option value="1" selected="selected">禁止登录</option>
                            <option value="0">允许登录</option>
                        </c:when>
                        <c:when test="${adminUser.forbid eq 0}">
                            <option value="1">禁止登录</option>
                            <option value="0" selected="selected">允许登录</option>
                        </c:when>
                        <c:otherwise>
                            <option value="" selected="selected">请选择状态</option>
                            <option value="1">禁止登录</option>
                            <option value="0">允许登录</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">错误次数</label>
            <div class="col-sm-3">
                <input type="text" name="errorcount" id="errorcount" class="form-control" value="${adminUser.errorcount}" />
                <span id="errorcountError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">短信发送次数</label>
            <div class="col-sm-3">
                <input type="text" name="smstimes" id="smstimes" class="form-control" value="${adminUser.smstimes}" />
                <span id="smstimesError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark" id="remark">${adminUser.remark}</textarea>
                <span id="remarkError" style="color:red"></span>
            </div>
        </div>
        <input type="hidden" name="id" value="${adminUser.id}"/>
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
                        message: "姓名不能为空"
                    }
                }
            },
            //支付通道名称
            email: {
                validators: {
                    notEmpty: {
                        message: "邮箱不能为空"
                    },
                    regexp:{
                        regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                        message: '邮箱格式不正确'
                    }
                }
            },
            mobile: {
                validators: {
                    notEmpty: {
                        message: "手机不能为空"
                    },
                    regexp: {
                        regexp: /^[1][3,4,5,7,8][0-9]{9}$/,
                        message: '手机格式不正确'
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

    $("#email").change(function(){
        $("#emailError").html("");
    });

    $("#mobile").change(function(){
        $("#mobileError").html("");
    });
</script>

</body>
</html>