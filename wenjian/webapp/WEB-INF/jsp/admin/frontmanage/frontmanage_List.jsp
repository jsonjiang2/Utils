<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>

<title>前端项目管理</title>
    <script type="text/javascript">
        $(function(){
            $("#select-adOwnUserName-text").val("${adSlotSetting.itemname}");
        })
    </script>
</head>
<style>
	.text-center td {
		text-align: center;
		vertical-align: middle !important;
		border: 1px solid #666;
	}
</style>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="GET" class="form-inline" id="form-frontmanage-history"
				action="getFrontmanageList">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
                <br/>
                &nbsp;&nbsp;
				<div class="form-group">
					前端项目名称：<input class="form-control" type="text" id="select-adOwnUserName-text"
						name="itemname" style="text-align: center; line-height: 18px;width:220px;"
						placeholder="前端项目名称">
				</div>
                &nbsp;&nbsp;
				<div class="form-group">
                    <div class="searchDiv">
					    <button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
					    <button type="reset" class="btn btn-default"  style="width: 100px;">重置</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-default" data-backdrop="static" data-toggle="modal" type="button"
                                data-dismiss="modal" data-target="#insertModal"
                                onclick="addFrontmanage()">新增
                        </button>
                    </div>
					<script>
                        function addFrontmanage() {
                           $.post(basePath+"/admin/frontmanage/addFrontmanage", function(data){
                                $("#insert-modal-body").html(data);
                            });
                        }
					</script>
				</div>
			</form>
			<jsp:include page="/WEB-INF/jsp/admin/frontmanage/frontmanageListTemp.jsp"></jsp:include>
		</div>
	</div>
	<!-- 设置模态框  -->
	<div class="modal fade" id="insertModal" tabindex="-1" role="dialog"
		 aria-labelledby="addModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" style="text-align: center" id="addModalLabel">
						<span class="glyphicon glyphicon-info-sign"></span>提示：正在进行设置操作
					</h4>
				</div>
				<div id="insert-modal-body" class="modal-body"></div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" id="btn-insert" class="btn btn-primary"
							onclick="insert()">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>