<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 注意文件的引入顺序 -->
<link href="<%=basePath%>/static/plugin/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=basePath%>/static/plugin/jquery/1.11.3/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>/static/plugin/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/static/js/util.js"></script>
<script src="<%=basePath%>/static/js/validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/common.js"></script>
<!-- 表格样式 -->
<style>
table tr td {
	text-align: center;
	vertical-align: middle !important;
}

.text-center2 td {
	border: 1px solid #666;
}
</style>
<script type="text/javascript">

//详情页面跳转
function deatilUI(id){
	var  action =  "/admin/logLogin/detail/"+id;
	$.post(action,  function(data){
		$("#detail-modal-body").html(data);
	});
}

function callback(data) {
	if (data.result == "success") {
		queryAllPerson('${pagehelper.pageNum}', '${pagehelper.pageSize}');
	}
}
//页面查询条件数据回显
$(function(){
	$(".remark-p").each(function() {
		var num = $(this).html();
		if (num.length > 5) {
			$(this).html(num.substr(0, 5) + "...");
		}
	});
	$("#ip_select").val("${logLogin.ip}");
	$("#username_select").val("${logLogin.username}");
	$("#status_select").val("${logLogin.status}");
	
	
});

function queryUsername(username){
	resting();
	$("#username_select").val(username);
	$("#form-select").submit();
}
function queryIp(ip){
	resting();
	$("#ip_select").val(ip);
	$("#form-select").submit();
}

function resting(){
	$("#username_select").val("");
	$("#ip_select").val("");
}

</script>

<title>用户信息列表</title>
</head>
<body style="font-size:12px;font-family: 微软雅黑">

	<div class="container" style="width: 80%;">
		<div style="float: left;">
				<form method="post" action="list" id="form-select" class="form-inline">
					<div style="margin-top: 18px;margin-bottom: 10px">
						<input type="hidden" id="pageNum" name="pageNum" /> 
						<input type="hidden" id="pageSize" name="pageSize" /> 
						<div class="form-group">
						用户名：<input class="form-control" type="text" id="username_select"
							name="username" style="text-align: center; line-height: 18px;"
							placeholder="填写用户名">
						</div> 
						<div class="form-group">
						IP：<input class="form-control" type="text" id="ip_select"
							name="ip" style="text-align: center; line-height: 18px;"
							placeholder="填写IP地址">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						登录状态： <select id="status_select" name="status" class="form-control">
								<option value="">--请选择状态--</option>
								<option value=0>失败</option>
								<option value=1>成功</option>
							</select>
						</div>
					
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
							<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
						</div>	
						
					</div>
					
				</form>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
	
					<table class="table table-hover" id="logLogin_table">
						<thead>
							<tr style="background-color: #CCCCCC;" class="text-center2">
								<td style="display: none">ID</td>
								<td>序号</td>
								<td>用户名</td> 
								<td>姓名</td> 
								<td>用户类型</td>
								<td>登录状态</td>
								<td>IP</td>
								<td>IP城市</td>
								
								<td>登录时间</td>
								<td>备注</td>
								<td>详情</td>
							</tr>
						</thead>
						<tbody>
							<!-- 这里面${userRecharge.id }是点的model里面的属性 -->
							<c:forEach items="${pagehelper.list}" var="logLogin"
								varStatus="status">
	
								<tr id="logLogin_tr_${logLogin.id }" class="text-center2">
									<td>${status.count}</td>
									<td>
										<a style="cursor:pointer;color: blue"  
										onclick="queryUsername('${logLogin.username}')"
										>
											${logLogin.username}
										</a>
									
									</td> 
									<td>${logLogin.useraccountinforealname}</td>
									<td>
										<c:if test="${logLogin.usertype eq 1}"><span style="color: red">管理员</span></c:if>
										<c:if test="${logLogin.usertype eq 2}">普通用户</c:if>
									</td>
									<td>
										<c:if test="${logLogin.status eq 0}"><span style="color: red">失败</span></c:if>
										<c:if test="${logLogin.status eq 1}">成功</c:if>
									</td>
									
									<td>
										<a style="cursor:pointer;color: blue"  
										onclick="queryIp('${logLogin.ip}')"
										>
											${logLogin.ip}
										</a>
									</td>
									<td>${logLogin.ipcity}</td>
									
									<td>
										<c:if test="${!empty logLogin.logintime}">
											${sf.format(logLogin.logintime)}
										</c:if>
									</td>
									
									<td class="remark-p" title="${logLogin.remark }">${logLogin.remark}</td>
									
									
									<td><button class="btn" data-backdrop="static" data-toggle="modal"
										data-dismiss="modal" data-target="#detailsModal"
										onclick="deatilUI('${logLogin.id}')">查看</button></td>
								
								</tr>
	
							</c:forEach>
						</tbody>
					</table>
					<div id="page_div">
						<%@ include file="./../../common/pagehelper.jsp"%>
					</div>
				</div>
			</div>
		</div>
		<!-- 引入公共的模态框 -->
		<%@ include file="./../../common/modal.jsp"%>
</body>
</html>
