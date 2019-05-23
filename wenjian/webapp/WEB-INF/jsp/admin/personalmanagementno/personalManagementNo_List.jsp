<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.ganjiangps.wangdaibus.common.util.DateUtils"%>
<%@include file="../../common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../../common/public.jsp"%>

<script type="text/javascript" src="/static/js/common.js"></script>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}

a:link {
	font-size: 12px;
	color: blue
}

a:visited {
	font-size: 12px;
	color: blue
}

a:hover {
	font-size: 12px;
	color: red
}
</style>
<title>大小名单</title>
<script type="text/javascript">
	$(function() {
		//当备注信息字数大于5个时，以"..."显示
		$(".remark-p").each(function() {
			var num = $(this).html();// 获取文本内容
			if (num.length > 5) {
				$(this).html(num.substr(0, 5) + "...");
			}
		});
		
		//当大名单名称字数大于10个时，以"..."显示
		$(".pmname-p").each(function() {
			var num = $(this).html();// 获取文本内容
			if (num.length > 10) {
				$(this).html(num.substr(0, 10) + "...");
			}
		});

		$(".tzui-tips").tzTip();//备注悬浮显示
		$(".pmname-p").tzTip();//大名单名称悬浮显示
		
		//页面查询条件数据回显
		$("#select-pmname-text").val("${personalManagementNo.pmname}");
		
	});

	//显示新增页面
	function insertView() {
		$.post("insertView", null, function(data) {
			$("#insert-modal-body").html(data)
		});
	}

	//名单匹配新增验证
	var insertValidate = {
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			pmno : {
				validators : {
					notEmpty : {
						message : "* 请选择名单"
					}
				}
			}
		}
	}
	//添加
	function insert() {
		var bv = $("#insert-form").data("bootstrapValidator");
		//手动触发验证
		bv.validate();
		if (bv.isValid()) {
			var arr = $("input[name='nos']");
			if (arr.length < 1) {
				alert("提示：请添加小名单编号。");
				return;
			}
			$.post("insert", $("#insert-form").serialize(), callback);
		}
	}

	//显示编辑页面
	function updateView(id) {
		$.post("updateView/" + id, function(data) {
			$("#update-modal-body").html(data);
		});
	}

	//名单匹配编辑后回到列表页
	function update() {
		var arr = $("input[name='nos']");
		if (arr.length < 1) {
			alert("提示：请添加小名单编号。");
			return;
		}
		$.post("update", $("#update-form").serialize(), callback);
	}

	//显示删除页面
	function deleteView(id) {
		$.post("deleteView/" + id, function(data) {
			$("#del-modal-body").html(data);
		});
	}

	function delById() {
		var id = $("#del-id").val();
		$.post("delete/" + id, callback);
	}

	//显示小名单详情页面
	function detail(id) {
		$.post("detail/" + id, function(data) {
			$("#detail-modal-body").html(data);
		});
	}

	//显示用户详情页
	function userDetail(id) {
		$.post("userDetail/" + id, function(data) {
			$("#detail-modal-body").html(data);
		});
	}

	//移除小名单
	function removeNo(obj) {
		$(obj).parent().parent().remove();
	}

	//回到列表页
	function callback(data) {
		alert(data.Msg);
		if (data.result == "success") {
			queryAllPerson('${pagehelper.pageNum}', '${pagehelper.pageSize}');
		}
	}
</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<!-- 名单匹配查询表单start -->
			<form action="/admin/personalManagementNo/mList" class="form-inline"
				id="form-select">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
				<div class="form-group">
					名单名称：<input class="form-control" type="text"
						id="select-pmname-text" name="pmname"
						style="text-align: center; line-height: 18px;" placeholder="名单名称">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<!-- 名单匹配查询表单end -->
			<div class="col-md-12">
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<button style="margin-left: 80px; color: blue;" type="button"
						class="btn btn-default" onclick="insertView()" data-toggle="modal"
						data-target="#insertModal" id="add-btn" data-backdrop="static">新增</button>
				</div>
			</div>

			<div style="margin-top: 15px;"></div>

			<!-- 名单匹配列表start -->
			<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>大名单编号</td>
						<td>大名单名称</td>
						<td>包含小名单</td>
						<td>大名单总人数</td>
						<td>设置时间</td>
						<td>设置人</td>
						<td>备注</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.count }</td>
							<td>${item.pmno}</td>
							<td class="pmname-p"
								tip="${item.pmname == null ? '暂无名单名称' : item.pmname}">${item.pmname }</td>
							<td><button class="btn btn-default" data-toggle="modal"
									data-target="#detailsModal" data-backdrop="static"
									onclick="detail('${item.id}')">${item.sonsize}个</button></td>
							<td><button class="btn btn-default" data-toggle="modal"
									data-target="#detailsModal" data-backdrop="static"
									onclick="userDetail('${item.id}')">${item.num }人</button></td>
							<td>${empty item.addtime ? '':dateUtils.formatDate(item.addtime)}

							</td>
							<td>${item.addman }</td>
							<td class="remark-p tzui-tips"
								tip="${item.remark == null ? '暂无备注信息' : item.remark }">${item.remark }</td>
							<td>
								<button class="btn btn-default" data-toggle="modal"
									data-target="#updateModal" data-backdrop="static"
									onclick="updateView('${item.id}')">编辑</button>&nbsp;&nbsp;
								<button class="btn btn-danger" data-toggle="modal"
									data-target="#delModal" data-backdrop="static"
									onclick="deleteView('${item.id}')">删除</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 名单匹配列表end -->

			<!-- 分页-->
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="../../common/pagehelper.jsp"%>
			</div>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="../../common/modal.jsp"%>
</body>
</html>