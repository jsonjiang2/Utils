<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户绑定修改</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/bootstrap.min.css" />
<script type="text/javascript" src="${basePath}/static/js/bootstrap.min.js"></script>
 <style type="text/css">
	.container {
	    width: 1200px;
	    margin: 0 auto;
	    padding:0;
	}
	
	a:hover{
		text-decoration: none;
	}
	.form-control {
 	    text-indent: 0px;
	}
	
	h5{
		padding:0;
		margin:0;
		line-height: 46px;
	}
	
	h3{
		padding:0;
		margin:0;
 	}
	body{
		background: rgb(241, 245, 248);
	}
	.colorpicker {
		z-index: 1050;
	}
</style>
 
 </head>
<body>
<div class="container">
    <form class="form-horizontal" role="form" id="threadUpdateForm">
        
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="presubject">普通用户名：</label>
            <div class="col-sm-3">
                     <input type="text" name="presubject" id="presubject" class="form-control" />
             </div>
        </div>
      
         <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="presubject">管理员用户名：</label>
            <div class="col-sm-3">
                     <input type="text" name="presubject" id="presubject" class="form-control"/>
             </div>
        </div>
        
    </form>
</div>
</body>
</html>