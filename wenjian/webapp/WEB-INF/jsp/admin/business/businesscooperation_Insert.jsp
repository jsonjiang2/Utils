<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%@include file="/WEB-INF/jsp/common/public.jsp" %>
<title>新增商务合作</title>
<style>
.logo{
width: 220px; height: 100px; border: 1px dashed #DFDFDF; display: inline-block; margin: 0 16px 20px 0; text-align: center; color: #7C7C7C; position: relative;margin-left: 16px
}
.logo p{
position: absolute; left: 0; bottom: 25px; width: 100%;
}
.ppp{
margin-top: 20px;
}
.pic{
position: absolute; width: 220px; height: 100px; left: 0; top: 0; z-index: 999; cursor: pointer; background-size: cover;
}
.salesman label{
font-size: 20px;color: red;margin-left: 50px
}
/* 业务员信息css */
.salesmanlogo{
width: 220px; height: 100px; border: 1px dashed #DFDFDF; display: inline-block; margin: 0 16px 20px 0; text-align: center; color: #7C7C7C; position: relative;margin-left: 16px
}
.salesmanlogo .ppp{
margin-top: 20px;
}
.salesmanlogo .slsman{
position: absolute; width: 220px; height: 100px; left: 0; top: 0; z-index: 999; cursor: pointer; background-size: cover;
}
.salesmanlogo p{
position: absolute; left: 0; bottom: 25px; width: 100%;
}

.weixlogo{
width: 220px; height: 100px; border: 1px dashed #DFDFDF; display: inline-block; margin: 0 16px 20px 0; text-align: center; color: #7C7C7C; position: relative;margin-left: 16px
}
.weixlogo .ppp{
margin-top: 20px;
}
.weixlogo .weixin{
position: absolute; width: 220px; height: 100px; left: 0; top: 0; z-index: 999; cursor: pointer; background-size: cover;
}
.weixlogo p{
position: absolute; left: 0; bottom: 25px; width: 100%;
}
.addbtn{
font-size: 20px;width: 50px;height: 100px;float: right;margin-right: 160px;margin-top: -100px
}
.addbtn input{
width: 50px;height: 130px;cursor: pointer;margin-top: -33px
}
</style>
<script>
	//添加
	function add(){
		var html = addhtml();
		$("#all").append(html);
	}
	
	function addhtml(){
		var $div = $("#all");
        var children = $div.children().length+1;
   	    var XH = parseFloat(children)+1;
   	    $("#xh").html(XH);
		var html = '<div class="form-group salesmanMessage">'+
		 '<label for="lastname" class="col-sm-2 control-label" id="xh">业务员信息-'+XH+'</label>'+
		  '<div class="col-sm-4 salesmanlogo" id="salesmanlogo-'+XH+'">'+
			'<img class="ppp" src="http://www.wangdaibus.com/static/images/first_week/huijiahao.png" alt="">'+
			'<img class="slsman" src="http://www.wangdaibus.com/static/images/first_week/touming.png" onclick="uploadToux('+XH+')">'+
			'<input type="hidden" name="profiles"/>'+
			'<input class="upload" name="lo1" id="lo1" accept="image/*" type="file" style="display: none" onchange="uploadimage_slaman(this)" data-type="2">'+
			'<p>上传图片(207*62)</p>'+
		'</div>'+
		
		 '<div class="col-sm-4 weixlogo" id="weixlogo-'+XH+'">'+
			'<img class="ppp" src="http://www.wangdaibus.com/static/images/first_week/huijiahao.png">'+
			'<img class="weixin" src="http://www.wangdaibus.com/static/images/first_week/touming.png" onclick="uploadWeix('+XH+')">'+
			'<input type="hidden" name="weicatcodes"/>'+
			'<input class="upload" name="lo1" id="lo1" accept="image/*" type="file" style="display: none" onchange="uploadimage_weixin(this)" data-type="2">'+
			'<p>上传微信二维码(207*62)</p>'+
		'</div>'+
		
		   '<div class="form-group">'+
		    '<div class="col-sm-3" style="margin-top: -20px">'+
		      '<input type="text" class="form-control" id="lastname" name="realnames" placeholder="请填写姓名">'+
		      '<input type="text" class="form-control" id="lastname" name="mobiles" placeholder="请填写手机号">'+
		      '<input type="text" class="form-control" id="lastname" name="qqcodes"  placeholder="请填写QQ号码">'+
		      '<input type="text" class="form-control" id="lastname" name="weicats" placeholder="请填写微信号码">'+
		    '</div>'+
		    '<div class="addbtn">'+
		    	'<input type="button" onclick="sub(this);" value="-"/>'+
		    '</div>'+
		  '</div>'+
	  '</div>';
	  return html;
	}
