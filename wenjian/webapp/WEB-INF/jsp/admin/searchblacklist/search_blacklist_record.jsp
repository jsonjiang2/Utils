<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<title>搜索黑名单后台</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<style>
.text-center td {
	vertical-align: text-top !important;
	border: 1px solid #666;
}

#personList_table {
	font-style: normal;
	font-variant-ligatures: normal;
	font-variant-caps: normal;
	font-variant-numeric: normal;
	font-weight: normal;
	font-stretch: normal;
	font-size: 12px;
	line-height: 24px;
	font-family: "Microsoft Yahei", "冬青黑体简体中文 w3", 宋体;
	overflow-y: auto;
}

#tableId tr td {
	border: none;
}
</style>
<script type="text/javascript">
	/*
	 全局的pageNum与pageSize
	 */
	var pageNum = '${pagehelper.pageNum}';
	var pageSize = '${pagehelper.pageSize}';

	$(function() {
		$(".remark-p").each(function(i) {
			var num = $(this).text();
			if (num.length > 5) {
				$(this).text(num.substr(0, 5) + "...");
			}
		});
		//重置
		$("#reset").click(function() {
			resetmeragent();
		});
	});

	//清空查询条件(重置)
	function resetmeragent() {
		$("#keyword").val("");
		$("#searchip").val("");
		$("#date1").val("");
		$("#cookie").val("");
	}

	//点击List列表页面中字段进行查询
	function selectByField() {
		//清空查询条件
		resetmeragent();

		//防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
		pageNum = 1;
		selectByCondition(pageNum, pageSize);
	}

	function selectByCondition(pageNum, pageSize) {
		//去掉查询条件两边的空格
		$("#keyword").val($.trim($("#keyword").val()));
		$("#searchip").val($.trim($("#searchip").val()));
		$("#cookie").val($.trim($("#cookie").val()));
		$("#isuse").val($.trim($("#isuse").val()));

		$("#pageNum").val(pageNum);
		$("#pageSize").val(pageSize);
		$("#conditionForm").submit();
	}

	function seKeyWord(keyword) {
		if (keyword != "") {
			$("#keyword").val(keyword);
		}
		//防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
		pageNum = 1;
		selectByCondition(pageNum, pageSize);

	}
	function seIp(Ip) {
		if (Ip != "") {
			$("#searchip").val(Ip);
		}
		pageNum = 1;
		selectByCondition(pageNum, pageSize);

	}
	function seCookie(Cookie) {
		if (Cookie != "") {
			$("#cookie").val(Cookie);
		}
		pageNum = 1;
		selectByCondition(pageNum, pageSize);

	}

	//删除
	function deleteUI(id1) {
		var ff = confirm("您确定要删除吗？");
		if (!ff) {
			return;
		}
		var action = "${pageContext.request.contextPath}/admin/SearchBlacklist/delete/";
		var data = {
			"id" : id1
		}

		var callback = function() {
			alert("删除成功");
			window.location.href = basePath + "/admin/SearchBlacklist/tolist";
		}
		$.post(action, data, callback);
	}
	//Del全选
	function checkDelAll() {
		var all = document.getElementById('allDel');//获取到点击全选的那个复选框的id  
		var one = document.getElementsByName('checkDelName');//获取到复选框的名称  
		//因为获得的是数组，所以要循环 为每一个checked赋值  
		for (var i = 0; i < one.length; i++) {
			one[i].checked = all.checked;
		}
	}

	//批量删除
	function delBatch(obj) {

		var number = "";
		$("input:checkbox[name=checkDelName]:checked").each(function(k) {
			if (k == 0) {
				number = $(this).val();
			} else {
				number += "," + $(this).val();
			}
		});
		if (isEmpty(number)) {
			alert("请至少选择一个记录操作");
			return;
		}

		var ff = confirm("您确定要批量删除吗？");
		if (!ff) {
			return;
		}
		var url = basePath + "/admin/SearchBlacklist/deletemore";
		var callback = function(data) {
			alert("批量删除成功");
			window.location.href = basePath + "/admin/SearchBlacklist/tolist";

		}
		$.post(url, {
			"ids" : number
		}, callback);
	}

	//操作
	function operate() {
		var crud = $("#crud").val();
		if (crud == "insert") {
			insert()
		} else if (crud == "update") {
			update()
		} else if (crud == "delete") {
			delById()
		}
	}

	//分页
	function queryAllPerson2(pageNum, pageSize) {
		selectByCondition(pageNum, pageSize);
	}

	function clearMode(id) {
		$("#" + id).html("");
	}

	$(function() {
		$(".daily-omit", "").each(function() {
			var num = $(this).html();
			if (num.length > 5) {
				$(this).html(num.substr(0, 10) + "...");
			}
		});

	});

	// 新增页面跳转
	function insertUI() {
		var action = basePath + "/admin/SearchBlacklist/toinster";
		$.post(action, function(data) {
			$("#insert-modal-body").html(data);
		});

	}
	//修改页面跳转
	function updateUI(id) {
		var action = basePath + "/admin/SearchBlacklist/toupdate/" + id;
		$.post(action, function(data) {
			$("#update-modal-body").html(data);
		});
	}
	// 新增数据
	function insert() {
		var action = basePath + "/admin/SearchBlacklist/inster";
		var ip = $("#ip").val();
		var cookiekey = $("#cookiekey").val();
		var params = {
			"ip" : ip,
			"cookiekey" : cookiekey
		}

		var callback = function(data) {
			alert(data.message);
			window.location.href = basePath + "/admin/SearchBlacklist/tolist";
		}
		$.post(action, params, callback);
	}
	// 保存修改
	function update() {
		var action = basePath + "/admin/SearchBlacklist/update";
		var id = $('#oldId').val();
		var ip = $("#ip").val();
		var cookiekey = $("#cookiekey").val();
		var params = {
			"id" : id,
			"ip" : ip,
			"cookiekey" : cookiekey
		}

		var callback = function(data) {
			alert(data.message);
			window.location.href = basePath + "/admin/SearchBlacklist/tolist";
		}
		$.post(action, params, callback);
	}
