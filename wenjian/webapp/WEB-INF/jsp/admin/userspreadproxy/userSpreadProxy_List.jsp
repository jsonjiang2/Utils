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
	$("#moblie_select").val("${userSpreadProxy.mobile}");
	$("#recommendlink_select").val("${userSpreadProxy.recommendlink}");
	 
});
//根据用户名查询
function queryUserName(username){
	$("#username_select").val(username);
	$("#form-select").submit();
}
//点击个数的时候查询
function deatilUI(baseid){
	var  action = "/admin/userSpreadProxy/deatil.action";
	var params = {
			"baseId":baseid
	}
	$.post(action,params,function(data){
		$("#detail-modal-body").html(data);
	});
}

function addErweima(){
	 window.location.href = "${pageContext.request.contextPath}/admin/userSpreadProxy/addErweima"; 
/* 	var qrcode = new QRCode("qrcode", {  
	    text: "http://www.gbtags.com",  
	    width: 260,  
	    height: 260,  
	    colorDark: '#efb73e',  
	    colorLight: "#ffffff"  
	});   */
}
/* 
function piliangQuery(){
	var min = $("#min").val();
	var max = $("#max").val();
	var params = {
			"min":min,
			"max":max
	}
	var action = "${pageContext.request.contextPath}/admin/userSpreadProxy/lishi";
	$.post(action,params,function(data){
		if(data.code=="00"){
			alert(data.message);
		}
		if(data.code=="88"){
			alert("修改完成");
			window.location.href = "${pageContext.request.contextPath}/admin/userSpreadProxy/list"; 
		}
	});
	
} */

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
						推广人用户名：<input class="form-control" type="text" id="username_select"
							name="username" style="text-align: center; line-height: 18px;"
							placeholder="填写姓名">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						姓名：<input class="form-control" type="text" id="realname_select"
							name="realname" style="text-align: center; line-height: 18px;"
							placeholder="填写姓名">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						手机号：<input class="form-control" type="text" id="moblie_select"
							name="mobile" style="text-align: center; line-height: 18px;"
							placeholder="填写手机号">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
						推广码：<input class="form-control" type="text" id="recommendlink_select"
							name="recommendlink" style="text-align: center; line-height: 18px;"
							placeholder="填写推广码">
						</div> 
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
							<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
						</div>	
					</div>
				
			</form> 
		<!-- 	<form method="post" action="" id="form-select2"  class="form-inline">
					最小值:<input id="min"/>
					最大值:<input id="max"/>
					<input type="button" value="提交" onclick="piliangQuery()"/>
			</form> -->
			
			
			
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">

				<table class="table table-hover" id="userspreadproxy_table">
					<thead>
						<tr style="background-color: #CCCCCC;" class="text-center2">
							<td style="display: none">ID</td>
							<td>序号</td>
							<td>推广人用户名-姓名</td>
							<td>注册时间</td>
							<td>注册来源</td>
							<td>推广码</td>
							<td>推广人数</td>
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
										${userspreadproxy.username}
										<c:if test="${empty userspreadproxy.realname}">
											-未实名
										</c:if>
										<c:if test="${!empty userspreadproxy.realname}">
											-${userspreadproxy.realname}
										</c:if>
										
									</td> 
									<td>
										<c:if test="${!empty userspreadproxy.regdate}">
											${sf.format(userspreadproxy.regdate)}
										</c:if>
									</td>
									<td>
										<c:if test="${userspreadproxy.registersource eq '1'}">自主注册</c:if>
										<c:if test="${userspreadproxy.registersource eq '2'}">推荐注册</c:if>
									</td>
									<td>${userspreadproxy.recommendlink}</td>
									<td>
										 <a style="cursor:pointer;color: blue">
											<button class="btn" data-backdrop="static"
											data-toggle="modal" data-dismiss="modal"
											data-target="#detailsModal"
											onclick="deatilUI('${userspreadproxy.baseid}')">${userspreadproxy.recommendnumber}个</button>
											
										 </a> 
										
										
									</td>
									<%-- <td>
										<c:if test="${!empty userspreadproxy.recommendprofit}">${userspreadproxy.recommendprofit}</c:if>	
										<c:if test="${empty userspreadproxy.recommendprofit}">0</c:if>	
										元
									</td> --%>
									
								
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
