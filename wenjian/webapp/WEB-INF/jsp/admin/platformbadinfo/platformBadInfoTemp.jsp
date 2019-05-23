<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">   <!--复选框-->
						<td>
							<input type="checkbox" id="allDel" class="myCheck" onclick="checkDelAll()">
						</td>
						<td>序号</td>
						<td>平台编号</td>
						<td>平台名称</td>
						<td>标题</td>
						<td>是否显示</td>
						<td>精华状态</td>
						<td>澄清状态</td>
						<td>文章类型</td>
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
							<td class="p-content" tip="${item.title}">
								${item.title}
							</td>
							<td>
								<a onclick="querystatus('${item.status}')" style="cursor:pointer;color: blue">
									<c:if test="${empty item.status}">---</c:if>
									<c:if test="${item.status==1}">显示</c:if>
									<c:if test="${item.status==0}">不显示</c:if>
								</a>
							</td>
							<td>
								<a onclick="queryelitestatus('${item.elitestatus}')" style="cursor:pointer;color: blue">
									<c:if test="${empty item.elitestatus}">---</c:if>
									<c:if test="${item.elitestatus==1}">精华</c:if>
									<c:if test="${item.elitestatus==0}">普通</c:if>
								</a>
							</td>
							<td>
								<a onclick="queryclearstatus('${item.clearstatus}')" style="cursor:pointer;color: blue">
									<c:if test="${empty item.clearstatus}">---</c:if>
									<c:if test="${item.clearstatus==1}">已澄清</c:if>
									<c:if test="${item.clearstatus==0}">未澄清</c:if>
								</a>
							</td>
							<td>
								<c:if test="${empty item.wztype}">---</c:if>
								<c:if test="${item.wztype==1}">标题包含</c:if>
								<c:if test="${item.wztype==2}">内容包含</c:if>
								<c:if test="${item.wztype==3}">外部文章</c:if>
							</td>
							<td class="p-content" tip="${item.remark}">
									${item.remark}
							</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="platform_detail(${item.id})">详情</button>
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

			<button class="btn btn-default" onclick="delBatch()">批量删除</button>

			<script type="text/javascript">

				function platform_detail(id){
					var action="/admin/platformBadInfo/detail/"+id;
					$.post(basePath+action,function(data){
			    		 $("#detailsModal").modal({
			                 backdrop: 'static',
			             });
			    		$("#detail-modal-body").html(data);
			    	});
				}

                function updateUI(id){
                    var action = "/admin/platformBadInfo/updateView/"+id;
                    $.post(action,function(data){
                        $("#update-modal-body").html(data);
                    });
                }

                function del(id){
                    if(confirm("确认删除吗？")){
                        var action ="/admin/platformBadInfo/del/"+id;
                        $.post(action, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/platformBadInfo/lists";
                        });
                    }
                }

                //Del全选
                function checkDelAll(){
                    var all = document.getElementById('allDel'); //获取到点击全选的那个复选框的id
                    var one = document.getElementsByName('checkDelName'); //获取到复选框的名称
                    //因为获得的是数组，所以要循环 为每一个checked赋值
                    for(var i=0;i<one.length;i++){
                        one[i].checked = all.checked;
                    }
                }
                //批量删除
                function delBatch(){
                    var number = "";
                    $("input:checkbox[name=checkDelName]:checked").each(function(k){
                        if(k == 0){
                            number = $(this).val();
                        }else{
                            number += ","+$(this).val();  // 获取id字符串 "1,2,3..."
                        }
                    });
                    if(isEmpty(number)){
                        alert("请至少选择一行数据！");
                        return ;
                    }
                    var qr = confirm("您确定要这些数据吗？"); // 删除前确认
                    if(!qr){
                        return ;
                    }
                    var url = basePath+"/admin/platformBadInfo/delMany";
                    var callback = function(data){
                        alert(data.meta.message);
                        window.location.href = basePath+"/admin/platformBadInfo/lists";
                    }
                    $.post(url,{"ids":number},callback);  // 执行完url(删除),执行callback
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

				// 导入负面
				function collect() {
                    var action ="/admin/platformBadInfo/collect";
                    $.post(action, function(data){
                        alert(data.meta.message);
                        window.location.href="${pageContext.request.contextPath}/admin/platformBadInfo/lists";
                    });
                }

			</script>

			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>