<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}

.myCheck{
    background-color: white;
    border-radius: 5px;
    border:1px solid #d3d3d3;
    width:16px;
    height:16px;
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    line-height: 16px;
}

.myCheck:checked{
    background-color: #eee;
}


</style>
<title>首页主题设置列表</title>
<script type="text/javascript">
	$(function(){
		$("#select-type-text").val($("#select-type-text").data("type"));
  	})

 	//显示设置/修改页面
 	function settingShow(obj){
		var opid = $(obj).data("opid");
  		var url = basePath+"/admin/threadShowSettings/settingShow";
		var callback = function(data){
 		   $("#insert-modal-body").html(data)
  		   $("#insertModal").modal('show');
 		}
		$.get(url,{"opid":opid},callback);
	}

	//详情
	function detailShow(obj){
		var opid = $(obj).data("opid");
		var url = basePath+"/admin/threadShowSettings/detail";
		var callback = function(data){
		   $("#detail-modal-body").html(data)
		   $("#detailsModal").modal('show');
		}
		$.get(url,{"opid":opid},callback);
	}

 	//保存设置
 	function insert(){
		 var type = $("#setting_type").val();
		 var obj = $(".setting_type_box_"+type);
		 var params = {};
		 params.type = type;
		 params.remark = $("#main_box").find("textarea[name='remark']").val();
		 params.color = $("#main_box").find("input[name='color']").val();
		 params.id = $("#main_box").find("input[name='id']").val();

		 params.tid = $(obj).find("input[name='tid']").val();
		 params.link = $(obj).find("input[name='link']").val();
		 params.subject = $(obj).find("textarea[name='subject']").val();
		 params.message = $(obj).find("textarea[name='message']").val();
		 params.sort = $(obj).find("select[name='sort']").val();
		 params.img = $(obj).find("input[name='img']").val();
		 params.pid = $(obj).find("input[name='pid']").val();
		 params.pno = $(obj).find("input[name='pno']").val();
		 params.aid = $(obj).find("input[name='aid']").val();
 		 params.tdateline = $("#tdateline").val();
 		 params.status = $(obj).find("select[name='status']").val();
 		 console.log(JSON.stringify(params));
		 var callback = function(data){
			 alert(data.message);
			 if(data.code =="88"){
				 window.location.href=basePath+"/admin/threadShowSettings/list";
			 }
		 }
		 var insertUrl = basePath+"/admin/threadShowSettings/setting"
		 $.post(insertUrl,params,callback);
	}

 	//查看图片
 	function imgEye(img){
 		$("#detailsModalLabel").html("<span class='glyphicon glyphicon-info-sign'></span>提示：正在进行图片查看操作");
 		$("#detail-modal-body").html("<img style='max-width:100%;' src="+img+">");
 		$("#detailsModal").modal("show");
 	}
</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-select"
				action="list">
				<input type="hidden" id="pageNum" name="pageNum">
				<input type="hidden" id="pageSize" name="pageSize">
 				&nbsp;&nbsp;&nbsp;&nbsp;
  				<div class="form-group">
					状态： <select id="select-type-text" name="type" class="form-control" data-type="${setting.type}">
						<option value="">--请选择状态--</option>
						<option value=1>头条</option>
						<option value=2>次头条</option>
						<option value=3>轮播图</option>
						<option value=4>热门平台</option>
						<option value=5>网贷咨询</option>
 						<option value=6>资源主推荐</option>
 						<option value=7>巴士-最新</option>
 						<option value=8>巴士-最热</option>
 						<option value=9>巴士-精华</option>
 						<option value=10>平台推荐</option>
						<option value=11>今日收录</option>
						<option value=12>h5轮播图</option>
     				</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
					<button type="button" class="btn btn-default" style="width: 100px;" onclick="settingShow(this)">添加</button>
  				</div>
			</form>
			<div style="margin-top: 20px;"></div>
  			<jsp:include page="/WEB-INF/jsp/admin/threadshowsettings/threadShowSettingsListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>