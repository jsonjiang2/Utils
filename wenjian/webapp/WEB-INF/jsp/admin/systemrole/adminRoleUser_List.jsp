<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色分配用户列表页面</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript"
	src="${basePath}/js/swfupload/tz_upload.js"></script>

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
				<label><input type="checkbox" id="allCheck"
					onclick="roleuser.allCheck(this)">全选</label><label><input
					type="checkbox" id="allChecked" onclick="roleuser.allChecked()">全不选</label>
				<div id="gj_roleuser">
					<jsp:include
						page="/WEB-INF/jsp/admin/systemrole/roleusertemplate.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
   	var cid =document.getElementById("allCheck");
	var cided =document.getElementById("allChecked");
	var roleuser = {
			 init:function(){
     				$("#checkbox").find("tr").on("click",function(){
  					$(this).toggleClass("on").find(".check").filter(function(){
  						var $this = $(this);
  						$this.prop("checked",!$this.prop("checked"));
 					});
  				 });
  			 },
  			 //保存方法
  			 save:function(roleId,$dialog,opts){
  				 var length = $(".checks").length;
  				 var params ="",count = 0;
  				 for(var i = 0;i<length;i++){
  					 //选中
  					 if($(".checks")[i].checked){
  						 count++;
  						//拼接字符串
  						params +=$(".checks")[i].value+",";
  					 }
  				 }
  				 //截取
  				 params = params.substring(0,params.lastIndexOf(","));
  				 if(count == 0){
  					 loading("请选中一个用户进行分配...",4);
  					 return;
  				 }
  				 $.ajax({
  					 type:"post",
  					 url:basePath+"/admin/systemrole/userRoleSave.action",
  					 data:{"roleId":roleId,"params":params},
  					 success:function(data){
  						 var obj = $.parseJSON(data);
  						 if(obj.result == "success"){
  							 alert("分配成功");
  							 //关闭阴影层
  							$dialog.next().remove();
  							//关闭弹窗
  							$dialog.remove();

  						 }
  					 }
  				 });
    		},
  			 //全选
   			 allCheck:function(){
   				if(cid.checked){
   					//清空全不选
   					cided.checked="";
 					var length = $(".checks").length;
 					for(var i = 0;i<length;i++){
 						$(".checks")[i].checked = cid.checked;
 					}
   				}
			 },
			 //全不选
			 allChecked:function(){
 	  				if(cided.checked){
 	  					//清空全选
 	  					cid.checked="";
	 					var length = $(".checks").length;
	 					for(var i = 0;i<length;i++){
  	 						$(".checks")[i].checked = "";
	 					}
 	  				}
 			 }
	};

	//初始化
 	roleuser.init();

 	//分页查询通用方法
	/*function queryAllPerson(pageNum,pageSize){
		$("#queryall_list").html("数据正在加载中.....");
		url=basePath+"/admin/systemrole/userList.action";
        window.location.href=url+"?pageNum="+pageNum+"&&pageSize="+pageSize;
 	}*/
    //分页查询通用方法
    function queryAllPerson(pageNo,pageSize){
        $("#queryall_list").html("数据正在加载中.....");
        var pageSize = "20";
        $.ajax({
            type:"post",
            data:{"pageSize":pageSize,"pageNo":pageNo},
            url:basePath+"/admin/roleuser/template.action",
            success:function(data){
                $("#gj_roleuser").html(data);
                $(".tzui-tips").tzTip();
                roleuser.init();
            }
        });
    }
</script>
</body>
</html>