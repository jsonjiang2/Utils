<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${basePath}/static/css/amazeui.min.css">
	<link rel="stylesheet" href="${basePath}/static/css/amazeui.cropper.css">
	<link rel="stylesheet" href="${basePath}/static/css/custom_up_img.css">
	<%@include file="/WEB-INF/jsp/common/public.jsp"%>
	<script src="${basePath}/static/js/amazeui.min.js" charset="utf-8"></script>
	<script src="${basePath}/static/js/cropper.min.js" charset="utf-8"></script>
	<script src="${basePath}/static/js/custom_up_img.js" charset="utf-8"></script> 
<title>新增商务合作</title>
<style>

</style>
<script>
	//添加
	function add(){
		var html = addhtml2();
		$("#all").append(html);
	}
	
	function addhtml(){
		var $div = $("#all");
        var children = $div.children().length+1;
   	    var XH = parseFloat(children)+1;
   	    $("#xh").html(XH);
		var html = '<div class="form-group salesmanMessage">'+
		 '<label for="lastname" class="col-sm-2 control-label" id="xh">业务员信息-'+XH+'</label>'+
		  '<div class="col-sm-4 salesmanlogo">'+
			'<img class="ppp" src="http://www.wangdaibus.com/static/images/first_week/huijiahao.png" alt="">'+
			'<img class="slsman" src="http://www.wangdaibus.com/static/images/first_week/touming.png">'+
			'<input class="upload" name="lo1" id="lo1" accept="image/*" type="file" style="display: none" onchange="uploadimage_slaman(this)" data-type="2">'+
			'<p>上传图片(207*62)</p>'+
		'</div>'+
		
		   '<div class="form-group">'+
		    '<div class="col-sm-3">'+
		      '<input type="text" class="form-control" id="lastname" placeholder="请填写手机号" style="margin-top: 10px">'+
		      '<input type="text" class="form-control" id="lastname" placeholder="请填写QQ号码" style="margin-top: 10px">'+
		      '<input type="text" class="form-control" id="lastname" placeholder="请填写微信号码" style="margin-top: 10px">'+
		    '</div>'+
		    '<div class="addbtn">'+
		    	'<input type="button" onclick="sub(this);" value="-"/>'+
		    '</div>'+
		  '</div>'+
	  '</div>';
	  return html;
	}
	
function addhtml2(){
	var $div = $("#all");
    var children = $div.children().length+1;
    var XH = parseFloat(children)+1;
    $("#xh").html(XH);
	var html = '<div class="form-group salesmanMessage">'+
		'<label for="lastname" class="col-sm-2 control-label" id="xh">业务员信息-'+XH+'</label>'+
		  '<div class="col-sm-4 salesmanlogo" id="salesmanlogo'+XH+'">'+
		  			'<input type="hidden" name="profiles" id="profile"/>'+
					'<div class="up-img-cover"  id="up-img-touch" onclick="tankuang('+XH+')">'+
						'<img class="am-circle" alt="点击图片上传" src="${basrPath}/static/images/search/head_portrait.png" >'+
						'<p>修改头像</p>'+
					'</div>'+
					'<div><a style="text-align: center; display: block;"  id="pic"></a></div>'+
					'<div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1">'+
						'<div class="am-modal-dialog up-frame-parent up-frame-radius tankuang">'+
							'<div class="am-modal-hd up-frame-header">'+
								'<label>修改头像</label>'+
								'<a href="javascript: void(0)" class="am-close am-close-spin close" data-am-modal-close>'+
									'<img src="http://www.wangdaibus.com/static/images/product_details/close.png">'+
								'</a>'+
							'</div>'+
							'<div class="am-modal-bd  up-frame-body ">'+
							'<div class="am-g am-fl" >'+
								'<div class="up-pre-before up-frame-radius" id="lock'+XH+'">'+
									'<img alt="" src="${basrPath}/static/images/search/head_portrait.png" id="image" >'+
								'</div>'+
								'<p class="yulan" style="margin-left: 200px;font-size: 20px">预览</p>'+
								'<div class="up-pre-after up-frame-radius" id="touxiang_imgs">'+
								'</div>'+
								'<div class="am-g am-fl xuanze_wj">'+
									'<div class="am-form-group am-form-file">'+
										'<div class="am-fl">'+
											'<button type="button" class="am-btn am-btn-default am-btn-sm">'+
												'<img src="http://www.wangdaibus.com/static/images/search/xianji.png">'+
												'<p style="margin-left: 10px;font-size: 20px">相册</p>'+
											'</button>'+
										'</div>'+
										'<input type="file" id="inputImage">'+
									'</div>'+
								'</div>'+
							'</div>'+
							'<a  class="touxiang_bc" id="touxiang_bc">保存</a>'+
							'</div>'+
						'</div>'+
					'</div>'+
			'</div>'+
	    	'<div class="form-group">'+
			   '<div class="col-sm-3" style="margin-left: -226px;margin-top: -10px">'+
			      '<input type="text" class="form-control" id="lastname" name="mobiles" placeholder="请填写手机号" style="margin-top: 10px">'+
			      '<input type="text" class="form-control" id="lastname" name="qqcodes" placeholder="请填写QQ号码" style="margin-top: 10px">'+
			      '<input type="text" class="form-control" id="lastname" name="weicats" placeholder="请填写微信号码" style="margin-top: 10px">'+
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
 });
 
