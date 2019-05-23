<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色已分配用户列表页面</title>
<%--<%@include file="/WEB-INF/jsp/common/public.jsp"%>--%>


<style>
.text-center td {
	vertical-align: text-top !important;
}

.input-group-addon a {
	text-decoration: none;
}

.on {
	background: #ccc;
	color: #fff;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div id="gj_roleuser">
					<jsp:include
						page="/WEB-INF/jsp/admin/systemrole/findroleusertemplate.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
  	
  	//删除已经分配的用户权限
  	function delete_findroleuser(obj){
  		var userId = $(obj).data("opid");
  		var roleId = $(obj).data("roleopid");
   		$.tzAlert({"content":"你確定要刪除吗","title":"刪除提示",callback:function(ok){
  			if(ok){
  			 	$.ajax({
  			 		type:"post",
  			 		url:basePath+"/admin/systemrole/userRoleDelete.action",
  			 		data:{"userId":userId,"roleId":roleId},
  			 		success:function(data){
  			 			var obj = $.parseJSON(data);
  			 			if(obj.result=="success"){
  			 				loading("操作成功",4);
 			 				$(".role_opid_"+userId+"").remove();
  			 			}else if(obj.result =="fail"){
  			 				loading("操作失败",4);
  			 			}
  			 		}
  			 	});
  			}
  		}
  			
  		});
  		
   	}
  	
 	//分页查询通用方法
	function queryAllPerson(pageNo,pageSize){
 		var opid = $("#role_id").data("roleopid");
   		$("#queryall_list").html("数据正在加载中.....");
 		var pageSize = "20";
  		$.ajax({
			type:"post",
			data:{"pageSize":pageSize,"pageNo":pageNo,"opid":opid},
			url:basePath+"/admin/roleuser/havetemplate.action",
			success:function(data){
  				$("#queryall_list").html(data);
				$(".tzui-tips").tzTip();
   			}
		});
 	}
</script>
</body>
</html>