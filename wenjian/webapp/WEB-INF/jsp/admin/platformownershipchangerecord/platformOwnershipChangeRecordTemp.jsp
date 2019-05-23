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
						<td>股东信息</td>
						<td>变更时间</td>
						<td>股权变更前</td>
						<td>股权变更后</td>
						<td>公示时间</td>
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
							<td class="p-content" tip="${item.shareholder}">
								${item.shareholder}
							</td>
							<td>${empty item.changetime ? '':dateUtils.formatDate(item.changetime)}</td>
							<td class="p-content" tip="${item.aheadamount}">
								${item.aheadamount}
							</td>
							<td class="p-content" tip="${item.afteramount}">
								${item.afteramount}
							</td>
							<td>${empty item.publicity ? '':dateUtils.formatDate(item.publicity)}</td>
 	 						<td>
 	 							<button class="btn btn-default" onclick="platformOwnershipChangeRecord_detail(${item.id})">查看</button>
 	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>

			</table>

			<script type="text/javascript">

				function platformOwnershipChangeRecord_detail(id){
					var action="/admin/platformOwnershipChangeRecord/getById/"+id;
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