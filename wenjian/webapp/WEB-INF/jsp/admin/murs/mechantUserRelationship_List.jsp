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

//添加页面跳转
function insertUI(){
    var action = "${pageContext.request.contextPath}/admin/mechantUserRelationship/insertUI"; 
    var callback = function (data) {
        $("#insertModal").modal({
            backdrop: 'static',
            keyboard: false
        });
        $("#insert-modal-body").html(data);
    };
     $.post(action, callback); 
}

//添加 提交
function insert(){
	var jsonData = $("#mechantUserRelationship_insertFrom").serialize();
    var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
	var bv = $("#mechantUserRelationship_insertFrom").data("bootstrapValidator");
	//手动触发验证
	bv.validate();
	var action ="${pageContext.request.contextPath}/admin/mechantUserRelationship/saveBM";
	if(bv.isValid()){
		$.post(action, params, function(data){
		  if(data.code=="88"){
       		  alert("添加成功");
	       	  window.location.href="${pageContext.request.contextPath}/admin/mechantUserRelationship/lists";

       	  }else{
       		 alert(data.message);
       	  }
		});
	}
}


//修改页面跳转
function updateUI(id){
	var  action = "/admin/mechantUserRelationship/updateUI";    // 通过id查询需要修改的bean信息
	var params = {
			"id":id
	}
	$.post(action,params,function(data){
		$("#update-modal-body").html(data);
	});
}
//修改后保存
function update(){
	var jsonData = $("#mechantUserRelationship_updateForm").serialize();
    var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
	var bv = $("#mechantUserRelationship_updateForm").data("bootstrapValidator");
	//手动触发验证
	bv.validate();
	var action ="${pageContext.request.contextPath}/admin/mechantUserRelationship/updateOK";
	if(bv.isValid()){
		$.post(action, params, function(data){
		  if(data.code=="88"){
       		  alert("修改成功");
	       	  window.location.href="${pageContext.request.contextPath}/admin/mechantUserRelationship/lists";

       	  }else{
       		 alert(data.message);
       	  }
		});
	}
}
//重置包括隐藏域
function resetting(){
	$("#merno_select").val("");
	$("#username_select2").val("");
}
</script>

<title>用户信息列表</title>
</head>
<body style="font-size: 12px; font-family: 微软雅黑">

	<div class="container" style="width: 80%;">
		<div style="float: left;">
			<form method="post" action="${pageContext.request.contextPath}/admin/mechantUserRelationship/lists" id="form-select" class="form-inline">
				<div style="margin-top: 18px;margin-bottom: 10px">
					<input type="hidden" id="pageNum" name="pageNum" />
					<input type="hidden" id="pageSize" name="pageSize" />
					<div class="form-group">
					商户号：<input class="form-control" type="text" id="merno_select"
						name="merno" style="text-align: center; line-height: 18px;"
						placeholder="填写商户号" value="${mechantUserRelationship.merno}">
					</div>
					<div class="form-group">
					用户名：<input class="form-control" type="text" id="username_select2"
						name="username" style="text-align: center; line-height: 18px;"
						placeholder="填写用户名" value="${mechantUserRelationship.username}">
					</div>
				
					<div class="form-group">
						<div class="btn btn-default" onclick="insertUI();"  class="btn">新增商户用户</div>	
					</div>	
						
					<div class="form-group">
						<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
						<button type="button" class="btn btn-default" style="width: 100px;" onclick="resetting();">重置</button>
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
							<td>用户</td>
							<td>时间</td>
							<td>操作</td>
						</tr>
					</thead>
					<tbody>
						<!-- 这里面${userRecharge.id }是点的model里面的属性 -->
						<c:forEach items="${pagehelper.list}" var="bsiness"
							varStatus="status">

							<tr class="text-center2">
								<td>${status.count}</td>
								<td>${bsiness.merno}</td>
								<td>${bsiness.username}-${bsiness.realname}</td>
								<td>
									<c:if test="${!empty bsiness.settime}">${sf.format(bsiness.settime)}</c:if>
								</td>
								
								 <td>
									<button class="btn" data-backdrop="static"
										data-toggle="modal" data-dismiss="modal"
										data-target="#updateModal"
										onclick="updateUI('${bsiness.id}')">修改</button>
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
