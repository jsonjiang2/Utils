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
						<td>高管序号</td>
						<td>高管名称</td>
						<td>高管职位</td>
						<%--<td>个人学历</td>--%>
						<td>个人图片</td>
 						<td>个人简介</td>
						<td>操作</td>
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
								${item.serialno}
							</td>
							<td>
								${item.name}
							</td>
							<td>
								${item.position}
							</td>
							<%--<td>--%>
								<%--<c:if test="${empty item.education}">---</c:if>--%>
								<%--<c:if test="${item.education==0}">无</c:if>--%>
								<%--<c:if test="${item.education==1}">小学</c:if>--%>
								<%--<c:if test="${item.education==2}">初中</c:if>--%>
								<%--<c:if test="${item.education==3}">高中</c:if>--%>
								<%--<c:if test="${item.education==4}">大专</c:if>--%>
								<%--<c:if test="${item.education==5}">本科</c:if>--%>
								<%--<c:if test="${item.education==6}">研究生</c:if>--%>
							<%--</td>--%>
							<td>
								<a target="_blank" href="${fdfsurl}${item.pic}">
									<img src="${fdfsurl}${item.pic}" alt="" height="60px" width="60px" />
								</a>
							</td>
							<td class="p-content" tip="${item.brief}">
								${item.brief}
							</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="platformExecutives_detail(${item.id})">详情</button>
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

				function platformExecutives_detail(id){
					var action="/admin/platformExecutives/getById/"+id;
					$.post(basePath+action,function(data){
			    		 $("#detailsModal").modal({
			                 backdrop: 'static',
			             });
			    		$("#detail-modal-body").html(data);
			    	});
				}

                function updateUI(id){
                    var action = "/admin/platformExecutives/updateView/"+id;
                    $.post(action,function(data){
                        $("#update-modal-body").html(data);
                    });
                }
                function update(){
                    var jsonData = $("#platformExecutives_updateForm").serialize();
                    var params = decodeURIComponent(jsonData,true);
                    var action ="/admin/platformExecutives/update";
                    $.post(action, params, function(data){
                        alert(data.meta.message);
                        window.location.href="${pageContext.request.contextPath}/admin/platformExecutives/cxList";
                    });
                }

                function del(id){
                    if(confirm("确认删除吗？")){
                        var action ="/admin/platformExecutives/del/"+id;
                        $.post(action, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/platformExecutives/cxList";
                        });
                    }
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