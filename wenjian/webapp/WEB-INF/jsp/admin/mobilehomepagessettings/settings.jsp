<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>h5首页设置</title>
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
<script type="text/javascript" src="${basePath}/static/js/admin/mobilehomesettings/settings.js"></script>
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
	top: 20px;
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
 </head>
<body>

 	<input type="text" id="mobileSeeting_ftype" value="${settings.ftype }" style="display:none;">
	<input type="text" id="mobileSeeting_subject" value="${settings.subject }" style="display:none;">
	<input type="text" id="mobileSeeting_link" value="${settings.link }" style="display:none;">
	<input type="text" id="mobileSeeting_tid" value="${settings.tid }" style="display:none;">
	<input type="text" id="mobileSeeting_type" value="${settings.type }" style="display:none;">
	<input type="text" id="mobileSeeting_sort" value="${settings.sort }" style="display:none;">
	<input type="text" id="mobileSeeting_color" value="${settings.color }" style="display:none;">
	<input type="text" id="mobileSeeting_imgtype" value="${settings.imgtype }" style="display:none;">
	<input type="text" id="mobileSeeting_attachment1" value="${settings.attachment1 }" style="display:none;">
	<input type="text" id="mobileSeeting_attachment2" value="${settings.attachment2 }" style="display:none;">
	<input type="text" id="mobileSeeting_attachment3" value="${settings.attachment3 }" style="display:none;">
	<input type="text" id="mobileSeeting_opid" value="${settings.id }" style="display:none;">
   
	<form class="form-horizontal">
		<div id="main_box">
 			<div class="form-group">
				<label for="setting_type" class="col-sm-2 control-label">位置</label>
				<div class="col-sm-6">
					<select class="form-control" name="ftype" id="setting_type" onchange="typeChange(this)">
						<option value="1">h5-首页</option>
						<option value="2">h5-首页2</option>
						<option value="21">h5-首页3</option>
   					</select>
				</div>
			</div>

			<!-- h5首页设置 开始 -->
			<div class="setting_box setting_type_box_1">
				<div id="insertThreadBox">
	 				<div class="form-group">
						<label for="setting_tid" class="col-sm-2 control-label">主题id</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="tid" placeholder="主题id">
						</div>
						<button type="button" class="btn btn-default"
							onclick="getThreadByH5Index(this)">获取</button>
					</div>
					
					<div class="form-group">
						<label for="setting_tid" class="col-sm-2 control-label">主题类型</label>
						<div class="col-sm-6">
							<select class="form-control" name="type">
 								<option value="1">茶馆</option>
								<option value="2">资讯</option>	
							</select>			
						</div>
 					</div>
  				</div>
				
				<div class="form-group subjectBox">
					<label for="setting_tid" class="col-sm-2 control-label">标题</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="subject"
							style="max-width: 270px; min-height: 120px;min-width: 270px;" onchange="topSubjectOnBlur(this)" onkeydown="topSubjectOnBlur(this)" onkeyup="topSubjectOnBlur(this)"></textarea>
					</div>
					<div class="col-sm-2">
						<span class="subjectError" style="color:red;">剩余35字符</span>
					</div>
				</div>

				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="link" placeholder="链接">
					</div>
				</div>
 
				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">首页定位</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
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
					<label for="setting_type" class="col-sm-2 control-label">图片模式</label>
					<div class="col-sm-6">
						<select class="form-control" name="imgtype" onchange="PictureModeChange(this)" id="imgtype">
							<option value="0">无图模式</option>
 							<option value="4">1小图模式</option>
 							<option value="1">1大图模式</option>
 							<option value="2">2图模式</option>
							<option value="3">3图模式</option>
  						</select>
					</div>
				</div>
				
				<!-- 展示1大图开始 -->
				<div class="form-group img_select_box" id="img_select_box1" style="display: none;" data-attachment="1">
					<label for="setting_tid" class="col-sm-2 control-label">展示1大图</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="attachment1" style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper" 
							onclick="caiqieCropperByH5Index(this)">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClickByH5Index(this)">→</div>
								<div class="pre" onclick="preClickByH5Index(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 展示1大图结束 -->
				
				<!-- 展示图2开始 -->
				<div class="form-group img_select_box" id="img_select_box2" style="display: none;" data-attachment="2">
					<label for="setting_tid" class="col-sm-2 control-label">展示图2</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="attachment2" style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper" 
							onclick="caiqieCropperByH5Index(this)">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClickByH5Index(this)">→</div>
								<div class="pre" onclick="preClickByH5Index(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 展示图2 结束-->
				
				<!-- 展示图3开始 -->
				<div class="form-group img_select_box" id="img_select_box3" style="display: none;" data-attachment="3">
					<label for="setting_tid" class="col-sm-2 control-label">展示图3</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="attachment3" style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper" 
								onclick="caiqieCropperByH5Index(this)">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClickByH5Index(this)">→</div>
								<div class="pre" onclick="preClickByH5Index(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 展示图3 结束-->
				
				<!-- 展示1小图开始 -->
				<div class="form-group img_select_box" id="img_select_box4" style="display: none;" data-attachment="1">
					<label for="setting_tid" class="col-sm-2 control-label">展示1小图</label>
					<div class="col-sm-8" id="img_select">
						<div class="img_select">
							<label><input type="radio" value="1" checked="checked"
								name="img_type" onchange="imgSelectChange(this)">&nbsp;远程&nbsp;&nbsp;</label>
							<label><input type="radio" value="2" name="img_type"
								onchange="imgSelectChange(this)">&nbsp;上传</label>
						</div>
						<div class="caiqie">
							<input name="attachment1" style="width: 240px; float: left;"
								class="form-control img_croopered" type="text">
							<button type="button" class="btn btn-default caiqieCropper" 
							onclick="caiqieCropperByH5Index(this)">裁剪</button>
 						</div>
						<div class="img_select_2" style="margin-top: 20px;display: none;">
							<div>
 								<input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
 							</div>
 						</div>
						<div class="img_select_1">
							<div class="img_select_1_img_box">
								<div class="next" onclick="nextClickByH5Index(this)">→</div>
								<div class="pre" onclick="preClickByH5Index(this)">←</div>
								<div class="smallImgs">
									<div class="smallImgs_box">
   									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 展示1小图结束 -->

			</div>
			<!-- h5首页设置 结束 -->
  
			<div class="form-group">
				<label for="setting_tid" class="col-sm-2 control-label">颜色</label>
				<div class="col-sm-6">
					<input class="form-control" class="form-control" name="color" id="color">
 				</div>
			</div>
			 <input type="text" name="tdateline" id="tdateline" style="display:none;">
			 <input type="text" name="id" style="display:none;">
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
			<button type="button" class="btn btn-default" id="cropper_submit" onclick="cropperSubmit(this)">裁剪</button>
			<button type="button" class="btn btn-default"
				onclick="$('#cropperModal').hide();">关闭</button>
		</div>
	</div>
	<!-- 裁剪模态框 结束 -->
	
	
	<!-- 用于控制图片1-3显示 -->
	<input type="text" id="settings_attachment" style="display: none;" value="">
</body>
</html>