//删除	
 function sub(t){
	 $(t).parent().parent().parent().remove();
	 var $div = $("#all");
	 var children = $div.children().length;
	 if(children == 0){
        $("#xh").html(1);
        return false;
	  }
	 for (var i = 0; i <children; i++) {
	    	$div.find(".salesmanMessage").eq(i).find("#xh").text("业务员信息-"+(i+2));
		} 
 }	
 
 $(function(){
	 //平台logo触发事件
	 $(".pic").on("click",function(){
	     $(this).parent().find(".upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
	 }) 
	 //业务员头像触发事件
	/*  $(".slsman").on("click",function(){
	     $(this).parent().find(".upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
	 })  */
 });
 
 function uploadToux(t){
	 var salesmanlogo = "#salesmanlogo-"+t;
	 $(salesmanlogo).find(".upload").click();
 }
 function uploadWeix(t){
	 var weixlogo = "#weixlogo-"+t;
	 $(weixlogo).find(".upload").click();
 }
 
//图片上传
 function uploadimage(fileThis){
     var fileObj = $(fileThis)[0].files[0];
     var type = $(fileThis).data("type")
     if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
         return;
     }

     var formFile = new FormData();
     formFile.append("upfile", fileObj); //加入文件对象
     formFile.append("type", type); //加入文件对象
     var action = basePath+"/admin/businesscooperation/uploadImage";
     $.ajax({
         url: action,
         data: formFile,
         type: "Post",
         cache: false,//上传文件无需缓存
         processData: false,//// 告诉jQuery不要去处理发送的数据
         contentType: false, //告诉jQuery不要去设置Content-Type请求头
         success: function (data) {
             if(data == "logout"){
                 //登录
                 UserLoginObj.loginShow();
                 return;
             }
             if(data.code == "88"){
                 //$(fileThis).parents(".activsx").css({"background":"red"});
                 var $activsx = $(fileThis).parents(".activsx");
                 $($activsx).find(".del").css("display", "block"); // 显示删除样式
                 $($activsx).find(".pic ").attr("src", data.data); // 将图片路径存入src中，显示出图片
                 $($activsx).find(".pid").attr("src", data.data);
                 $($activsx).find(":input[name='logo']").val(data.data);
             }else{
                 alert(data.message);
             }
         }
     })
 }
 
 function uploadimage_slaman(fileThis){
     var fileObj = $(fileThis)[0].files[0];
     var type = $(fileThis).data("type")
     if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
         return;
     }

     var formFile = new FormData();
     formFile.append("upfile", fileObj); //加入文件对象
     formFile.append("type", type); //加入文件对象
     var action = basePath+"/admin/businesscooperation/uploadImage";
     $.ajax({
         url: action,
         data: formFile,
         type: "Post",
         cache: false,//上传文件无需缓存
         processData: false,//// 告诉jQuery不要去处理发送的数据
         contentType: false, //告诉jQuery不要去设置Content-Type请求头
         success: function (data) {
             if(data == "logout"){
                 //登录
                 UserLoginObj.loginShow();
                 return;
             }
             if(data.code == "88"){
                 //$(fileThis).parents(".activsx").css({"background":"red"});
                 var $activsx = $(fileThis).parents(".salesmanlogo");
                 $($activsx).find(".del").css("display", "block"); // 显示删除样式
                 $($activsx).find(".slsman").attr("src", data.data); // 将图片路径存入src中，显示出图片
                 $($activsx).find(".pid").attr("src", data.data);
                 $($activsx).find(":input[name='profiles']").val(data.data);
             }else{
                 alert(data.message);
             }
         }
     })
 }
 
 function uploadimage_weixin(fileThis){
     var fileObj = $(fileThis)[0].files[0];
     var type = $(fileThis).data("type")
     if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
         return;
     }

     var formFile = new FormData();
     formFile.append("upfile", fileObj); //加入文件对象
     formFile.append("type", type); //加入文件对象
     var action = basePath+"/admin/businesscooperation/uploadImage";
     $.ajax({
         url: action,
         data: formFile,
         type: "Post",
         cache: false,//上传文件无需缓存
         processData: false,//// 告诉jQuery不要去处理发送的数据
         contentType: false, //告诉jQuery不要去设置Content-Type请求头
         success: function (data) {
             if(data == "logout"){
                 //登录
                 UserLoginObj.loginShow();
                 return;
             }
             if(data.code == "88"){
                 //$(fileThis).parents(".activsx").css({"background":"red"});
                 var $activsx = $(fileThis).parents(".weixlogo");
                 $($activsx).find(".del").css("display", "block"); // 显示删除样式
                 $($activsx).find(".weixin").attr("src", data.data); // 将图片路径存入src中，显示出图片
                 $($activsx).find(".pid").attr("src", data.data);
                 $($activsx).find(":input[name='weicatcodes']").val(data.data);
             }else{
                 alert(data.message);
             }
         }
     })
 }
 
 function saveFrom(){
		var jsonData = $("#insertSWFrom").serialize();
	    var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
	    var action = basePath+"/admin/businesscooperation/saveSWHZ";
	    $.post(action,params,function(data){
	    	if(data.code=="88"){
	    		 forList();
	    	}
	    	if(data.code=="00"){
	    		alert(data.message);
	    	}
	    	
	    });
	}
 
