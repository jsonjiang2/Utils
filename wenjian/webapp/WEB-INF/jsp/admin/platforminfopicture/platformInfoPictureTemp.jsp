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
						<td>证件图片类型</td>
						<td>图片</td>
						<td>图片名称</td>
						<td>前端显示</td>
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
								<c:if test="${empty item.pictype}">---</c:if>
								<c:if test="${item.pictype==1}">现场办公</c:if>
								<c:if test="${item.pictype==2}">公司证件</c:if>
							</td>
							<td>
								<a target="_blank" href="${fdfsurl}${item.picpath}">
									<img src="${fdfsurl}${item.picpath}" alt="" height="60px" width="60px" />
								</a>
							</td>
							<td>
								${item.picname}
							</td>
							<td>
								<c:if test="${empty item.display}">---</c:if>
								<c:if test="${item.display==1}">显示</c:if>
								<c:if test="${item.display==0}">不显示</c:if>
							</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="platformInfoPicture_detail(${item.id})">详情</button>
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

				function platformInfoPicture_detail(id){
					var action="/admin/platformInfoPicture/getById/"+id;
					$.post(basePath+action,function(data){
			    		 $("#detailsModal").modal({
			                 backdrop: 'static',
			                 keyboard: false
			             });
			    		$("#detail-modal-body").html(data);
			    	});
				}

                function updateUI(id){
                    var action = "/admin/platformInfoPicture/updateView/"+id;
                    $.post(action,function(data){
                        $("#update-modal-body").html(data);
                    });
                }
                function update(){
                    var jsonData = $("#platformInfoPicture_updateForm").serialize();
                    var params = decodeURIComponent(jsonData,true);
                    var action ="/admin/platformInfoPicture/update";
                    $.post(action, params, function(data){
                        alert(data.meta.message);
                        window.location.href="${pageContext.request.contextPath}/admin/platformInfoPicture/cxList";
                    });
                }

                // $(function() {
                //     $(".p-content").each(function() {
                //         var content = $(this).html().trim();
                //         if (content.length > 8) {
                //             $(this).html(content.substr(0, 8) + "...");
                //         }
                //     })
                //     $(".p-content").tzTip();
                // });

                function del(id){
                    if(confirm("确认删除吗？")){
                        var action ="/admin/platformInfoPicture/del/"+id;
                        $.post(action, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/platformInfoPicture/cxList";
                        });
                    }
                }

			</script>

			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>