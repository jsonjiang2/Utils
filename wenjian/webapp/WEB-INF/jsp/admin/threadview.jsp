<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>主题显示</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>
    <style type="text/css">
        .boxParent{width:100%}
    	.box{
    		width:80%;
    		margin:100px auto;
    	}
    </style>
 </head>
<body>
	<div class="boxParent">
	 	 <div class="box">
	 	 	 
	 	 	 <h1>
	 	 	 	主题标题：${vo.subject }<br><br><br>
	 	 	         浏览次数：${vo.views }<br><br><br>
	 	 	         回复次数：${vo.replies }<br><br><br>
  	 	 	     作者：${vo.author }<br><br><br>
	 	 	    
	 	 	 </h1><br><br><br>
	 	 	 <h2>帖子内容:<br><br><br>
	 	 	  </h2>	
	 	 	  <p>${vo.message }</p>
	 	 </div>   
 	</div>
</body>
</html>