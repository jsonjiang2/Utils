/*$(document).ready(function(){
		//点击修改头像
        $("#up-img-touch").click(function(){
        	$("#doc-modal-1").modal({width:'600px'});
        });
});*/
var biaozhi;
function tankuang(t){
	biaozhi = t;
	//点击圆圈里面的图片的时候
	/*var imgsrc = "#salesmanlogo"+t+"  #up-img-touch"+" img"
	var src = $(imgsrc)[0].src; 
	alert(src);
	var lockS = "#lock1"+"  img";
	$(lockS).attr("src",src);
	var lock = "#lock"+t;*/
	//找到和lockXXX 同级的touxiang_imgs 的下的image
	//var src1 = $(lock).parent().find("#touxiang_imgs img")[0].src;
	
	$("#doc-modal-1").modal({width:'600px'});
}
$(function() {
    'use strict';
    // 初始化
    var $image = $('#image');
    $image.cropper({
        aspectRatio: '1',
        autoCropArea:0.8,
        preview: '.up-pre-after',
        
    });

    // 事件代理绑定事件
    $('.docs-buttons').on('click', '[data-method]', function() {
   
        var $this = $(this);
        var data = $this.data();
        var result = $image.cropper(data.method, data.option, data.secondOption);
        switch (data.method) {
            case 'getCroppedCanvas':
            if (result) {
                // 显示 Modal
                $('#cropped-modal').modal().find('.am-modal-bd').html(result);
                $('#download').attr('href', result.toDataURL('image/jpeg'));
            }
            break;
        }
    });
    
    

    // 上传图片
    var $inputImage = $('#inputImage');
    var URL = window.URL || window.webkitURL;
    var blobURL;

    if (URL) {
        $inputImage.change(function () {
            var files = this.files;
            var file;

            if (files && files.length) {
               file = files[0];

               if (/^image\/\w+$/.test(file.type)) {
                    blobURL = URL.createObjectURL(file);
                    $image.one('built.cropper', function () {
                        // Revoke when load complete
                       URL.revokeObjectURL(blobURL);
                    }).cropper('reset').cropper('replace', blobURL);
                    $inputImage.val('');
                } else {
                    window.alert('Please choose an image file.');
                }
            }

            // Amazi UI 上传文件显示代码
            var fileNames = '';
            $.each(this.files, function() {
                fileNames += '<span class="am-badge">' + this.name + '</span> ';
            });
            $('#file-list').html(fileNames);
        });
    } else {
        $inputImage.prop('disabled', true).parent().addClass('disabled');
    }
    
    //绑定上传事件
    $('#up-btn-ok').on('click',function(){
    	var $modal = $('#my-modal-loading');
    	var $modal_alert = $('#my-alert');
    	var img_src=$image.attr("src");
    	if(img_src==""){
    		set_alert_info("没有选择上传的图片");
    		$modal_alert.modal();
    		return false;
    	}
    	
    	$modal.modal();
    	
    	var url=$(this).attr("url");
    	var canvas=$("#image").cropper('getCroppedCanvas');
    	var data=canvas.toDataURL(); //转成base64
        $.ajax( {  
                url:url,  
                dataType:'json',  
                type: "POST",  
                data: {"image":data.toString()},  
                success: function(data, textStatus){
                	$modal.modal('close');
                	set_alert_info(data.result);
                	$modal_alert.modal();
                	if(data.result=="ok"){
                		$("#up-img-touch img").attr("src",data.file);
                	
                		var img_name=data.file.split('/')[2];
                		console.log(img_name);
                		$("#pic").text(img_name);
                	}
                },
                error: function(){
                	$modal.modal('close');
                	set_alert_info("上传文件失败了！");
                	$modal_alert.modal();
                	//console.log('Upload error');  
                }  
         });  
    	
    });
    
    //图片上传
    $('#touxiang_bc').on('click',function(){
    	alert(biaozhi);
    	var $modal = $('#my-modal-loading');
    	var $modal_alert = $('#my-alert');
    	var img_src=$image.attr("src");
    	if(img_src==""){
    		$modal_alert.modal();
    		return false;
    	}
    	
    	$modal.modal();
    	
    	var url=basePath+"/admin/businesscooperation/upload"; //后台地址
    	var canvas=$("#image").cropper('getCroppedCanvas');
    	var data=canvas.toDataURL(); //转成base64
    	var params = {
    			"upfile":decodeURIComponent(data),
    			"biaozhi":biaozhi
    	}
    	$.post(url,params,function(data){
    		if(data.code=="00"){
    			alert("图片上传失败");
    		}else{
    			alert(data.data.url);
    			alert(data.data.biaozhi);
    			var lock = "#lock"+biaozhi+"  image";
    			$(lock).attr("src", data.data.url);
    			
    			var toux = "#salesmanlogo"+biaozhi+"  #up-img-touch"+"  img";
    			$(toux).attr("src", data.data.url);
    			
    			var toux_input = "#salesmanlogo"+biaozhi+"  #profile";
    			$(toux_input).val(data.data.url);
    			
    			var lock = "#lock"+biaozhi;
    			//找到和lockXXX 同级的touxiang_imgs 的下的image
    			$(lock).parent().find("#touxiang_imgs img").attr("src",data.data.url);
    		}
    	});
 
    });
    
  //平台高管头像上传
    $('#platform_touxiang_bc').on('click',function(){
    	var $modal = $('#my-modal-loading');
    	var $modal_alert = $('#my-alert');
    	var img_src=$image.attr("src");
    	if(img_src==""){
    		failPopup("没有选择上传的图片");
    		$modal_alert.modal();
    		return false;
    	}
    	
    	$modal.modal();
    	
    	var url=basePath+"/user/platformInfo/uploadCropperImage";
    	var canvas=$("#image").cropper('getCroppedCanvas');
    	var data=canvas.toDataURL(); //转成base64
    	var params = {
    		"upfile":decodeURIComponent(data),
    		"type":"2"
    	}
    	$.post(url,params,function(data){
     		if(data.code=="00"){
    			failPopup("图片上传失败");
    		/*	$(".am-dimmer.am-active").css("opacity","0");*/
    			/*$("#doc-modal-1").css('display','none'); */
    		}else{
    			/*successPopup("图片上传成功");*/
     		    // 将图片路径存入src中，显示出图片
                $("#gg_editor_box").find(".pid").attr("src", data.data);
                $(".close").click();
    		}
    	});
    	
    });
    
});


function failPopup(message){
	//替换提示错误图标
	$("#tishi_common .tishi_text").find("img").attr("src",basePath+"/static/images/ten/shibai.png");
	//替换提示成功图标
	//$("#tishi_common .tishi_text").find("img").attr("src",basePath+"/static/images/ten/chenggong.png");
	//替换提示文字
	$("#tishi_common .tishi_text .message").text(message);
	//提示弹框
	$(".tishi").fadeIn(300)
}


function rotateimgright() {
$("#image").cropper('rotate', 90);
}


function rotateimgleft() {
$("#image").cropper('rotate', -90);
}

function set_alert_info(content){
	$("#alert_content").html(content);
}



 
