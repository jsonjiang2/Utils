<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <title>网贷巴士注册页面</title>
    <style>
        .box {
            width: 100%;
            height: 100%;
        }

        .box .register-box {
            width: 100%;
            max-width: 500px;
            margin: 180px auto;
        }

        .box .register-box .register-title {
            height: 45px;
            background: #666;
        }

        .box .register-box .register-title h1 {
            line-height: 45px;
            font-size: 16px;
            color: #fff;
            font-family: "宋体" !important;
        }

        .box .register-box .register-title small {
            line-height: 45px;
            font-size: 16px;
            color: #fff;
            font-family: "宋体" !important;
        }

        .box .register-content {
            border: 1px solid #666;
            width: 100%;
            height: 580px;
        }

        .box .register-content form {
            width: 100%;
            max-width: 500px;
            height: 275px;
            margin: 10px auto 0px auto;
            padding-top: 25px;
        }

        .input-group {
            margin: 0px 0px 30px 0px !important;
        }
    </style>
</head>
<body>
<div class="box">
    <div class="register-box">
        <div class="register-title text-center">
            <h1>
                <small>注册用户</small>
            </h1>
        </div>
        <div class="register-content ">
            <div class="form">
                <form id="gj_user_register">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-user"></span></span>
                                <input type="text" id="username" name="username" class="form-control"  placeholder="请输入用户名"/>
                                <font color="green"
                                      id="font_username"
                                      style="position: absolute; top: 8px; right: 20px; z-index: 2; font-size: 22px;"></font>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-user"></span></span> <input type="text" id="fullname" name="fullname" class="form-control" placeholder="请输入姓名">
                                <font color="green"
                                      id="font_fullname"
                                      style="position: absolute; top: 8px; right: 20px; z-index: 2; font-size: 22px;"></font>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-record"></span></span> <input type="text" id="email" name="email" class="form-control" placeholder="请输入邮箱账号">
                                <font color="green"
                                      id="font_email"
                                      style="position: absolute; top: 8px; right: 20px; z-index: 2; font-size: 22px;"></font>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-phone"></span></span> <input
                                    type="text" id="mobile" name="password"
                                    class="form-control" placeholder="请输入手机号码">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-lock"></span></span> <input
                                    type="password" id="password" name="password"
                                    class="form-control" placeholder="请输入密码">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-lock"></span></span> <input
                                    type="password" id="password1" name="password1"
                                    class="form-control" placeholder="请再次输入密码">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-actions">
                        <div class="col-xs-4 col-xs-offset-5 ">
                            <button type="button" class="btn btn-sm btn-info"
                                    onclick="gj_register(this)" id="register">
                                <span class="glyphicon glyphicon-off"></span>注册用户
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin">
                                <small>忘记密码？</small>
                                <a href="${basePath}/admin/forget">
                                    <small>找回</small>
                                </a>
                            </p>
                        </div>
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin">
                                <small>已经注册?</small>
                                <a href="${basePath}/login">
                                    <small>登录</small>
                                </a>
                            </p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        //查询用户名是否存在
        $("#username").blur(function () {
            var username = $("#username").val();
            var length = username.length;
            if (length >= 40) {
                $("#username").select();
                loading("你输入的名字字数超过40字限制", 4);
                return false;
            }
            var params = {"username": username};
            var action = basePath + "/getbyuser.action";
            $.post(action, params, username_callback);
        });

        $("#fullname").blur(function () {
            var fullname = $("#fullname").val();
            var length = fullname.length;
            if (length >= 20) {
                $("#fullname").select();
                loading("你输入的名字字数超过20字限制", 4);
                return false;
            }
        });

        //按回车保存
        $(document).keydown(function (e) {
            if (e.keyCode == 13) {
                gj_register();
            }
        });


    });
    //注册
    function gj_register(obj) {
        var username = $("#username").val();
        var fullname = $("#fullname").val();
        var mobile = $("#mobile").val();
        var email = $("#email").val();
        var password = $("#password").val();
        var password1 = $("#password1").val();
        var length = username.length;
        if (isEmpty(username)) {
            loading("请输入用户名", 4);
            return false;
        }
        if (isEmpty(fullname)) {
            loading("请输入姓名", 4);
            return false;
        }
        if (length >= 40) {
            $("#username").select();
            loading("你输入的名字字数超过40字限制", 4);
            return false;
        }
        if (isEmpty(email)) {
            loading("请输入邮箱", 4);
            return false;
        } else {
            if (!isEmail(email)) {
                loading("您输入的邮箱格式不正确", 4);
                return false;
            }
        }

        if(isEmpty(mobile)){
            loading("请输入手机号码", 4);
            return false;
        }else if(!isMobile(mobile)){
            loading("您输入的手机格式不正确", 4);
            return false;
        }

        if (isEmpty(password)) {
            loading("请输入密码", 4);
            return false;
        }

        if (isEmpty(password1)) {
            loading("请再次输入密码", 4);
            return false;
        }

        if (isNotEmpty(password) && isNotEmpty(password1) && password != password1) {
            loading("两次输入密码不一致", 4);
            return false;
        }
        var params = {"username": username, "password": password, "email": email,
        "mobile":mobile,"fullname":fullname};
        var action = basePath + "/register";
        $(obj).removeAttr("onclick").text("保存中...");
        $.ajax({
            type: "post",
            url: action,
            data: params,
            error: function () {
                $("#register").attr("onclick", "gj_register(this)").text("保存");
            },
            success: function (data) {
                $("#register").attr("onclick", "gj_register(this)").text("保存");
                var obj = $.parseJSON(data);
                if (obj.result == "success") {
                    loading("注册成功...", 10);
                    setTimeout(function () {
                        window.top.location = basePath + "/admin/login.action";
                    }, 2000);
                } else if (obj.result == "account_error") {
                    loading("你的用户名已经注册过了", 4);
                }else if (obj.result == "email_error") {
                    loading("你的邮箱已经注册过了", 4);
                }else if (obj.result == "mobile_error") {
                    loading("你的手机已经注册过了", 4);
                }

            }
        });
    }

    //查询邮箱回调函数
    function email_callback(data) {
        var obj = $.parseJSON(data);
        if (obj.result == "success") {
            $("#font_email").css("color", "green").text("√");
        } else if (obj.result == "fail") {
            $("#email").select();
            $("#font_email").css("color", "red").text("×");
            loading("你输入的邮箱已经注册了", 4);
        }
    }

    //查询用户名回调函数
    function username_callback(data) {
        var obj = $.parseJSON(data);
        if (obj.result == "success") {
            $("#font_username").css("color", "green").text("√");
        } else if (obj.result == "fail") {
            $("#username").select();
            $("#font_username").css("color", "red").text("×");
            loading("你输入的用户名已经注册", 4);

        }
    }

    //验证邮箱
    function isEmail(str) {
        var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        return reg.test(str);
    }
    //验证手机
    function isMobile(str) {
        var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
        return reg.test(str);
    }
</script>
</body>
</html>