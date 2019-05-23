<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=basePath%>/static/plugin/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=basePath%>/static/plugin/jquery/1.11.3/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>/static/plugin/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/static/plugin/bootstrap/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script src="<%=basePath%>/static/js/util.js"></script>
<script src="<%=basePath%>/static/js/validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/common.js"></script>
<script type="text/javascript" src="${basePath}/static/js/admin/adImage/adImage.js"></script>
<script type="text/javascript" src="${basePath}/static/js/admin/advertising/advertising.js"></script>

<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<!-- 引入模态框 -->
<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
    <script type="text/javascript" src="${basePath}/static/js/admin/adImage/adImage.js"></script>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}
.searchDiv{
    position:relative;
    left:40%;
    top: 10%;
}
</style>

<title>广告版块</title>
    <script type="text/javascript">
        $(function(){
            $("#select-valid-text").val("${param.isValid}");
            $("#select-moduleName-text").val("${param.moduleName }");
            $("#select-title-text").val("${param.title }");
            $("#uid").val("${param.uid }");
            $("#adHostUid").val("${param.adHostUid }");
        })
    </script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="GET" class="form-inline" id="form-select-history"
				action="lists">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
                <br/>
                <div class="form-group">
                    标题：<input class="form-control" type="text" id="select-title-text"
                               name="title" style="text-align: center; line-height: 18px;width:220px;"
                               placeholder="帖子名称" onclick="ad.search('title','lists')">
                </div>
                &nbsp;&nbsp;
                <wdb:getUser uid="${param.uid}" var="userAd">
                    <div class="form-group">
                        广告位${param.uid}：<input class="form-control" type="text" id="select-adOwnUserName-text"
                                   name="adOwnUserName" style="text-align: center; line-height: 18px;width:220px;"
                                   value="${userAd.username}" placeholder="广告位拥有者">
                    </div>
                </wdb:getUser>

                &nbsp;&nbsp;
                <wdb:getUser uid="${param.adHostUid}" var="users1">
                    <div class="form-group">
                        广告主：<input class="form-control" type="text" id="select-adBuyUserName-text"
                                   name="adBuyUserName" style="text-align: center; line-height: 18px;width:220px;"
                                   value="${users1.username}" placeholder="广告位使用者">
                    </div>
                </wdb:getUser>

                <p>&nbsp;</p>
                <div class="form-group">
                    广告状态：
                    <select id="select-valid-text" name="isValid" class="form-control">
                        <option value="">--请选择--</option>
                        <option value="1">展示中</option>
                        <option value="2">已完成</option>
                        <option value="3">已暂停</option>
                        <option value="4">已下架</option>
                    </select>
                </div>
                &nbsp;&nbsp;
                <div class="form-group">
                    模块：
                    <select id="select-moduleName-text" name="moduleName" class="form-control">
                        <option value="">--请选择--</option>
                        <option value=1>首页</option>
                        <option value=2>资源主列表</option>
                        <option value=3>平台数据列表</option>
                        <option value=4>巴士茶馆</option>
                        <option value=5>网贷资讯</option>
                    </select>
                </div>
                <input type="hidden" name="uid" id="uid"/>
                <input type="hidden" name="adHostUid" id="adHostUid"/>
				<div class="form-group">
                    <div class="searchDiv">
					    <button class="btn btn-default" style="width: 100px;">查询</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
					    <button type="button" class="btn btn-default" onclick="clearForms()" style="width: 100px;">重置</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-default" data-backdrop="static"
                                data-toggle="modal" data-dismiss="modal"
                                data-target="#updateModal" type="button"
                                onclick="setAdShows('navigation')">广告图优先展示
                        </button>
                        <script>
                            function setAdShows(obj){
                                $.get(basePath+"/admin/Advertising/editAdShow",{"returnUrl":obj},function(data){
                                    $("#update-modal-body").html(data);
                                });
                            }
                            function LongToString(){
                                var title = document.getElementById("title").value;
                                alert(title)
                            }
                        </script>
                    </div>
				</div>
			</form>
			<jsp:include page="/WEB-INF/jsp/admin/advertising/advertisingListTemp.jsp"></jsp:include>
		</div>
	</div>
        <script>
            function clearForms(){
                $("#select-valid-text").val("");
                $("#select-moduleName-text").val("");
                $("#select-title-text").val("");
                $("#uid").val("");
                $("#adHostUid").val("");
                    document.getElementById("select-adOwnUserName-text").value="";
                    document.getElementById("select-adBuyUserName-text").value="";
                    document.getElementById("uid").value="";
                    document.getElementById("adHostUid").value="";
            }
        </script>
</body>
</html>