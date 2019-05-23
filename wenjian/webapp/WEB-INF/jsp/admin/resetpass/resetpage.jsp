<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>密码重置页面</title>
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
            height: 380px;
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
        function resetAdminUser() {
            var adminUserId = $("#adminUserId").val();
            var username = $("#username").val();
            var newPassword = $("#newPassword").val();
            var newPassword2 = $("#newPassword2").val();
            if (newPassword != newPassword2) {
                alert("两次输入密码不一致");
            } else {
                $.ajax({
                    url: basePath + "/admin/adminUser/resetAdminUser",
                    async: false,
                    data: {
                        password: newPassword,
                        id: adminUserId,
                        username: username
                    },
                    success: function (data) {
                        alert("修改成功");
                    }
                });
            }
        }
    </script>
</head>
<body>
<form>


    <div class="box">
        <div class="reset-box">
            <c:choose>
                <c:when test="${!empty adminUser}">
                    <div class="reset-title text-center">
                        <h1>
                            <small>找回密码</small>
                        </h1>
                    </div>

                    <div class="reset-content ">

                        <div class="form">
                            <form id="gj_user_register">

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-user"></span></span> <input type="text"
                                                                                                   id="username"
                                                                                                   name="username"
                                                                                                   class="form-control"
                                                                                                   value="${adminUser.username}"
                                                                                                   readonly="readonly">
                                            <font color="green"
                                                  id="font_username"
                                                  style="position: absolute; top: 8px; right: 20px; z-index: 2; font-size: 22px;"></font>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12  ">
                                        <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-lock"></span></span> <input
                                                type="password" id="newPassword" name="newPassword"
                                                class="form-control" placeholder="请输入密码">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12  ">
                                        <div class="input-group">
									<span class="input-group-addon"><span
                                            class="glyphicon glyphicon-lock"></span></span> <input
                                                type="password" id="newPassword2" name="newPassword2"
                                                class="form-control" placeholder="请再次输入密码">
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-sm btn-info"
                                        onclick="resetAdminUser(this)" id="register">
                                    <span class="glyphicon glyphicon-off"></span>修改
                                </button>
                                <input type="hidden" value="${adminUser.id}" name="id" id="adminUserId">
                            </form>
                        </div>

                    </div>
                </c:when>
                <c:otherwise>

                    <font size="25">${message}</font>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</form>
</body>
</html>
