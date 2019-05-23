<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>

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

<%@include file="/WEB-INF/jsp/common/public.jsp"%>

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
            $("#select-valid-text").val("${adImage.reviewStatus }");
            $("#uid").val("${adImage.uid }");
        })
    </script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="GET" class="form-inline" id="form-select-history"
				action="adImageHistory">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
                <br/>
				<c:if test="${idImage.uid==null or idImage.uid==''}">
					<div class="form-group">
						广告主：<input class="form-control" type="text" id="select-name-text"
								   name="userName" style="text-align: center; line-height: 18px;width:220px;"
								   value="" placeholder="广告使用者">
					</div>
				</c:if>
				<c:if test="${idImage.uid!=null or idImage.uid!=''}">
					<c:if test="${idImage.usermark==1}">
						<wdb:getAdminUser uid="${idImage.uid}" var="imagehistoryAdminUser">
							<div class="form-group">
								广告主：<input class="form-control" type="text" id="select-name-text"
										   name="userName" style="text-align: center; line-height: 18px;width:220px;"
										   value="${imagehistoryAdminUser.username}" placeholder="广告使用者">
							</div>
						</wdb:getAdminUser>
					</c:if>
					<c:if test="${idImage.usermark==2}">
						<wdb:getUser uid="${idImage.uid}" var="imagehistoryUser">
							<div class="form-group">
								广告主：<input class="form-control" type="text" id="select-name-text"
										   name="userName" style="text-align: center; line-height: 18px;width:220px;"
										   value="${imagehistoryUser.username}" placeholder="广告使用者">
							</div>
						</wdb:getUser>
					</c:if>
				</c:if>
				&nbsp;&nbsp;
 				<div class="form-group">
                    广告展示端：
                    <select id="select-status-text" name="imageType" class="form-control">
                        <option value="">--请选择--</option>
                        <option value="1">PC端</option>
                        <option value="2">手机端</option>
  					</select>
                </div>
                &nbsp;&nbsp;
                <input type="hidden" id="uid" name="uid">
                <div class="form-group">
                    广告图状态：
                    <select id="select-valid-text" name="reviewStatus" class="form-control">
                        <option value="">--请选择--</option>
                        <option value="1">待审核</option>
                        <option value="2">已合格</option>
                        <option value="3">不合格</option>
                        <option value="4">已下架</option>
                    </select>
                </div>

				<div class="form-group">
                    <div class="searchDiv">
					    <button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
					    <button type="button" class="btn btn-default" onclick="clearForm()" style="width: 100px;">重置</button>
                    </div>    
				</div>
			</form>
            <%--<input type="checkbox" name="allPass" id = "allSelect" onclick="ad.allSelect('xiajia')" title="全选" />&nbsp;全选--%>
			<jsp:include page="/WEB-INF/jsp/admin/adimage/adImageHistoryListTemp.jsp"></jsp:include>
		</div>
	</div>

	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
<script>
    function clearForm() {
        $("#select-status-text").val("");
        $("#select-valid-text").val("");
        $("#uid").val("");
        document.getElementById("select-name-text").value="";
    }
</script>
</body>
</html>