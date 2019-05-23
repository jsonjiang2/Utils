<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>网贷巴士-后台登录页面</title>
	<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
	<%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style type="text/css">
        .box {
            width: 100%;
            height: 100%;
        }

        .box .login-box {
            width: 100%;
            max-width: 480px;
            margin: 240px auto;
        }

        .box .login-box .login-title {
            height: 45px;
            background: #666;
        }

        .box .login-box .login-title h1 {
            line-height: 45px;
            font-size: 16px;
            color: #fff !important;
            font-family: "宋体" !important;
        }

        .box .register-box .login-title small {
            line-height: 45px;
            font-size: 16px;
            color: #fff !important;
            font-family: "宋体" !important;
        }

        .box .login-content {
            border: 1px solid #666;
            width: 100%;
            height: 300px;
        }

        .box .login-content form {
            width: 100%;
            max-width: 500px;
            height: 275px;
            margin: 10px auto 0px auto;
            padding-top: 25px;
        }

        .input-group {
            margin: 0px 0px 30px 0px !important;
        }

        .hint{
            color: #DC143C;
            text-align:center;
        }


    </style>
    <script type="text/javascript"
            src="<%=basePath%>/static/js/jquery.tips.js"></script>
</head>
<body>
<div class="box">
	<div class="login-box">
		<div class="login-title text-center">
			<h1>
				<small>登录</small>
			</h1>
			<div class="hint">请使用浏览器兼容模式登录</div>
		</div>
		<div class="login-content " id="loginbox">


			<div class="form">
				<form id="gj_user" action="${pageContext.request.contextPath}/admin/login" method="post">
					<div class="form-group">
						<div class="col-xs-12  ">
							<div class="input-group">
									<span class="input-group-addon"><span
											class="glyphicon glyphicon-user"></span></span> <input type="text" id="username" name="username" value="${adminuser.username}" style="width:200px;" class="form-control" placeholder="用户名">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12  ">
							<div class="input-group">
									<span class="input-group-addon"><span
											class="glyphicon glyphicon-lock"></span></span> <input
									type="password" id="password" name="password"   value="${adminuser.password}"
									class="form-control" style="width:200px; height:35px;" placeholder="密码">
								<input type="hidden" id="SNArea" name="SNArea" />

							</div>
						</div>
					</div>
					<%-- <div class="form-group">
                        <div class="col-xs-8">
                            <div class="input-group">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-record"></span></span> <input type="text"
                                                                                                     id="code"
                                                                                                     name="code"
                                                                                                     class="form-control"
                                                                                                     placeholder="验证码">
                                <img src="${basePath}/Kaptcha.jpg"
                                     id="kaptchaImage"
                                     onclick="this.src=basePath+'/Kaptcha.jpg?d='+new Date().getTime();"
                                     style="position: absolute; top: 2px; right: 8px; z-index: 2;"/>
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <a href="javascript:void(0)" onclick="changeCode(this)">看不清?换一张</a>
                        </div>
                    </div> --%>
					<div class="form-group form-actions">
						<div class="col-xs-4 col-xs-offset-5 ">
							<button type="button" class="btn btn-sm btn-info"
									onclick="gj_login(this)" id="login">
								<span class="glyphicon glyphicon-off"></span> 登录
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
								<small>还没注册?</small>
								<a href="${basePath}/admin/reg">
									<small>注册</small>
								</a>
							</p>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="hint">${msg}</div>
	</div>
</div>
<script type="text/javascript">
    $(function () {
        var msg="${msg}";
        var error_type="${error_type}";
        if (msg != "" ) {
            if(error_type=="codeError"){
                $("#code").tips({
                    side: 2,
                    msg: msg,
                    bg: '#AE81FF',
                    time: 3
                });
            }else if(error_type=="usernameOrPassError"){
                $("#username").tips({
                    side: 2,
                    msg: msg,
                    bg: '#AE81FF',
                    time: 3
                });
            }

        }
        //按回车登录
        $(document).keydown(function (e) {
            if (e.keyCode == 13) {
                gj_login();
            }
        });
    });

    //登录
    function gj_login(obj) {
        if (check()) {
            ET199GetSN();
            $("#gj_user").submit();
        }
    }

    //刷新验证码
    /* function changeCode(obj) {
     $("#kaptchaImage").attr("src", basePath + '/Kaptcha.jpg?d=' + new Date().getTime());
     } */


    //客户端校验
    function check() {
        if ($("#username").val() == "") {
            $("#username").tips({
                side: 2,
                msg: '用户名不得为空',
                bg: '#AE81FF',
                time: 3
            });

            $("#username").focus();
            return false;
        } else {
            $("#username").val(jQuery.trim($('#username').val()));
        }

        if ($("#password").val() == "") {
            $("#password").tips({
                side: 2,
                msg: '密码不得为空',
                bg: '#AE81FF',
                time: 3
            });

            $("#password").focus();
            return false;
        }

        /* if ($("#code").val() == "") {

         $("#code").tips({
         side: 1,
         msg: '验证码不得为空',
         bg: '#AE81FF',
         time: 3
         });

         $("#code").focus();
         return false;
         } */

        $("#loginbox").tips({
            side: 1,
            msg: '正在登录 , 请稍后 ...',
            bg: '#68B500',
            time: 10
        });

        return true;
    }

    function ET199GetSN()
    {
        //获取ET199硬件序列号
        var result = ETUCtrl.GetSN();
        $("#SNArea").attr("value",result);
    }

</script>
<OBJECT id="ETUCtrl" classid="clsid:9222986D-9A56-4324-99E0-FDAC970EE0B0" VIEWASTEXT></OBJECT>
</body>
</html>