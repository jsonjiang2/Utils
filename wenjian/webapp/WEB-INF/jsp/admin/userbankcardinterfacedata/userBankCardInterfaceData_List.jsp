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
	$.post("/admin/userBankCardInterfaceData/detail/"+id,function(data){
		$("#detail-modal-body").html(data);
	});
}


function deleteById(id) {
    var flag = confirm("确定要删除吗？");
    var action = "${pageContext.request.contextPath}/admin/userBankCardInterfaceData/delete/" + id;
    var callback = function (data) {
    	if (flag) {
	        if (data.Msg == "删除成功！") {
	        	queryAllPerson('${pagehelper.pageNum}', '${pagehelper.pageSize}');
	        }
    	}
    }
    $.post(action, callback);
}


//页面查询条件数据回显
$(function(){
	$(".remark-p").each(function() {
		var num = $(this).html();
		if (num.length > 5) {
			$(this).html(num.substr(0, 5) + "...");
		}
	});
	$("#user_select").val('${useraccountinfoname}');
	$("#baseid").val("${userBankCardInterfaceData.baseid}");
	$("#username_select").val("${userBankCardInterfaceData.username}");
	$("#bindstatus_select").val("${userBankCardInterfaceData.bindstatus}");
	$("#bankmobile_select").val("${userBankCardInterfaceData.bankmobile}");
	
});

function callback(data) {
	if (data.result == "success") {
		queryAllPerson('${pagehelper.pageNum}', '${pagehelper.pageSize}');
	}
}
//点击用户名的时候查询并且赋值
function queryUsername_baseid(baseid,useraccountinfoname){
	$("#baseid").val(baseid);
	$("#user_select").val(useraccountinfoname);
	$("#form-select").submit();
}
//重置包括隐藏域
function resetting(){
	$("#baseid").val("");
	$("#user_select").val("");
	$("#username_select").val("");
	$("#bindstatus_select").val("");
	$("#bankmobile_select").val("");
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
						用户名：<input class="form-control" type="text" id="user_select"
							style="text-align: center; line-height: 18px;" name="useraccountinfoname"
							placeholder="填写用户名">
							<input value="" id="baseid" name="baseid" type="hidden"/>
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						姓名：<input class="form-control" type="text" id="username_select"
							name="username" style="text-align: center; line-height: 18px;"
							placeholder="填写姓名">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						手机号：<input class="form-control" type="text" id="bankmobile_select"
							name="bankmobile" style="text-align: center; line-height: 18px;"
							placeholder="填写开卡手机号">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						绑定状态： <select id="bindstatus_select" name="bindstatus" class="form-control">
								<option value="">--请选择状态--</option>
								<option value=2>失败</option>
							</select>
						</div>
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
							<button type="reset" class="btn btn-default" style="width: 100px;" onclick="resetting()">重置</button>
						</div>	
					</div>
					
				</form>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
	
					<table class="table table-hover" id="userBankCard_table">
						<thead>
							<tr style="background-color: #CCCCCC;" class="text-center2">
								<td style="display: none">ID</td>
								<td>序号</td>
								<td>用户名</td>
								<td>姓名</td>
								<td>银行</td>
								<td>卡号</td>
								<td>绑定时间</td>
								<td>绑定状态</td>
								<td>失败原因</td>
								<td>详情</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
							<!-- 这里面${userRecharge.id }是点的model里面的属性 -->
							<c:forEach items="${pagehelper.list}" var="userBankCardInterfaceData"
								varStatus="status">
	
								<tr id="userRecharge_tr_${userBankCardInterfaceData.id }" class="text-center2">
									<td>${status.count}</td>
									<td>
										<a style="cursor:pointer;color: blue"  
										onclick="queryUsername_baseid('${userBankCardInterfaceData.baseid}','${userBankCardInterfaceData.useraccountinfoname}')"
										>
											${userBankCardInterfaceData.useraccountinfoname}
										</a>
									</td>
									
									<td>${userBankCardInterfaceData.username}</td>
									<td>${userBankCardInterfaceData.bankname}</td>
									<td>${userBankCardInterfaceData.cardno}</td>
									<td>
										<c:if test="${!empty userBankCardInterfaceData.bindtime}">${sf.format(userBankCardInterfaceData.bindtime)}</c:if>
										<c:if test="${empty userBankCardInterfaceData.bindtime}">暂时没有时间</c:if>
									</td>
									
									<td>
										<c:if test="${userBankCardInterfaceData.bindstatus eq 2}"><span style="color: red">失败</span></c:if>
									</td>
									
									<td>${userBankCardInterfaceData.result}</td>
									
									
									<td><button class="btn" data-backdrop="static" data-toggle="modal"
										data-dismiss="modal" data-target="#detailsModal"
										onclick="deatilUI('${userBankCardInterfaceData.id}')">查看</button></td>
										
									<td><button 
										onclick="deleteById('${userBankCardInterfaceData.id}')">删除</button></td>	
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
