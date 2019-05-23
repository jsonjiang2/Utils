<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>

<script type="text/javascript" charset="utf-8" src="${basePath}/static/subjectrelease/js/wangEditor.js"></script>
<!DOCTYPE HTML>
<html>
<head>
    <style type="text/css">
        *{margin: 0px;padding: 0px;}
        .laber_from {color: #222;font-weight: normal;}
        .route_bg{ background-color: #E7E7E7; border-radius: 4px; padding: 5px; margin-right: 5px;margin-left: 5px;margin-top: 5px; }
        .route_bg i{ color: #ccc;font-weight: 400;font-size: 12px;padding-right: 5px;line-height: 25px; }
        .route_bg a{ font-size: 12px; color: #666; text-decoration: none;line-height: 1.6;font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif !important; }
        .route_bg a:hover{ color: #888; text-decoration: none;}
        hr{
            margin: 5px;
        }
        select{
            text-align-last: center;
        }
    </style>
</head>
<style type="text/css">
    .m{ width: 860px;margin-left: auto; margin-right: auto; }
    #editor{
        height: 410px;
        width: auto;
        border:1px solid #ccc;
    }
    #wangEditors{
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
        outline:medium;
        border:1px solid #ccc;
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
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="updateFrontForm">
        <input id="id" name="id" value="${data.id}" hidden="hidden" />

        <div class="form-group">
            <label  class="col-sm-1 control-label laber_from">项目类型</label>
            <input id="itemid" name="itemid" hidden="hidden" />
            <div class="col-sm-2" style="width: 16%">
                <select id="itemtype" name="itemtype" class="form-control" onchange="selectItemType()">
                    <option value="1">一级项目</option>
                    <option value="2">二级项目</option>
                    <option value="3">三级项目</option>
                </select>
            </div>
        </div>

        <div id="selectOneDiv" style="display: none">
            <div class="form-group">
                <label  class="col-sm-1 control-label laber_from" style="width: 102px">一级项目</label>
                <div class="col-sm-2" style="width: 16%">
                    <select id="firstType" name="firstType" class="form-control" onchange="selectItemChang()"></select>
                </div>
            </div>
        </div>

        <div id="selectTwoDiv" style="display: none">
            <div class="form-group">
                <label  class="col-sm-1 control-label laber_from" style="width: 102px">二级项目</label>
                <div class="col-sm-2" style="width: 16%">
                    <select id="twoType" name="twoType" class="form-control" onchange="selectItem2Chang()">
                        <option value="0" selected="selected">请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div id="selectThreeDiv" style="display: none">
            <div class="form-group">
                <label  class="col-sm-1 control-label laber_from" style="width: 102px">三级项目</label>
                <div class="col-sm-2" style="width: 16%">
                    <select id="threeType" name="threeType" class="form-control">
                        <option value="0" selected="selected">请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label laber_from">主标题</label>
            <div class="col-sm-2" style="width: 38%" >
                <input id="maintitless" name="maintitless" class="form-control" type="text" value="${data.maintitless}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label laber_from">调用样式</label>
            <div class="col-sm-2" style="width: 26%" >
                <input id="maintitlelink" name="maintitlelink" class="form-control" type="text" value="${data.maintitlelink}"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label laber_from">副标题1</label>
            <div class="col-sm-2" style="width: 38%" >
                <input id="subtitleone" name="subtitleone" class="form-control" type="text" value="${data.subtitleone}"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label laber_from">副标题2</label>
            <div class="col-sm-2" style="width: 38%" >
                <input id="subtitletwo" name="subtitletwo" class="form-control" type="text" value="${data.subtitletwo}"/>
            </div>
        </div>

        <div class="form-group" id="uploadImg">
            <label class="col-sm-1 control-label laber_from">标题图上传</label>
            <div class="col-sm-2" style="width: 16%" >
                <input id="titleimg" name="titleimg" class="form-control img_croopered" type="text" readonly="readonly" value="${data.titleimg}">
                <input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
            </div>
            <script>
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
                        url: basePath+"/uploadAlibabaImage",
                        data: data,
                        type: "Post",
                        dataType: "json",
                        cache: false,//上传文件无需缓存
                        processData: false,//用于对data参数进行序列化处理 这里必须false
                        contentType: false, //必须
                        success: function (data) {
                            console.log(data+"==="+JSON.stringify(data));
                            if(data.state == "SUCCESS"){
                                $("#titleimg").val(data.url_group);
                            }else{
                                alert(data.message);
                            }
                        },
                    });
                }
            </script>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label laber_from">主题图链接</label>
            <div class="col-sm-2" style="width: 26%" >
                <input id="subtitleimgurl" name="subtitleimgurl" class="form-control" placeholder="www.baidu.com" type="text" class="form-control" maxlength="100" value="${data.subtitleimgurl}"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label laber_from">定位</label>
            <div class="col-sm-2" style="width: 16%" >
                <input id="position" name="position" class="form-control" type="text" value="${data.position}"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label laber_from">内容</label>
            <div class="col-sm-2" style="width: 58%;height: 10%">
                <div id="editorMenus" class="toolbar"></div>
                <div id="wangEditors" class="text" style="height: 300px;"></div>
            </div>
        </div>

        <div class="form-group" hidden="hidden">
            <label class="col-sm-2 control-label laber_from">内容1：</label>
            <div class="col-sm-2" style="width: 16%" >
                <textarea rows="3" class="form-control" id="content" name="content" >${data.content}</textarea>
            </div>
        </div>
        <input hidden="hidden" id="putoneid" value="${data.oneid}" />
        <input hidden="hidden" id="puttwoid" value="${data.twoid}" />
        <input hidden="hidden" id="putthreeid" value="${data.threeid}" />
    </form>
</div>
<script type="text/javascript">
    //二级项目展示
    function selectItemChang(){
        var itemType = $("#itemtype").val();
        var obj3=document.getElementById("threeType");
        obj3.options.length=0;
        obj3.add(new Option("--请选择--",""));
        if(itemType!=null&&itemType!=""&&itemType!=undefined){
            if(itemType==2||itemType==3){
                var itemType2 = $("#firstType").val();
                var itemSelectNum = "twoType";
                getItemListByPid(itemType2,itemSelectNum);
            }
        }
    }

    //三级项目展示
    function selectItem2Chang(){
        var itemType = $("#itemtype").val();
        if(itemType!=null&&itemType!=""&&itemType!=undefined){
            if(itemType==3){
                var itemType2 = $("#twoType").val();
                var itemSelectNum = "threeType";
                getItemListByPid(itemType2,itemSelectNum);
            }
        }
    }

    //项目下拉框填充
    function getItemListByPid(id,itemSelectNum){
        var actions ="${basePath}/admin/frontmanage/getItemListByPid";
        $.ajax({
            type: "post",
            url: actions,
            data: {"parentid":id},
            dataType: "json",
            async:true,
            success: function(data){
                var code = data.meta.code;
                if(code=="88"){
                    var items = data.data;
                    var obj=document.getElementById(itemSelectNum);
                    obj.options.length=0;
                    obj.add(new Option("--请选择--",""));
                    jQuery.each(items, function(i,item){
                        var id = item.id;
                        var name = item.itemname;
                        obj.add(new Option(name,id));
                    });
                }else{
                    var obj=document.getElementById(itemSelectNum);
                    obj.options.length=0;
                    obj.add(new Option("--请选择--",""));
                }
            },
            error: function (data) {
                alert("系统异常，请稍候再试或联系客服");
            }
        });
    }

    //切换项目类型
    function selectItemType(){
        var itemType = $("#itemtype").val();
        if(itemType==1){
            var obj=document.getElementById("firstType");
            obj.options.length=0;
            obj.add(new Option("--请选择--",""));
            selectItemByType(1);
            document.getElementById("selectOneDiv").style.display="block";
            document.getElementById("selectTwoDiv").style.display="none";
            document.getElementById("selectThreeDiv").style.display="none";
        }
        if(itemType==2){
            var obj=document.getElementById("firstType");
            obj.options.length=0;
            obj.add(new Option("--请选择--",""));
            var obj2=document.getElementById("twoType");
            obj2.options.length=0;
            obj2.add(new Option("--请选择--",""));
            var obj3=document.getElementById("threeType");
            obj3.options.length=0;
            obj3.add(new Option("--请选择--",""));
            selectItemByType(1);
            document.getElementById("selectOneDiv").style.display="block";
            document.getElementById("selectTwoDiv").style.display="block";
            document.getElementById("selectThreeDiv").style.display="none";
        }
        if(itemType==3){
            var obj3=document.getElementById("threeType");
            obj3.options.length=0;
            obj3.add(new Option("--请选择--",""));
            var obj2=document.getElementById("twoType");
            obj2.options.length=0;
            obj2.add(new Option("--请选择--",""));
            var obj1=document.getElementById("firstType");
            obj1.options.length=0;
            obj1.add(new Option("--请选择--",""));
            selectItemByType(1);
            document.getElementById("selectOneDiv").style.display="block";
            document.getElementById("selectTwoDiv").style.display="block";
            document.getElementById("selectThreeDiv").style.display="block";
        }
    }

    //获取单个项目级别菜单
    function selectItemByType(itemtype){
        var actions ="${basePath}/admin/frontmanage/getOneItemList";
        var selectd = "";
        if(itemtype!=null&&itemtype!=""&&itemtype!=undefined){
            if(itemtype==1){
                selectd = "firstType";
            }else{
                alert("参数异常，请刷新重试")
                return false;
            }
        }
        $.ajax({
            type: "post",
            url: actions,
            data: {"itemtype":itemtype},
            dataType: "json",
            async:true,
            success: function(data){
                var code = data.meta.code;
                if(code=="88"){
                    var items = data.data;
                    var obj=document.getElementById(selectd);
                    obj.options.length=0;
                    obj.add(new Option("--请选择--",""));
                    jQuery.each(items, function(i,item){
                        var id = item.id;
                        var name = item.itemname;
                        obj.add(new Option(name,id));
                    });
                }else{
                    var obj=document.getElementById(selectd);
                    obj.options.length=0;
                }
            },
            error: function (data) {
                alert("系统异常，请稍候再试或联系客服");
            }
        });
    }

    //获取多个项目级别菜单
    function selectItemByTypeList(itemtype,tid){
        var actions ="${basePath}/admin/frontmanage/getOneItemList";
        var selectd = "";
        if(itemtype!=null&&itemtype!=""&&itemtype!=undefined){
            if(itemtype==1){
                selectd = "firstType";
            }else if(itemtype==2){
                selectd = "twoType";
            }else if(itemtype==3){
                selectd = "threeType";
            }else{
                alert("参数异常，请刷新重试")
                return false;
            }
        }
        $.ajax({
            type: "post",
            url: actions,
            data: {"itemtype":itemtype},
            dataType: "json",
            async:true,
            success: function(data){
                var code = data.meta.code;
                if(code=="88"){
                    var items = data.data;
                    var obj=document.getElementById(selectd);
                    obj.options.length=0;
                    obj.add(new Option("--请选择--",""));
                    jQuery.each(items, function(i,item){
                        var id = item.id;
                        var name = item.itemname;
                        if(id==tid){
                            obj.add(new Option(name,id,true,true));
                        }else{
                            obj.add(new Option(name,id));
                        }
                    });
                }else{
                    var obj=document.getElementById(selectd);
                    obj.options.length=0;
                }
            },
            error: function (data) {
                alert("系统异常，请稍候再试或联系客服");
            }
        });
    }

    $(function(){
        var E = window.wangEditor
        var editor3 = new E("#editorMenus", "#wangEditors")
        editor3.customConfig.uploadImgMaxLength = 1
        editor3.customConfig.uploadImgMaxSize = 2 * 1024 * 1024
        editor3.customConfig.uploadFileName = 'upfile'
        editor3.customConfig.customUploadImg = function (files, insert) {
            // files 是 input 中选中的文件列表
            // insert 是获取图片 url 后，插入到编辑器的方法
            uploadImage(files, insert)
            // 上传代码返回结果之后，将图片插入到编辑器中
        }
        editor3.create();

        var wdbmessage = $("#content").val();
        editor3.txt.html(wdbmessage)

        //项目类型
        var itemType = ${data.itemtype};
        $("#itemtype").val(itemType);
        if(itemType==0){
            var obj=document.getElementById("firstType");
            obj.options.length=0;
            obj.add(new Option("--请选择--",""));
            var obj2=document.getElementById("twoType");
            obj2.options.length=0;
            obj2.add(new Option("--请选择--",""));
            var obj3=document.getElementById("threeType");
            obj3.options.length=0;
            obj3.add(new Option("--请选择--",""));
            document.getElementById("selectOneDiv").style.display="none";
            document.getElementById("selectTwoDiv").style.display="none";
            document.getElementById("selectThreeDiv").style.display="none";
        }
        if(itemType==1){
            var three = $("#putthreeid").val();//最外层项目级别---一级项目id
            var obj=document.getElementById("firstType");
            obj.options.length=0;
            obj.add(new Option("--请选择--",""));
            selectItemByTypeList(1,three);
            document.getElementById("selectOneDiv").style.display="block";
            document.getElementById("selectTwoDiv").style.display="none";
            document.getElementById("selectThreeDiv").style.display="none";
        }
        if(itemType==2){
            var three = $("#putthreeid").val();//最外层项目级别---一级项目id
            var two = $("#puttwoid").val();//二级项目id
            var obj=document.getElementById("firstType");
            obj.options.length=0;
            obj.add(new Option("--请选择--",""));
            var obj2=document.getElementById("twoType");
            obj2.options.length=0;
            obj2.add(new Option("--请选择--",""));
            var obj3=document.getElementById("threeType");
            obj3.options.length=0;
            obj3.add(new Option("--请选择--",""));
            selectItemByTypeList(1,two);
            selectItemByTypeList(2,three);
            document.getElementById("selectOneDiv").style.display="block";
            document.getElementById("selectTwoDiv").style.display="block";
            document.getElementById("selectThreeDiv").style.display="none";
        }
        if(itemType==3){
            var three = $("#putthreeid").val();//最外层项目级别---一级项目id
            var two = $("#puttwoid").val();//二级项目id
            var one = $("#putoneid").val();//三级项目id
            var obj3=document.getElementById("threeType");
            obj3.options.length=0;
            obj3.add(new Option("--请选择--",""));
            var obj2=document.getElementById("twoType");
            obj2.options.length=0;
            obj2.add(new Option("--请选择--",""));
            var obj1=document.getElementById("firstType");
            obj1.options.length=0;
            obj1.add(new Option("--请选择--",""));
            selectItemByTypeList(1,one);
            selectItemByTypeList(2,two);
            selectItemByTypeList(3,three);
            document.getElementById("selectOneDiv").style.display="block";
            document.getElementById("selectTwoDiv").style.display="block";
            document.getElementById("selectThreeDiv").style.display="block";
        }

        //图片上传
        function uploadImage(files,insert){
            //var img = $(".post_img .pic")[0].src;
            var uid = $("#wdbuid").val();
            var formFile = new FormData();
            formFile.append("upfile", files[0]); //加入文件对象
            formFile.append("uid", uid); //加入文件对象

            var action = basePath+"/uploadCarouselImage";
            $.ajax({
                url: action,
                data: formFile,
                type: "Post",
                cache: false,//上传文件无需缓存
                processData: false,//// 告诉jQuery不要去处理发送的数据
                contentType: false, //告诉jQuery不要去设置Content-Type请求头
                success: function (data) {
                    if(data.state == "SUCCESS"){
                        insert(data.url);
                    }else{
                        alert(data.meta.message);
                    }
                }
            })
        }
        function update(){}
        //更新内容信息
        $("#btn-update").on("click",function(){
            var itemType = $("#itemtype").val();
            if(itemType==1){
                 var tid = $("#firstType").val();
                 if(tid!=null&&tid!=""&&tid!=undefined){
                     $("#itemid").val(tid);
                 }else{
                     alert("一级项目项目未选定")
                     return false;
                 }
            }else if(itemType==2){
                var tid = $("#firstType").val();
                if(tid!=null&&tid!=""&&tid!=undefined){
                    $("#itemid").val(tid);
                }else{
                    alert("一级项目项目未选定")
                    return false;
                }
                var tid2 = $("#twoType").val();
                if(tid2!=null&&tid2!=""&&tid2!=undefined){
                    $("#itemid").val(tid2);
                }else{
                    alert("二级项目项目未选定")
                    return false;
                }
            }else if(itemType==3){
                var tid = $("#firstType").val();
                if(tid!=null&&tid!=""&&tid!=undefined){
                    $("#itemid").val(tid);
                }else{
                    alert("一级项目项目未选定")
                    return false;
                }
                var tid2 = $("#twoType").val();
                if(tid2!=null&&tid2!=""&&tid2!=undefined){
                    $("#itemid").val(tid2);
                }else{
                    alert("二级项目项目未选定")
                    return false;
                }
                var tid3 = $("#threeType").val();
                if(tid3!=null&&tid3!=""&&tid3!=undefined){
                    $("#itemid").val(tid3);
                }else{
                    alert("二级项目项目未选定")
                    return false;
                }
            }


            var message = editor3.txt.html();
            if(message!=null&&message!=""&&message!=undefined){
                $("#content").val(message);
            }else{
                $("#content").val("");
            }
            var maintitles = $("#maintitless").val();
            if(maintitles!=null&&maintitles!=""&&maintitles!=undefined){
                maintitles = maintitles.replace(/(^\s*)|(\s*$)/g, "")
                if(maintitles==null||maintitles==""){
                    alert("主标题不能为空");
                    return false;
                }
            }else{
                alert("主标题不能为空");
                return false;
            }
            var json = $("#updateFrontForm").serialize();
            var action ="${pageContext.request.contextPath}/admin/frontmanagecontent/updateFMCById";
            $.ajax({
                type: "post",
                url: action,
                data: json,
                dataType: "json",
                async: true,
                success: function(data){
                    if (data.meta.code == 88) {
                        alert(data.meta.message)
                        window.location.reload();
                    } else {
                        alert(data.meta.message)
                    }
                },
                error: function (data) {
                    alert("程序异常，请稍候刷新重试!")
                }
            });
        });
    })
</script>
</body>
</html>