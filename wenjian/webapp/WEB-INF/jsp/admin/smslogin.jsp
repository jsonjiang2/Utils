<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.ganjiangps.wangdaibus.model.AdminUser"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>网贷巴士-后台登录短信验证页面</title>

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
        
        .error{
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
        </div>
        <div class="login-content " id="loginbox">
            <div class="form">
                <form id="gj_user" action="${pageContext.request.contextPath}/admin/smslogin" method="post">
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span> <input type="text" id="mobile" name="mobile" value="${mobile}" style="width:200px;" class="form-control" placeholder="手机号" readonly="readonly">
                            </div>
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <div class="col-xs-8">
                            <div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-record"></span></span> 
									<input type="text" id="code" name="code" style="width:100px;" class="form-control" placeholder="短信验证码" onchange="codeOnBlur(this)" onkeydown="codeOnBlur(this)" onkeyup="codeOnBlur(this)">
									<input class="form-control" style="width:120px;" type="button" value="获取验证码" id="msgCode" onclick="affordMessageCode(this)"/>
                            </div>
                        </div>
                        
                    </div>
                    <div class="form-group form-actions">
                        <div class="col-xs-4 col-xs-offset-5 ">
                            <button type="button" class="btn btn-sm btn-info"
                                    onclick="gj_login(this)" id="login">
                                <span class="glyphicon glyphicon-off"></span> 登录
                            </button>
                            <input type="hidden" id="id" name="id" value="${adminuser.id}"/>
                            <input type="hidden" id="username" name="username" value="${adminuser.username}"/>
                            <input type="hidden" id="password" name="password" value="${adminuser.password}"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="error">${msg}</div>
    </div>
</div>

<script type="text/javascript">
$(function () {
     //按回车登录
    $(document).keydown(function (e) {
        if (e.keyCode == 13) {
            gj_login();
        }
    });
     
     $("#msgCode").click();
 });
 
	//验证码输入6位数自动登录
	function codeOnBlur(){
		var code = $("#code").val();
		if(code.length >= 6){
			gj_login();
		}
	}
	
    //登录
    function gj_login(obj) {
        if (check()) {
            $("#gj_user").submit();
        }
    }

    //短信验证码
    function sendCode(obj) {
        //$("#kaptchaImage").attr("src", basePath + '/Kaptcha.jpg?d=' + new Date().getTime());
    }


    //客户端校验
    function check() {        
        if ($("#code").val() == "") {

            $("#code").tips({
                side: 1,
                msg: '验证码不得为空',
                bg: '#AE81FF',
                time: 3
            });

            $("#code").focus();
            return false;
        }

        $("#loginbox").tips({
            side: 1,
            msg: '正在登录 , 请稍后 ...',
            bg: '#68B500',
            time: 10
        });

        return true;
    }
    
  	//验证码倒计时
    var countdown = 60;
    function settime(obj) {
        if (countdown == 0) {
            obj.removeAttribute("disabled");
            obj.value = "手机验证码";
            countdown = 60;
            obj.style.cursor = "pointer"
            return;
        } else {
            obj.setAttribute("disabled", true);
            obj.value = "重新发送(" + countdown + ")";
            countdown--;
            obj.style.cursor = "auto"
        }
        setTimeout(function () {
                settime(obj)
            }
            , 1000)
    }
    
    //发送短信验证码
    function affordMessageCode(t) {
        var phone = $("#mobile").val();
        if (phone.length != 0) {
            if (countdown == 60) {
                //请求短信验证码
                var url = "${pageContext.request.contextPath}/admin/messageCode" ;
                var param = {
                    "phone": phone
                };
                var callback = function (data) {
                	if(data.code == "00"){
 	                    alert(data.message);
                	}
                };
                $.post(url, param, callback);
            }
            settime(t);
        } else {
            $("#mobile").html("手机号不能为空");
        }

    }

</script>
</body>
</html>