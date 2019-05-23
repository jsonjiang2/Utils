<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="allDel" class="myCheck" onclick="PrePortalArticleTitle.checkDelAll()">
						</td>
						<td>序号</td>
						<td>论坛名称</td>
						<td>审核状态</td>
						<td>标题</td>
						<td>内容</td>
 						<td>发布人</td>
						<td>发布时间</td>
						<td>排位</td>
 						<td>操作</td>
 						<td>详情</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<input type="checkbox" name="checkDelName" class="myCheck" value="${item.aid}" />
							</td>
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
							<td>${item.sort }</td>
							<td>
								 <a class="btn btn-default" href="${basePath}/admin/prePortalArticle/editorArticleShow?aid=${item.aid}">编辑</a>
 								<button type="button" class="btn btn-default" onclick="PrePortalArticleTitle.updShow(this)" data-opid="${item.aid}" data-updlist="upd">操作</button>
								<button type="button" class="btn btn-default" onclick="PrePortalArticleTitle.del(this)" data-opid="${item.aid}">删除</button>
								
							</td>
							<td>
								<button type="button" class="btn btn-default" onclick="PrePortalArticleTitle.detail('${item.aid}')">详情</button>
   	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<button type="button" class="btn btn-default" onclick="PrePortalArticleTitle.delBatch(this)">批量删除</button>
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper2.jsp"%>
			</div>