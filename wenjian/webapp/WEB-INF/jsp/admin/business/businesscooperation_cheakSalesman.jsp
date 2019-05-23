<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
table tr td {
	text-align: center;
	vertical-align: middle !important;
}

.text-center2 td {
	border: 1px solid #666;
}
</style>
<c:if test="${lists.size()==0}">暂无数据</c:if>
<c:if test="${lists.size()>0}">
			<form method="post" action="deatil" id="deatil_form"  class="form-inline">
					<div style="margin-top: 18px;margin-bottom: 10px">
						<input type="hidden" id="pageNum" name="pageNum" id="pageNum"/> 
						<input type="hidden" id="pageSize" name="pageSize" id="pageSize"/> 
						<input type="hidden" id="id" name="ptid" value="${id}"/> 
						<input type="hidden" id="type_select" name="type" value="${type}"/> 
					</div>
						
			</form>
	
			<table class="table table-hover" id="salesman_table">
					<thead>
						<tr style="background-color: #CCCCCC;" class="text-center2">
							<td style="display: none">ID</td>
							<td>序号</td>
							<td>姓名</td>
							<td>电话</td>
							<td>QQ号</td>
							<td>微信</td>
						</tr>
					</thead>
					<tbody>
						<!-- 这里面${userRecharge.id }是点的model里面的属性 -->
						<c:forEach items="${lists}" var="salesman" varStatus="status">
							<tr id="salesman_tr_${userspreadproxy.id }" class="text-center2">
								<td>${status.count}</td>
								 <td>${salesman.realname}</td> 
								 <td>${salesman.mobile}</td> 
								 <td>${salesman.qqcode}</td> 
								 <td>${salesman.weicat}</td> 
							</tr>

						</c:forEach>
					</tbody>
				</table>
			<div id="page_div">
					<%@ include file="./../../common/pagehelper2.jsp"%>
			</div>
	

</c:if>

<script type="text/javascript">
   //模态框分页
   function queryAllPerson2(pageNum,pageSize){
	   $("#pageNum").val(pageNum);
       $("#pageSize").val(pageSize);
	   var id = $("#id").val();
	   var type = $("#type_select").val();
	   var  action = "/admin/businesscooperation/cheakSalesman.action";
		var params = {
				"id":id,
				"type":type,
				"pageNum":pageNum,
				"pageSize":pageSize
		}
		$.post(action,params,function(data){
			$("#detail-modal-body").html(data);
		});
   }
   

</script>
