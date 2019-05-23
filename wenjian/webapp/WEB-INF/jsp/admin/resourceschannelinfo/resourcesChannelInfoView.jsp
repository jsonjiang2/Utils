<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						
						<td>序号</td>
						<td>申请人</td>
						<td>申请时间</td>
						<td>审核状态</td>
						<td>推荐状态</td>
						<!-- <td>身份证号</td>
						<td>保证金</td> -->
						<td>微信二维码</td>
						<td>身份证正面</td>
						<td>身份证反面</td>
						<td>个人照片</td>
						<td>手持照</td>
						<!-- <td>微信</td>
						<td>手机号</td> -->
 						<!-- <td>审核人</td>
 						<td>审核时间</td>
 						<td>审核备注</td> -->
 						<td>详情</td>
 						<td>操作</td>
 						
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							
							<td>${status.index+1}</td>
							<td>
								<wdb:getUser uid="${item.preCommonMember.uid }" var="user">
									${user.username}--${user.realname}
								</wdb:getUser>
							</td>
							
							<td>
								 ${empty item.applytime ? '--' : dateUtils.formatDate(item.applytime)}
 							</td>
							<td>
								<c:if test="${item.status==1}">待审核</c:if>
								<c:if test="${item.status==2}"><font color="blue">合格</font></c:if>
								<c:if test="${item.status==3}"><font color="red">不合格</font></c:if>
								<c:if test="${item.status==4}"><font color="red">黑名单</font></c:if>
							</td>
	 						<td>
								<c:if test="${item.recommend==0}">否</c:if>
								<c:if test="${item.recommend==1}"><font color="blue">是</font></c:if>
							</td>
 							<%-- <td>
	 							${item.preCommonMember.certno}
 	 						</td>
 	 						<td>
	 							${item.bail}
 	 						</td> --%>
 	 						<td><a target="_blank" href="${domain}${item.wxqrcode}"><font color="blue">查看</font></a></td>
 	 						<td><a target="_blank" href="${domain}${item.certnopath1}"><font color="blue">查看</font></a></td>
 	 						<td><a target="_blank" href="${domain}${item.certnopath2}"><font color="blue">查看</font></a></td>
 	 						<td><a target="_blank" href="${domain}${item.picture}"><font color="blue">查看</font></a></td>
 	 						<td><a target="_blank" href="${domain}${item.holdpicture}"><font color="blue">查看</font></a></td>
 	 						<%-- <td>${item.wechat}</td>
 	 						<td>
 	 							<wdb:getUser uid="${item.preCommonMember.uid }" var="user">
									${user.mobile}
								</wdb:getUser>
 	 						</td> --%>
 	 						<%-- <td>${item.auditman}</td>
 	 						<td>${empty item.audittime ? '--' : dateUtils.formatDate(item.audittime)}</td>
 	 						<td>${item.remark}</td> --%>
 	 						<td>
 	 							<button class="btn btn-default" onclick="resourcesChannelInfo_detail(${item.id})">查看</button> 
 	 						</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="resourcesChannelInfo_updatetuijian(${item.id},1)"><font color="blue">推荐</font></button>	 	
 	 							<button class="btn btn-default" onclick="resourcesChannelInfo_updatetuijian(${item.id},0)"><font color="red">不推荐</font></button>
 	 						</td>
 	 						
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
			
				function resourcesChannelInfo_update(id,status){
					var action="/admin/resourcesChannelInfo/update";
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
				
				//全选
				 function checkAll(){
		 			var all=document.getElementById('all');//获取到点击全选的那个复选框的id  
					var one=document.getElementsByName('checkname');//获取到复选框的名称  
					//因为获得的是数组，所以要循环 为每一个checked赋值  
					for(var i=0;i<one.length;i++){  
						one[i].checked=all.checked; 
					}  
		 		}
				
				//详情查看
				 function resourcesChannelInfo_detail(id){
					var action="/admin/resourcesChannelInfo/detail/"+id;
					$.post(basePath+action,function(data){
			    		 $("#detailsModal").modal({
			                 backdrop: 'static',
			                 keyboard: false
			             });
			    		$("#detail-modal-body").html(data);
			    	});
				
				}
				
				//更新推荐
				function resourcesChannelInfo_updatetuijian(id,recommend){
					var action="/admin/resourcesChannelInfo/update";
					// alert(basePath+action);
					//var id =  $("#id").val();
					//var recommend = $("#recommend").val();
					if(window.confirm('你确定要更改吗？')){
						$.post(basePath+action,{id:id,recommend:recommend},function(data){
				    		window.location.reload();
				    	});
		                 return true;
		              }else{
		                 return false;
		             }
				}
			
			</script>
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>