<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>论坛名称</td>
						<td>审核状态</td>
						<td>标题</td>
						<td>内容</td>
 						<td>发布人</td>
						<td>发布时间</td>
 						<td>详情</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.index+1}</td>
							<td>网贷资讯</td>
							<td>
								<c:choose>
									<c:when test="${item.status == -1}">审核中</c:when>
									<c:when test="${item.status == -2}">审核失败</c:when>
									<c:when test="${item.status == -3}">已删除</c:when>
									<c:when test="${item.status == 0}">审核通过</c:when>
 									<c:otherwise>
 										未知
 									</c:otherwise>								
 								</c:choose>
 							</td>
							<td>
								<span title="${item.title}">
 	 								<c:choose>
										<c:when test="${fn:length(item.title)>20}">
											${fn:substring(item.title,0,20)}...
										</c:when>
										<c:otherwise>
											${item.title}
										</c:otherwise>
									</c:choose>
								</span>
							</td>
							<td>
 								<a target="_blank" href="${url}article-${item.aid}-1-1.html?wdaikey=fb9f74ac80fbf0d35ba2fcec10c93bff" class="btn btn-default" class="btn btn-default">查看</a>
 							</td>
 	 						<td>
 	 							<wdb:getUser uid="${item.uid }" var="uid">
 	 								${uid.username }
 	 							</wdb:getUser>
 	 						</td>
							<td>
								<wdb:formatDate value="${item.dateline }" var="dateline">
									${dateline}
								</wdb:formatDate>
							</td>
							<td>
								<button type="button" class="btn btn-default" onclick="PrePortalArticleTitle.detail('${item.aid}')">详情</button>
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
							<a href="javascript:queryAllPerson5(${pagehelper.firstPage}, ${pagehelper.pageSize});">&lt;&lt;首页</a>
						</li>
						<c:if test="${!pagehelper.isFirstPage}">
							<li>
								<a href="javascript:queryAllPerson5(${pagehelper.prePage}, ${pagehelper.pageSize});">&lt;前一页</a>
							</li>
						</c:if>
						<c:forEach items="${pagehelper.navigatepageNums}"
							var="navigatepageNum">
				
							<c:if test="${navigatepageNum==pagehelper.pageNum}">
								<li class="active">
									<a href="javascript:queryAllPerson5(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a>
								</li>
							</c:if>
							<c:if test="${navigatepageNum!=pagehelper.pageNum}">
								<li>
									<a href="javascript:queryAllPerson5(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${!pagehelper.isLastPage}">
							<li> 
								<a href="javascript:queryAllPerson5(${pagehelper.nextPage}, ${pagehelper.pageSize});">下一页&gt;</a>
							</li>
				
						</c:if>
						<li>
							<a href="javascript:queryAllPerson5(${pagehelper.lastPage}, ${pagehelper.pageSize});">尾页&gt;&gt;</a>
						</li>
						<!-- <li><a href="#">&raquo;</a></li> -->
					</ul>
				</div>
			</div>