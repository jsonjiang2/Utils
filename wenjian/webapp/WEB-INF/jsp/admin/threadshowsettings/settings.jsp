<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>首页主题设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link href="${basePath }/static/plugin/colorpicker/css/colorpicker.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${basePath}/static/plugin/colorpicker/js/colorpicker.js"></script>
<link href="${basePath }/static/plugin/cropper/cropper.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${basePath}/static/plugin/cropper/cropper.js"></script>
<style type="text/css">
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}

.myCheck {
	background-color: white;
	border-radius: 5px;
	border: 1px solid #d3d3d3;
	width: 16px;
	height: 16px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	line-height: 16px;
}

.myCheck:checked {
	background-color: #eee;
}

.colorpicker {
	z-index: 1050;
}

.dipnone {
	display: none;
}

/* 轮播图样式 */
#img_select .img_box {
	width: 100px;
	height: 100px;
}

#img_select .img_box img {
	max-width: 100%;
}

#img_select .img_select_2 {
	overflow: hidden;
	height: 100px;
}

#img_select .img_select_1 {
	margin-top: 10px;
}

#img_select .img_select_1 .img_select_1_img_box {
	height: 80px;
	width: 320px;
	overflow: hidden;
}

#img_select .img_select_1 .img_select_1_img_box .smallImgs {
	width: 240px;
	height: 80px;
	overflow: hidden;
	display: block;
}

#img_select .img_select_1 .img_select_1_img_box .smallImgs_box {
	display: block;
	height: 80px;
	width: 1600px;
}

#img_select .img_select_1 .img_select_1_img_box .pre {
	width: 40px;
	height: 80px;
	line-height: 80px;
	text-align: center;
	float: left;
	cursor: pointer;
	background: #F5F5F5;
}

#img_select .img_select_1 .img_select_1_img_box .pre:hover {
	background-color: #C2D5E3;
}

#img_select .img_select_1 .img_select_1_img_box .next {
	float: right;;
	width: 40px;
	height: 80px;
	line-height: 80px;
	text-align: center;
	cursor: pointer;
	background: #F5F5F5;
}

#img_select .img_select_1 .img_select_1_img_box .next:hover {
	background-color: #C2D5E3;
}

#img_select .img_select_1 .img_select_1_img_box .smallImgs_box img {
	width: 80px;
	height: 80px;
}

.selected {
	border: 4px solid #F60;
	width: 72px;
	height: 72px;
}

.z {
	float: left;
}

/**裁剪css**/
#cropperModal {
	background: #ccc;
	position: fixed;
	top: 0;
	right: 550px;
	width: 600px;
	heigth: 600px;
	max-heigth: 600px;
}

#cropperModal .cropperImg_box img {
	max-width: 100%;
	max-height: 100%;
}

