<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资讯操作修改</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link href="${basePath }/static/plugin/cropper/cropper.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${basePath}/static/plugin/cropper/cropper.js"></script>
<style>
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
	var cropper;
	$(function(){
		 $("#sort").val($("#sort").data("sort"));
        $(".img_croopered").val($(".img_croopered").data("pic"));

		//裁剪图片显示
			var image = document.querySelector("#cropper_image");
			var minAspectRatio = 0.5;
			var maxAspectRatio = 1.5;
			var scopeWidth = 402;
			var scopeHeight = 270;
			cropper = new Cropper(image, {
				cropBoxResizable : false,//不允许调整裁剪框大小
				minCanvasWidth : scopeWidth + 100,
				minCanvasHeight : scopeHeight + 100,
				minCropBoxWidth : scopeWidth,
				minCropBoxHeight : scopeHeight,
				minContainerWidth : scopeWidth + 180,
				minContainerHeight : scopeHeight + 100,
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
				var obj = $("#img_select_box");
				var imgSrc = $(obj).find(".img_croopered").val();
	   			//替换裁剪图片
				cropper.replace(imgSrc);
				$("#cropperModal").show();
			});
 	})
 	
 	//轮播图上一幅
	function preClick(obj) {
		var obj = $("#img_select_box");
		var le = $(obj).find('.smallImgs').scrollLeft();
		$('.smallImgs').scrollLeft(le - 240);
	}

	//轮播图下一幅
	function nextClick(obj) {
		var obj = $("#img_select_box");
		var le = $(obj).find('.smallImgs').scrollLeft() + 240;
		var ll = $(obj).find(".smallImgs_box").find("img").length * 80;
		if (le >= ll) {
			return;
		}
		$(obj).find('.smallImgs').scrollLeft(le);
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
	
	//图片裁剪
	function imgClick(obj){
		$(obj).siblings().removeClass("selected");
		$(obj).addClass("selected");
		var imgSrc = $(obj)[0].src;
		$("#cropper_image").attr("src", imgSrc);
		//替换裁剪图片
		cropper.replace(imgSrc);
		$("#cropperModal").show();
	}
	
	//文件上传
	function fileUpload(objThis){
		var obj = $("#img_select_box");
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
</script>
 </head>
<body>
	 <div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form" id="threadUpdateForm">
        <input type="hidden" id="aid" name="aid" value="${prePortalArticleTitle.aid}"/>

		<div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="subject">标题：</label>
            <div class="col-sm-3">
                  <textarea rows="3" style="max-width:350px;" class="form-control" name="title">${prePortalArticleTitle.title}</textarea>
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
					<input name="pic" style="width: 240px; float: left;" data-pic="${prePortalArticleTitle.pic}"
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
							     <c:forEach items="${imgs }" var="imgs">
							     	<img class="z" onclick="imgClick(this)" src="${imgs }" />
							     </c:forEach>
 							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 封面图结束-->
        
        <div class="form-group" id="csort_box">
            <label class="col-sm-2 control-label laber_from">普通定位：</label>
            <div class="col-sm-3">
                <select class="form-control" id="sort" name="sort" data-sort="${prePortalArticleTitle.sort }">
                	<option value="100">--不设置定位--</option>
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
                </select>
             </div>
        </div>
        
         <div class="form-group">
            <label class="col-sm-2 control-label laber_from">摘要：</label>
            <div class="col-sm-3">
                <textarea rows="3" style="max-width:350px;" class="form-control" name="summary">${prePortalArticleTitle.summary}</textarea>
            </div>
        </div>
   
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">管理员留言：</label>
            <div class="col-sm-3">
                <textarea rows="3" style="max-width:350px;" class="form-control" name="amessage">${prePortalArticleTitle.amessage}</textarea>
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" style="max-width:350px;" class="form-control" name="remark">${prePortalArticleTitle.remark}</textarea>
            </div>
        </div>
 
    </form>
</div>

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