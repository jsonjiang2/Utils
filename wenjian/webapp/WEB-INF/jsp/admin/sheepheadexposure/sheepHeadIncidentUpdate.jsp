<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>黑羊头标题事件修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="p2p网贷,网贷资讯,互联网金融,互联网理财">
<meta name="description" content="网贷巴士努力为投资人提供最新最有价值最客观的p2p网贷资讯 ">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${basePath}/static/subjectrelease/dist/bootstrap.css">
	
<script src="${basePath}/static/subjectrelease/js/jquery.min.js"></script>
<script src="${basePath}/static/subjectrelease/js/bootstrap.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
	//标题长度控制
	function titleLengthContr(obj) {
		var val = $(obj).val();
		if (val.length >= 30) {
			$(obj).val(val.substring(0, 30));
		}
	}

	//发布
	function fabu() {
		var title = $('#title').val();
		var id = $('#id').val();
		var incident = $('#incident').val();

		var dataObj = {}
		dataObj.title=title;
		dataObj.id=id;
		dataObj.incident=incident;
 
		var action = basePath + "/admin/sheepHead/sheepHeadIncident"; 
		var callback = function(data) {
			alert(data.message);
			if (data.code == "88") {
				window.location.href = "sheepDelList";
			}
		}
		$.post(action, dataObj, callback); 
	}

</script>
</head>
<body>
 
 	<div class="bus">
 		 <div class="fatieye">
        	<div class="title">
           		<div class="center" style="margin-left: 500px;font-size: 18px;margin-top: 20px;position: absolute;">曝光</div>
           	    <a href="javascript:void(0)" class="btn btn-primary" onclick="fabu();" style="float: right;margin-top: 13px;margin-right: 50px;width: 80px;background-color:#0066ff">发布</a>
                <div class="clear"></div>
        	</div>
    	</div>
    </div>
    
    <hr style="margin-top: 65px;">
 
	<form id="updateIncident-form" class="form-horizontal">
		<div class="container" style="margin-left: 430px;"> 
			<div id="wdbmessage" style="display: none;">
				${sheepHeadExposure.baseid}</div>
			<div>
				<input type="text" id="baseid"
					value="${sheepHeadExposure.baseid}" style="display: none;" />
			</div>
			
			<div>
				<input type="text" name="id" id="id" value="${sheepHeadExposure.id}" style="display: none;" />
			</div>
			
			<br><br><br>

			<div class="post">
				<h2><input type="text" style="background-color: #f2f2f2;font-size: 25px;width: 815px;height: 50px;" name="title"
					id="title" value="${sheepHeadExposure.title}"
					placeholder="请输入标题（最多30个字）" onchange="titleLengthContr(this)" onkeydown="titleLengthContr(this)" onkeyup="titleLengthContr(this)" /></h2>
			</div>

			<div>
				<textarea id="incident" cols="129" rows="30" name="incident">${sheepHeadExposure.incident}</textarea>
			</div>
	
 			<br>
			<div class="fatieye">
				<div class="title"> 
					<a href="javascript:void(0)" class="btn btn-primary" style="width: 80px;background-color:#0066ff "
						id="wdbSubmit" onclick="fabu();">发布</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>