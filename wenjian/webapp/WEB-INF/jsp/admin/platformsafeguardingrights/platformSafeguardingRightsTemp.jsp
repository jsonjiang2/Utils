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
						<td>平台名称</td>
						<td>爆雷时间</td>
						<td>维权天数</td>
						<td>维权人数</td>
						<td>待收统计</td>
						<td>维权状态</td>
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
							<td>
								${item.pname}
 							</td>
							<td>
								${empty item.thunderstormtime ? '':dateUtils.formatYY_MM_DD(item.thunderstormtime)}
							</td>
							<td>
								${item.days}
							</td>
							<td>
								${item.number}
							</td>
							<td>
								${item.tobecollected}
							</td>
							<td>
								<c:if test="${item.status==1}">开启</c:if>
								<c:if test="${item.status==2}">关闭</c:if>
							</td>

 	 						<td>
								<button class="btn btn-default" onclick="safeguarding_detail(${item.id})">详情</button>
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

                function safeguarding_detail(id){
                    var action="/admin/platformSafeguardingRights/detail1/"+id;
                    $.post(basePath+action,function(data){
                        $("#detailsModal").modal({
                            backdrop: 'static',
                            keyboard: false
                        });
                        $("#detail-modal-body").html(data);
                    });
                }

                function updateUI(id){
                    var action = "/admin/platformSafeguardingRights/updateView/"+id;
                    $.post(action,function(data){
                        $("#update-modal-body").html(data);
                    });
                }
                function update(){
                    var jsonData = $("#platformSafeguardingRights_updateForm").serialize();
                    var params = decodeURIComponent(jsonData,true);
                    var action ="/admin/platformSafeguardingRights/update";
                    $.post(action,params, function(data){
                        alert(data.meta.message);
                        window.location.href="${pageContext.request.contextPath}/admin/platformSafeguardingRights/lists";
                    });
                }

                function del(id){
                    if(confirm("确认删除吗？")){
                        var action ="/admin/platformSafeguardingRights/del/"+id;
                        $.post(action, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/platformSafeguardingRights/lists";
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
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>