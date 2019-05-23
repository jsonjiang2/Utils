<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>

<c:if test="${lists.size()==0}">暂无数据</c:if>
<c:if test="${lists.size()>0}">
			<form method="post" action="deatil" id="deatil_form"  class="form-inline">
					<div style="margin-top: 18px;margin-bottom: 10px">
						<input type="hidden" id="pageNum" name="pageNum" id="pageNum"/> 
						<input type="hidden" id="pageSize" name="pageSize" id="pageSize"/> 
						<input type="hidden" id="baseId" name="baseid" value="${baseId}"/> 
					</div>
						
			</form>
	
			<table class="table table-hover" id="userspreadproxy_table">
					<thead>
						<tr style="background-color: #CCCCCC;" class="text-center2">
							<td style="display: none">ID</td>
							<td>序号</td>
							<td>用户名-姓名</td>
							<td>注册时间</td>
						</tr>
					</thead>
					<tbody>
						<!-- 这里面${userRecharge.id }是点的model里面的属性 -->
						<c:forEach items="${lists}" var="userspreadquery"
							varStatus="status">

							<tr id="userRecharge_tr_${userspreadproxy.id }"
								class="text-center2">
									
									<td>${status.count}</td>
									 <td>${userspreadquery.username}
									 	<c:if test="${!empty userspreadquery.realname}">-${userspreadquery.realname}</c:if>
									 	<c:if test="${empty userspreadquery.realname}">-未实名</c:if>
									 </td> 
									 <td>
									 	<c:if test="${!empty userspreadquery.regdate}">${sf.format(userspreadquery.regdate)}</c:if>
									 	<c:if test="${empty userspreadquery.regdate}">暂无时间</c:if>
									 	
									 </td> 
									
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
	   var baseId = $("#baseId").val();
	   var  action = "/admin/userSpreadProxy/deatil.action";
		var params = {
				"baseId":baseId,
				"pageNum":pageNum,
				"pageSize":pageSize
		}
		$.post(action,params,function(data){
			$("#detail-modal-body").html(data);
		});
   }
   

</script>