#cropperModal .cropper-bg{
	max-height: 750px;
}
</style>
<script type="text/javascript">
	var cropper = {};
	$(function(){

		//修改设置默认参数
		var type = $("#updateSetting_type").val();
		var updateSetting_id = $("#updateSetting_id").val();
		var updateSetting_tid = $("#updateSetting_tid").val();
		var updateSetting_sort = $("#updateSetting_sort").val();
		var updateSetting_link = $("#updateSetting_link").val();
		var updateSetting_subject = $("#updateSetting_subject").val();
		var updateSetting_message = $("#updateSetting_message").val();
		var updateSetting_color = $("#updateSetting_color").val();
		var updateSetting_remark = $("#updateSetting_remark").val();
		var updateSetting_img = $("#updateSetting_img").val();
		var updateSetting_pno = $("#updateSetting_pno").val();
		var updateSetting_pid = $("#updateSetting_pid").val();
		var updateSetting_status = $("#updateSetting_status").val();
		var updateSetting_aid = $("#updateSetting_aid").val();

		if(!isEmpty(type)){
 			$("#setting_type").val(type);
			$("#setting_type").attr("disabled", "disabled");
		}
		typeChange();

		var obj = $(".setting_type_box_" + type);

		$("#main_box").find("textarea[name='remark']").val(updateSetting_remark);
		$("#main_box").find("input[name='color']").val(updateSetting_color);
		$("#main_box").find("input[name='id']").val(updateSetting_id);
		$(obj).find("input[name='tid']").val(updateSetting_tid);
		$(obj).find("input[name='link']").val(updateSetting_link);
		$(obj).find("textarea[name='subject']").val(updateSetting_subject);
		$(obj).find("textarea[name='message']").val(updateSetting_message);
		$(obj).find("select[name='sort']").val(updateSetting_sort);
		$(obj).find("input[name='img']").val(updateSetting_img);
		$(obj).find("input[name='pid']").val(updateSetting_pid);
		$(obj).find("input[name='pno']").val(updateSetting_pno);
		$(obj).find("select[name='status']").val(updateSetting_status);
		$(obj).find("input[name='aid']").val(updateSetting_aid);

		//触发标题改变事件
   		var  subjectObj = $(obj).find("textarea[name='subject']");
   		subjectOnBlur(subjectObj);
   		topSubjectOnBlur(subjectObj)
   		var  messageObj = $(obj).find("textarea[name='message']");
   		messageOnBlur(messageObj);

	})

	$(function() {
		//颜色选择
		$('#color').ColorPicker({
			onSubmit : function(hsb, hex, rgb, el) {
				$(el).val("#" + hex);
				$(el).ColorPickerHide();
			},
			onBeforeShow : function() {
				$(this).ColorPickerSetColor(this.value);
			},
			onChange : function(hsb, hex, rgb) {
				$('#color').css('backgroundColor', '#' + hex);
			}
		}).bind('keyup', function() {
			$(this).ColorPickerSetColor(this.value);
		});
 		//裁剪图片显示
 		CropperImageInit();

		//图片裁剪 并上传
		$("#cropper_submit").click(function() {
 			var canvas = cropper.getCroppedCanvas();
			var base64 = canvas.toDataURL();
			var url = basePath + "/uploadCropperImage";
			var callback = function(data) {
				console.log(JSON.stringify(data));
				if(data.state == "SUCCESS"){
					$(".img_croopered").val(data.url);
 					$("#cropperModal").hide();
				}else{
					alert(data.message);
				}
			}
			$.post(url, {
				"upfile" : decodeURIComponent(base64)
			}, callback);
		});


		//再次裁剪
		$(".caiqieCropper").click(function(){
			var type = $("#setting_type").val();
			var obj = $(".setting_type_box_" + type);
			var imgSrc = $(obj).find(".img_croopered").val();
   			//替换裁剪图片
			var type = $("#setting_type").val();
			var widthVal = 375;
			var heightVal = 165;
			if(type == 12){
			 	//注销
				cropper.destroy();
				CropperImageInit(widthVal,heightVal);
			}
			cropper.replace(imgSrc);
			$("#cropperModal").show();
		});

	})
	
	function CropperImageInit(scopeWidthVal,scopeHeightVal){
		var image = document.querySelector("#cropper_image");
		//裁剪图片显示
	 	var minAspectRatio = 0.5;
		var maxAspectRatio = 1.5;
		var scopeWidth = 402;
		var scopeHeight = 270;
		if(scopeWidthVal){
			scopeWidth = scopeWidthVal;
		}
		if(scopeHeightVal){
			scopeHeight = scopeHeightVal;
		}
		console.log("scopeWidth=="+scopeWidth);
		console.log("scopeHeight=="+scopeHeight);
	 	cropper = new Cropper(image, {
			//cropBoxResizable : false,//不允许调整裁剪框大小
	/* 		minCanvasWidth : scopeWidth + 100,
			minCanvasHeight : scopeHeight + 100,
			minCropBoxWidth : scopeWidth,
			minCropBoxHeight : scopeHeight,
			minContainerWidth : scopeWidth + 180,
			minContainerHeight : scopeHeight + 100, */
			// zoomable: false,
			ready : function() {
				var cropper = this.cropper;
				var image = new Image();
				image.src = cropper.getCroppedCanvas().toDataURL();
				cropper.setCropBoxData({
					width : scopeWidth,
					height : scopeHeight
				});
			}
		});
	}

	//控制其他设置div 显示
	function typeChange(obj) {
		var type = $("#setting_type").val();
		$("#main_box").find(".setting_box").addClass('dipnone');
		$("#main_box").find(".setting_type_box_" + type).removeClass('dipnone');
	}

	//根据tid获取主题信息
	function getThread() {
		var type = $("#setting_type").val();
		var obj = $(".setting_type_box_" + type);
		var tid = $(obj).find("input[name='tid']").val();
		var callback = function(data) {
			if (data.code == "88") {
				$(obj).find("input[name='link']").val(data.data.link);
				$("#tdateline").val(data.data.tdateline);
 				$(obj).find("textarea[name='subject']").val(data.data.subject);
				$(obj).find("textarea[name='message']").val(data.data.message);

				var html = "";
				for(var i =0;i < data.data.imgs.length;i++){
 					html +="<img crossOrigin='anonymous' class='z' onclick='imgClick(this)' src='"+data.data.imgs[i]+"' >";
				}
 				$(obj).find(".smallImgs_box").html(html);
			} else {
				alert(data.message);
			}
		}
		var insertUrl = basePath + "/admin/threadShowSettings/getThread"
		$.post(insertUrl, {
			"tid" : tid,
			"type": type
		}, callback);
	}

	//获取平台信息
	function getPlatformInfo(obj){
		var type = $("#setting_type").val();
		var obj = $(".setting_type_box_" + type);
		var pno = $(obj).find("input[name='pno']").val();
		var callback = function(data) {
			if (data.code == "88") {
				$(obj).find("input[name='link']").val(data.data.link);
				$(obj).find("textarea[name='subject']").val(data.data.pname);
				$(obj).find("input[name='pno']").val(data.data.pno);
				$(obj).find("input[name='pid']").val(data.data.pid);
  			} else {
				alert(data.message);
			}
		}
		var anctionUrl = basePath + "/admin/threadShowSettings/getPlatformInfo"
		$.post(anctionUrl, {
			"pno" : pno
 		}, callback);
	}

	//根据id获取主题信息
	function getArticle() {
		var type = $("#setting_type").val();
		var obj = $(".setting_type_box_" + type);
		var aid = $(obj).find("input[name='aid']").val();
		var callback = function(data) {
			if (data.code == "88") {
				$(obj).find("input[name='link']").val(data.data.link);
 				$(obj).find("textarea[name='subject']").val(data.data.subject);
				$(obj).find("textarea[name='message']").val(data.data.message);
 			} else {
				alert(data.message);
			}
		}
		var insertUrl = basePath + "/admin/threadShowSettings/getArticle"
		$.post(insertUrl, {
			"aid" : aid,
		}, callback);
	}


	//图片裁剪
	function imgClick(obj){
		$(obj).siblings().removeClass("selected");
		$(obj).addClass("selected");
		var imgSrc = $(obj)[0].src;
		$("#cropper_image").attr("src", imgSrc);
		//替换裁剪图片
		var type = $("#setting_type").val();
		var widthVal = 375;
		var heightVal = 165;
		if(type == 12){
		 	//注销
			cropper.destroy();
			CropperImageInit(widthVal,heightVal);
		}
		cropper.replace(imgSrc);
		$("#cropperModal").show();
	}

	//轮播图类型选择
	function imgSelectChange(obj) {
		var type = $(obj).val();
		if(type == 2){
 	 		$(".img_select_2").show();
 		}else{
 			$(".img_select_2").hide();
 		}
	}

	//巴士-最新，最热 排序第1不允许自动更新
	function changSelect(objVal){
		var type = $("#setting_type").val();
		var obj = $(".setting_type_box_" + type);
		var vl = $(objVal).val();
 		if(vl == 1){//排序1
			$(obj).find("select[name='status']").val(0);
			$(obj).find("select[name='status']").attr("disabled","disabled");
  		}else{
  			$(obj).find("select[name='status']").removeAttr("disabled");
		}
	}

	//选择头条
	function threadListsChange(obj){
		var valTid = $(obj).val();
 		if(valTid > 0){
 			var type = $("#setting_type").val();
 			var obj = $(".setting_type_box_" + type);
 			$(obj).find("input[name='tid']").val(valTid);
 			getThread();
		}
	}

	//排序1 不能选择自更
	function statucChangeVial(objVal){
		var type = $("#setting_type").val();
		var obj = $(".setting_type_box_" + type);
		var sortval = $(obj).find("select[name='sort']").val();
		var vl = $(objVal).val();
 		if(sortval == 1){
 			if(vl == 1){
 				alert("排名1不能选择'自更'更新方式");
				$(obj).find("select[name='status']").val(0);
 			}
  		}
	}

	//轮播图上一幅
	function preClick(obj) {
		var type = $("#setting_type").val();
		var obj = $(".setting_type_box_" + type);
		var le = $(obj).find('.smallImgs').scrollLeft();
		$('.smallImgs').scrollLeft(le - 240);
	}

	//轮播图下一幅
	function nextClick(obj) {
		var type = $("#setting_type").val();
		var obj = $(".setting_type_box_" + type);
		var le = $(obj).find('.smallImgs').scrollLeft() + 240;
		var ll = $(obj).find(".smallImgs_box").find("img").length * 80;
		if (le >= ll) {
			return;
		}
		$(obj).find('.smallImgs').scrollLeft(le);
	}

	//文件上传
	function fileUpload(objThis){
		var type = $("#setting_type").val();
		var obj = $(".setting_type_box_" + type);
		var fileObj = $(objThis)[0].files[0]; // js 获取文件对象
		console.log(fileObj);
		 if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
             alert("请选择图片");
             return;
         }

		 var formFile = new FormData();
		 formFile.append("upfile", fileObj); //加入文件对象
		  var data = formFile;
          $.ajax({
              url: basePath+"/uploadCarouselImage",
              data: data,
              type: "Post",
              dataType: "json",
              cache: false,//上传文件无需缓存
              processData: false,//用于对data参数进行序列化处理 这里必须false
              contentType: false, //必须
              success: function (data) {
                   console.log(data+"==="+JSON.stringify(data));
                   if(data.state == "SUCCESS"){
                	   $(obj).find(".img_croopered").val(data.url);
                    }else{
                	   alert(data.message);
                   }
              },
          })
 	}

	//控制头条标题字数
	function topSubjectOnBlur(obj){
		var subjectBox = $(obj).parents(".subjectBox");
 		var subject = $(subjectBox).find("textarea[name='subject']").val();
		var subjectLength = 35;
		if(!isEmpty(subject)){
 	 		var indexLength = subjectLength - strlen(subject);
 			/* if(subject.replace(/[^\x00-\xff]/g,"**").length > subjectLength){
				subject = getByteVal(subject, subjectLength);
				$(subjectBox).find("textarea[name='subject']").val(subject);
	 			$(subjectBox).find(".subjectError").text("剩余0字符");
	 		}else{
	 			$(subjectBox).find(".subjectError").text("剩余"+indexLength+"字符");
	 		} */
 			$(subjectBox).find(".subjectError").text("剩余"+indexLength+"字符");
		}else{
			$(subjectBox).find(".subjectError").text("剩余"+subjectLength+"字符");
		}
	}

	//控制其他标题字数
	function subjectOnBlur(obj){
		var subjectBox = $(obj).parents(".subjectBox");
 		var subject = $(subjectBox).find("textarea[name='subject']").val();
		var subjectLength = 48;
		if(!isEmpty(subject)){
 	 		var indexLength = subjectLength - strlen(subject);
 			/* if(subject.replace(/[^\x00-\xff]/g,"**").length > subjectLength){
				subject = getByteVal(subject, subjectLength);
				$(subjectBox).find("textarea[name='subject']").val(subject);
	 			$(subjectBox).find(".subjectError").text("剩余0字符");
	 		}else{
	 			$(subjectBox).find(".subjectError").text("剩余"+indexLength+"字符");
	 		} */
 			$(subjectBox).find(".subjectError").text("剩余"+indexLength+"字符");
		}else{
			$(subjectBox).find(".subjectError").text("剩余"+subjectLength+"字符");
		}
	}

	//控制概述字数
	function messageOnBlur(obj){
		var messageBox = $(obj).parents(".messageBox");
 		var message = $(messageBox).find("textarea[name='message']").val();
		var messageLength = 95;
		if(!isEmpty(message)){
 	 		var indexLength =    messageLength - strlen(message);
 	 		/* if(message.replace(/[^\x00-\xff]/g,"**").length > messageLength){
				message = getByteVal(message, messageLength);
				$(messageBox).find("textarea[name='message']").val(message);
	 			$(messageBox).find(".messageError").text("剩余0字符");
	 		}else{
	 			$(messageBox).find(".messageError").text("剩余"+indexLength+"字符");
	 		} */
 	 		$(messageBox).find(".messageError").text("剩余"+indexLength+"字符");
		}else{
			$(messageBox).find(".messageError").text("剩余"+messageLength+"字符");
		}
	}

	//统计字符串字符
	function strlen(str){  
	    var len = 0;  
	    for (var i=0; i<str.length; i++) {   
		     var c = str.charCodeAt(i);   
		    //单字节加1   
		     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {   
		       len++;   
		     }else {   
		       len+=2;   
		     }   
	    }   
		return len;  
	}  

	//字符串截取
	function getByteVal(str, max) {
		var returnValue = '';
		var byteValLen = 0;
		for (var i = 0; i < str.length; i++) {
			var c = str.charCodeAt(i);  
			 //单字节加1   
		     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {   
		       byteValLen++;   
		     }else {   
		      	byteValLen+=2;   
		     } 

			 if (byteValLen > max){
				break;
			 }

			returnValue += str[i];
		}
		return returnValue;
	}

  </script>
