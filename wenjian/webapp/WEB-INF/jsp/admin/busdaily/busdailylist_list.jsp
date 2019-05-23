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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="javascript" type="text/javascript"src="WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="WdatePicker.css">

<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<title>巴士日报后台</title>
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
		$("#name").val("");
		$("#date1").val("");
		$("#type").val("");
		$("#isuse").val("");
	}

	//点击List列表页面中字段进行查询
	function selectByField() {
		//清空查询条件
		resetmeragent();

		//防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
		pageNum = 1;
		selectByCondition(pageNum, pageSize);
	}

	//删除页面跳转j
	function deleteUI(id1) {
		var ff = confirm("您确定要删除吗？");
		if (!ff) {
			return;
		}
		var action = "${pageContext.request.contextPath}/admin/daily/delete";
		var data = {
			"id" : id1
		}

		var callback = function() {
			alert("删除成功");
			window.location.href = basePath + "/admin/daily/tolist";
		}
		$.post(action, data, callback);
	}
	
	//位次排列
	function rank(id){
		
		var number = "";
		$("input:checkbox[name=checkDelName]:checked").each(function(k) {
			if (k == 0) {
				number = $(this).val();
			} else {
				alert("请仅选择一个记录操作");
				window.location.href = basePath + "/admin/daily/tolist";
			}
		});
	
		var action = "${pageContext.request.contextPath}/admin/daily/rank";
		var data = {
				"id" : number,
				"placeId" : $("#placeId").val()
			}
		
		var callback = function() {
			window.location.href = basePath + "/admin/daily/tolist";
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
	
	//复位
	function cleanplaceid(){
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
		var ff = confirm("您确定要复位所选位次吗？");
		if (!ff) {
			return;
		}
		var url = basePath + "/admin/daily/cleanplaceid";
		var callback = function(data) {
			alert("位次复位成功");
			window.location.href = basePath + "/admin/daily/tolist";

		}
		$.post(url, {
			"ids" : number
		}, callback);
	}

	//批量删除
	function delBatch(obj) {

		var number = "";
		$("input:checkbox[name=checkDelName]:checked").each(function(k) {
			if (k == 0) {               //k: 选择器index的位置; 第几个元素,0为第1位;
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
		var url = basePath + "/admin/daily/deletemore";
		var callback = function(data) {
			alert("批量删除成功");
			window.location.href = basePath + "/admin/daily/tolist";

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

	function selectByCondition(pageNum, pageSize) {
		//去掉查询条件两边的空格
		$("#name").val($.trim($("#name").val()));
		$("#date").val($.trim($("#date").val()));
		$("#type").val($.trim($("#type").val()));
		$("#isuse").val($.trim($("#isuse").val()));

		$("#pageNum").val(pageNum);
		$("#pageSize").val(pageSize);
		$("#conditionForm").submit();
	}

	//分页
	function queryAllPerson2(pageNum, pageSize) {
		selectByCondition(pageNum, pageSize);
	}

	function clearMode(id) {
		$("#" + id).html("");
	}

	//省略号替换字符
	$(function() {
		$(".daily-omit", "").each(function() {
			var num = $(this).html();
			if (num.length > 5) {
				$(this).html(num.substr(0, 15) + "...");
			}
		});

	});
</script>


</head>
<body style="font-size: 12px; font-family: 微软雅黑">

	<div class="container" style="width: 80%;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form action="${pageContext.request.contextPath}/admin/daily/tolist" method="post" role="form" id="conditionForm">
					<input type="hidden" id="pageNum" name="pageNum" /> 
					<input type="hidden" id="pageSize" name="pageSize" />
					<div class="col-md-9 form-inline" style="margin-top: 15px;">
						<div class="form-group">
							<label>标题关键字:</label> 
							<input type="text" class="form-control" name="keyWord" id="name" value = "${keyword}" placeholder="标题关键字">&nbsp;&nbsp;
							<label>发布时间:</label>
							 <input class="form-control" type="text" class="Wdate" id="date1" name="date1"
                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value = "${searchdate}" placeholder="选择发布日期" />
						</div>
					</div>
					<div class="col-md-9 form-inline"
						style="margin-top: 6px; margin-bottom: 6px;">
						<button id="query_btn" class="btn btn-default" type="button" onclick = "selectByCondition(1,20)">查询
						</button>
						<input type="button" value="重置" class="btn btn-default" id="reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="plcaeId" id="placeId" value="0" style="width:45px;height:30px">
						<button type="button" class="btn btn-default"  onclick="rank('${item.id}')">设置位次</button>
						<button type="button" class="btn btn-default"  onclick="cleanplaceid()">复位位次</button>
					</div>
					
					<br>
					<br> <a class="btn btn-default"
						href="${basePath}/admin/daily/torelease">发布</a>
				</form>
				
				




				<table class="table  table-hover" id="personList_table">
					<thead>
						<tr style="background-color: #CCCCCC;" class="text-center">
							<td><input type="checkbox" id="allDel" class="myCheck"
								onclick="checkDelAll()"></td>
							<td>序号</td>
							<td>位次</td>
							<td>标题</td>
							<td>发布时间</td>
							<td>发布人</td>
							<td>操作人</td>
							<td>操作</td>
						
						</tr>
					</thead>
					<tbody>
						<!-- 这里面${userRecharge.id }是点的model里面的属性 -->
						<c:forEach items="${pagehelper.list}" var="item"
							varStatus="status">
							<tr class="text-center">
								<td><input type="checkbox" name="checkDelName" class="myCheck" value="${item.id}"></td>
								<td>${status.count}</td>
								<td>${item.placeId}</td>
								<td class="daily-omit">${item.title}</td>
								<td>${sf.format(item.date)}</td>
								<td>${item.userName}</td>
								<td>${item.operator}</td>
								<td>
									<a class="btn btn-default" href="${basePath}/admin/daily/release?id=${item.id}">修改</a>
									<button class="btn btn-default" onclick="deleteUI('${item.id}')">删除</button>
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

</body>
</html>