<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<script src="<%=basePath%>/static/plugin/bootstrap/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
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

//刷新页面
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
	$("#username_select").val("${userSpreadProxy.username}");
	$("#realname_select").val("${userSpreadProxy.realname}");
	$("#tmoblie_select").val("${userSpreadProxy.tmoblie}");
	$("#recommendlink_select").val("${userSpreadProxy.recommendlink}");
	
});
//根据用户名查询
function queryUserName(username){
	$("#username_select").val(username);
	$("#form-select").submit();
}
//点击个数的时候查询
function updateUI(id){
	var  action = "/admin/userSpreadProxy/updateUI.action";
	var params = {
			"id":id
	}
	$.post(action,params,function(data){
		$("#update-modal-body").html(data);
	});
}

//修改后保存
function update(){
	var jsonData = $("#uProxy_update").serialize();
	var params = decodeURIComponent(jsonData,true);
	var action = "/admin/userSpreadProxy/update.action";
	$.post(action, params, function(data){
		if(data.code=="300"){
			alert(data.msg);
		}
		if(data.code=="200"){
			queryAllPerson('${pagehelper.pageNum}', '${pagehelper.pageSize}');
		}
	});
}


function addErweima(){
	window.location.href = "${pageContext.request.contextPath}/admin/userSpreadProxy/addErweima";
}
</script>

<title>推广信息列表</title>
</head>
<body style="font-size: 12px; font-family: 微软雅黑">

	<div class="container" style="width: 80%;">
		<div style="float: left;">
			<form method="post" action="list_zizhu" id="form-select"  class="form-inline">
					<div style="margin-top: 18px;margin-bottom: 10px">
						<input type="hidden" id="pageNum" name="pageNum" /> 
						<input type="hidden" id="pageSize" name="pageSize" /> 
						<div class="form-group">
						注册用户名：<input class="form-control" type="text" id="username_select"
							name="username" style="text-align: center; line-height: 18px;"
							placeholder="填写姓名">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						姓名：<input class="form-control" type="text" id="realname_select"
							name="realname" style="text-align: center; line-height: 18px;"
							placeholder="填写姓名">
						</div> 
						<!-- &nbsp;&nbsp;
						<div class="form-group">
						手机号：<input class="form-control" type="text" id="tmoblie_select"
							name="tmoblie" style="text-align: center; line-height: 18px;"
							placeholder="填写手机号">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						推广码：<input class="form-control" type="text" id="recommendlink_select"
							name="recommendlink" style="text-align: center; line-height: 18px;"
							placeholder="填写手机号">
						</div>  -->
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
							<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
						</div>	
						
						<!-- <button type="button" class="btn btn-default" style="width: 100px;" onclick="addErweima()">添加二维码</button> -->
					</div>
				
			</form>
			
			
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">

				<table class="table table-hover" id="userspreadproxy_table">
					<thead>
						<tr style="background-color: #CCCCCC;" class="text-center2">
							<td style="display: none">ID</td>
							<td>序号</td>
							<td>注册人</td>
							<td>推荐人</td>
							<td>注册时间</td>
							<td>操作人</td>
							<td>操作时间</td>
							<td>备注</td>
							<td>操作</td>
						<!-- 	<td>推广收入</td> -->
						</tr>
					</thead>
					<tbody>
						<!-- 这里面${userRecharge.id }是点的model里面的属性 -->
						<c:forEach items="${pagehelper.list}" var="userspreadproxy"
							varStatus="status">

							<tr id="userRecharge_tr_${userspreadproxy.id }"
								class="text-center2">
								
									<td>${status.count}</td>
									 <td>
										${userspreadproxy.username}-${userspreadproxy.realname}
									</td> 
									<td>
										<c:if test="${empty userspreadproxy.sproxyusername}">
											--
										</c:if>
										<c:if test="${!empty userspreadproxy.sproxyusername}">
											${userspreadproxy.sproxyusername}-${userspreadproxy.sproxyrealname}
										</c:if>
									</td>
									<td>
										<c:if test="${!empty userspreadproxy.regdate}">
											${sf.format(userspreadproxy.regdate)}
										</c:if>
									</td>
									<td>
										<c:if test="${empty userspreadproxy.setman}">--</c:if>
										<c:if test="${!empty userspreadproxy.setman}">${userspreadproxy.setman}</c:if>
									</td>
									<td>
										<c:if test="${empty userspreadproxy.setdate}">--</c:if>
										<c:if test="${!empty userspreadproxy.setdate}">${sf.format(userspreadproxy.setdate)}</c:if>
									</td>
									<td>
										<c:if test="${empty userspreadproxy.remark}">--</c:if>
										<c:if test="${!empty userspreadproxy.remark}">${userspreadproxy.remark}</c:if>
									</td>
									<td>
										<c:if test="${empty userspreadproxy.sproxyusername}">
											 <a style="cursor:pointer;color: blue">
												<button class="btn" data-backdrop="static"
												data-toggle="modal" data-dismiss="modal"  
												data-target="#updateModal"
												onclick="updateUI('${userspreadproxy.id }')">自主推荐</button>
											 </a> 
										</c:if>
										<c:if test="${!empty userspreadproxy.sproxyusername}">
											<button class="btn" style="background-color: #FFFFFF">无</button>
										</c:if>
									</td>
									
								
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
