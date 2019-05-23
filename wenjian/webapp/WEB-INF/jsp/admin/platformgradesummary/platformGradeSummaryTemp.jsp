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
						<td>平台状态</td>
						<td>评级机构</td>
						<td>评级时间</td>
						<td>排名</td>
						<td>操作人</td>
						<td>操作时间</td>
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
								<a onclick="querypname('${item.pname}')" style="cursor:pointer;color: blue">${item.pname}</a>
 							</td>
							<td>
								<a onclick="querypstatus('${item.pstatus}')" style="cursor:pointer;color: blue">
									<c:if test="${empty item.pstatus}">---</c:if>
									<c:if test="${item.pstatus==1}">正常</c:if>
									<c:if test="${item.pstatus==2}">跑路</c:if>
									<c:if test="${item.pstatus==3}">清盘</c:if>
									<c:if test="${item.pstatus==4}">高风险</c:if>
									<c:if test="${item.pstatus==5}">有争议</c:if>
									<c:if test="${item.pstatus==6}">延期兑付</c:if>
									<c:if test="${item.pstatus==7}">停业</c:if>
									<c:if test="${item.pstatus==8}">经侦介入</c:if>
									<c:if test="${item.pstatus==9}">提现困难</c:if>
								</a>
							</td>
							<td>
								<a onclick="queryorganization('${item.organization}')" style="cursor:pointer;color: blue">
									<c:if test="${empty item.organization}">---</c:if>
									<c:if test="${item.organization==1}">网贷之家</c:if>
									<c:if test="${item.organization==2}">网贷天眼</c:if>
									<c:if test="${item.organization==3}">网贷巴士</c:if>
									<c:if test="${item.organization==4}">融360 </c:if>
									<c:if test="${item.organization==5}">逸飞</c:if>
								</a>
							</td>
							<td>
								${empty item.gradetime ? '':dateUtils.formatDate(item.gradetime)}
							</td>
							<td>
								${item.ranking}
							</td>
							<td>
								${item.handlers}
							</td>
							<td>${empty item.changetime ? '':dateUtils.formatDate(item.changetime)}</td>
							<td class="p-content" tip="${item.remark}">
									${item.remark}
							</td>
 	 						<td>
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

                function updateUI(id){
                    var action = "/admin/platformGradeSummary/updateView/"+id;
                    $.post(action,function(data){
                        $("#update-modal-body").html(data);
                    });
                }
                function update(){
                    var jsonData = $("#platformGradeSummary_updateForm").serialize();
                    var params = decodeURIComponent(jsonData,true);
                    var action ="/admin/platformGradeSummary/update";
                    $.post(action,params, function(data){
                        alert(data.meta.message);
                        window.location.href="${pageContext.request.contextPath}/admin/platformGradeSummary/list";
                    });
                }

                function del(id){
                    if(confirm("确认删除吗？")){
                        var action ="/admin/platformGradeSummary/del/"+id;
                        $.post(action, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/platformGradeSummary/list";
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