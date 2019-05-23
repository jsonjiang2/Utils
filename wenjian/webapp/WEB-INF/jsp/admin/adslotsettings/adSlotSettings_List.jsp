<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
#fontId{
    font-size: 12px;
    font-style: normal;
    font-variant-ligatures: normal;
    font-variant-caps: normal;
    font-variant-numeric: normal;
    font-variant-east-asian: normal;
    font-weight: normal;
    font-stretch: normal;
    line-height: 24px;
    font-family: "Microsoft Yahei", "冬青黑体简体中文 w3", 宋体;
}
</style>
<title>广告版块</title>
    <script type="text/javascript">
        $(function(){
            $("#select-adOwnUserName-text").val("${adSlotSetting.adUserName}");
            $("#select-sort-text").val("${adSlotSetting.adsort }");
            $("#select-addaystatus-text").val("${adSlotSetting.addaystatus }");
            $("#select-adweekstatus-text").val("${adSlotSetting.adweekstatus }");
            $("#select-adyearstatus-text").val("${adSlotSetting.adyearstatus }");
        })
    </script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="GET" class="form-inline" id="form-select-history"
				action="getAdSlotListByUserId">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
                <br/>
                &nbsp;&nbsp;
				<div class="form-group">
					广告位：<input class="form-control" type="text" id="select-adOwnUserName-text"
						name="adUserName" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="广告位拥有者">
				</div>
                &nbsp;&nbsp;
                <div class="form-group">
                    属性：
                    <select id="select-sort-text" name="adsort" class="form-control">
                        <option value="">--请选择--</option>
						<option value="2">通用广告</option>
						<option value="1">特殊广告</option>
						<%--<option value="0">通用广告</option>
                        <option value="2">默认</option>--%>
                    </select>
                </div>
				&nbsp;&nbsp;
				<div class="form-group">
					按天设置：
					<select id="select-addaystatus-text" name="addaystatus" class="form-control">
						<option value="">--请选择--</option>
						<option value="0">关闭</option>
						<option value="1">开启</option>
					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					按周设置：
					<select id="select-adweekstatus-text" name="adweekstatus" class="form-control">
						<option value="">--请选择--</option>
						<option value="0">关闭</option>
						<option value="1">开启</option>
					</select>
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					按年设置：
					<select id="select-adyearstatus-text" name="adyearstatus" class="form-control">
						<option value="">--请选择--</option>
						<option value="0">关闭</option>
						<option value="1">开启</option>
					</select>
				</div>
				<div class="form-group">
                    <div class="searchDiv">
					    <button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
					    <button type="reset" class="btn btn-default"  style="width: 100px;">重置</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-default" data-backdrop="static" data-toggle="modal" type="button"
                                data-dismiss="modal" data-target="#insertModal"
                                onclick="addAdSlotAndPoses()">新增
                        </button>
                    </div>
					<script>
                        function addAdSlotAndPoses() {
                           $.post(basePath+"/admin/adSlotSettings/addAdSlotAndPose/", function(data){
                                $("#insert-modal-body").html(data);
                            });
                        }
					</script>
				</div>
			</form>
			<jsp:include page="/WEB-INF/jsp/admin/adslotsettings/adSlotSettingsListTemp.jsp"></jsp:include>
		</div>
	</div>

	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>