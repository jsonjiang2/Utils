<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="allDel" class="myCheck" onclick="checkDelAll()">
						</td>
						<td>序号</td>
						<td>平台编号</td>
						<td>平台名称</td>
 						<td>认领人</td>
						<td>认领时间</td>
						<td>认领状态</td>
						<td>管理员备注</td>
						<td>详情</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<input type="checkbox" name="checkDelName" class="myCheck" value="${item.id}">
							</td>
							<td>${status.index+1}</td>
							<td>${item.pno}</td>
							<td>
								<a onclick="querypname('${item.pname}')" style="cursor:pointer;color: blue">${item.pname}</a>
 							</td>
							<td>
								${item.claimname}
							</td>
							<td>${empty item.claimdate ? '':dateUtils.formatDate(item.claimdate)}</td>
							<td>
								<c:if test="${empty item.status}">---</c:if>
								<c:if test="${item.status==1}">待处理</c:if>
								<c:if test="${item.status==3}">已认领</c:if>
								<c:if test="${item.status==4}">认领失败</c:if>
								<c:if test="${item.status==5}">已撤销</c:if>  <%--认领人已提交认领申请，但在审核过程中，突然不想认领了--%>
							</td>
							<td class="p-content" tip="${item.claimremark}">
									${item.claimremark}
							</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="claim_detail(${item.id})">查看</button>
 	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>

			<script type="text/javascript">

				function claim_detail(id){
					var action="/admin/platformClaim/detail/"+id;
					$.post(basePath+action,function(data){
			    		 $("#detailsModal").modal({
			                 backdrop: 'static',
			             });
			    		$("#detail-modal-body").html(data);
			    	});
				}

                $(function() {
                    $(".p-content").each(function() {
                        var content = $(this).html().trim();
                        if (content.length > 12) {
                            $(this).html(content.substr(0, 12) + "...");
                        }
                    })
                    $(".p-content").tzTip();
                });

			</script>
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>