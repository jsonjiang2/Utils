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

<div class="container"  style="margin-top: 25px;">
			<form class="form-horizontal" role="form"  id="type_insertFrom">
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="certtype">商务合作类型</label>
					<div class="col-sm-3">
						<select name="type" id="type" class="form-control">
							<option value="1">广告合作 </option>
							<option value="2">平台收录</option>
							<option value="3">巴士名人堂</option>
							<option value="4">钱多多回血</option>
							<option value="5">友情链接</option>
							<option value="6">其他合作</option>
						</select> 
					</div>
				</div>
				<div class="form-group">
					<label for="remark" class="col-sm-2 control-label laber_from">类型备注</label>
					<div class="col-sm-3">
						  <textarea rows="3" class="form-control" name="brief"></textarea>
					</div>
				</div>
			</form>
		</div>
								
</body>
</html>
