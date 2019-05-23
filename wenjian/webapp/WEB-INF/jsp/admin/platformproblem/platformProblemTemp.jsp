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
						<td>问题描述</td>
						<td>手机号</td>
						<td>平台人员</td>
						<td>报错时间</td>
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
							<td class="p-content" tip="${item.problem}">
								${item.problem}
							</td>
							<td>${item.mobile}</td>
							<td>
								<c:if test="${item.isuser==1}">是</c:if>
								<c:if test="${item.isuser==0}">否</c:if>
							</td>
							<td>
								${empty item.dealtime ? '---':dateUtils.formatDate(item.dealtime )}
							</td>

 	 						<td>
								<button class="btn btn-default" onclick="del('${item.id}')">删除</button>
 	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>

			<button class="btn btn-default" onclick="delBatch()">批量删除</button>

			<script type="text/javascript">

                function del(id){
                    if(confirm("确认删除吗？")){
                        var action ="/admin/platformProblem/del/"+id;
                        $.post(action, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/platformProblem/lists";
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
                    var url = basePath+"/admin/platformProblem/delMany";
                    var callback = function(data){
                        alert(data.meta.message);
                        window.location.href = basePath+"/admin/platformProblem/lists";
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

			</script>

			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>