<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>管理后台回复修改-最开放自由的P2P网贷交流门户 -网贷巴士</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="p2p网贷,网贷资讯,互联网金融,互联网理财">
<meta name="description" content="网贷巴士努力为投资人提供最新最有价值最客观的p2p网贷资讯 ">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link rel="stylesheet" type="text/css" href="${basePath}/static/subjectrelease/dist/bootstrap.css">
<script src="${basePath}/static/subjectrelease/js/jquery.min.js"></script>
<script src="${basePath}/static/subjectrelease/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}/static/subjectrelease/js/wangEditor.js"></script>
<style type="text/css">
	.m{ width: 860px;margin-left: auto; margin-right: auto; }
 	#editor{
        height: 410px;
        width: auto;
        border:1px solid #ccc;
    }
    #wangEditor{
        height: 560px;
        max-height:560px;
        border:1px solid #ccc;
    }
    .w-e-toolbar{
      background-color: #f1f1f1;
      border: 1px solid #ccc;
    }
   </style>
 <style type="text/css">
        .float_l{
            float: left;
        }
        .float_r{
            float: right;
        }
        .clear{
            clear: both;
        }
        .center{
            width: 660px;
            margin: auto;
        }
        .fatieye{
            
        }
        .fatieye .title{
            height: 60px;
            border-bottom: solid 1px #EBEBEB;
        }
        .fatieye .title .center{
            color: #333;
            font-size: 16px;
            line-height: 60px;
        }
        .pic{
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            cursor:pointer;
            z-index: 9;
        }
        .post{
            width: 860px;
            margin: auto;
            margin-top: 47px;
        }
        .release_button{
            width: 82px;
            height: 32px;
            line-height: 30px;
            padding: 0;
            display: block;
            border:solid 1px #DADADA;
            border-radius: 10px;
            text-align: center;
            color: #DADADA;
            margin-top: -46px;
            margin-right: 50px;
            background: #3773ea;
            color: #fff;
        }
        .release_button:hover{
            color: #B3B3B3;
            text-decoration:none; 
        }
        .post_img{
            background: url("${basePath}/static/subjectrelease/images/tupianbiaoti2.png") top center no-repeat;
            width: 660px;
            min-height: 192px;
            display: inline-block;
            text-align: center;
            color: #7C7C7C;
            position: relative;
        }
        .chkan{
            position: absolute;
            background: rgba(0,0,0,.6);
            width: 44px;
            height: 44px;
            position: absolute;
            top: 50%;
            font-size: 14px;
            left: 50%;
            transform: translate(-50%,-50%);
            color: #fff;
            z-index: 99999;
            display: none;
            line-height: 44px;
            text-align: center;
            border-radius: 100%;
        }
        .nban{
            background: rgba(0,0,0,.4);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 999999;
            display:none;
        }
        .nban img{
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            height: 75%;
            z-index: 99999999;
        }
        .del{
            display: none;
            position: absolute;
            right: -8px;
            cursor: pointer;
            
            z-index: 11111;
            top: -8px;
            background: #EB3C3C;
            color: #fff;
            width:20px;
            height:20px;
            line-height: 20px;
            border-radius: 100%;
        }
        .subile{
            width: 277px;
            line-height: 40px;
            text-align: center;
            font-size: 16px;
            color: #fff;
            border: none;
            background: #3773EB;
            margin-top: 30px;
        }
        .jishaox{
            font-size: 14px;
            color: #868686;
            line-height: 18px;
            margin-top: 40px;
        }
        .post_img .p{
            position: absolute;
            left: 0;
            bottom: 40px;
            width: 100%;
            font-size: 16px;
            color: #B3B3B3;
            overflow: hidden;
            height: 25px;
        }
        .post_img .p p{
            margin-top: -30px;
            transition: all 0.2s ease-in-out;
        }
        .post_img:hover .p p{
            margin-top: 0px;
        }
        .title_input{
            width: 100%;
            min-height: 44px;
            margin: 16px 0;
            font-size: 32px;
            color: #1A1A1A;
            font-weight: 700;
            border: none;
            outline:none;
            background:transparent;
            border:none;
            outline:medium;
        }
        .title_input::-webkit-input-placeholder { /* WebKit, Blink, Edge */
            color:#B3B3B3;
        }
        .title_input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
            color:#B3B3B3;
        }
        .title_input::-moz-placeholder { /* Mozilla Firefox 19+ */
            color:#B3B3B3;
        }
        .title_input:-ms-input-placeholder { /* Internet Explorer 10-11 */
            color:#B3B3B3;
        }
        .note-editor.note-frame .note-editing-area .note-editable{
            height: auto !important;
            min-height: 300px;
            border-bottom: solid 1px #ECECEC;
        }
        .btn-group > .btn-group {
            display: none;
        }
        .note-editor.note-frame{
            border: none;
        }
        .note-editor.note-frame .note-statusbar .note-resizebar{
            display: none;
        }
        .panel-default > .panel-heading{
            background: none;
            border: solid 1px #ECECEC;
            border-radius: 0;
            border-left: none;
            border-right: none;
        }
        .panel{
            box-shadow: none;
        }
        .note-popover .popover-content, .panel-heading.note-toolbar{
            padding: 6px 0px 11px 5px;
        }
    </style>
     
