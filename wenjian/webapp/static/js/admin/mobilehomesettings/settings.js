var cropper = {};
$(function(){
	ColorSelect();
 	CropperImageInit();
	var ftype = $("#mobileSeeting_ftype").val();
	var subject = $("#mobileSeeting_subject").val();
	var link = $("#mobileSeeting_link").val();
	var tid = $("#mobileSeeting_tid").val();
	var type = $("#mobileSeeting_type").val();
	var sort = $("#mobileSeeting_sort").val();
	var color = $("#mobileSeeting_color").val();
	var imgtype = $("#mobileSeeting_imgtype").val();
	var attachment1 = $("#mobileSeeting_attachment1").val();
	var attachment2 = $("#mobileSeeting_attachment2").val();
	var attachment3 = $("#mobileSeeting_attachment3").val();
	var opid = $("#mobileSeeting_opid").val();
	   
	var obj = $(".setting_type_box_" + ftype);
 	$("#main_box").find("input[name='color']").val(color);
	$("#main_box").find("input[name='id']").val(opid);
	$(obj).find("input[name='tid']").val(tid);
	$(obj).find("input[name='link']").val(link);
	$(obj).find("textarea[name='subject']").val(subject);
 	$(obj).find("select[name='sort']").val(sort);
 	$(obj).find("select[name='type']").val(type);
 	$(obj).find("select[name='imgtype']").val(imgtype);
	$(obj).find("input[name='attachment1']").val(attachment1);
	$(obj).find("input[name='attachment2']").val(attachment2);
	$(obj).find("input[name='attachment3']").val(attachment3);
	
	if(!isEmpty(ftype)){
 		$("#setting_type").val(ftype).attr("disabled", "disabled");
 		$("#insertThreadBox").hide();
 	}
	//触发标题改变事件		
	var  subjectObj = $(obj).find("textarea[name='subject']");
	topSubjectOnBlur(subjectObj);
	PictureModeChange();
  })

//裁剪框渲染
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

//颜色选择
function ColorSelect(){
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
}

//图片模式
function PictureModeChange(obJVal){
	var imgtype = $("#imgtype").val();
	getThreadByH5Index();
	if(imgtype == 1){
		$("#img_select_box2").hide();
		$("#img_select_box3").hide();
		$("#img_select_box4").hide();
		
		$("#img_select_box1").show();
	}else if(imgtype == 2){
		$("#img_select_box3").hide();
		$("#img_select_box4").hide();
		
		$("#img_select_box1").show();
		$("#img_select_box2").show();
	}else if(imgtype == 3){
		$("#img_select_box4").hide();
		
		$("#img_select_box1").show();
		$("#img_select_box2").show();
		$("#img_select_box3").show();
	}else if(imgtype == 4){
		$("#img_select_box1").hide();
		$("#img_select_box2").hide();
		$("#img_select_box3").hide();
		
		$("#img_select_box4").show();
	}else{
		$("#img_select_box1").hide();
		$("#img_select_box2").hide();
		$("#img_select_box3").hide();
		$("#img_select_box4").hide();
	}
}

//轮播图上一幅
function preClickByH5Index(objVal) {
  	var $targetObj = $(objVal).parent(".img_select_1_img_box");
 	var le = $($targetObj).find('.smallImgs').scrollLeft();
 	$($targetObj).find('.smallImgs').scrollLeft(le - 240);
}

//轮播图下一幅
function nextClickByH5Index(objVal) {
	var $targetObj = $(objVal).parent(".img_select_1_img_box");
	var le = $($targetObj).find('.smallImgs').scrollLeft() + 240;
	var ll = $($targetObj).find(".smallImgs_box").find("img").length * 80;
	if (le >= ll) {
		return;
	}
	$($targetObj).find('.smallImgs').scrollLeft(le);
}

//控制h5首页标题字数
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


//图片类型选择 远程/上传
function imgSelectChange(obj) {
	var type = $(obj).val();
	var parentObj = $(obj).parents(".img_select_box");
	if(type == 2){
	 	$(parentObj).find(".img_select_2").show();
	}else{
		$(parentObj).find(".img_select_2").hide();
	}
}

//文件上传
function fileUpload(objThis){
	var type = $("#setting_type").val();
	var obj = $(".setting_type_box_" + type);
	var parentObj = $(objThis).parents(".img_select_box");
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
             	   $(parentObj).find(".img_croopered").val(data.url);
                }else{
            	   alert(data.message);
               }
          }
      })
}

