<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="all" class="myCheck" onclick="checkAll()">
						</td>
						<td>序号</td>
						<td>平台编号</td>
						<td>平台名称</td>
						<td>发布状态</td>
						<td>产品展示</td>
						<td>认领状态</td>
						<td>平台押金</td>
						<td>官方号</td>
						<td>申报审核人</td>
						<td>操作人</td>
						<td>操作时间</td>
						<td>操作备注</td>
 						<td>发布操作</td>
 						<td>展示操作</td>
 						<td>申报审核操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<input type="checkbox" name="checkname" class="myCheck" value="${item.id}">
							</td>
							<td>${status.index+1}</td>
							<td>${item.pno}</td>
							<td>
								 ${item.pname}
 							</td>
							<td>
								<c:if test="${item.status==1}"><font color="red">不容许</font></c:if>
								<c:if test="${item.status==2}"><font color="blue">容许</font></c:if>
								<c:if test="${item.status==3}"><font color="red">高风险</font></c:if>
							</td>
	 						<td>
		 						<c:if test="${item.display==0}"><font color="red">不展示</font></c:if>
		 						<c:if test="${item.display==1}"><font color="blue">展示</font></c:if>
	 						</td>
	 						<td>
	 							<c:if test="${item.platformInfo.claimstatus==0}"><font color="red">未认领</font></c:if>
		 						<c:if test="${item.platformInfo.claimstatus==1}"><font color="blue">已认领</font></c:if>
		 					</td>
	 						<td>
	 							 ${item.platformInfo.bail}
	 						</td>
	 						<td> ${item.username}-- ${item.realname}</td>
	 						<td>
	 							<c:if test="${item.applyauditman==1}"><font color="blue">官方号</font></c:if>
		 						<c:if test="${item.applyauditman==2}"><font color="blue">一级资源人</font></c:if>
		 					</td>
							<td>${item.dealman}</td>
 							<td>
	 							${empty item.dealtime ? '--' : dateUtils.formatDate(item.dealtime)}
 	 						</td>
 	 						<td>${item.remark}</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="resourceplatform_update(${item.id},1)"><font color="red">不容许</font></button>	 	
 	 							<button class="btn btn-default" onclick="resourceplatform_update(${item.id},2)"><font color="blue">容许</font></button> 	
 	 							<button class="btn btn-default" onclick="resourceplatform_update(${item.id},3)"><font color="red">高风险</font></button>
 	 						</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="resourceplatform_displayupdate(${item.id},0)"><font color="red">不展示</font></button>	 	
 	 							<button class="btn btn-default" onclick="resourceplatform_displayupdate(${item.id},1)"><font color="blue">展示</font></button> 
 	 						</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="resourceplatform_auditupdate(${item.id},1)"><font color="blue">官方号</font></button>	 	
 	 							<button class="btn btn-default" onclick="resourceplatform_auditupdate(${item.id},2)"><font color="blue">一级资源人</font></button> 
 	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<button class="btn btn-danger"  onclick="resourceplatform_audit(this)" data-audit="1">批量不容许</button>
			<button class="btn btn-primary"  onclick="resourceplatform_audit(this)" data-audit="2">批量容许</button>
			<button class="btn btn-danger"  onclick="resourceplatform_audit(this)" data-audit="3">批量高风险</button>
			<button class="btn btn-danger"  onclick="resourceplatform_displayaudit(this)" data-audit="0">批量不展示</button>
			<button class="btn btn-primary"  onclick="resourceplatform_displayaudit(this)" data-audit="1">批量展示</button>
			<script type="text/javascript">
				var myDate = new Date();
			    <!--发布更改 //-->
				function resourceplatform_update(id,status){
					var action="/admin/resourcesPlatformSetting/update";
					// alert(basePath+action);
					if(window.confirm('你确定要更改吗？')){
						$.post(basePath+action,{id:id,status:status,dealtime:myDate.getTime()},function(data){
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
				
				//批量发布更改
				function resourceplatform_audit(obj){
					var number = "";
					$("input:checkbox[name=checkname]:checked").each(function(k){
					    if(k == 0){
					        number = $(this).val();
					    }else{
					        number += ","+$(this).val();
					    }
					});
					if(isEmpty(number)){
						alert("请至少选择一个主题操作");
						return ;
					}
					if(window.confirm('你确定提交吗？')){
						var audit = $(obj).data("audit");
						var url = basePath+"/admin/resourcesPlatformSetting/auditBatch";
						var callback = function(data){
							alert(data.meta.message);
							/* if(data.meta.code == "88"){
								window.location.href = basePath+"/admin/resourcesPlatformSetting/list";
							} */ 
							window.location.reload();
						}
						$.post(url,{"tids":number,"audit":audit},callback);
					}
				}
				
				<!--产品展示更改 //-->
				function resourceplatform_displayupdate(id,display){
					var action="/admin/resourcesPlatformSetting/update";
					// alert(basePath+action);
					if(window.confirm('你确定要更改吗？')){
						$.post(basePath+action,{id:id,display:display,dealtime:myDate.getTime()},function(data){
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
				
				//批量产品展示更改
				function resourceplatform_displayaudit(obj){
					var number = "";
					$("input:checkbox[name=checkname]:checked").each(function(k){
					    if(k == 0){
					        number = $(this).val();
					    }else{
					        number += ","+$(this).val();
					    }
					});
					if(isEmpty(number)){
						alert("请至少选择一个主题操作");
						return ;
					}
					if(window.confirm('你确定提交吗？')){
						var audit = $(obj).data("audit");
						var url = basePath+"/admin/resourcesPlatformSetting/auditBatch";
						var callback = function(data){
							alert(data.meta.message);
							/* if(data.meta.code == "88"){
								window.location.href = basePath+"/admin/resourcesPlatformSetting/list";
							} */
							window.location.reload();
						}
						$.post(url,{"tids":number,"display":audit},callback);
					}
					
				}
				
				//申报审核人修改
				function resourceplatform_auditupdate(id,applyauditman){
					var action="/admin/resourcesPlatformSetting/update";
					if(window.confirm('你确定要更改吗？')){
						$.post(basePath+action,{id:id,applyauditman:applyauditman,dealtime:myDate.getTime()},function(data){
				    		window.location.reload();
				    	});
		                 return true;
		              }else{
		                 return false;
		             }
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