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
						<td>资料名称</td>
						<td>文件格式</td>
						<td>上传用户</td>
						<td>上传时间</td>
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
								${item.datumname}
							</td>
							<td>
								${item.form}
							</td>
							<td>
								${item.username}
							</td>
							<td>
								${empty item.uploadtime ? '':dateUtils.formatYY_MM_DD(item.uploadtime)}
							</td>
 	 						<td>
								<button class="btn btn-default"><a href="${fdfsurl}${item.datumurl}" download="${item.datumname}.${item.form}"></a>下载</button>
								<button class="btn btn-default" onclick="del('${item.id}')">删除</button>
 	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">

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