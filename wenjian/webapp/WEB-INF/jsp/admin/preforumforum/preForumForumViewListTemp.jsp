<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-hover" id="personList_table" style="margin-top:25px;">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>平台名称</td>
						<td>产品名称</td>
						<td>综合年化</td>
 						<td>预约品号</td>
						<td>产品编号</td>
						<td>预约人数</td>
						<td>预约保证金</td>
						<td>状态</td>
 						<td>详情</td>
 					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.index+1}</td>
							<td>
								<a href="${basePath}/admin/subscribeProduct/viewList?pno=${item.platformproduct.pno}" style="color:blue;">${item.platformproduct.pname}</a>
							</td>
							<td>${item.platformproduct.ppname}</td>
							<td>${item.platformproduct.totalinterest}</td>
	 						<td>${item.subsno}</td>
							<td>${item.ppno}</td>
							<td>${item.count}</td>
							<td>${item.earnestmoney}</td>
							<td> 
								<c:choose>
									<c:when test="${item.status == 1}">预约中</c:when>
									<c:when test="${item.status == 2}">成功 </c:when>
									<c:when test="${item.status == 3}">失败</c:when>
 								</c:choose>
							</td>
	 						<td>
	 							<button class="btn btn-default" onclick="subscribeProductObject.detail('${item.id}')">详情</button>
	 						</td>
 						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<div id="page_div" style="margin-top: 20px;">
				<!-- 页数 -->
					<div class="message">
						共<i class="blue">${pagehelper.total}</i>条记录，当前显示第&nbsp;<i class="blue">${pagehelper.pageNum}/${pagehelper.pages}</i>&nbsp;页
					</div>
					<div style="text-align: center;" id="pageCon">
						<ul class="pagination">
							<!-- <li><a href="#">&laquo;</a></li> -->
							<li id="liOne">
								<a href="javascript:queryAllPersonView(${pagehelper.firstPage}, ${pagehelper.pageSize});">&lt;&lt;首页</a>
							</li>
							<c:if test="${!pagehelper.isFirstPage}">
								<li>
									<a href="javascript:queryAllPersonView(${pagehelper.prePage}, ${pagehelper.pageSize});">&lt;前一页</a>
								</li>
							</c:if>
							<c:forEach items="${pagehelper.navigatepageNums}"
								var="navigatepageNum">
					
								<c:if test="${navigatepageNum==pagehelper.pageNum}">
									<li class="active">
										<a href="javascript:queryAllPersonView(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a>
									</li>
								</c:if>
								<c:if test="${navigatepageNum!=pagehelper.pageNum}">
									<li>
										<a href="javascript:queryAllPersonView(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${!pagehelper.isLastPage}">
								<li> 
									<a href="javascript:queryAllPersonView(${pagehelper.nextPage}, ${pagehelper.pageSize});">下一页&gt;</a>
								</li>
					
							</c:if>
							<li>
								<a href="javascript:queryAllPersonView(${pagehelper.lastPage}, ${pagehelper.pageSize});">尾页&gt;&gt;</a>
							</li>
							<!-- <li><a href="#">&raquo;</a></li> -->
						</ul>
					</div>
			</div>