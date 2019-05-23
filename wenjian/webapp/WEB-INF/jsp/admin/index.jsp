<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//System.out.println(path);
	//System.out.println(basePath);
	
%>
<!DOCTYPE HTML>
<html>
<head>
<title>后台管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>static/plugin/assets/css/dpl-min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/plugin/assets/css/bui-min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>static/plugin/assets/css/main-min.css" rel="stylesheet"
	type="text/css" />
</head>
<body style="font-family: '微软雅黑';">

	<div class="header">

		<div class="dl-title">
			<!--<img src="/chinapost/Public/assets/img/top.png">-->
		</div>

		<div class="dl-log">
			欢迎您，<span class="dl-log-user">${adminuser.username }</span><a
				href="<%=basePath%>logout" title="退出系统" class="dl-log-quit">[退出]</a>
		</div>
	</div>
	<div class="content">
		<div class="dl-main-nav">
			<div class="dl-inform">
				<div class="dl-inform-title">
					<s class="dl-inform-icon dl-up"></s>
				</div>
			</div>
			<ul id="J_Nav" class="nav-list ks-clear">
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-home">后台管理</div></li>
				<!-- <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">业务管理</div></li> -->

			</ul>
		</div>
		<ul id="J_NavContent" class="dl-tab-conten">

		</ul>
	</div>
	<script type="text/javascript"
		src="<%=basePath%>static/plugin/assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/plugin/assets/js/bui.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>static/plugin/assets/js/common/main-min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>static/plugin/assets/js/config-min.js"></script>
	<script>
        var basePath = "${basePath}"
        window.onload=function(){
            $.ajax({
                type:"post",
                url:basePath+"/admin/resource/loadMenu",
                success:function(data){
                    var obj = $.parseJSON(data);
                    BUI.use('common/main', function() {
                        var config = [ {
                            id : '1',
                            homePage:'/admin/userInExRecord/wrongList',
                            menu :obj
                        }];
                        new PageUtil.MainPage({
                            modulesConfig : config
                        });
                    });
                }
            });
        }

			 
		</script>
	<br />
	<br />
	<br />

</body>
</html>