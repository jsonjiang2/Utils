<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="all" class="myCheck" onclick="checkAll()">
						</td>
						<td>序号</td>
						<td>资源编号</td>
						<td>平台名称</td>
						<td>资源名称</td>
						<td>发布人</td>
						<td>发布时间</td>
						<td>活动类型</td>
						<td>资源状态</td>
						<td>资源级别</td>
 						<td>详情</td>
 						<!-- <td>操作</td> -->
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<input type="checkbox" name="checkname" class="myCheck" value="${item.id}">
							</td>
							<td>${status.index+1}</td>
							<td>${item.resourceno}</td>
							<td>${item.resourcesInfo.pname}--${item.resourcesInfo.pno}</td>
							<td>
								 ${item.resourcesInfo.resourcename}
 							</td>
							<td>
								<wdb:getUser uid="${item.uid }" var="user">
									${user.username}--${user.realname}
								</wdb:getUser>
							</td>
							<td>
								 ${empty item.releasetime ? "--" : dateUtils.formatDate(item.releasetime)}
							</td>
	 						
							<td>
								<c:if test="${item.type==1}">首投</c:if> 
								<c:if test="${item.type==2}">复投</c:if> 
							</td>
 							<td>
 								<c:if test="${item.status==0}">异常</c:if> 
	 							<c:if test="${item.status==1}">正常</c:if>
 	 						</td>
 	 						<td>${item.level}级</td>
 	 						<td><button class="btn btn-default" onclick="resourcesInfo_detail(${item.id})">查看</button> </td>
 	 						<%-- <td>
 	 							<button class="btn btn-default" onclick="resourcesInfo_update(${item.id},2)">删除</button>	 	
 	 							<button class="btn btn-default" onclick="resourcesInfo_update(${item.id},3)">修改</button> 	
 	 							<button class="btn btn-default" onclick="resourcesInfo_update(${item.id},4)">新增</button>
 	 						</td> --%>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
			
				function resourcesInfo_update(id,status){
					//var action="/admin/resourcesInfo/update";
					// alert(basePath+action);
					if(window.confirm('你确定要更改吗？')){
						$.post(basePath+action,{id:id,status:status},function(data){
				    		 //$("#detailsModal").modal({
				             //    backdrop: 'static',
				             //    keyboard: false
				             //});
				    		//$("#detail-modal-body").html(data);
				    		window.location.reload();
				    	});
		                 return true;
		              }else{
		                 return false;
		             }
				}
				
				
				function resourcesInfo_detail(id){
					var action="/admin/resourcesRelease/detail/"+id;
					$.post(basePath+action,function(data){
			    		 $("#detailsModal").modal({
			                 backdrop: 'static',
			                 keyboard: false
			             });
			    		$("#detail-modal-body").html(data);
			    	});
				
				}
				
				//全选
				 function checkAll(){
		 			var all=document.getElementById('all');//获取到点击全选的那个复选框的id  
					var one=document.getElementsByName('checkname');//获取到复选框的名称  
					//因为获得的是数组，所以要循环 为每一个checked赋值  
					for(var i=0;i<one.length;i++){  
						one[i].checked=all.checked; 
					}  
		 		}
			
			</script>
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>