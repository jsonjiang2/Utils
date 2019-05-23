<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="all" class="myCheck" onclick="checkAll()">
						</td>
						<td>序号</td>
						<td>组别号</td>
						<td>组别名称</td>
						<td>资源主uid</td>
						<td>资源主名称</td>
						<td>备注</td>
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
							<td>${item.ugroup}</td>
							<td>
								 ${item.ugroupname}
 							</td>
							<td>${item.uid}</td>
							<td>${item.preCommonMember.username}--${item.preCommonMember.realname}</td>
							<td>
								 ${item.remark}
							</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="resourcesGroup_delete(${item.id},2)">删除</button>	 	
 	 							<button class="btn btn-default" onclick="resourcesGroup_modify(${item.id})" data-backdrop="static"
										data-toggle="modal" data-dismiss="modal"
										data-target="#updateModal">修改</button> 	
 	 							<%-- <button class="btn btn-default" onclick="resourcesGroup_addViewModal(${item.id},${item.ugroup},'${item.ugroupname}',${item.uid},4)">新增资源主</button> --%>
 	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
				//打开添加模态框
				/* function resourcesGroup_addViewModal(id,ugroup,ugroupname,uid,status){
					$("#id").val(id);
					$("#uid").val(uid);
					$("#ugroup").val(ugroup);
					$("#ugroupname").html(ugroupname);
					$("#status").val(status);
		    		$("#addViewModal").modal();
				} */
				//提交数据
				/* function resourcesGroup_update(){
					var action="/admin/resourcesGroup/insert";
					var username = $("#username").val();
					var ugroup = $("#ugroup").val();
					var status = $("#status").val();
					var id = $("#id").val();
					var uid = $("#uid").val();
					if(window.confirm('你确定要添加吗？')){
						$.post(basePath+action,{id:id,uid:uid,ugroup:ugroup,status:status,username:username},function(data){
				    		 //$("#detailsModal").modal({
				             //    backdrop: 'static',
				             //    keyboard: false
				             //});
				    		//$("#detail-modal-body").html(data);
				    		if(data.meta==null){
				    			alert("添加失败，请检查该用户是否已经存在此组里面，用户信息是否有误");
				    		}else{
				    			alert(data.meta.message);
					    		window.location.reload();
				    		}
				    		
				    	});
		                 return true;
		              }else{
		                 return false;
		             }
				} */
				
				
				
				//删除
				function resourcesGroup_delete(id,status){
					var action="/admin/resourcesGroup/delete";
					if(window.confirm('你确定要删除吗？')){
						$.post(basePath+action,{id:id},function(data){
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
				
			
			</script>
			<!-- 编辑 模态框 -->
			<!-- <div class="modal fade" id="addViewModal" tabindex="-1" role="dialog"
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
								<input id = "ugroup" type="hidden"/>
								<input id = "status" type="hidden"/>
								<input id = "uid" type="hidden"/>
								
								<label class="col-sm-2 control-label laber_from" >组别名称：</label>
								<div class="col-sm-3"><span id="ugroupname" class="form-control" > </span><br/></div>
								
								<label class="col-sm-2 control-label laber_from" >用户名：</label>
								<div class="col-sm-3"><input id="username" name="username" value="" class="form-control" /></div>
								
								<label class="col-sm-2 control-label laber_from" >备注 ：   </label>
								<div class="col-sm-3"><input id="remark" name="remark" value="" class="form-control" /></div>
								
						</div>
						<div class="modal-footer">
							<button type="button" id="btn-update" class="btn btn-primary upbtn"
								onclick="resourcesGroup_update()">保存</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div> -->
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>