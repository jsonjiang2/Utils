<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>找回密码页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style>
        .box {
            width: 100%;
            height: 100%;
        }

        .box .reset-box {
            width: 100%;
            max-width: 500px;
            margin: 180px auto;
        }

        .box .reset-box .reset-title {
            height: 45px;
            background: #666;
        }

        .box .reset-box .reset-title h1 {
            line-height: 45px;
            font-size: 16px;
            color: #fff;
            font-family: "宋体" !important;
        }

        .box .reset-box .reset-title small {
            line-height: 45px;
            font-size: 16px;
            color: #fff;
            font-family: "宋体" !important;
        }

        .box .reset-content {
            border: 1px solid #666;
            width: 100%;
            height: 230px;
        }

        .box .reset-content form {
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
    <script type="text/javascript">
        function checkRightOrNot() {
            var email = $("#email").val();
            var username = $("#username").val();
            if (email == "" || username == "") {
                alert("用户名和邮箱不能为空！");
                return;
            }
            $.ajax({
                url: basePath + "/admin/sendEmail",
                async: false,
                data: {
                    email: email,
                    username: username
                },
                success: function (data) {
                    var sendResult = data.sendResult;
                    var errorMsg = data.errorMsg;
                    if (sendResult == "success") {
                        alert("发送成功");
                    } else {
                        alert(errorMsg);
                    }
                }
            });
        }
    </script>
</head>
<body>
<div class="box">
    <div class="reset-box">
        <div class="reset-title text-center">
            <h1>
                <small>发送邮件</small>
            </h1>
        </div>

        <div class="reset-content ">

            <div class="form">
                <form id="gj_user_register">

                    <div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-user"></span></span> <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名">
                                <font color="green" id="font_username" style="position: absolute; top: 8px; right: 20px; z-index: 2; font-size: 22px;"></font>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-record"></span></span> <input type="email" id="email" name="email" class="form-control" placeholder="请输入邮箱">
                            </div>
                        </div>
                    </div>

                    <p class="text-center remove-margin">
                        <button type="button" class="btn btn-sm btn-info" onclick="checkRightOrNot(this)" id="register"><span class="glyphicon glyphicon-off"></span>发送</button>
                        <a class="btn btn-sm btn-info " href="${basePath}/login">
                            <span class="glyphicon glyphicon-th"></span>
                            <small>登录</small>
                        </a>

                    </p>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