<script type="text/javascript">
  
$(function(){
	var E = window.wangEditor
	var editor2 = new E("#editorMenu","#wangEditor")
	var wdbreplytype = $("#wdbreplytype").val();
 	if(wdbreplytype == 1){
		// 自定义菜单配置
	    editor2.customConfig.menus = [
	         'head',  // 标题
	         'bold',  // 粗体
	         'fontSize',  // 字号
	         'fontName',  // 字体
	         'italic',  // 斜体
	         'underline',  // 下划线
	         'strikeThrough',  // 删除线
	         'foreColor',  // 文字颜色
	         'backColor',  // 背景颜色
	         'link',  // 插入链接
	         'list',  // 列表
	         'justify',  // 对齐方式
	         'quote',  // 引用
	          'image',  // 插入图片
	         'table',  // 表格
	         'video',  // 插入视频
	          'undo',  // 撤销
	         'redo'  // 重复
	    ]
	}else{
		// 自定义菜单配置
	    editor2.customConfig.menus = [
	         'head',  // 标题
	         'bold',  // 粗体
	         'fontSize',  // 字号
	         'fontName',  // 字体
	         'italic',  // 斜体
	         'underline',  // 下划线
	         'strikeThrough',  // 删除线
	         'foreColor',  // 文字颜色
	         'backColor',  // 背景颜色
	         'link',  // 插入链接
	         'list',  // 列表
	         'justify',  // 对齐方式
	         'quote',  // 引用
  	          'undo',  // 撤销
	         'redo'  // 重复
	    ]
	}
   	editor2.customConfig.uploadImgMaxLength = 1
	editor2.customConfig.uploadImgMaxSize = 2 * 1024 * 1024
	editor2.customConfig.uploadFileName = 'upfile'
	editor2.customConfig.customUploadImg = function (files, insert) {
           // files 是 input 中选中的文件列表
           // insert 是获取图片 url 后，插入到编辑器的方法
		uploadImage(files,insert)
           // 上传代码返回结果之后，将图片插入到编辑器中
	}
	editor2.create()
	
   //赋值
  var wdbmessage = $("#wdbmessage").html();
  editor2.txt.html(wdbmessage)
  $("#subject").val($("#wdbsubject").val());
  
  //发布
  $(".wdbSubmit").on("click",function(){
	  //内容
	  var message = editor2.txt.html();
 	  console.log(message)
 	  var id = $('#wdbid').val();
  	  var dataObj = {};
	  dataObj.message = message;
 	  dataObj.id = id;
	  var wdbliststr = $("#wdbliststr").val();
  	  var action = basePath+"/admin/preReply/editorPreReply";
	  var callback = function(data){
 		  alert(data.message);
		  if(data.code =="88"){
			  window.location.href=basePath+"/admin/preReply/"+wdbliststr;
		  } 
	  }
	  $.post(action,dataObj,callback);
  })
  
});

