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
            $("#select-sendUser-text").val("${sendName}");
            $("#select-resevUser-text").val("${recevName}");
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
			<form method="GET" class="form-inline" id="getFrontContentListAdmin"
				action="getFrontContentListAdmin">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
                <br/>
                &nbsp;&nbsp;
				<div class="form-group">
					发送者用户名：<input class="form-control" type="text" id="select-sendUser-text"
						name="sendName" style="text-align: center; line-height: 18px;width:220px;">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					接收者用户名：<input class="form-control" type="text" id="select-resevUser-text"
								  name="recevName" style="text-align: center; line-height: 18px;width:220px;">
				</div>
                &nbsp;&nbsp;
				<div class="form-group">
                    <div class="searchDiv">
					    <button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
					    <button type="reset" class="btn btn-default"  style="width: 100px;">重置</button>
                    </div>
				</div>
			</form>
			<jsp:include page="/WEB-INF/jsp/admin/userchat/chatHistoryListTemp.jsp"></jsp:include>
		</div>
	</div>
    <!-- 查看内容模态框 -->
    <div class="modal fade" id="detailsModal2" tabindex="-1" role="dialog"
         aria-labelledby="detailsModalLabel">
        <div id="detail-modal2" class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="detailsModalLabel2">
                        <span class="glyphicon glyphicon-info-sign"></span>提示：正在进行查看详情操作
                    </h4>
                </div>
                <div id="detail-modal-body2" class="modal-body"></div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" onclick="clearContent()" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>