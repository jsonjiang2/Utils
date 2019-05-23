<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="com.ganjiangps.wangdaibus.common.util.DateUtils,com.ganjiangps.wangdaibus.common.util.AES"%>
<%@include file="../../common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../../common/public.jsp"%>
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
<script type="text/javascript" src="/static/js/common.js"></script>
<style>
</style>
<title>成员添加</title>
<script type="text/javascript">
    $(function(){
		//页面查询条件数据回显
		$("#select-username-text").val("${AES.getDecrypt(personalManagementUser.username)}");
	})

	//显示新增页面
	function insertView() {
		$.post("insertView", null, function(data) {
			$("#insert-modal-body").html(data);
		});
	}

	//名单成员新增验证
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
						message : "* 请选择小名单"

					}
				}
			}
		}
	}

	//点击添加
	function insert() {
		var bv = $("#insert-form").data('bootstrapValidator');
		//手动触发验证
		bv.validate();
		if (bv.isValid()) { 
			var arr = $("input[name='baseids']");
			if (arr.length < 1) {
				alert("请填写用户名");
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

	//名单成员编辑验证
	var updateValidate = {
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			username : {
				validators : {
					notEmpty : {
						message : "* 请填写用户名"
					},
					remote : {
						message : "* 该用户小名单已存在，或者该用户不存在",
						url : 'validateUsername',
						type : 'POST',
						data : function(validator) {
							return {
								username : $("input[name='username']").val(),//获取输入的用户名,传到Controller
								pmno : $("#update-pmno-text").val()//获取小名单编号,传到Controller
							};
						}
					}
				}
			}
		}
	}

	//编辑更新
	function update() {
		var bv = $("#update-form").data('bootstrapValidator');
		//手动触发验证
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

	//删除成员
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

	//移除添加的用户
	function removeUser(obj) {
		$(obj).parent().parent().remove();
	}
	
	//全选
	function checkDelAll(){
        var all = document.getElementById('allDel');
        var one = document.getElementsByName('checkDelName');
        for(var i=0;i<one.length;i++){
            one[i].checked = all.checked;
        }
    }
	
	//批量删除
	function delBatch(){
        var number = "";
        $("input:checkbox[name=checkDelName]:checked").each(function(k){
            if(k == 0){
                number = $(this).val();
            }else{
                number += ","+$(this).val();
            }
        });
        if(isEmpty(number)){
            alert("请至少选择一行数据！");
            return ;
        }
        var qr = confirm("您确定要这些数据吗？");
        if(!qr){
            return ;
        }
        var url = basePath+"/admin/personalManagementUser/delMany";
     
        $.post(url,{"ids":number},callback);
    }

    function queryUsername(username){
        $("#select-username-text").val(username);
        $("#form-select").submit();
    }
    function queryAllPerson2(pageNum, pageSize) {
        $("#pageNum").val(pageNum);
        $("#pageSize").val(pageSize);
        $("#form-select").submit();
    }
    
</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<!-- 名单成员查询表单start -->
			<form method="post" class="form-inline" id="form-select" action="list">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
				<div class="form-group">
					小名单名称：<select id="select-pmno" class="form-control" name="pmno">
						<option value="">---请选择---</option>
						<c:forEach items="${noList}" var="item">
							<option value="${item.pmno }">${item.pmname}</option>
						</c:forEach>
					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					用户名：<input class="form-control" type="text"
						id="select-username-text" name="username"
						style="text-align: center; line-height: 18px;" value="" placeholder="用户名">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="button" onclick="queryAllPerson2(1,20)">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div> 
			</form>
			<!-- 名单成员查询表单end -->

			<div class="col-md-12">
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<button style="margin-left: 70px; color: blue;" type="button"
						class="btn btn-default" onclick="insertView()" data-toggle="modal"
						data-target="#insertModal" id="add-btn" data-backdrop="static">新增</button>
				</div>
			</div>

			<!-- 名单成员列表start -->
			<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td><input type="checkbox" id="allDel" class="myCheck"
							onclick="checkDelAll()"></td>
						<td>序号</td>
						<td>小名单编号</td>
						<td>小名单名称</td>
						<td>用户名-姓名</td>
						<td>设置时间</td>
						<td>设置人</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td><input type="checkbox" name="checkDelName"
								class="myCheck" value="${item.id}"></td>
							<td>${status.count}</td>
							<td>${item.pmno}</td>
							<td>
								<a href="list?pmno=${item.pmno }">${item.pmname }</a></td> 
							<td> 							
	                            <wdb:getUser uid="${item.baseid}" var="user1">
	                                <a href="javascript:queryUsername('${user1.username}')" style="color: blue;">
	                                     ${user1.username}-${user1.realname}
	                                </a>
	                            </wdb:getUser>
                            </td> 
							<td>${empty item.addtime ? '':dateUtils.formatDate(item.addtime)}</td>
							<td>${item.addman}</td>
							<td>
								<button class="btn btn-default" data-toggle="modal"
									data-target="#updateModal" data-backdrop="static"
									onclick="updateView('${item.id}');">编辑</button>
								<button class="btn btn-danger" data-toggle="modal"
									data-target="#delModal" data-backdrop="static"
									onclick="deleteView('${item.id}');">删除</button>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 名单成员列表end -->

			<button class="btn btn-danger" onclick="delBatch();">批量删除</button>
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