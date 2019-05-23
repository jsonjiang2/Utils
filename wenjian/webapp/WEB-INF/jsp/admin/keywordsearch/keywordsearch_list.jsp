<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<title>搜索记录列表后台</title>
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

	//删除页面跳转j
	function deleteUI(id1) {
		var ff = confirm("您确定要删除吗？");
		if (!ff) {
			return;
		}
		var action = "${pageContext.request.contextPath}/admin/KeywordSearch/delete/";
		var data = {
			"id" : id1
		}

		var callback = function() {
			alert("删除成功");
			window.location.href = basePath + "/admin/KeywordSearch/tolist";
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
		var url = basePath + "/admin/KeywordSearch/deletemore";
		var callback = function(data) {
			alert("批量删除成功");
			window.location.href = basePath + "/admin/KeywordSearch/tolist";

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

	//查看详情页
	function lookDetail(pid,prefix) {
		window.open(prefix + "/platformInfo/platformDetail/" + pid); //在另外新建窗口中打开窗口
		return;
	}
</script>


</head>
<body style="font-size: 12px; font-family: 微软雅黑">


	<div class="container" style="width: 80%;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form action="${pageContext.request.contextPath}/admin/KeywordSearch/tolist" method="post" role="form" id="conditionForm">
					<input type="hidden" id="pageNum" name="pageNum" />
					<input type="hidden" id="pageSize" name="pageSize" />

					<div class="col-md-9 form-inline" style="margin-top: 15px;">
						<div class="form-group">
							<label>关键字:</label>
							<input type="text" class="form-control" value="${keyword}" name="keyWord" id="keyword" placeholder="关键字">
							&nbsp;&nbsp;
							<label>ip:</label>
							<input type="text" value="${searchip}" class="form-control" name="searchip" id="searchip" placeholder="ip">
							&nbsp;&nbsp;
							<label>cookie:</label>
							<input type="text" value="${cookiekey}" class="form-control" name="cookie" id="cookie" placeholder="cookie" style="width: 250px">
							&nbsp;&nbsp;
							<label>搜索时间:</label>
							<input class="form-control" type="text" class="Wdate" id="date1" name="date1" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${searchdate}" placeholder="选择搜索时间" />
						</div>
					</div>
					<div class="col-md-9 form-inline" style="margin-top: 6px; margin-bottom: 6px;">
						<button id="query_btn" class="btn btn-default" type="button" onclick="selectByCondition(1,20)">查询</button>
						<input type="button" value="重置" class="btn btn-default" id="reset" />
					</div>
				</form>

				<table class="table  table-hover" id="personList_table">
					<thead>
						<tr style="background-color: #CCCCCC;" class="text-center">
							<!-- <td>
								<input type="checkbox" id="allDel" class="myCheck" onclick="checkDelAll()">
							</td> -->
							<td>序号</td>
							<td>关键字</td>
							<td>ip</td>
							<td>cookie</td>
							<td>搜索时间</td>
							<td>平台收录</td>
							<td>平台数据</td>
							<!-- 	<td>操作</td> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
							<tr class="text-center">

								<%-- 	<td><input type="checkbox" name="checkDelName"
									class="myCheck" value="${item.id}"></td> --%>
								<td>${status.count}</td>
								<td>
									<a href="javascript:seKeyWord('${item.keyword}')" style="color: blue;"> ${item.keyword}</a>
								</td>
								<td>
									<a href="javascript:seIp('${item.searchip}')" style="color: blue;">${item.searchip}</a>
								</td>
								<td>
									<a href="javascript:seCookie('${item.cookiekey}')" style="color: blue;">${item.cookiekey}</a>
								</td>
								<td>${sf.format(item.searchdate)}</td>
								<c:choose>
									<c:when test="${empty item.include or item.include == 0}">
										<td style="color: red">未收录</td>
									</c:when>
									<c:when test="${not empty item.include and item.include != 0}">
										<td style="color: blue">已收录
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${not empty item.include and item.include != 0}">
										<td>
											<button onclick="lookDetail('${item.include}','${prefix}')">查看</button>
										</td>
									</c:when>
									<c:when test="${ empty item.include or item.include == 0}">
										<td></td>
									</c:when>
								</c:choose>


								<%-- 	<td>
									<button class="btn btn-default" onclick="deleteUI('${item.id}')">删除</button>
								</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 	<button class="btn btn-default" onclick="delBatch(this)">批量删除</button> -->
				<div id="page_div">
					<%@ include file="./../../common/pagehelper2.jsp"%>
				</div>

				<!-- 模态框 -->
				<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="delModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" onclick="clearMode('modal-body')" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="delModalLabel">
									<span class="glyphicon glyphicon-info-sign"></span>
									提示：
								</h4>
							</div>
							<div id="modal-body" class="modal-body"></div>
							<input type="hidden" id="crud" />
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" onclick="operate()" id="crudType">操作</button>
								<button type="button" class="btn btn-default" onclick="clearMode('modal-body')" data-dismiss="modal">取消</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>