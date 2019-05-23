<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${basePath }/static/plugin/colorpicker/css/colorpicker.css"
      rel="stylesheet" type="text/css">
<script type="text/javascript"
        src="${basePath}/static/plugin/colorpicker/js/colorpicker.js"></script>
<link href="${basePath }/static/plugin/cropper/cropper.css"
      rel="stylesheet" type="text/css">
<script type="text/javascript"
        src="${basePath}/static/plugin/cropper/cropper.js"></script>
<script type="text/javascript">
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

        //图片裁剪开始

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
</script>
<c:if test="${resource.fatherMenuName !=null }">
    <div class="row">
        <div class="col-md-8">
            <label class="col-sm-2 text-right">上级菜单</label>
            <div class="col-sm-6">
                <input type="hidden" value="${resource.parentId==null?'0':resource.parentId}" name="parentId"
                       id="parentId" /> <input type="text" class="form-control"
                                                 readonly="readonly" value="${resource.fatherMenuName}">
            </div>
        </div>
    </div>
</c:if>
<div class="row">
    <div class="col-md-8">
        <label class="col-sm-2 text-right">菜单名称</label>
        <div class="col-sm-6">
            <input type="hidden" value="${ resource.resourceId}" id="resourceId" /> <input
                type="text" class="form-control" id="resourceName" name="resourceName"
                value="${resource.resourceName}" placeholder="请输入菜单名称...">
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-8">
        <label class="col-sm-2 text-right">菜单链接</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="resourceUrl"
                   name="resourceUrl" value="${resource.resourceUrl}"
                   placeholder="请输入菜单链接...">
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-8">
        <label class="col-sm-2 text-right">菜单编号</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="sort"
                   name="sort" value="${resource.sort}"
                   placeholder="请输入菜单编号">
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-8">
        <label class="col-sm-2 text-right">菜单名称颜色</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="color"
                   name="color" value="${resource.color}"
                   placeholder="请输颜色">
        </div>
    </div>
</div>





<div class="row">
    <div class="col-md-8">
        <div class="col-sm-6">
            <button class="btn" onclick="menu.menu_save()">保存</button>
            <button class="btn" onclick="menu.menu_back()">返回</button>
        </div>
    </div>
</div>