//显示裁剪框
function caiqieCropperByH5Index(objVal){
 	var parentObj = $(objVal).parents(".img_select_box");
	var attachment = $(parentObj).data("attachment");
	$("#settings_attachment").val(attachment);
	var imgSrc = $(parentObj).find(".img_croopered").val();
	
	var imgtype = $("#imgtype").val();
	var widthVal = 494;
	var heightVal = 124;
	if(imgtype == 2){//两图模式
		widthVal  = 395;
		heightVal = 310;
	}else if(imgtype == 3){
		widthVal  = 395;
		heightVal = 310;
	}else if(imgtype == 4){//一小图
		widthVal  = 415;
		heightVal = 310;
	}
 	//注销
	cropper.destroy();
	CropperImageInit(widthVal,heightVal);
	//替换裁剪图片
   	cropper.replace(imgSrc);
 	$("#cropperModal").show();
}

//远程图片选择显示图片裁剪
function imgClickByH5Index(objVal){
	var parentObj = $(objVal).parents(".img_select_box");
	var attachment = $(parentObj).data("attachment");
	$("#settings_attachment").val(attachment);
	
	$(objVal).siblings().removeClass("selected");
	$(objVal).addClass("selected");
	var imgSrc = $(objVal)[0].src;
	$("#cropper_image").attr("src", imgSrc);
	//替换裁剪图片
 	var imgtype = $("#imgtype").val();
 	var widthVal = 494;
	var heightVal = 124;
	if(imgtype == 2){//两图模式
		widthVal  = 395;
		heightVal = 310;
	}else if(imgtype == 3){
		widthVal  = 395;
		heightVal = 310;
	}else if(imgtype == 4){//一小图
		widthVal  = 415;
		heightVal = 310;
	}
 	//注销
	cropper.destroy();
	CropperImageInit(widthVal,heightVal);
	//替换裁剪图片
   	cropper.replace(imgSrc);
	$("#cropperModal").show();
}

//图片裁剪 并上传
function cropperSubmit(obj){
	var canvas = cropper.getCroppedCanvas();
	var base64 = canvas.toDataURL();
	var url = basePath + "/uploadCropperImage";
	var callback = function(data) {
		console.log(JSON.stringify(data));
		if(data.state == "SUCCESS"){
			var attachment = $("#settings_attachment").val();
			var type = $("#setting_type").val();
			var typeBoxObj = $(".setting_type_box_" + type);
			if(isEmpty(attachment)){
				$(".img_croopered").val(data.url);
 			} else if(attachment == "1"){
  				$(typeBoxObj).find("input[name='attachment1']").val(data.url);
 			}else if(attachment == "2"){
  				$(typeBoxObj).find("input[name='attachment2']").val(data.url);
 			}else if(attachment == "3"){
  				$(typeBoxObj).find("input[name='attachment3']").val(data.url);
 			}
			$("#cropperModal").hide();
		}else{
			alert(data.message);
		}
	}
	$.post(url, {
		"upfile" : decodeURIComponent(base64)
	}, callback);
}

//根据tid获取主题信息
function getThreadByH5Index() {
	var ftype = $("#setting_type").val();
	var obj = $(".setting_type_box_" + ftype);
	var tid = $(obj).find("input[name='tid']").val();
	var type = $(obj).find("select[name='type']").val();
   	if(type != "1"){
 		return;
	}
	var callback = function(data) {
		if (data.code == "88") {
			console.log("=====================");
			$(obj).find("input[name='link']").val(data.data.link);
			$("#tdateline").val(data.data.tdateline);
				$(obj).find("textarea[name='subject']").val(data.data.subject);
			$(obj).find("textarea[name='message']").val(data.data.message);
			
			var html = "";
			for(var i =0;i < data.data.imgs.length;i++){
					html +="<img  crossOrigin='anonymous' class='z' onclick='imgClickByH5Index(this)' src='"+data.data.imgs[i]+"' >";
			} 
			$(obj).find(".smallImgs_box").html(html);
		} else {
			alert(data.message);
		}
	}
	var insertUrl = basePath + "/admin/mobileHomePagesSettings/getThread";
	$.post(insertUrl, {
		"tid" : tid,
		"ftype": ftype
	}, callback);
}
 