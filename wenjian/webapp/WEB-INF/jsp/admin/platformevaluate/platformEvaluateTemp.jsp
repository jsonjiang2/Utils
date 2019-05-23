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
						<td>评价倾向</td>
						<td>评价内容</td>
						<td>评价时间</td>
						<td>定位序号</td>
						<td>是否显示</td>
						<td>备注</td>
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
								<a onclick="queryevaluationtendency('${item.evaluationtendency}')" style="cursor:pointer;color: blue">
									<c:if test="${empty item.evaluationtendency}">---</c:if>
									<c:if test="${item.evaluationtendency==1}">好评</c:if>
									<c:if test="${item.evaluationtendency==2}">一般</c:if>
									<c:if test="${item.evaluationtendency==3}">差评</c:if>
								</a>
							</td>
							<td class="p-content" tip="${item.evaluationcontent}">
								${item.evaluationcontent}
							</td>
							<td>${empty item.evaluationtime ? '':dateUtils.formatDate(item.evaluationtime)}</td>
							<td>${item.sort}</td>
							<td>
								<a onclick="querydisplay('${item.display}')" style="cursor:pointer;color: blue">
									<c:if test="${empty item.display}">---</c:if>
									<c:if test="${item.display==0}">不显示</c:if>
									<c:if test="${item.display==1}">显示</c:if>
								</a>
							</td>
 	 						<td class="p-content" tip="${item.remark==null ? '无备注信息' : item.remark}">
									${item.remark}
							</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="evaluate_detail(${item.id})">详情</button>
								<button class="btn" data-backdrop="static"
										data-toggle="modal" data-dismiss="modal"
										data-target="#updateModal"
										onclick="updateUI('${item.id}')">修改</button>
								<%--<button class="btn btn-default" onclick="del('${item.id}')">删除</button>--%>
 	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>

		    <button class="btn btn-default" onclick="delBatch()">批量删除</button>

			<script type="text/javascript">

				function evaluate_detail(id){
					var action="/admin/platformEvaluate/detail1/"+id;
					$.post(basePath+action,function(data){
			    		 $("#detailsModal").modal({
			                 backdrop: 'static'
			             });
			    		$("#detail-modal-body").html(data);
			    	});
				}

				function updateUI(id) {
					var action = "/admin/platformEvaluate/updateView/"+id;
					$.post(action,function (data) {
                        $("#update-modal-body").html(data);
                    });
                }
                function update() {
				    var jsonData = $("#platformEvaluate_updateForm").serialize();
				    var params = decodeURIComponent(jsonData,true);
				    var action = "/admin/platformEvaluate/update";
                    $.post(action,params, function(data){
                        alert(data.meta.message);
                        window.location.href="${pageContext.request.contextPath}/admin/platformEvaluate/cxList";
                    });
                }

                function del(id){
                    if(confirm("确认删除吗？")){
                        var action ="/admin/platformEvaluate/del/"+id;
                        $.post(action, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/platformEvaluate/cxList";
                        });
                    }
                }

                function checkDelAll(){
                    var all = document.getElementById('allDel');
                    var one = document.getElementsByName('checkDelName');
                    for(var i=0;i<one.length;i++){
                        one[i].checked = all.checked;
                    }
                }
                function delBatch(){
                    var number = "";
                    $("input:checkbox[name=checkDelName]:checked").each(function(k){
                        if(k == 0){
                            number = $(this).val();
                        }else{
                            number += ","+$(this).val();
                        }
                    });
                    if(isEmpty(number)){
                        alert("请至少选择一行数据！");
                        return ;
                    }
                    var qr = confirm("您确定要这些数据吗？");
                    if(!qr){
                        return ;
                    }
                    var url = basePath+"/admin/platformEvaluate/delMany";
                    var callback = function(data){
                        alert(data.meta.message);
                        window.location.href = basePath+"/admin/platformEvaluate/cxList";
                    }
                    $.post(url,{"ids":number},callback);
                }

                $(function() {
                    $(".p-content").each(function() {
                        var content = $(this).html().trim(); // 获取文本内容，并且去除空格
                        if (content.length > 10) {
                            $(this).html(content.substr(0, 10) + "..."); // 显示前5个字符，其它内容用...显示
                        }
                    })
                    $(".p-content").tzTip();  // 悬浮提示
                });

			</script>

			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>