<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>编辑页面demo</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>
    <script type="text/javascript" charset="utf-8" src="${basePath}/static/subjectrelease/js/wangEditor.js"></script>
    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>
	<button id="btn1">获取html</button>
<button id="btn2">获取text</button>
<p>wangEditor 上传图片到服务器</p>
    <div id="div3">
        <p>欢迎使用 wangEditor 富文本编辑器</p>
    </div>

    <p>wangEditor 以base64保存图片文件</p>
    <div id="div4">
        <p>欢迎使用 wangEditor 富文本编辑器</p>
    </div>

    <p>wangEditor 自定义上传图片</p>
    <div id="div5">
        <p>欢迎使用 wangEditor 富文本编辑器</p>
    </div>

     <script type="text/javascript">
        var E = window.wangEditor
        var editor2 = new E('#div3')
        editor2.customConfig.uploadImgServer = '/upload-img'
        editor2.customConfig.uploadImgMaxLength = 2
        editor2.customConfig.uploadImgMaxSize = 2 * 1024 * 1024
        editor2.customConfig.uploadFileName = 'upfile'
        editor2.customConfig.customUploadImg = function (files, insert) {
            // files 是 input 中选中的文件列表
            // insert 是获取图片 url 后，插入到编辑器的方法
			uploadImage(files,insert)
            // 上传代码返回结果之后，将图片插入到编辑器中
         }
        
        document.getElementById('btn1').addEventListener('click', function () {
            // 读取 html
            alert(editor2.txt.html())
        }, false)

        document.getElementById('btn2').addEventListener('click', function () {
            // 读取 text
            alert(editor2.txt.text())
        }, false)
        
        
        // editor2.customConfig.uploadImgParams = {
        //     a: 123,
        //     b: 'vvv'
        // }
        // editor2.customConfig.uploadImgParamsWithUrl = true
        editor2.create()
        var editor1 = new E('#div4')
        editor1.customConfig.uploadImgShowBase64 = true
        editor1.create()
        var editor = new E('#div5')
        editor.customConfig.customUploadImg = function (files, insert) {
            console.log(files)
            insert('https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png')
        }
        editor.create()
        
        
        //图片上传
function uploadImage(files,insert){
  	//var img = $(".post_img .pic")[0].src;
  	var formFile = new FormData();
	formFile.append("upfile", files[0]); //加入文件对象
 	
	var action = basePath+"/admin/preForumThread/uploadImageByThread";
		$.ajax({
        url: action,
        data: formFile,
        type: "Post",
        cache: false,//上传文件无需缓存
        processData: false,//// 告诉jQuery不要去处理发送的数据
        contentType: false, //告诉jQuery不要去设置Content-Type请求头
        success: function (data) {
        	alert(JSON.stringify(data));
          	if(data.meta.code == "88"){
          		insert(data.data);
        	}else{
        		alert(data.meta.message);
        	}
         }
    })
} 
    </script>

</body>
</html>