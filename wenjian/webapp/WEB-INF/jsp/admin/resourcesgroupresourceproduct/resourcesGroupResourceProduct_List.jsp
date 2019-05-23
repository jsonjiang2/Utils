<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>组别资源和产品</title>
<script type="text/javascript">
	$(function(){
		$("#select-username-text").val("${resourcesGroupResourceProduct.username}");
		$("#select-ugroup-text").val("${resourcesGroupResourceProduct.ugroup}");
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
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>
			</form>
			<div style="margin-top: 20px;"></div>
 			<jsp:include page="/WEB-INF/jsp/admin/resourcesgroupresourceproduct/resourcesGroupResourceProductTemp.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript">
		//打开添加模态框
		function resourcesGroupResourceProduct_addViewModal(id){
			var action = "/admin/resourcesGroupResourceProduct/insertPage";    // 通过id查询需要修改的bean信息
			$.post(action,{id:id},function(data){
				$("#insert-modal-body").html(data);
			});
		}
		//提交数据
		function insert(){
			var jsonData = $("#resourcesGroupResourceProduct_insertForm").serialize();
		    var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
			var bv = $("#resourcesGroupResourceProduct_insertForm").data("bootstrapValidator");
			//手动触发验证
			bv.validate();
			var action ="${pageContext.request.contextPath}/admin/resourcesGroupResourceProduct/insertData";
			if(bv.isValid()){
				$.post(action, params, function(data){
					if(data.meta==null){
		    			alert("分配资源和产品失败，请检查用户是否已经分配，或信息是否有误");
		    		}else{
		    			alert(data.meta.message);
			    		window.location.reload();
		    		}
				  
				});
			}
		}
		
		//详情查看
		 function resourcesGroupResourceProduct_detail(id){
			var action="/admin/resourcesGroupResourceProduct/detail/"+id;
			$.post(basePath+action,function(data){
				 $("#detailsModal").modal();
				 $("#detail-modal").css({"width":"1200px"});
				 //$(".modal-content").css({"width":"1500px"});
	    		 //$("#detail-modal-body").css({"width":"1500px"});
	    		 $("#detail-modal-body").html(data);
	    	});
		
		}

	</script>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
	
	
</body>
</html>