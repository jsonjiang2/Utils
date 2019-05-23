<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ganjiangps.wangdaibus.common.util.DateUtils"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<style>
.text-center td {
	text-align: center;
	vertical-align: middle !important;
	border: 1px solid #666;
}

.myCheck {
	background-color: white;
	border-radius: 5px;
	border: 1px solid #d3d3d3;
	width: 16px;
	height: 16px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	line-height: 16px;
}

.myCheck:checked {
	background-color: #eee;
}
</style>
<title>爆雷热门设置列表</title>
<script type="text/javascript">
	
	function queryAllPerson(pageNum, pageSize) {
        $("#pageNum").val(pageNum);
        $("#pageSize").val(pageSize);
        $("#form-select").submit();
    }

	//设为热门维权
	function setHot(obj) {
		var opid = $(obj).data("opid");
		var ishot = $(obj).data("ishot");	
		var url = basePath + "/admin/explodeRay/setHot";
		var callback = function(data) {
			alert(data.message);
			if (data.code == "88") {
				/*  window.location.href = basePath + "/admin/explodeRay/hotSetList"; */											
				queryAllPerson('${pagehelper.pageNum}', '${pagehelper.pageSize}');
			}
		}
		$.post(url, {
			"id" : opid,
			"ishot" : ishot
		}, callback);
	}
	
	function detail1(opid){
		var action = basePath+"/admin/explodeRay/detail/"+opid;
		var callback = function(data){
			 $("#detailsModal").modal({
				 show:true
			  });
			 $("#detail-modal-body").html(data);
		}
		$.post(action,{},callback);
	}
</script>
</head>
<body>
	<div class="container" style="width: 85%;">
		<div class="row clearfix">
			<div style="margin-bottom: 10px;"></div>
			<form method="post" class="form-inline" id="form-select"
				action="hotSetList">
				<input type="hidden" id="pageNum" name="pageNum"> 
				<input type="hidden" id="pageSize" name="pageSize">
				<div class="form-group">
					平台名称：<input class="form-control" type="text"
						id="select-pname-text" name="pname"
						style="text-align: center; line-height: 18px;"
						placeholder="平台名称">
				</div>
				&nbsp;&nbsp;
				<div class="form-group">
					维权进展：<select id="select-progress" name="progress" class="form-control" >
						<option value="">--请选择--</option>
						<option value=1>未立案</option>
						<option value=2>已立案</option>
						<option value=3>已结案</option>
						<option value=4>已清退</option>
					</select>
				</div>
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" type="button" onclick="queryAllPerson(1,20)">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>			
				
			</form>
			<div style="margin-top: 20px;"></div>
			<table class="table table-hover">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>						
						<td>平台名称</td>
						<td>维权时间</td>
						<td>维权qq群</td>
						<td>维权进展</td>
						<td>最新公告</td>		
						<td>设置时间</td>
						<td>操作</td>
						<td>详情</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.index+1}</td>					
							<td>${item.pname}</td>
							<td>${Math.round(item.days/30)}个月</td>
							<td>${item.qqgroup}</td>
							
							 <c:choose>
								<c:when test="${item.progress eq 1}">
									<td>未立案</td>
								</c:when>
								
								<c:when test="${item.progress eq 2}">
									<td>已立案</td>
								</c:when>
								
								<c:when test="${item.progress eq 3}">
									<td>已结案</td>
								</c:when>
								
								<c:when test="${item.progress eq 4}">
									<td>已清退</td>
								</c:when>
							</c:choose>
							<td>${item.notice}</td>
							<td>${empty item.hotsetTime ? '-':DateUtils.formatDate(item.hotsetTime)}</td>
							<td>
								<button class="btn btn-default"
									onclick="setHot(this);"
									data-opid="${item.id}" data-ishot="1">热门维权置顶</button>
									
								<button class="btn btn-default"
									onclick="setHot(this);"
									data-opid="${item.id}" data-ishot="0">取消置顶</button>  
							</td>
							
							<td>
								<button type="button" class="btn btn-default" onclick="detail1('${item.id}');">详情</button>
   	 						</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 分页 -->
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>
		</div>
	</div>
	<!-- 引入模态框 -->
	<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>