//图片上传
function uploadImage(files,insert){
  	//var img = $(".post_img .pic")[0].src;
  	var uid = $("#wdbuid").val();
 	var formFile = new FormData();
	formFile.append("upfile", files[0]); //加入文件对象
	formFile.append("uid", uid); //加入文件对象
	
	var action = basePath+"/admin/preReply/uploadImage";
		$.ajax({
        url: action,
        data: formFile,
        type: "Post",
        cache: false,//上传文件无需缓存
        processData: false,//// 告诉jQuery不要去处理发送的数据
        contentType: false, //告诉jQuery不要去设置Content-Type请求头
        success: function (data) {
          	if(data.meta.code == "88"){
          		insert(data.data);
        	}else{
        		alert(data.meta.message);
        	}
         }
    })
} 
  
//控制标题字符
function subjectLengthContr(obj){
	var val = $(obj).val();
 	if(val.length >= 30){
		$(obj).val(val.substring(0,30));
 	}
}
</script>
</head>
<body>
  <div id="wdbmessage" style="display:none;">
  		${vo.message}
  </div>
  <input type="text" id="wdbuid" value="${vo.uid}" style="display:none;" />
  <input type="text" id="wdbid" value="${vo.id}" style="display:none;" />
  <input type="text" id="wdbreplytype" value="${vo.replytype}" style="display:none;" />
  <input type="text" id="wdbliststr" value="${liststr}" style="display:none;" />
  
   
  
   <div class="bus">
 		 <div class="fatieye">
        <div class="title">
            <div class="center">发帖</div>
            <a href="javascript:void(0)" class="float_r release_button wdbSubmit" >发布</a>
            <div class="clear"></div>
        </div>
    </div>
 	    <div class="m">
  	         <div id="editorMenu" class="toolbar"></div>
  	     </div>
  	      <div class="m">
  	         <div id="wangEditor" class="text"></div>
  	     </div>
     </div>
     <div style="width:865px;height:80px;margin:15px auto;">
		  <button class="btn btn-default wdbSubmit"  style="width: 82px;height: 32px;line-height: 30px;padding: 0;background: #3773ea;color: #fff;">发布</button>
 	</div>
      <script>
        $(".del").on("click",function(){
            $("input").attr("value",""); 
            $(this).parent().find(".pic").attr("src", "images/tupianbiaoti.png")
            $(this).css('display',"none")
            $(this).parent().find(".chkan").css('display',"none")  
        })
        $(".chkan").on("click",function(){
            $(this).parent().find(".nban").css("display","block")
        })
        $(".nban").on("click",function(){
            $(this).css("display","none")
        })
    //上传图片js
        $(function() {
            $(".pic").click(function () {
            	$(this).parent().find(".upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
             /*     $(this).parent().find(".upload").on("change",function(){
                var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                setTimeout(() => {  
                    $(this).parent().find(".del").css("display", "block"); 
                    $(this).parent().find(".chkan").css('display',"block"); 
                }, 1500);
                $(this).parent().find(".pic").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
                $(this).parent().find(".pid").attr("src", objUrl) ;
                }
            	}); */
            });
        }); 
        function getObjectURL(file) {
            var url = null ;
            if (window.createObjectURL!=undefined) { // basic
                url = window.createObjectURL(file) ;
            } else if (window.URL!=undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file) ;
            } else if (window.webkitURL!=undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file) ;
            }
            return url ;
        }
    </script>
     
	</div>
</body>
</html>