</script>


</head>
<body style="font-size: 12px; font-family: 微软雅黑">


	<div class="container" style="width: 80%;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form
					action="${pageContext.request.contextPath}/admin/SearchBlacklist/tolist"
					method="post" role="form" id="conditionForm">
					<input type="hidden" id="pageNum" name="pageNum" /> <input
						type="hidden" id="pageSize" name="pageSize" />
				</form>
				<div class="col-md-9 form-inline"
					style="margin-top: 6px; margin-bottom: 6px;">
					<button id="query_btn" class="btn btn-default" type="button"
						ata-backdrop="static" data-toggle="modal" data-dismiss="modal"
						data-target="#insertModal" onclick="insertUI()">新增</button>

				</div>
				<table class="table  table-hover" id="personList_table">
					<thead>
						<tr style="background-color: #CCCCCC;" class="text-center">
							<td><input type="checkbox" id="allDel" class="myCheck"
								onclick="checkDelAll()"></td>
							<td>序号</td>
							<td>ip</td>
							<td>cookie</td>
							<td>添加时间</td>
							<td>操作</td>
							<!-- 	<td>操作</td> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagehelper.list}" var="item"
							varStatus="status">
							<tr class="text-center">

								<td><input type="checkbox" name="checkDelName"
									class="myCheck" value="${item.id}"></td>
								<td>${status.count}</td>
								<td>${item.ip}</td>
								<td>${item.cookiekey}</td>
								<td>${sf.format(item.dateline)}</td>
								<td>
									<button class="btn btn-default" ata-backdrop="static"
										data-toggle="modal" data-dismiss="modal"
										data-target="#updateModal" onclick="updateUI('${item.id}')">修改</button>
									<button class="btn btn-default"
										onclick="deleteUI('${item.id}')">删除</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button class="btn btn-default" onclick="delBatch(this)">批量删除</button>
				<div id="page_div">
					<%@ include file="./../../common/pagehelper2.jsp"%>
				</div>

				<!-- 模态框 -->
				<div class="modal fade" id="Modal" tabindex="-1" role="dialog"
					aria-labelledby="delModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									onclick="clearMode('modal-body')" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="delModalLabel">
									<span class="glyphicon glyphicon-info-sign"></span>提示：
								</h4>
							</div>
							<div id="modal-body" class="modal-body"></div>
							<input type="hidden" id="crud" />
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" onclick="operate()"
									id="crudType">操作</button>
								<button type="button" class="btn btn-default"
									onclick="clearMode('modal-body')" data-dismiss="modal">取消</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- 引入公共的模态框 -->
	<%@ include file="./../../common/modal.jsp"%>
</body>
</html>