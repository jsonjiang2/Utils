<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>平台图片添加页面</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>
    <style>
        .text-center td {
            text-align: center;
            vertical-align: middle !important;
            border: 1px solid #666;
        }

        .myCheck{
            background-color: white;
            border-radius: 5px;
            border:1px solid #d3d3d3;
            width:16px;
            height:16px;
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            line-height: 16px;
        }

        .myCheck:checked{
            background-color: #eee;
        }

    </style>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
    <form id="inputForm" class="form-horizontal" >

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pid">平台ID</label>
            <div class="col-sm-3">
                <input type="text" name="pid" id="pid" class="form-control" readonly="readonly"/>
            </div>   <%--用来显示提示信息--%>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
            <div class="col-sm-3">
                <input type="text" name="pname" id="pname" onblur="findPname()" class="form-control" />
                <span id="errorPname" style="color:red;font-weight:bold;"></span>  
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="picpath">平台图片：</label>
            <div class="col-sm-3">
                <input name="picpath" id="picpath"
                       class="form-control" type="text" readonly="readonly">
                <input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload1(this)">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pictype">图片类型</label>
            <div class="col-sm-3">
                <select name="pictype" id="pictype" class="form-control">
                    <option value="1">现场办公</option>
                    <option value="2">公司证件</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="picname">图片名称</label>
            <div class="col-sm-3">
                <input type="text" name="picname" id="picname" class="form-control" />
            </div>
        </div>

        <button id="insertButton" onclick="return checkForm()" class="btn btn-default" type="button"
                style="margin-top: 20px;margin-left:200px;">保存
        </button>
        <button class="btn btn-default" type="button"
                onclick="window.location.href='${pageContext.request.contextPath}/admin/platformInfoPicture/cxList';"
                style="margin-top: 20px;margin-left:100px;">返回
        </button>
    </form>
    <div class="col-md-3"></div>
</div>
</body>

<script type="text/javascript">

    $("#insertButton").click(function(){
        var pname = $("#pname").val();
        if (isEmpty(pname)){
            alert("请输入平台名称！");
            return;
        }
        var picpath = $("#picpath").val();
        if (isEmpty(picpath)){
            alert("请上传平台图片！");
            return;
        }
        var action="/admin/platformInfoPicture/save";
        $.post(action,$("#inputForm").serialize(),function(data){
            alert(data.meta.message);
            window.location.href="${pageContext.request.contextPath}/admin/platformInfoPicture/cxList";
        });
    });

    // 判断平台名称是否存在
    function findPname() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/platformBackground/findPname",
            data: {
                pname: function () {
                    return $("#pname").val();
                }
            },
            success: function (data) {
                document.getElementById('errorPname').innerHTML="";
                if (data == "null"){
                    document.getElementById('errorPname').innerHTML="平台名称不能为空";
                }else if(data == "notExist"){
                    document.getElementById('errorPname').innerHTML="平台名称不存在";
                    $("#insertButton").attr({"disabled":"disabled"});
                }else{
                    document.getElementById('errorPname').innerHTML="";
                    $("#pid").val(data);  // 如果平台名称已输入且存在，将其对应的平台编号自动显示
                    $("#insertButton").attr({"disabled":false});
                }
            }
        })
    }



    //文件上传
    // logo1
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
                    $("#picpath").val(data.url_group);
                }else{
                    alert(data.message);
                }
            },
        });
    }

</script>


</html>