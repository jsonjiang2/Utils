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
function callback(data) {
	if (data.result == "success") {
		alert(data.Msg);
		queryAllPerson('${pagehelper.pageNum}', '${pagehelper.pageSize}');
	}
	if(data.result=="fail"){
		 alert(data.Msg);
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

});

//重置包括隐藏域
function resetting(){
	$("#merchants_select").val("");
	$("#merchanturl_select").val("");
}
//修改页面跳转
function updateUI(id){
	var  action = "/admin/resourceMasterSettings/updateUI";    // 通过id查询需要修改的bean信息
	var params = {
			"id":id
	}
	$.post(action,params,function(data){
		$("#update-modal-body").html(data);
	});
}
//修改后保存
function update(){
	var jsonData = $("#resourceMasterSettings_updateForm").serialize();
    var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
	//手动触发验证
	var action ="${pageContext.request.contextPath}/admin/resourceMasterSettings/updateOK";
	$.post(action, params, function(data){
	  if(data.code=="88"){
	      	 alert("修改成功");
	       	 window.location.href="${pageContext.request.contextPath}/admin/resourceMasterSettings/lists";
      	  }else{
      		 alert(data.message);
      	  }
	});
}
</script>

<title>用户信息列表</title>
</head>
<body style="font-size: 12px; font-family: 微软雅黑">

	<div class="container" style="width: 80%;">
		<div style="float: left;">
			<form method="post" action="${pageContext.request.contextPath}/admin/resourceMasterSettings/lists" id="form-select" class="form-inline">
				<div style="margin-top: 18px;margin-bottom: 10px">
					<input type="hidden" id="pageNum" name="pageNum" />
					<input type="hidden" id="pageSize" name="pageSize" />
					<div class="form-group">
					商户号：<input class="form-control" type="text" id="merchants_select"
						name="merchants" style="text-align: center; line-height: 18px;"
						placeholder="填写商户号" value="${resourceMasterSettings.merchants}">
					</div>
					<div class="form-group">
					商户网址：<input class="form-control" type="text" id="merchanturl_select"
						name="merchanturl" style="text-align: center; line-height: 18px;"
						placeholder="填写商户网址" value="${resourceMasterSettings.merchanturl}">
					</div>
					<div class="form-group">
						<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
						<button type="reset" class="btn btn-default" style="width: 100px;" onclick="resetting();">重置</button>
					</div>
				</div>

			</form>
		</div>
		<div class="row clearfix" style="margin-top: 10px">
			<div class="col-md-12 column">

				<table class="table table-hover" id="userRechargeList_table">
					<thead>
						<tr style="background-color: #CCCCCC;" class="text-center2">
							<td style="display: none">ID</td>
							<td>序号</td>
							<td>商户号</td>
							<td>网址</td>
							<td>资源主限制</td>
							<td>操作人</td>
							<td>资源主设置</td>
							<td>操作时间</td>
							<td>备注</td>
						</tr>
					</thead>
					<tbody>
						<!-- 这里面${userRecharge.id }是点的model里面的属性 -->
						<c:forEach items="${pagehelper.list}" var="entity"
							varStatus="status">

							<tr class="text-center2">
								<td>${status.count}</td>
								<td>${entity.merchants}</td>
								<td>${entity.merchanturl}</td>
								
								<td>
									<c:if test="${entity.resourcesastrict eq 0}">
										<span style="color: red">禁止查看</span>
									</c:if>
									<c:if test="${entity.resourcesastrict eq 1}">
										不限制
									</c:if>
									<c:if test="${entity.resourcesastrict eq 2}">
										${entity.resourcesnum}人
									</c:if>
								</td>
								
								<td>${entity.operatiomanusername}-${entity.operatiomanrealname}</td>
								
								<td>
									<button class="btn" data-backdrop="static"
										data-toggle="modal" data-dismiss="modal"
										data-target="#updateModal"
										onclick="updateUI('${entity.id}')">修改</button>
								</td>
								
								<td>${entity.operationtimestr}</td>
								<td>${entity.remark}</td>
							
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
