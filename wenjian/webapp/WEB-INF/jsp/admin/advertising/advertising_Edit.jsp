<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="${basePath}/static/js/jscolor.js"></script>

<div class="row">
	<div class="col-xs-9">
		<form id="_adPostForm" class="form-horizontal" role="form"
			validate="true">
			<%--<input type="hidden" name="tid" value="${data.tid}">--%>

            <div class="form-group" id="modelSelect">
                <input type="text" style="display: none;" value="${returnUrl}" id="returnUrl" />
                <label for="modelname" class="col-sm-6 control-label no-padding-right">所在页面板块：</label>
                <div class="col-sm-6">
                    <select id="modelname" name="modelname" class="form-control" onchange="selectImgNum(this)">
                        <option value="">--请选择--</option>
                        <option value="1">首页</option>
                        <option value="2">资源主列表</option>
                        <option value="3">平台数据列表</option>
                        <option value="4">巴士茶馆</option>
                        <option value="5">网贷资讯</option>
                        <option value="1,2,3,4" hidden>全选</option>
                    </select>
                    <input type="checkbox" name="allModleSelect" id = "allModleSelect" value="" onchange="allModleSelect()" title="全选" />&nbsp;全部模块
                    <input type="hidden" id="tid" name="tid" value="${tid}"/>
                </div>
            </div>

            <div class="form-group">
                <label for="select-adImgaway-text" class="col-sm-6 control-label no-padding-right">优先展示：</label>
                <div class="col-sm-6">
                    <select id="select-adImgaway-text" name="postadway" class="form-control" onchange="setAdImg(this)">
                        <option value=1>用户广告图</option>
                        <option value=2>管理员广告图</option>
                    </select>
                </div>
            </div>

            <div class="form-group" id="adImgShow" style="display: none;">
                <label for="select-adImgaway-text" class="col-sm-6 control-label no-padding-right">是否设置通用广告图：</label>
                <div class="col-sm-6" style="padding-top: 8px">
                    <input type="radio" value="0" checked="checked"
                           name="img_type" onclick="imgChanges(0)">&nbsp;否&nbsp;&nbsp;
                    <input type="radio" value="1"
                           name="img_type" onclick="imgChanges(1)">&nbsp;是&nbsp;&nbsp;
                </div>
                <div class="img_select_2" style="margin-top: 20px;display: none;">
                    <label for="select-adImgaway-text" class="col-sm-6 control-label no-padding-right">PC端广告图：</label>
                    <div class="col-sm-6" style="padding-top: 8px">
                        <input name="pcimgAdress" id="pcimgAdress" style="width: 240px; float: left;"
                               class="form-control img_croopered" type="text" readonly="readonly">
                        <input type="file" name="FileUpload"  style="display: block;border: initial;" onchange="fileUpload(this)">
                    </div>
                    <label for="select-adImgaway-text" class="col-sm-6 control-label no-padding-right">PC端超链接：</label>
                    <div class="col-sm-6" style="padding-top: 8px">
                        <input name="pcimgHyperlink" id="pcimgHyperlink" style="width: 240px; float: left;" type="text">
                    </div>
                </div>
                <div class="img_select_2" style="margin-top: 20px;display: none;">
                    <label for="select-adImgaway-text" class="col-sm-6 control-label no-padding-right">App端广告图：</label>
                    <div class="col-sm-6" style="padding-top: 8px">
                        <input name="appimgAdress" id="appimgAdress" style="width: 240px; float: left;"
                               class="form-control img_croopered1" type="text" readonly="readonly">
                        <input type="file" name="FileUploads"  style="display: block;border: initial;" onchange="fileUpload1(this)">
                    </div>
                    <label for="select-adImgaway-text" class="col-sm-6 control-label no-padding-right">App端超链接：</label>
                    <div class="col-sm-6" style="padding-top: 8px">
                        <input name="appimgHyperlink" id="appimgHyperlink" style="width: 240px; float: left;" type="text">
                    </div>
                </div>
            </div>
		</form>
	</div>