//公司logo图片上传
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
				 $("#logo").val(data.data);
             }else{
                 alert(data.message);
             }
         }
     })
 }
 
function saveFrom(){
	var jsonData = $("#insertSWFrom").serialize();
    var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
    alert(params);
    var action = basePath+"/admin/businesscooperation/saveSWHZ";
    $.post(action,params,function(data){
    	
    	
    });
}

</script>
</head>
<body>
	<div style="margin-left: 45%;margin-top: 30px;font-size: 20px">新增商务合作</div>
	<div class="container" style="width: 60%;margin-left: 30%;margin-top: 50px;height:auto; border: 1px red solid;">
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
				      <input type="text" class="form-control" id="firmname" placeholder="请填写公司名称" name="firmname">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">公司地址</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" id="firmaddress" placeholder="请填写公司地址" name="firmaddress">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">公司简介</label>
				    <div class="col-sm-4">
				      <textarea class="form-control" rows="3" id="brief" name="brief"></textarea>
				    </div>
				  </div>
				  
				  <!-- data-type 为1 表示公司logo  为2 表示是业务员头像 -->
				   <div class="form-group">
				    <label for="lastname" class="col-sm-2 control-label">公司LOGO</label>
					<div class="col-sm-2 logo activsx">
						<img class="ppp" src="http://www.wangdaibus.com/static/images/first_week/huijiahao.png" alt="">
						<img class="pic" src="http://www.wangdaibus.com/static/images/first_week/touming.png">
						<input type="hidden" id="logo" name="logo"/>
						<input class="upload" name="lo1" id="lo1" accept="image/*" type="file" style="display: none" onchange="uploadimage(this)" data-type="1">
						<p>上传图片(207*62)</p>
					</div>
				</div>
				
				 <div class="form-group salesman">
				    <label for="lastname" class="col-sm-4 control-label">业务员信息</label>
				  </div>
				  <span id="xh" style="display:none;">1</span>
				  <div class="form-group">
					 <label for="lastname" class="col-sm-2 control-label">业务员信息-1</label>
					  <div class="col-sm-4 salesmanlogo" id="salesmanlogo1">
					  			 <input type="hidden" name="profiles" id="profile"/>
								<div class="up-img-cover"  id="up-img-touch" onclick="tankuang(1)">
									<img class="am-circle" alt="点击图片上传" src="${basrPath}/static/images/search/head_portrait.png">
									<p>修改头像</p>
								</div>
								<div><a style="text-align: center; display: block;"  id="pic"></a></div>
								<!--图片上传框-->
								<div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1">
									<div class="am-modal-dialog up-frame-parent up-frame-radius tankuang">
										<div class="am-modal-hd up-frame-header">
											<label>修改头像</label>
											<a href="javascript: void(0)" class="am-close am-close-spin close" data-am-modal-close>
												<img src="http://www.wangdaibus.com/static/images/product_details/close.png">
											</a>
										</div>
										<div class="am-modal-bd  up-frame-body ">
										
										<div class="am-g am-fl" >
											<div class="up-pre-before up-frame-radius" id="lock1">
												<img alt="" src="${basrPath}/static/images/search/head_portrait.png" id="image" >
											</div>
											<p class="yulan" style="margin-left: 200px;font-size: 20px">预览</p>
											<!-- 截取的图片 -->
											<div class="up-pre-after up-frame-radius" id="touxiang_imgs">
											 
											</div>
											
											<div class="am-g am-fl xuanze_wj">
												<div class="am-form-group am-form-file">
													<div class="am-fl">
														<button type="button" class="am-btn am-btn-default am-btn-sm">
															<img src="http://www.wangdaibus.com/static/images/search/xianji.png">
															<p style="margin-left: 10px;font-size: 20px">相册</p>
														</button>
													</div>
													<input type="file" id="inputImage">
												</div>
											</div>
										</div>
										<a  class="touxiang_bc" id="touxiang_bc">保存</a>
										</div>
									</div>
								</div> 
						</div>
					
				    	<div class="form-group">
						    <div class="col-sm-3" style="margin-left: -226px;margin-top: -10px">
						      <input type="text" class="form-control" id="mobile" name="mobiles" placeholder="请填写手机号" style="margin-top: 10px">
						      <input type="text" class="form-control" id="qqcode" name="qqcodes" placeholder="请填写QQ号码" style="margin-top: 10px">
						      <input type="text" class="form-control" id="weicat" name="weicats" placeholder="请填写微信号码" style="margin-top: 10px">
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
				      style="margin-left: 100px;border: 1px blue solid;font-size: 20px;width: 240px;
				      background-color: blue;color: #FFFFFF" onclick="saveFrom();">保存</button>
				    </div>
				  </div> 
				</form>
		</div>
	</div>
</body>
</html>