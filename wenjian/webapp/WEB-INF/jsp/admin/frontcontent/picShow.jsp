<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>图片详情</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
    </style>

</head>

<body>

<center>
    <h1>标题：${frontContent.thumbnailTitle}</h1>
    </br>
    <h1>链接：${frontContent.thumbnailAddress}</h1>
    </br>
    <img src="<%=basePath%>/frontContent/image/${frontContent.thumbnailPic}" style="max-width: 500px"/>
</center>
</body>
</html>

