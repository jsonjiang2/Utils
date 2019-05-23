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
//修改页面跳转
function updateUI(id){
	$.post("/admin/userSpreadQuery/updateView/"+id,function(data){
		$("#update-modal-body").html(data);
	});
}

//修改后保存
function update(){
	var jsonData = $("#userSpreadQuery_updateForm").serialize();
    var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
	$.post("update", params, callback);
	
}
//详情页面跳转
function deatilUI(id){
	$.post("/admin/userspreadquery/detail/"+id, function(data){
		$("#detail-modal-body").html(data);
	});
}


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
	$("#recommendman_select").val("${userSpreadQuery.recommendusername}");
	$("#recommendname_select").val("${userSpreadQuery.recommendrealname}");
	$("#tmoblie_select").val("${userSpreadQuery.recommendmobile}");
	$("#username_select").val("${userSpreadQuery.username}");
	$("#realname_select").val("${userSpreadQuery.realname}");
	$("#bmoblie_select").val("${userSpreadQuery.mobile}");
	
});
function queryRecommendman(recommendman,recommendrealname){
	$("#recommendman_select").val(recommendman);
	$("#recommendname_select").val(recommendrealname);
	$("#form-select").submit();
}

</script>

<title>推广信息列表</title>
</head>
<body style="font-size: 12px; font-family: 微软雅黑">

	<div class="container" style="width: 80%;">
		<div style="float: left;">
			<form method="post" action="list" id="form-select"  class="form-inline">
					<div style="margin-top: 18px;margin-bottom: 10px">
						<input type="hidden" id="pageNum" name="pageNum" /> 
						<input type="hidden" id="pageSize" name="pageSize" /> 
						<div class="form-group">
						推广人用户名：<input class="form-control" type="text" id="recommendman_select"
							name="recommendusername" style="text-align: center; line-height: 18px;"
							placeholder="填写用户名">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						推广人姓名：<input class="form-control" type="text" id="recommendname_select"
							name="recommendrealname" style="text-align: center; line-height: 18px;"
							placeholder="填写推荐人姓名">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						推广人手机号：<input class="form-control" type="text" id="tmoblie_select"
							name="recommendmobile" style="text-align: center; line-height: 18px;"
							placeholder="填写用户名">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						注册人用户名：<input class="form-control" type="text" id="username_select"
							name="username" style="text-align: center; line-height: 18px;"
							placeholder="填写姓名">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						注册人姓名：<input class="form-control" type="text" id="realname_select"
							name="realname" style="text-align: center; line-height: 18px;"
							placeholder="填写姓名">
						</div> 
						<div class="form-group">
						注册人手机号：<input class="form-control" type="text" id="bmoblie_select"
							name="mobile" style="text-align: center; line-height: 18px;"
							placeholder="填写手机号">
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

				<table class="table table-hover" id="userspreadquery_table">
					<thead>
						<tr style="background-color: #CCCCCC;" class="text-center2">
							<td style="display: none">ID</td>
							<td>序号</td>
							<td>推广人用户名-姓名</td>
							<td>注册人用户名-姓名</td>
							<td>注册时间</td>
						</tr>
					</thead>
					<tbody>
						<!-- 这里面${userRecharge.id }是点的model里面的属性 -->
						<c:forEach items="${pagehelper.list}" var="userspreadquery"
							varStatus="status">

							<tr id="userRecharge_tr_${userspreadquery.id }"
								class="text-center2">
								
									<td>${status.count}</td>
									<td>
										<a style="cursor:pointer;color: blue"  onclick="queryRecommendman('${userspreadquery.recommendusername}','${userspreadquery.recommendrealname}')">
											${userspreadquery.recommendusername}
												<c:if test="${empty userspreadquery.recommendrealname}">
													-未实名
												</c:if>
												<c:if test="${!empty userspreadquery.recommendrealname}">
													-${userspreadquery.recommendrealname}
												</c:if>
										</a>
									</td>
									<td>
									${userspreadquery.username}
										<c:if test="${empty userspreadquery.realname}">
											-未实名
										</c:if>
										<c:if test="${!empty userspreadquery.realname}">
											-${userspreadquery.realname}
										</c:if>
									
									</td>
									<td>
										<c:if test="${!empty userspreadquery.regdate}">
											${sf.format(userspreadquery.regdate)}
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
