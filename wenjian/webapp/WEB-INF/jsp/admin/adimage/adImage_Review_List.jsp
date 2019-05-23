<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
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
<title>广告图版块</title>
    <script type="text/javascript">
        $(function(){
            $("#select-status-text").val("${adImage.imageType }");
            $("#uid").val("${adImage.uid }");
        })
    </script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="GET" class="form-inline" id="form-select"
				action="imageReviewList">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
                <br/>

				<div class="form-group">
                    <c:if test="${idImage.uid==null or idImage==''}">
                        <div class="form-group">
                            广告主：<input class="form-control" type="text" id="select-name-text"
                                       name="userName" style="text-align: center; line-height: 18px;width:220px;"
                                       value="" placeholder="广告使用者">
                        </div>
                    </c:if>
                    <c:if test="${idImage.uid!=null or idImage.uid!=''}">
                        <c:if test="${idImage.usermark==1}">
                            <wdb:getAdminUser uid="${idImage.uid}" var="reviewListAdminUser">
                                <div class="form-group">
                                    广告主：<input class="form-control" type="text" id="select-name-text"
                                               name="userName" style="text-align: center; line-height: 18px;width:220px;"
                                               value="${reviewListAdminUser.username}" placeholder="广告使用者">
                                </div>
                            </wdb:getAdminUser>
                        </c:if>
                        <c:if test="${idImage.usermark==2}">
                            <wdb:getUser uid="${idImage.uid}" var="reviewListUser">
                                <div class="form-group">
                                    广告主：<input class="form-control" type="text" id="select-name-text"
                                               name="userName" style="text-align: center; line-height: 18px;width:220px;"
                                               value="${reviewListUser.username}" placeholder="广告使用者">
                                </div>
                            </wdb:getUser>
                        </c:if>
                    </c:if>

				</div>
				&nbsp;&nbsp;
 				<div class="form-group">
					广告展示端：
					<select id="select-status-text" name="imageType" class="form-control">
                        <option value="">--请选择--</option>
                        <option value="1">PC端</option>
                        <option value="2">手机端</option>
                        <option value="3">H5</option>
  					</select>
				</div>
                <input type="hidden" name="uid" id="uid"/>
				<div class="form-group">
                    <div class="searchDiv">
					    <button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
					    <button type="button" class="btn btn-default" onclick="clearForm()" style="width: 100px;">重置</button>
                    </div>    
				</div>
			</form>
			<jsp:include page="/WEB-INF/jsp/admin/adimage/adImageViewListTemp.jsp"></jsp:include>
		</div>
	</div>

	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
<script>
    function clearForm(){
        $("#select-status-text").val("");
        $("#uid").val("");
        document.getElementById("select-name-text").value="";
        $("#userName").val("");
    }
</script>
</html>