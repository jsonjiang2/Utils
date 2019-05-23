<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.ganjiangps.wangdaibus.common.util.DateUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../common/taglib.jsp"%>
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
<script type="text/javascript">
	$(function() {
		//当备注信息字数大于5个时，以"..."显示
		$(".p-remark").each(function() {
			var num = $(this).html();// 获取文本内容
			if (num.length > 5) {
				$(this).html(num.substr(0, 5) + "...");

			}
		})
		
		//当名单名称字数大于10个时，以"..."显示
		$(".p-pmname").each(function() {
			var num = $(this).html();// 获取文本内容
			if (num.length > 10) {
				$(this).html(num.substr(0, 10) + "...");

			}
		})
		
		
		$(".p-remark").tzTip();//备注悬浮显示
		$(".p-pmname").tzTip();//名单名称悬浮显示
		
		//页面查询条件数据回显
		$("#select-pmno-text").val("${personalManagement.pmno}");
		$("#select-pmname-text").val("${personalManagement.pmname}");
		$("#select-pmtype").val("${personalManagement.pmtype}");

	});

	//显示新增页面
	function insertView() {
		$.post("insertView", null, function(data) {
			$("#insert-modal-body").html(data);
		});
	}
	//大小名单录入验证
	var insertValidate = {
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			pmtype:{
				validators:{
					notEmpty:{
						message:"* 请选择名单类型"
					}
				}
			},
			
			pmname : {
				validators : {
					notEmpty : {
						message : "* 请填写名单名称"
					},
					remote : {
						message : "该名单名称已存在",
						type : 'POST',
						url : 'validatePmname',
						data : function(validators) {
							//获取输入的pmname值,传给Controller
							return {
								pmname : $("input[name='pmname']").val()
							};
						}
					}
				}
			}
		}
	}

	//添加
	function insert() {

		var bv = $("#insert-form").data('bootstrapValidator');
		//手动触发验证
		bv.validate();
		if (bv.isValid()) {
			$.post("insert", $("#insert-form").serialize(), callback);
		}
	}

	//显示编辑页面
	function updateView(id) {
		$.post("updateView/" + id, function(data) {
			$("#update-modal-body").html(data);
		});
	}

	//编辑更新
	function update() {

		var bv = $("#update-form").data('bootstrapValidator');
		bv.validate();
		if (bv.isValid()) {
			$.post("update", $("#update-form").serialize(), callback);

		}
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
			<!-- 大小名单查询表单start -->
			<form action="list" id="form-select" class="form-inline">
				<input type="hidden" id="pageNum" name="pageNum">
				<input type="hidden" id="pageSize" name="pageSize">
				<div class="form-group">
					名单编号：<input class="form-control" type="text" id="select-pmno-text"
						name="pmno" style="text-align: center; line-height: 18px;"
						placeholder="名单编号">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					名单名称：<input class="form-control" type="text"
						id="select-pmname-text" name="pmname"
						style="text-align: center; line-height: 18px;"
						placeholder="名单名称">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					名单类型：<select id="select-pmtype" name="pmtype" class="form-control">
						<option value="">--请选择--</option>
						<option value=1>大名单</option>
						<option value=2>小名单</option>
					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>


			</form>
			<!-- 大小名单查询表单end -->

			<div class="col-md-12">
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<button type="button" class="btn btn-default" data-toggle="modal"
						style="margin-left: 85px; color: blue;" data-target="#insertModal"
						data-backdrop="static" onclick="insertView();">新增</button>
				</div>
			</div>


			<!-- 大小名单列表start -->
			<table class="table table-hover table-striped">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>名单编号</td>
						<td>名单名称</td>
						<td>包含小名单</td>
						<td>总人数</td>
						<td>设置人</td>
						<td>设置时间</td>
						<td>备注</td>
						<td>操作</td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.count}</td>
							<td>${item.pmno}</td>
							<td class="p-pmname"
								tip="${item.pmname==null?'暂无名单名称':item.pmname}">${item.pmname}</td>
							<td><c:choose>
									<c:when test="${empty item.sonsize}">--</c:when>
									<c:when test="${not empty item.sonsize}">${item.sonsize}个</c:when>
								</c:choose></td>
							<td>${item.num}人</td>

							<td>${item.addman}</td>
							<td>${empty item.addtime ? '':dateUtils.formatDate(item.addtime)}
							</td>
							<td class="p-remark"
								tip="${item.remark==null?'暂无备注信息':item.remark}">${item.remark}</td>
							<td>
								<button class="btn btn-default" data-toggle="modal"
									data-target="#updateModal" data-backdrop="static" type="button"
									onclick="updateView('${item.id}');">编辑</button>
								<button class="btn btn-danger" data-toggle="modal"
									data-target="#delModal" data-backdrop="static" type="button"
									onclick="deleteView('${item.id}');">删除</button>
							</td>


						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 大小名单列表end -->

			<!-- 分页 -->
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="../../common/pagehelper.jsp"%>
			</div>

		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="../../common/modal.jsp"%>
</body>
</html>