</div>
<script>
    $(function(){
        var returnUrl = document.getElementById("returnUrl").value;
        if(returnUrl=="list"){
            document.getElementById("modelSelect").style.display="none";
        }
        $("#select-adImgaway-text").val("${data.postadway}");
        if(${data.postadway}==1){
            document.getElementById("adImgShow").style.display="none";
        }else{
            document.getElementById("adImgShow").style.display="block";
        }
        var modelvalue = document.getElementById("allModleSelect");
        modelvalue.onclick=function(){
            if(this.checked){
                $("#modelname").val("1,2,3,4");
                $("#modelname").attr("disabled","disabled");
            }else{
                $("#modelname").val("");
                $("#modelname").removeAttr("disabled");
            }
        }
        document.getElementById("modelname").onselect=function () {
            alert(document.getElementById("modelname").value);
        }
    });
</script>
<script type="text/javascript">
    //验证
    var validates = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            modelname: {
                validators: {
                    notEmpty: {
                        message: "请选择模块!"
                    }
                }
            },
            postadway: {
                validators: {
                    notEmpty: {
                        message: "优先展示"
                    }
                }
            }
        }
    };
    function selectImgNum(obj){
        if(obj.value=="1,2,3,4"){
            alert("全选");
            $("#allModleSelect").attr("checked","checked");
        }
    }
    function allModleSelect() {
        var modelvalue = document.getElementById("allModleSelect");
        modelvalue.onclick=function(){
            if(this.checked){
                $("#modelname").val("1,2,3,4");
                alert(document.getElementById("modelname").value);
            }else{
                $("#modelname").val("0");
            }
        }
    }
    function setAdImg(object){
        if(object.value==1){
            document.getElementById("adImgShow").style.display="none";
        }else{
            document.getElementById("adImgShow").style.display="block";
        }
    }

    //轮播图类型选择
    function imgChanges(type) {
        if(type == 1){
            $(".img_select_2").show();
        }else{
            $(".img_select_2").hide();
            $(".img_select_2").clean();
        }
    }
    function update(){
        $("#modelname").removeAttr("disabled");
        $("#_adPostForm").bootstrapValidator(validates);
        //获取定义好规则的代理对象
        var bv = $("#_adPostForm").data("bootstrapValidator");
        //手动触发验证
        var vali = bv.validate();
        //给表单字段定义验证规则
        if (bv.isValid()) {
            var tid = document.getElementById("tid").value;
            var adImagAway = document.getElementById("select-adImgaway-text").value;
            if(adImagAway==2){
                var obj = document.getElementsByName("img_type");
                var objValue = 0;
                for(var i=0; i<obj.length; i ++){
                    if(obj[i].checked){
                        objValue=obj[i].value;
                    }
                }
                if(objValue==1){
                    var pcimgAdress = document.getElementById("pcimgAdress").value;
                    if(pcimgAdress==""){
                        alert("没有指定通用广告图！");
                        return false;
                    }
                }
            }
            var json = $("#_adPostForm").serialize();
            var action ="${pageContext.request.contextPath}/admin/Advertising/setPostAdShow";
            $.ajaxSettings.async = false;
            var code="";
            $.post(action, json, function(data){
                code = data.meta.code;
                if(data.meta.code=="88"){
                    alert(data.meta.message);
                    window.location.reload(true);
                }else{
                    alert(data.meta.message);
                }
            });
        }
	};

    //文件上传
    function fileUpload(obj){
        var fileObj = $(obj)[0].files[0]; // js 获取文件对象
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
                    $(".img_croopered").val(data.url_group);
                }else{
                    alert(data.message);
                }
            },
        })
    }

    function fileUpload1(obj){
        var fileObj = $(obj)[0].files[0]; // js 获取文件对象
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
                    $(".img_croopered1").val(data.url_group);
                }else{
                    alert(data.message);
                }
            },
        })
    }
</script>