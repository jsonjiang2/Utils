<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>新闻公告内容查看页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/ueditor/ueditor.all.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
    <textarea name="content" id="editor">${frontContent.content}</textarea>
    <button id="query_btn" class="btn btn-default" type="button" onclick="window.location.href='${pageContext.request.contextPath}/admin/frontContent/list';" style="margin-top: 20px;margin-left:500px;" >返回</button>
</div>

<script type="text/javascript">
    //实例化编辑器
    var ue = UE.getEditor('editor');

</script>
</body>
</html>