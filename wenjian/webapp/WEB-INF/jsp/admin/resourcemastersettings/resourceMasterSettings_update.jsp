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
	.shanchu{
		padding-left: 20px;border: 1px #FF7676 solid;color: #FFFFFF;cursor: pointer;background: #FF7676
	}
</style>
<script type="text/javascript">
//来到这页面的时候查看资源主限制
$(function(){
	var resourcesastrict = $("#resourcesastrict").val();
	if(resourcesastrict==0){
		$("#tianjia").css('display','none');
		$("#neirong").css('display','none');
	}else{
		$("#tianjia").css('display','block');
		$("#neirong").css('display','block');
	}
});

//选择资源主限制的时候
function resourcesastrict_onblur(){
	var resourcesastrict = $("#resourcesastrict").val();
	if(resourcesastrict==0){
		$("#tianjia").css('display','none');
		$("#neirong").css('display','none');
	}else{
		$("#tianjia").css('display','block');
		$("#neirong").css('display','block');
	}
}

//用户添加按钮
function userAdd(){
	var username = $("#salesmanshare").val();
	if(username==""){
		alert("请输入资源主用户名");
		return ;
	}
	var action  = "${pageContext.request.contextPath}/admin/resourceMasterSettings/selectRelname";
	var params ={
			"username":username
	}
	var arrayObj = new Array();
	 $("#neirong input[type='hidden']").each(function(){ //把内容下所有的input中的值全部放进数组
		    arrayObj.push($(this).val());
	 });
	$.post(action,params,function(data){
		if(data.code=="00"){
			alert(data.message);
		}
		if(data.code=="88"){
			var username = data.data.username;
			var realname = data.data.realname;
			var username_realname = username+"-"+realname;
			var uid = data.data.uid;
			for (var i = 0;  i< arrayObj.length; i++) {
				if(uid==arrayObj[i]){
					alert("该用户名:"+username_realname+"已存在");
					return;
				}
			}
			add(username_realname,uid);
			$("#salesmanshare").val(""); //清空添加输入框的值
		}
	});
	
}


//动态添加资源主
function add(username_realname,uid){
	var $div = $("#neirong");
	var html = "<div class='form-group'>"+
		"<label class='col-sm-2 control-label laber_from' for='salesmanshare'></label>"+
		"<div class='col-sm-2' style='font-size: 15px'>"+
			"<div style='margin-left: 15px;margin-top: 8px'>"+username_realname+
				"<input type='hidden' name='uids' value='"+uid+"'/>"+
			"</div>"+
		"</div>"+
		"<div class='col-sm-1'>"+
			"<div type='button' class='form-control shanchu' onclick='removeItSelf(this)'>删除</div>"+
		"</div>"+
	"</div>";
	$div.append(html);
}
//动态删除资源主
function removeItSelf(t){
	 $(t).parent().parent().remove();
}

</script>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
			<form class="form-horizontal" role="form"  id="resourceMasterSettings_updateForm">
			<c:if test="${empty resourceMasterSettings}">
			    <label>暂无数据</label>
			</c:if>
			<c:if test="${!empty resourceMasterSettings}">
			<input type="hidden" name="id" value="${resourceMasterSettings.id}"/>
				
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="merchants">商户号</label>
					<div class="col-sm-3">
						<input type="hidden" name="merchants" id="merchants" value="${resourceMasterSettings.merchants}" class="form-control" disabled="disabled"/>
						<div style="margin-top: 4px;height: 30px;font-size: 15px">${resourceMasterSettings.merchants}</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="merchanturl">商户网址</label>
					<div class="col-sm-3">
						<input type="hidden" name="merchanturl" id="merchanturl" class="form-control" value="${resourceMasterSettings.merchanturl}"/>
						<div style="margin-top: 2px;height: 30px;font-size: 15px">${resourceMasterSettings.merchanturl}</div>
					</div>
				</div>
				
				
				
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="resourcesastrict">资源主限制</label>
					<div class="col-sm-2">
						<select name="resourcesastrict" id="resourcesastrict" class="form-control" onchange="resourcesastrict_onblur();">
							<option value="0" <c:if test="${resourceMasterSettings.resourcesastrict eq '0'}">selected="selected"</c:if>>禁止查看</option>
							<option value="1" <c:if test="${resourceMasterSettings.resourcesastrict eq '1'}">selected="selected"</c:if>>不限制</option>
							<option value="2" <c:if test="${resourceMasterSettings.resourcesastrict eq '2'}">selected="selected"</c:if>>定向限制</option>
						</select> 
					</div>
				</div>
				
				<div class="form-group" id="tianjia">
					<label class="col-sm-2 control-label laber_from" for="salesmanshare">资源主添加</label>
					<div class="col-sm-2">
						<input type="text"  id="salesmanshare"  class="form-control" value=""/>
					</div>
					<div class="col-sm-1">
						<div type="button" class="form-control" style="padding-left: 20px;border: 1px #4584FF solid;color: #4584FF;cursor: pointer;" onclick="userAdd();">添加</div>
					</div>
				</div>
				
				
				<div id="neirong">
					<c:if test="${!empty resourceMasterSettings.lists}">
						<c:forEach items="${resourceMasterSettings.lists}" var="entity" varStatus="status">
							<div class="form-group">
								<label class="col-sm-2 control-label laber_from" for="salesmanshare"></label>
								<div class="col-sm-2" style="font-size: 15px">
									<div style="margin-left: 15px;margin-top: 8px">${entity.resourcesusername}-${entity.resourcesrealname}
										<input type="hidden" name="uids" value="${entity.resourcesuid}"/>
									</div>
								</div>
								<div class="col-sm-1">
									<div type="button" class="form-control shanchu" onclick="removeItSelf(this)">删除</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				<div>
				
				</c:if>
			</form>
		</div>
								
</body>
</html>