function forList(){
	window.location.href=basePath+"/admin/businesscooperation/lists"; 
}
</script>
</head>
<body>
	<div style="margin-left: 45%;margin-top: 30px;font-size: 20px">新增商务合作</div>
	<div class="container" style="width: 70%;margin-left: 20%;margin-top: 50px;height:auto;">
		<div>
			<form class="form-horizontal" role="form" id="insertSWFrom">
			
				 <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">合作类型</label>
				    <div class="col-sm-4">
				    	<!-- 1广告合作  2平台收录 3巴士名人堂 4钱多多回血 5友情链接 6其他合作 -->
				      <select class="form-control" name="type" id="type_select">
                            <option value="">请选择--</option>
                            <option value="1">广告合作</option>
                            <option value="2">平台收录</option>
                            <option value="3">巴士名人堂</option>
                            <option value="4">钱多多回血</option>
                            <option value="5">友情链接</option>
                            <option value="6">其他合作</option>
                        </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="firstname" class="col-sm-2 control-label">公司名称</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" id="firmname" name="firmname" placeholder="请填写公司名称">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">公司地址</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" id="firmaddress" name="firmaddress" placeholder="请填写公司地址">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">公司简介</label>
				    <div class="col-sm-4">
				      <textarea class="form-control" rows="3" name="brief"></textarea>
				    </div>
				  </div>
				  
				  <!-- data-type 为1 表示公司logo  为2 表示是业务员头像 -->
				   <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">公司LOGO</label>
					<div class="col-sm-4 logo activsx">
						<img class="ppp" src="http://www.wangdaibus.com/static/images/first_week/huijiahao.png" alt="">
						<img class="pic" src="http://www.wangdaibus.com/static/images/first_week/touming.png">
						<input type="hidden" name="logo"/>
						<input class="upload" name="logo" id="logo" accept="image/*" type="file" style="display: none" onchange="uploadimage(this)" data-type="1">
						<p>上传图片(207*62)</p>
					</div>
				</div>
				
				 <div class="form-group salesman">
				    <label for="lastname" class="col-sm-4 control-label">业务员信息</label>
				  </div>
				  <span id="xh" style="display:none;">1</span>
				  <div class="form-group salesmanMessage">
					 <label for="lastname" class="col-sm-2 control-label">业务员信息-1</label>
					  <div class="col-sm-4 salesmanlogo" id="salesmanlogo-1">
						<img class="ppp" src="http://www.wangdaibus.com/static/images/first_week/huijiahao.png">
						<img class="slsman" src="http://www.wangdaibus.com/static/images/first_week/touming.png" onclick="uploadToux(1);">
						<input type="hidden" name="profiles"/>
						<input class="upload" name="lo1" id="lo1" accept="image/*" type="file" style="display: none" onchange="uploadimage_slaman(this)" data-type="2">
						<p>上传业务员头像(207*62)</p>
					</div>
					 <div class="col-sm-4 weixlogo" id="weixlogo-1">
						<img class="ppp" src="http://www.wangdaibus.com/static/images/first_week/huijiahao.png">
						<img class="weixin" src="http://www.wangdaibus.com/static/images/first_week/touming.png" onclick="uploadWeix(1)">
						<input type="hidden" name="weicatcodes"/>
						<input class="upload" name="lo1" id="lo1" accept="image/*" type="file" style="display: none" onchange="uploadimage_weixin(this)" data-type="2">
						<p>上传微信二维码(207*62)</p>
					</div>
					
					   <div class="form-group">
					    <div class="col-sm-3" style="margin-top: -20px">
					      <input type="text" class="form-control" id="lastname" name="realnames" placeholder="请填写姓名">
					      <input type="text" class="form-control" id="lastname" name="mobiles" placeholder="请填写手机号">
					      <input type="text" class="form-control" id="lastname" name="qqcodes" placeholder="请填写QQ号码">
					      <input type="text" class="form-control" id="lastname" name="weicats" placeholder="请填写微信号码">
					    </div>
					    <div class="addbtn">
					    	<input type="button" onclick="add();" value="+"/>
					    </div>
					  </div>
					  
				  </div>
				  
				  <div id="all" style="display: block;">
				 	
				  
				  
				  </div>
				 
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="button" class="btn btn-default" 
				      style="margin-left: 0px;border: 1px #0089FF solid;font-size: 20px;width: 240px;
				      background-color: #0089FF;color: #FFFFFF" onclick="saveFrom();">保存</button>
				      <button type="button" class="btn btn-default" 
				      style="margin-left: 10px;border: 1px #DDDDDD solid;font-size: 20px;width: 240px;
				      background-color: #DDDDDD;color: black" onclick="forList();">返回</button>
				    </div>
				  </div> 
				</form>
		</div>
	</div>
</body>
</html>