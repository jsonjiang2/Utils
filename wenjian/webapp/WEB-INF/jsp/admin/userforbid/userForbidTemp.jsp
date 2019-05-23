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
						<td>禁止类型</td>
						<td>类型内容</td>
						<td>禁止内容</td>
						<td>禁止天数</td>
						<td>添加人</td>
						<td>添加时间</td>
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
							<td>
								<a onclick="queryforbidtype('${item.forbidtype}')" style="cursor:pointer;color: blue">
									<c:if test="${empty item.forbidtype}">---</c:if>
									<c:if test="${item.forbidtype==1}">IP</c:if>
									<c:if test="${item.forbidtype==2}">用户名</c:if>
									<c:if test="${item.forbidtype==3}">回复审核</c:if>
								</a>
							</td>
							<td>${item.typecontent}</td>
							<td>
								<a onclick="queryforbidcontent('${item.forbidcontent}')" style="cursor:pointer;color: blue">
									<c:if test="${empty item.forbidcontent}">---</c:if>
									<c:if test="${item.forbidcontent==1}">登录</c:if>
									<c:if test="${item.forbidcontent==2}">发帖</c:if>
									<c:if test="${item.forbidcontent==3}">回复</c:if>
									<c:if test="${item.forbidcontent==4}">访问</c:if>
								</a>
							</td>
							<td>
								${empty item.forbiddaynum ? '永久':item.forbiddaynum}
							</td>
							<td>
								${item.addman}
							</td>
							<td>
								${empty item.addtime ? '':dateUtils.formatDate(item.addtime)}
							</td>
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
                    var action = "/admin/userForbid/updateView/"+id;
                    $.post(action,function(data){
                        $("#update-modal-body").html(data);
                    });
                }
                function update(){
                    var jsonData = $("#userForbid_updateForm").serialize();
                    var params = decodeURIComponent(jsonData,true);
                    var forbidTypeVal = $(".form-horizontal .forInp").val();
                    var typeContentVal = $(".form-horizontal .typecontentDiv .typecontentVal").val();
                    var shifouxianshi = true;
                    if (forbidTypeVal == "2"){
                        $.ajax({
                            type : "POST",
                            async: false,    //或true,是否异步
                            url : basePath + "/admin/userForbid/checkUserName",
                            data : {
                                userName:typeContentVal
                            },
                            dataType:'json',
                            success : function(result) {
                                if (result.code == "88") {
                                    alert(result.message);
                                    shifouxianshi = false;
                                    return;
                                }else {
                                }
                            }
                        });
                    }
                    if (shifouxianshi){
                        var action ="/admin/userForbid/update";
                        $.post(action,params, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/userForbid/cxList";
                        });
                    }
                }

                function del(id){
                    if(confirm("确认删除吗？")){
                        var action ="/admin/userForbid/del/"+id;
                        $.post(action, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/userForbid/cxList";
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