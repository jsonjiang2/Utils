<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
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
<title>列表页设置</title>
<script type="text/javascript">
	var cropper;
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
 
		//修改设置默认参数
		var type = $("#updateSetting_type").val();
		if (!isEmpty(type)) {
			var updateSetting_id = $("#updateSetting_id").val();
			var updateSetting_tid = $("#updateSetting_tid").val();
			var updateSetting_sort = $("#updateSetting_sort").val();
			var updateSetting_link = $("#updateSetting_link").val();
			var updateSetting_subject = $("#updateSetting_subject").val();
			var updateSetting_message = $("#updateSetting_message").val();
			var updateSetting_color = $("#updateSetting_color").val();
			var updateSetting_remark = $("#updateSetting_remark").val();
			var updateSetting_img = $("#updateSetting_img").val();
 			 
			$("#setting_type").val(type);
			$("#setting_type").attr("disabled", "disabled");
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
 		}
 
		//裁剪图片显示
		var image = document.querySelector("#cropper_image");
		var minAspectRatio = 0.5;
		var maxAspectRatio = 1.5;
		var scopeWidth = 402;
		var scopeHeight = 270;
		cropper = new Cropper(image, {
			//cropBoxResizable : false,//不允许调整裁剪框大小
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
			var type = $("#setting_type").val();
			var obj = $(".setting_type_box_" + type);
			var imgSrc = $(obj).find(".img_croopered").val();
   			//替换裁剪图片
			cropper.replace(imgSrc);
			$("#cropperModal").show();
		});
 	})

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
 					html +="<img class='z' onclick='imgClick(this)' src='"+data.data.imgs[i]+"' >";
				}
 				$(obj).find(".smallImgs_box").html(html);
			} else {
				alert(data.message);
			}
		}
		var insertUrl = basePath + "/admin/insidePagesSettings/getThread"
		$.post(insertUrl, {
			"tid" : tid,
			"type": type
		}, callback);
	}
	
	 
	//根据aid获取资讯信息
	function getArticle() {
		var type = $("#setting_type").val();
		var obj = $(".setting_type_box_" + type);
		var tid = $(obj).find("input[name='tid']").val();
		var callback = function(data) {
			if (data.code == "88") {
				$(obj).find("input[name='link']").val(data.data.link);
				$("#tdateline").val(data.data.tdateline);
 				$(obj).find("textarea[name='subject']").val(data.data.subject);
				$(obj).find("textarea[name='message']").val(data.data.message);
 			} else {
				alert(data.message);
			}
		}
		var insertUrl = basePath + "/admin/insidePagesSettings/getArticle"
		$.post(insertUrl, {
			"tid" : tid,
			"type": type
		}, callback);
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

	//轮播图类型选择
	function imgSelectChange(obj) {
		var type = $(obj).val();
		if(type == 2){
 	 		$(".img_select_2").show();
 		}else{
 			$(".img_select_2").hide();
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
</script>
</head>
<body>
	<form class="form-horizontal">
		<div id="main_box">
			 <input type="hidden" id="updateSetting_id" value="${setting_insert.id }">
			 <input type="hidden" id="updateSetting_type" value="${setting_insert.type }">
			 <input type="hidden" id="updateSetting_tid" value="${setting_insert.tid }">
			 <input type="hidden" id="updateSetting_sort" value="${setting_insert.sort }">
			 <input type="hidden" id="updateSetting_link" value="${setting_insert.link }">
			 <input type="hidden" id="updateSetting_subject" value="${setting_insert.subject }"> 
			 <input type="hidden" id="updateSetting_message" value="${setting_insert.message }">
			 <input type="hidden" id="updateSetting_color" value="${setting_insert.color }"> 
			 <input type="hidden" id="updateSetting_remark" value="${setting_insert.remark }">
			 <input type="hidden" id="updateSetting_img" value="${setting_insert.img }">
		     <input type="hidden" name="id">
		     
			<div class="form-group">
				<label for="setting_type" class="col-sm-2 control-label">类型</label>
				<div class="col-sm-6">
					<select class="form-control" id="setting_type"
						onchange="typeChange(this)">
						<option value="1">热门帖子</option>
						<option value="2">网贷资讯</option>
						<option value="3">现金贷</option>
  					</select>
				</div>
			</div>
  
			<!-- 热门帖子 开始 -->
			<div class="setting_box setting_type_box_1">
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

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="subject"
							style="max-width: 400px;"></textarea>
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
						</select>
					</div>
				</div>
			</div>
			<!-- 热门帖子  结束 -->
 
			<!-- 网贷资讯 开始 -->
			<div class="setting_box setting_type_box_2 dipnone">
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">资讯id</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="tid"
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

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="subject"
							style="max-width: 400px;"></textarea>
					</div>
				</div>

				<!-- <div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">概述</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="message"></textarea>
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
				</div> -->
 
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
			<!-- 网贷资讯 结束 -->
			
			
			
				<!-- 热门帖子 开始 -->
			<div class="setting_box setting_type_box_3 dipnone" >
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

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="subject"
							style="max-width: 400px;"></textarea>
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
						</select>
					</div>
				</div>
			</div>
			<!-- 热门帖子  结束 -->
 
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
					<textarea class="form-control" name="remark"></textarea>
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