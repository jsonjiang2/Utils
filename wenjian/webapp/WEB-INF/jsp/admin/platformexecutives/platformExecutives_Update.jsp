<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

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
    </style>


</head>
<body  style="font-family:'微软雅黑'; ">

<script type="text/javascript">
</script>

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form" id="platformExecutives_updateForm">
        <c:if test="${empty platformExecutives}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty platformExecutives}">
            <input type="hidden" name="id" value="${platformExecutives.id}"/>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="name">高管姓名</label>
                <div class="col-sm-3">
                    <input type="text" name="name" id="name" value="${platformExecutives.name}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="name">高管职位</label>
                <div class="col-sm-3">
                    <input type="text" name="position" id="position" value="${platformExecutives.position}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pic">高管头像</label>
                <div class="col-sm-3">
                    <input name="pic" id="pic" value="${platformExecutives.pic}"
                           class="form-control" type="text" readonly="readonly">
                    <input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload1(this)">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="brief">个人简历</label>
                <div class="col-sm-3">
                    <textarea rows="6" class="form-control" name="brief" id="brief">${platformExecutives.brief}</textarea>
                </div>
            </div>
        </c:if>
    </form>


    <script type="text/javascript">

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
                        $("#pic").val(data.url_group);
                    }else{
                        alert(data.message);
                    }
                }
            });
        }

    </script>


</div>

</body>
</html>
