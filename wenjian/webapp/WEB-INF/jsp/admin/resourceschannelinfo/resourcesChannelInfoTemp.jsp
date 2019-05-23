<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="all" class="myCheck" onclick="checkAll()">
						</td>
						<td>序号</td>
						<td>申请人</td>
						<td>申请时间</td>
						<td>审核状态</td>
						<td>推荐</td>
						<!-- <td>身份证号</td>
						<td>保证金</td> -->
						<td>微信二维码</td>
						<td>身份证正面</td>
						<td>身份证反面</td>
						<td>个人照片</td>
						<td>手持照</td>
						<!-- <td>微信</td>
						<td>手机号</td>
 						<td>审核人</td>
 						<td>审核时间</td>
 						<td>审核备注</td> -->
 						<td>详情</td>
 						<td>操作</td>
 						<!-- <td>推荐操作</td> -->
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<input type="checkbox" name="checkname" class="myCheck" value="${item.id}_${item.preCommonMember.uid }">
							</td>
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
 	 						</td>
 	 						<td>${item.auditman}</td>
 	 						<td>${empty item.audittime ? '--' : dateUtils.formatDate(item.audittime)}</td>
 	 						<td>${item.remark}</td> --%>
 	 						<td><button class="btn btn-default" onclick="resourcesChannelInfo_detail(${item.id})">查看</button> </td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="resourcesChannelInfo_updateview(${item.id},${item.uid},2)"><font color="blue">合格</font></button>	 	
 	 							<button class="btn btn-default" onclick="resourcesChannelInfo_updateview(${item.id},${item.uid},3)"><font color="red">不合格</font></button>
 	 							<button class="btn btn-default" onclick="resourcesChannelInfo_updateview(${item.id},${item.uid},4)"><font color="red">黑名单</font></button>
 	 						</td>
 	 						<%-- <td>
 	 							<button class="btn btn-default" onclick="resourcesChannelInfo_updatetuijian(${item.id},1)"><font color="blue">推荐</font></button>	 	
 	 							<button class="btn btn-default" onclick="resourcesChannelInfo_updatetuijian(${item.id},0)"><font color="red">不推荐</font></button>
 	 						</td> --%>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<button class="btn btn-primary"  onclick="resourcesChannelInfo_auditview(this)" data-audit="2">批量合格</button>
			<button class="btn btn-danger"  onclick="resourcesChannelInfo_auditview(this)" data-audit="3">批量不合格</button>
			<button class="btn btn-danger"  onclick="resourcesChannelInfo_auditview(this)" data-audit="4">批量黑名单</button>
			
			<script type="text/javascript">
				var myDate = new Date();
				
				//更新前通过模态框添加审核备注
				 function resourcesChannelInfo_updateview(id,uid,status){
							 $("#id").val(id);
							 $("#uid").val(uid);
							 $("#status").val(status);
				    		 $("#updateViewModal").modal();
					}
				//更新
				function resourcesChannelInfo_update(){
					var action="/admin/resourcesChannelInfo/updaterci";
					// alert(basePath+action);
					var id =  $("#id").val();
					var uid =  $("#uid").val();
					var status = $("#status").val();
					var remark = $("#remark").val();
					if(window.confirm('你确定要更改吗？')){
						$.post(basePath+action,{id:id,uid:uid,status:status,remark:remark,audittime:myDate.getTime()},function(data){
				    		 //$("#detailsModal").modal({
				             //    backdrop: 'static',
				             //    keyboard: false
				             //});
				    		//$("#detail-modal-body").html(data);
				    		alert(data.message);
				    		window.location.reload();
				    	});
		                 return true;
		              }else{
		                 return false;
		             }
				}
				
				
				//批量更新前通过模态框添加审核备注
				function resourcesChannelInfo_auditview(obj){
					var uid = "";
					var number = "";
					var audit = $(obj).data("audit");
					$("input:checkbox[name=checkname]:checked").each(function(k){
					    if(k == 0){
					    	number = $(this).val().split("_")[0];
					        uid = $(this).val().split("_")[1];
					    }else{
					    	number += ","+$(this).val().split("_")[0];
					        uid += ","+$(this).val().split("_")[1];
					    }
					    $("#uids").val(uid);
					    $("#tids").val(number);
					    $("#batchstatus").val(audit);
					    $("#updateBatchViewModal").modal();
					});
					if(isEmpty(number)){
						alert("请至少选择一个主题操作");
						return ;
					}
					
				}
				
				//批量更改
				function resourcesChannelInfo_audit(){
					var uids = $("#uids").val();
					var tids = $("#tids").val();
				    var batchstatus = $("#batchstatus").val();
				    var batchremark = $("#batchremark").val();
					if(window.confirm('你确定提交吗？')){
						
						var url = basePath+"/admin/resourcesChannelInfo/auditBatch";
						var callback = function(data){
							alert(data.meta.message);
							/* if(data.meta.code == "88"){
								window.location.href = basePath+"/admin/resourcesChannelInfo/list";
							} */
							window.location.reload();
						}
						$.post(url,{"tids":tids,"uids":uids,"status":batchstatus,"remark":batchremark},callback);
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
			
			</script>
			
			<!-- 编辑 模态框 -->
			<div class="modal fade" id="updateViewModal" tabindex="-1" role="dialog"
				aria-labelledby="editModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="editModalLabel">
								<span class="glyphicon glyphicon-info-sign"></span>提示：正在进行编辑操作
							</h4>
						</div>
						<div id="update-view-modal-body" class="modal-body">
								<input id = "id" type="hidden"/>
								<input id = "uid" type="hidden"/>
								<input id = "status" type="hidden"/>
								操作备注：<br/>
								<textarea id="remark" rows="3" cols="80"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" id="btn-update" class="btn btn-primary upbtn"
								onclick="resourcesChannelInfo_update()">保存</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 批量编辑 模态框 -->
			<div class="modal fade" id="updateBatchViewModal" tabindex="-1" role="dialog"
				aria-labelledby="editModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="editModalLabel">
								<span class="glyphicon glyphicon-info-sign"></span>提示：正在进行编辑操作
							</h4>
						</div>
						<div id="update-batch-modal-body" class="modal-body">
								<input id = "tids" />
								<input id = "uids" />
								<input id = "batchstatus" type="hidden"/>
								操作备注：<br/>
								<textarea id="batchremark" rows="3" cols="80"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" id="btn-update" class="btn btn-primary upbtn"
								onclick="resourcesChannelInfo_audit()">保存</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>