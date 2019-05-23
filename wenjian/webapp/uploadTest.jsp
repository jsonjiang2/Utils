a<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/7/17 0017
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="form" method="post" enctype="multipart/form-data"
      action="/admin/adImage/uploadImage">
    <div class="form-group" style="margin-top:15px; " id="picShow">
        <label class="col-sm-2 control-label">图片1</label>
        <input type="file" id="imageFile" name="imageFile"/>
    </div>
    <button class="btn btn-default" type="submit"
            style="margin-top: 20px;margin-left:200px;">保存
    </button>
</form>


</body>
</html>
