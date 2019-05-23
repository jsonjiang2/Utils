<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="all" class="myCheck" onclick="">
						</td>
						<td>序号</td>
						<td>平台编号</td>
						<td>平台名称</td>
 						<td>公司名称</td>
						<td>公司类型</td>
						<td>法人代表</td>
						<td>备案域名</td>
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
							<td>${item.pno}</td>
							<td>
								${item.pname}
 							</td>
							<td>
								${item.recordname}
							</td>
							<td>
								${item.companytype}
							</td>
							<td>${item.legalperson}</td>
							<td>${item.recorddomain}</td>
							<td class="p-content" tip="${item.remark}">
									${item.remark}
							</td>
							<td>
								<button class="btn btn-default" onclick="business_detail(${item.id})">详情</button>
								<button class="btn" data-backdrop="static"
										data-toggle="modal" data-dismiss="modal"
										data-target="#updateModal"
										onclick="updateUI('${item.id}')">修改</button>
								<button class="btn btn-default" onclick="del('${item.id}')">删除</button>
							</td>
						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">

				function business_detail(id){
					var action="/admin/platformBusinessRegistration/getById/"+id;
					$.post(basePath+action,function(data){
			    		 $("#detailsModal").modal({
			                 backdrop: 'static',
			             });
			    		$("#detail-modal-body").html(data);
			    	});
				}

                function updateUI(id){
                    var action = "/admin/platformBusinessRegistration/updateView/"+id;
                    $.post(action,function(data){
                        $("#update-modal-body").html(data);
                    });
                }
                function update(){
                    var jsonData = $("#platformInfo_updateForm").serialize();
                    var params = decodeURIComponent(jsonData,true);
                    var action ="/admin/platformBusinessRegistration/update";
					$.post(action, params, function(data){
							alert(data.meta.message);
							window.location.href="${pageContext.request.contextPath}/admin/platformBusinessRegistration/cxList";
					});
                }

                function del(id){
                    if(confirm("确认删除吗？")){
                    	var action ="/admin/platformBusinessRegistration/del/"+id;
                    	$.post(action, function(data){
                        	alert(data.meta.message);
                        	window.location.href="${pageContext.request.contextPath}/admin/platformBusinessRegistration/cxList";
                    	});
					}
                }

                $(function() {
                    $(".p-content").each(function() {
                        var content = $(this).html().trim();
                        if (content.length > 8) {
                            $(this).html(content.substr(0, 8) + "...");
                        }
                    })
                    $(".p-content").tzTip();
                });

			</script>
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>