</head>
<body>
	<form class="form-horizontal">
		<div id="main_box">
			<input type="text" id="updateSetting_id" value="${setting_insert.id }" style="display:none;">
			<input type="text" id="updateSetting_type" value="${setting_insert.type }" style="display:none;">
			<input type="text" id="updateSetting_tid" value="${setting_insert.tid }" style="display:none;">
			<input type="text" id="updateSetting_sort" value="${setting_insert.sort }" style="display:none;">
		    <input type="text" id="updateSetting_link" value="${setting_insert.link }" style="display:none;">
		    <input type="text" id="updateSetting_subject" value="${setting_insert.subject }" style="display:none;">
		    <input type="text" id="updateSetting_message" value="${setting_insert.message }" style="display:none;">
			<input type="text" id="updateSetting_color" value="${setting_insert.color }" style="display:none;">
			<input type="text" id="updateSetting_remark" value="${setting_insert.remark }" style="display:none;">
			<input type="text" id="updateSetting_img" value="${setting_insert.img }" style="display:none;">
			<input type="text" id="updateSetting_pid" value="${setting_insert.pid }" style="display:none;">
			<input type="text" id="updateSetting_pno" value="${setting_insert.pno }" style="display:none;">
			<input type="text" id="updateSetting_status" value="${setting_insert.status }" style="display:none;">
			<input type="text" id="updateSetting_aid" value="${setting_insert.aid }" style="display:none;">
			<input type="text" name="id" style="display:none;">

			<div class="form-group">
				<label for="setting_type" class="col-sm-2 control-label">类型</label>
				<div class="col-sm-6">
					<select class="form-control" id="setting_type"
						onchange="typeChange(this)">
						<option value="1">头条</option>
						<option value="2">次头条</option>
						<option value="3">轮播图</option>
						<option value="4">热门平台</option>
						<option value="5">网贷咨询</option>
						<option value="6">资源主推荐</option>
						<option value="7">巴士-最新</option>
						<option value="8">巴士-最热</option>
						<option value="9">巴士-精华</option>
						<option value="10">平台推荐</option>
						<option value="11">今日收录</option>
						<option value="12">h5轮播图</option>
  					</select>
				</div>
			</div>

			<!-- 头条 开始 -->
			<div class="setting_box setting_type_box_1">

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
							<select id="topLists" class="form-control" onchange="threadListsChange(this)">
								<option value="">--选择主题--</option>
 								<c:forEach items="${topLists}" var="topList">
 									<option value="${topList.tid}">${topList.subject }</option>
								</c:forEach>
							</select>
					</div>
  				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="tid"
							placeholder="主题id">
					</div>
					<button type="button" class="btn btn-default"
						onclick="getThread(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group subjectBox">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="subject"
							style="max-width: 270px; min-height: 120px;min-width: 270px;" onchange="topSubjectOnBlur(this)" onkeydown="topSubjectOnBlur(this)" onkeyup="topSubjectOnBlur(this)"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="subjectError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<div class="form-group messageBox">
					<label for="setting_tid" class="col-sm-2 control-label">概述</label>
					<div class="col-sm-6 message">
						<textarea class="form-control" name="message"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"
 							onchange="messageOnBlur(this)" onkeydown="messageOnBlur(this)" onkeyup="messageOnBlur(this)"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="messageError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
				</div>

			</div>
			<!-- 头条 结束 -->


			<!-- 次头条 开始 -->
			<div class="setting_box setting_type_box_2 dipnone">
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
							<select id="topLists" class="form-control" onchange="threadListsChange(this)">
								<option value="">--选择主题--</option>
 								<c:forEach items="${twoLists}" var="twoLists">
 									<option value="${twoLists.tid}">${twoLists.subject }</option>
								</c:forEach>
							</select>
					</div>
  				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="tid"
							placeholder="主题id">
					</div>
					<button type="button" class="btn btn-default"
						onclick="getThread(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group subjectBox">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="subject" onchange="subjectOnBlur(this)" onkeydown="subjectOnBlur(this)" onkeyup="subjectOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="subjectError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
						</select>
					</div>
				</div>

			</div>
			<!-- 次头条 结束 -->

			<!-- 轮播图 开始 -->
			<div class="setting_box setting_type_box_3 dipnone">
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
							<select id="topLists" class="form-control" onchange="threadListsChange(this)">
								<option value="">--选择主题--</option>
 								<c:forEach items="${bannerLists}" var="bannerLists">
 									<option value="${bannerLists.tid}">${bannerLists.subject }</option>
								</c:forEach>
							</select>
					</div>
  				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="tid"
							placeholder="主题id">
					</div>
					<button type="button" class="btn btn-default"
						onclick="getThread(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group subjectBox">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="subject" onchange="subjectOnBlur(this)" onkeydown="subjectOnBlur(this)" onkeyup="subjectOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="subjectError" style="color:red;">剩余0字符</span>
					</div>
				</div>
 				
				<!-- 封面图开始 -->
				<div class="form-group" id="img_select_box">
					<label for="setting_tid" class="col-sm-2 control-label">封面图</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="img" style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClick(this)">→</div>
								<div class="pre" onclick="preClick(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 封面图结束-->

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
						</select>
					</div>
				</div>
			</div>
			<!-- 轮播图 结束 -->

			<!-- 热门平台 开始 -->
			<div class="setting_box setting_type_box_4 dipnone">

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">平台编号</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="pno"
							placeholder="平台编号">
						<input type="hidden" name="pid" >
					</div>
					<button type="button" class="btn btn-default"
						onclick="getPlatformInfo(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">平台名称</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="subject"
							style="max-width: 400px; max-height: 40px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
  						</select>
					</div>
				</div>
			</div>
			<!-- 热门平台 结束 -->

			<!-- 网贷资讯 开始 -->
			<div class="setting_box setting_type_box_5 dipnone">
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">资讯id</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="aid"
							placeholder="资讯id">
					</div>
					<button type="button" class="btn btn-default"
						onclick="getArticle(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group subjectBox">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="subject" onchange="subjectOnBlur(this)" onkeydown="subjectOnBlur(this)" onkeyup="subjectOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="subjectError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<div class="form-group messageBox">
					<label for="setting_tid" class="col-sm-2 control-label">概述</label>
					<div class="col-sm-6 message">
						<textarea class="form-control" name="message" onchange="messageOnBlur(this)" onkeydown="messageOnBlur(this)" onkeyup="messageOnBlur(this)"
						style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="messageError" style="color:red;">剩余0字符</span>
					</div>
				</div>


				<div class="form-group" id="img_select_box2">
					<label for="setting_tid" class="col-sm-2 control-label">封面图</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="img"  style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload"  style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClick(this)">→</div>
								<div class="pre" onclick="preClick(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
				</div>
			</div>
			<!-- 网贷资讯 结束 -->

			<!-- 资源主推荐 开始 -->
			<div class="setting_box setting_type_box_6 dipnone">
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="subject" style="max-width: 400px;min-height: 120px;min-width: 180px;"
							placeholder="标题">
					</div>
				</div>

				<div class="form-group messageBox">
					<label for="setting_tid" class="col-sm-2 control-label">概述</label>
					<div class="col-sm-6 message">
						<textarea class="form-control" name="message" onchange="messageOnBlur(this)" onkeydown="messageOnBlur(this)" onkeyup="messageOnBlur(this)"
						style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="messageError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
				</div>
			</div>
			<!-- 资源主推荐 结束 -->

			<!-- 巴士-最新 开始 -->
			<div class="setting_box setting_type_box_7 dipnone">

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="tid"
							placeholder="主题id">
					</div>
					<button type="button" class="btn btn-default"
						onclick="getThread(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group subjectBox">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="subject" onchange="subjectOnBlur(this)" onkeydown="subjectOnBlur(this)" onkeyup="subjectOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="subjectError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<div class="form-group messageBox">
					<label for="setting_tid" class="col-sm-2 control-label">概述</label>
					<div class="col-sm-6 message">
						<textarea class="form-control" name="message" onchange="messageOnBlur(this)" onkeydown="messageOnBlur(this)" onkeyup="messageOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="messageError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<!-- 封面图开始 -->
				<div class="form-group" id="img_select_box3">
					<label for="setting_tid" class="col-sm-2 control-label">封面图</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="img" style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClick(this)">→</div>
								<div class="pre" onclick="preClick(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 封面图结束-->

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort" onchange="changSelect(this)">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
					</div>
				</div>

				<div class="form-group status">
					<label  class="col-sm-2 control-label">更新方式</label>
					<div class="col-sm-6">
						 <select class="form-control" name="status" onchange="statucChangeVial(this)">
						 		<option value="0">手更</option>
						 		<option value="1">自更</option>
 						 </select>
					</div>
				</div>

			</div>
			<!-- 巴士-最新 结束 -->

			<!-- 巴士-最热 开始 -->
			<div class="setting_box setting_type_box_8 dipnone">
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="tid"
							placeholder="主题id">
					</div>
					<button type="button" class="btn btn-default"
						onclick="getThread(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group subjectBox">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="subject" onchange="subjectOnBlur(this)" onkeydown="subjectOnBlur(this)" onkeyup="subjectOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="subjectError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<div class="form-group messageBox">
					<label for="setting_tid" class="col-sm-2 control-label">概述</label>
					<div class="col-sm-6 message" >
						<textarea class="form-control" name="message" onchange="messageOnBlur(this)" onkeydown="messageOnBlur(this)" onkeyup="messageOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="messageError" style="color:red;">剩余0字符</span>
					</div>
				</div>


				<!-- 封面图开始 -->
				<div class="form-group" id="img_select_box4">
					<label for="setting_tid" class="col-sm-2 control-label">封面图</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="img" style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClick(this)">→</div>
								<div class="pre" onclick="preClick(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 封面图结束-->

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort" onchange="changSelect(this)">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
					</div>
				</div>

				<div class="form-group status">
					<label for="setting_tid" class="col-sm-2 control-label">更新方式</label>
					<div class="col-sm-6">
						 <select class="form-control" name="status" onchange="statucChangeVial(this)">
						 		<option value="0">手更</option>
						 		<option value="1">自更</option>
 						 </select>
					</div>
				</div>

			</div>
			<!-- 巴士-最热 结束 -->

			<!-- 巴士-精华 开始 -->
			<div class="setting_box setting_type_box_9 dipnone">

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="tid"
							placeholder="主题id">
					</div>
					<button type="button" class="btn btn-default"
						onclick="getThread(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group subjectBox">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="subject" onchange="subjectOnBlur(this)" onkeydown="subjectOnBlur(this)" onkeyup="subjectOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="subjectError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<div class="form-group messageBox">
					<label for="setting_tid" class="col-sm-2 control-label">概述</label>
					<div class="col-sm-6 message">
						<textarea class="form-control" name="message" onchange="messageOnBlur(this)" onkeydown="messageOnBlur(this)" onkeyup="messageOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="messageError" style="color:red;">剩余0字符</span>
					</div>
				</div>

				<!-- 封面图开始 -->
				<div class="form-group" id="img_select_box5">
					<label for="setting_tid" class="col-sm-2 control-label">封面图</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="img" style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClick(this)">→</div>
								<div class="pre" onclick="preClick(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 封面图结束-->

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
 						</select>
					</div>
				</div>
			</div>
			<!-- 巴士-精华 结束 -->


			<!-- 平台推荐 开始 -->
			<div class="setting_box setting_type_box_10 dipnone">

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">平台编号</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="pno"
							placeholder="平台编号">
						<input type="hidden" name="pid" >
					</div>
					<button type="button" class="btn btn-default"
						onclick="getPlatformInfo(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">平台名称</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="subject"
							style="max-width: 400px; max-height: 40px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
				</div>
			</div>
			<!-- 热门推荐 结束 -->



			<!-- 今日收录 开始-->
			<div class="setting_box setting_type_box_11 dipnone">

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">平台编号</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="pno"
							   placeholder="平台编号">
						<input type="hidden" name="pid" >
					</div>
					<button type="button" class="btn btn-default"
							onclick="getPlatformInfo(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">平台名称</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="subject"
								  style="max-width: 400px; max-height: 40px;"></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
					</div>
				</div>
			</div>
			<!-- 今日收录 结束-->

			<!-- h5轮播图 开始 -->
			<div class="setting_box setting_type_box_12 dipnone">
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
							<select id="topLists" class="form-control" onchange="threadListsChange(this)">
								<option value="">--选择主题--</option>
 								<c:forEach items="${hfbannerLists}" var="hfbannerLists">
 									<option value="${hfbannerLists.tid}">${hfbannerLists.subject }</option>
								</c:forEach>
							</select>
					</div>
  				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="tid"
							placeholder="主题id">
					</div>
					<button type="button" class="btn btn-default"
						onclick="getThread(this)">获取</button>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link"
							placeholder="链接">
					</div>
				</div>

				<div class="form-group subjectBox">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="subject" onchange="subjectOnBlur(this)" onkeydown="subjectOnBlur(this)" onkeyup="subjectOnBlur(this)"
							style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="subjectError" style="color:red;">剩余0字符</span>
					</div>
				</div>
				<!-- 轮播图开始 -->
				
				
				<!-- 封面图开始 -->
				<div class="form-group" id="img_select_box">
					<label for="setting_tid" class="col-sm-2 control-label">封面图</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="img" style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClick(this)">→</div>
								<div class="pre" onclick="preClick(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 封面图结束-->

				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
						</select>
					</div>
				</div>
			</div>
			<!-- h5轮播图结束 -->
				

			<div class="form-group">
				<label for="setting_tid" class="col-sm-2 control-label">颜色</label>
				<div class="col-sm-6">
					<input class="form-control" class="form-control" name="color"
						id="color">
 				</div>
			</div>

			<div class="form-group">
				<label for="setting_tid" class="col-sm-2 control-label">备注</label>
				<div class="col-sm-6">
					<textarea class="form-control" name="remark" style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
				</div>
			</div>
			 <input type="hidden" name="tdateline" id="tdateline">
		</div>
	</form>



	<!-- 裁剪模态框 开始 -->
	<div id="cropperModal" style="display: none;">
		<div class="cropperImg_box">
			<img id="cropper_image"
				src="http://image.wangdaibus.com/group1/M00/00/50/rBMV6Vt2qk2ANSKEAAGWiuYHXA8616.jpg"
				alt="Picture" crossorigin>
		</div>
		<div class="btn-box" style="margin-top: 20px;">
			<button type="button" class="btn btn-default" id="cropper_submit">裁剪</button>
			<button type="button" class="btn btn-default"
				onclick="$('#cropperModal').hide();">关闭</button>
		</div>
	</div>
	<!-- 裁剪模态框 结束 -->
</body>
</html>