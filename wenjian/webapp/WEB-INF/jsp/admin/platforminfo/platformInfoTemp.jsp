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
 						<td>平台网址</td>
						<td>运营状态</td>
						<td>页面显示</td>
						<td>添加时间</td>
						<td>审核状态</td>
						<td>排位序号</td>
						<td>管理员备注</td>
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
								${item.websiteStr}
							</td>
	 						<td>
								<a onclick="querystatus('${item.operatingstatus}')" style="cursor:pointer;color: blue">
								<c:if test="${empty item.operatingstatus}">---</c:if>
								<c:if test="${item.operatingstatus==1}">正常</c:if>
								<c:if test="${item.operatingstatus==2}">跑路</c:if>
								<c:if test="${item.operatingstatus==3}">清盘</c:if>
								<c:if test="${item.operatingstatus==4}">高风险</c:if>
								<c:if test="${item.operatingstatus==5}">有争议</c:if>
								<c:if test="${item.operatingstatus==6}">延期兑付</c:if>
								<c:if test="${item.operatingstatus==7}">停业</c:if>
								<c:if test="${item.operatingstatus==8}">经侦介入</c:if>
								<c:if test="${item.operatingstatus==9}">提现困难</c:if>
								</a>
							</td>
							<td>
								<c:if test="${empty item.display}">---</c:if>
								<c:if test="${item.display==1}">显示</c:if>
								<c:if test="${item.display==0}">不显示</c:if>
							</td>
							<td>${empty item.addtime ? '':dateUtils.formatDate(item.addtime)}</td>
 							<td>
								<c:if test="${empty item.auditstatus}">---</c:if>
								<c:if test="${item.auditstatus==0}">待审核</c:if>
								<c:if test="${item.auditstatus==1}">审核通过</c:if>
								<c:if test="${item.auditstatus==2}">审核失败</c:if>
 	 						</td>
							<td>
								${item.sort}
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

			<script type="text/javascript">

				//查看详情
				function platform_detail(id){
					var action="/admin/platformInfo/detail1/"+id;
					$.post(basePath+action,function(data){
                         $("#detailsModal").modal({    // 调用模态框 设置点击框外区域 不被关闭
			                 backdrop: 'static',
			             });
			    		$("#detail-modal-body").html(data);  // body区域被 data信息 覆盖
			    	});
				}

                //查询需要修改的信息，并且跳转到修改页面  updateView/"+id封装了_Update.jsp操作
                function updateUI(id){
                    var action = "/admin/platformInfo/updateView/"+id;   //通过id查询出要修改的bean信息
                    $.post(action,function(data){
                        $("#update-modal-body").html(data);   // 这里为什么不写调用模态框的语句？
                    });
                }

                //修改后保存
                function update(){
                    var jsonData = $("#platformInfo_updateForm").serialize();  // 对编辑表单的数据进行序列化
                    var params = decodeURIComponent(jsonData,true);  // 解码
                    // var bv = $("#platformInfo_updateForm").data("bootstrapValidator");
                    //手动触发验证
                    // bv.validate();
                    var action ="/admin/platformInfo/update";
                    // if(bv.isValid()){
                        $.post(action, params, function(data){
                                alert(data.meta.message);
                                window.location.href="${pageContext.request.contextPath}/admin/platformInfo/lists";

                        });
                    // }

					/*post(action, params, function(data)
					action  执行的方法
					params 是编辑表单的数据，它进行了序列化与解码，要不然在action执行中，取不到bean值
 					function(data) data是action执行返回的结果
					 */
                }

                function del(id){
                    if(confirm("确认删除吗？")){
                    	var action ="/admin/platformInfo/del/"+id;
                    	$.post(action, function(data){
                        	alert(data.meta.message);
                        	window.location.href="${pageContext.request.contextPath}/admin/platformInfo/lists";
                    	});
					}
                }

                $(function() {
                    $(".p-content").each(function() {
                        var content = $(this).html().trim(); // 获取文本内容，并且去除空格
                        if (content.length > 8) {
                            $(this).html(content.substr(0, 8) + "..."); // 显示前8个字符，其它内容用...显示
                        }
                    })
                    $(".p-content").tzTip();  // 悬浮提示
                });

			</script>
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>