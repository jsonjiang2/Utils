<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="<%=basePath%>/static/js/common.js"></script>
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
<title>资源主组别</title>
<script type="text/javascript">
	$(function(){
		$("#select-username-text").val("${resourcesGroup.username}");
		$("#select-ugroup-text").val("${resourcesGroup.ugroup}");
		$("#select-ugroupname-text").val("${resourcesGroup.ugroupname}");
	})
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
 				<div class="form-group">
					用户名：<input class="form-control" type="text" id="select-username-text" data-name=""
						name="username" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="用户名">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					组别号：<input class="form-control" type="text" id="select-ugroup-text" data-name=""
						name="ugroup" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="组别号">
				</div>
				&nbsp;&nbsp;
 				<div class="form-group">
					组别名：<input class="form-control" type="text" id="select-ugroupname-text" data-name=""
						name="ugroupname" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="组别名称">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
			<div align="right" style="margin-top: 20px;margin-bottom: 20px;">
				<button class="btn btn-default" onclick="resourcesGroup_addViewModal()" data-backdrop="static"
										data-toggle="modal" data-dismiss="modal"
										data-target="#insertModal">新增资源主</button>
			</div>
 			<jsp:include page="/WEB-INF/jsp/admin/resourcesgroup/resourcesGroupTemp.jsp"></jsp:include>
		</div>
	</div>
	
	<script type="text/javascript">
			//----------------------------新增----------------------------------//
			//打开添加模态框
			function resourcesGroup_addViewModal(){
				var action = "/admin/resourcesGroup/insertView";    // 通过id查询需要修改的bean信息
				$.post(action,function(data){
					$("#insert-modal-body").html(data);
				});
	    		
			}
			
			//新增资源主到资源主组别
			function insert(){
				var jsonData = $("#resourcesGroup_insertForm").serialize();
			    var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
				var bv = $("#resourcesGroup_insertForm").data("bootstrapValidator");
				//手动触发验证
				bv.validate();
				var action ="${pageContext.request.contextPath}/admin/resourcesGroup/insert";
				if(bv.isValid()){
					$.post(action, params, function(data){
						if(data.meta==null){
			    			alert("添加失败，请检查该用户是否已经存在此组里面，用户信息是否有误");
			    		}else{
			    			alert(data.meta.message);
				    		window.location.reload();
			    		}
					  /* if(data.meta.code=="88"){
			       		  alert(data.meta.message);
				       	  window.location.href="${pageContext.request.contextPath}/admin/resourcesGroup/list";

			       	  }else{
			       		 alert(data.meta.message);
			       	  } */
					});
				}
			}
			
			//----------------------------修改----------------------------------//
			//修改模态框
			function resourcesGroup_modify(id){
				var action = "/admin/resourcesGroup/updateView";    // 通过id查询需要修改的bean信息
				$.post(action,{id:id},function(data){
					$("#update-modal-body").html(data);
				});
			}
			
			//修改资源主组别信息提交
			function update(){
				var jsonData = $("#resourcesGroup_insertForm").serialize();
			    var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
				var bv = $("#resourcesGroup_insertForm").data("bootstrapValidator");
				//手动触发验证
				bv.validate();
				var action ="${pageContext.request.contextPath}/admin/resourcesGroup/update";
				if(bv.isValid()){
					$.post(action, params, function(data){
						if(data.meta==null){
			    			alert("修改失败，用户信息是否有误");
			    		}else{
			    			alert(data.meta.message);
				    		window.location.reload();
			    		}
					  /* if(data.meta.code=="88"){
			       		  alert(data.meta.message);
				       	  window.location.href="${pageContext.request.contextPath}/admin/resourcesGroup/list";

			       	  }else{
			       		 alert(data.meta.message);
			       	  } */
					});
				}
			}
				
	</script>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
	<!-- 查看详情模态框 -->
	<!-- <div class="modal fade" id="detailsModal" tabindex="-1" role="dialog"
		aria-labelledby="detailsModalLabel">
		<div id="detail-modal" class="modal-dialog" style="width:1000px" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="detailsModalLabel">
						<span class="glyphicon glyphicon-info-sign"></span>提示：正在进行查看详情操作
					</h4>
				</div>
				<div id="detail-modal-body" class="modal-body"></div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div> -->
</body>
</html>