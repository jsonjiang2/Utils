<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>图片裁剪测试jsp</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link href="${basePath }/static/plugin/cropper/cropper.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${basePath}/static/plugin/cropper/cropper.js"></script>
<style type="text/css">
.container {
	max-width: 640px;
	margin: 20px auto;
	height:600px;
 }

.container img {
  	width:100%;
  }
</style>
</head>
<body>
	<div class="container">
		<h1>Cropper with a range of aspect ratio</h1>
 			<img id="image" src="http://image.wangdaibus.com/group1/M00/00/50/rBMV6Vt2qk2ANSKEAAGWiuYHXA8616.jpg" alt="Picture" crossorigin>
  	</div>
  	<div> <button class="btn btn-default"  id="corp">截取</button> </div>
 	<script type="text/javascript">
		window.addEventListener("DOMContentLoaded", function() {
			var image = document.querySelector("#image");
			var minAspectRatio = 0.5;
			var maxAspectRatio = 1.5;
			var scopeWidth = 402;
			var scopeHeight = 270;
 			var cropper = new Cropper(image, {
     			 cropBoxResizable:false,//不允许调整裁剪框大小
    			 minCanvasWidth:scopeWidth+100,
    			 minCanvasHeight:scopeHeight+100,
    			 minCropBoxWidth:scopeWidth,
    			 minCropBoxHeight:scopeHeight,
    			 minContainerWidth:scopeWidth+100,
    			 minContainerHeight:scopeHeight+100,
   				ready:function(){
  					 var cropper = this.cropper;
  					  var image = new Image();
  			          image.src = cropper.getCroppedCanvas().toDataURL();
  					  cropper.setCropBoxData({
   			              width: scopeWidth,
   			              height:scopeHeight
  			         });
  				} 
			});
 			//截取并上传
 			 $("#corp").click(function(){
   				var canvas = cropper.getCroppedCanvas();
  				 var base64 = canvas.toDataURL();
   			     var url = basePath + "/uploadCropperImage";
 		         var callback = function(data){
		        	 console.log(JSON.stringify(data));
		         }
				 $.post(url,{"upfile":decodeURIComponent(base64)},callback);
   			 });
		});
 	</script>
</body>
</html>