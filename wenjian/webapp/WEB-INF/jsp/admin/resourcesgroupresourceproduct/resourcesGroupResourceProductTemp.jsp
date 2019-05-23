<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="all" class="myCheck" onclick="checkAll()">
						</td>
						<td>序号</td>
						<!-- <td>组别号</td> -->
						<td>资源主uid</td>
						<td>资源主名称</td>
						<td>资源编号</td>
						<td>产品编号</td>
						<td>产品开关</td>
						<td>备注</td>
						<td>详情</td>
 						<td>操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<input type="checkbox" name="checkname" class="myCheck" value="${item.id}">
							</td>
							<td>${status.index+1}</td>
							<%-- <td>${item.ugroup}</td> --%>
							<td>${item.uid}</td>
							<td>${item.preCommonMember.username}--${item.preCommonMember.realname}</td>
							<td>${item.resourceno}</td>
							<td>${item.productno}</td>
							<td>
								
								<c:if test="${item.onoff==0}">关闭</c:if>
								<c:if test="${item.onoff==1}">开启</c:if>
							
							</td>
							<td>
								 ${item.remark}
							</td>
							<td>
								<button class="btn btn-default" onclick="resourcesGroupResourceProduct_detail(${item.id})">查看</button> 
							</td>
 	 						<td>
 	 							<%-- <button class="btn btn-default" onclick="resourcesGroupResourceProduct_update(${item.id},2)">删除</button>	 	
 	 							<button class="btn btn-default" onclick="resourcesGroupResourceProduct_update(${item.id},3)">修改</button> --%> 	
 	 							<button class="btn btn-default" data-backdrop="static"
										data-toggle="modal" data-dismiss="modal"
										data-target="#insertModal" onclick="resourcesGroupResourceProduct_addViewModal(${item.id})">分配资源和产品</button>
 	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
				/* //打开添加模态框
				function resourcesGroupResourceProduct_addViewModal(id,ugroup,status){
					$("#id").val(id);
					$("#ugroup").val(ugroup);
					$("#status").val(status);
		    		$("#addViewModal").modal();
				}
				//提交数据
				function resourcesGroupResourceProduct_update(){
					var action="/admin/resourcesGroup/insert";
					var username = $("#username").val();
					var status = $("#status").val();
					var id = $("#id").val();
					if(window.confirm('你确定要添加吗？')){
						$.post(basePath+action,{id:id,status:status,username:username},function(data){
				    		 //$("#detailsModal").modal({
				             //    backdrop: 'static',
				             //    keyboard: false
				             //});
				    		//$("#detail-modal-body").html(data);
				    		alert(data.meta.message);
				    		window.location.reload();
				    	});
		                 return true;
		              }else{
		                 return false;
		             }
				}
				
				
			 */
			</script>
			
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>