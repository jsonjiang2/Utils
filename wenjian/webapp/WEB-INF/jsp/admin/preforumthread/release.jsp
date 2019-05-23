<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>管理后台修改-最开放自由的P2P网贷交流门户 -网贷巴士</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="p2p网贷,网贷资讯,互联网金融,互联网理财">
<meta name="description" content="网贷巴士努力为投资人提供最新最有价值最客观的p2p网贷资讯 ">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link rel="stylesheet" type="text/css" href="${basePath}/static/subjectrelease/dist/bootstrap.css">
<script src="${basePath}/static/subjectrelease/js/jquery.min.js"></script>
<script src="${basePath}/static/subjectrelease/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}/static/plugin/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${basePath}/static/plugin/ueditor/ueditor.all.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${basePath}/static/plugin/ueditor/lang/zh-cn/zh-cn.js"></script>
<style type="text/css">
	#edui1_imagescale{display:none !important;} /*去除点击图片后出现的拉伸边框*/
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
            font-size: 26px;
            color: #1A1A1A;
            font-weight: 700;
            border: none;
            outline:none;
            background:transparent;
            background-color:#f1f1f1;
            border:none;
            border:1px solid #ccc;
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
	 //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor', {
    	//控制显示的按钮
                   enterTag:'br' ,
        toolbars: [
                   [
                    'source', //源代码
                    'bold', //加粗
                    'indent', //首行缩进
                    'italic', //斜体
                    'underline', //下划线
                    'forecolor', //字体颜色
                    'backcolor', //背景色
                    'insertorderedlist', //有序列表
                    'fontsize', //字号
                    'fontfamily', //字体
                    'removeformat', //清除格式
                    'justifyleft', //居左对齐
                    'justifyright', //居右对齐
                    'justifycenter', //居中对齐
                    'justifyjustify', //两端对齐
                    'simpleupload', //单图上传
                    'insertimage', //多图上传
                    'emotion', //表情
                    'insertvideo', //视频
                    'link', //超链接
                    'unlink', //取消链接
       				]
               ],
         elementPathEnabled:false,//关闭元素
         wordCount:false ,  //关闭统计数字
         autoHeightEnabled:false //自动高度
    });
    
     ue.ready(function() {
    	   ue.setHeight(560); //设置编辑器高度
    	   //赋值
    	  var wdbmessage = $("#wdbmessage").html();
    	  console.log(wdbmessage)
    	  ue.setContent(wdbmessage);
    });
    
     //设置图片 和视频上传的地址
    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action) {
    	console.log(action)
	     if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage') {
	         return basePath+'/admin/preForumThread/uploadUedImageByThread';
	     } else if (action == 'uploadvideo') {
	         return basePath+'/admin/preForumThread/uploadUedVideoByThread';
	     } else {
	         return this._bkGetActionUrl.call(this, action);
	     }
    }
	 
  $("#subject").val($("#wdbsubject").val());
  
  //发布
  $(".wdbSubmit").on("click",function(){
	  //内容
	  var message = ue.getContent();
 	  var subject = $('#subject').val();
	  var tid = $('#wdbtid').val();
	  var wdbliststr = $("#wdbliststr").val();
 	  var dataObj = {};
	  dataObj.message =message;
	  dataObj.subject = subject;
	  dataObj.tid = tid;
	  console.log(JSON.stringify(dataObj))
  	  var action = basePath+"/admin/preForumThread/editorThread";
	  var callback = function(data){
 		  alert(data.message);
		  if(data.code =="88"){
			  window.location.href=basePath+"/admin/preForumThread/"+wdbliststr;
		  } 
	  }
	  $.post(action,dataObj,callback);
  })
  
});
 
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
  		${vo.adminmessage}
  </div>
  <input type="text" id="wdbuid" value="${vo.authorid}" style="display:none;" />
  <input type="text" id="wdbsubject" value="${vo.subject}" style="display:none;" />
  <input type="text" id="wdbtid" value="${vo.tid}" style="display:none;" />
  <input type="text" id="wdbliststr" value="${liststr}" style="display:none;" />
  
  
   <div class="bus">
 		 <div class="fatieye">
        <div class="title">
            <div class="center">发帖</div>
            <a href="javascript:void(0)" class="float_r release_button wdbSubmit">发布</a>
            <div class="clear"></div>
        </div>
    </div>
    <div class="post">
      <%--   <div class="post_img">
            <img class="pic" src="${basePath}/static/subjectrelease/images/tupianbiaoti.png" >
            <input class="upload" name="file" accept="image/*" type="file" style="display: none" onchange="uploadCoverimage(this)"/>
            <div class="p">
                <p>添加题图</p>
            </div>
            <span class="del">×</span>
            <div class="chkan">查看</div>
            
            <div class="nban">
                <img class="pid" src="${basePath}/static/subjectrelease/images/tupianbiaoti.png" />
            </div>
        </div> --%>
        <input type="text" class="title_input" id="subject" 
        placeholder="请输入标题（最多30个字）" onchange="subjectLengthContr(this)"
         onkeydown="subjectLengthContr(this)" onkeyup="subjectLengthContr(this)" />
    </div>
	<div class="m" style="margin-bottom:45px;">
  	         <!-- <div id="editor" class="toolbar"></div> -->
  	             <textarea  id="editor" type="text/plain" style="height:500px;"></textarea >
     </div>
     <div style="width:865px;height:80px;margin:45px auto;">
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