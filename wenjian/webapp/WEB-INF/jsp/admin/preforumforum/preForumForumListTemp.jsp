<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>论坛名称</td>
						<td>显示状态</td>
						<td>显示顺序</td>
 						<td>主题数量  </td>
						<td>帖子数量</td>
						<td>今日发帖数量</td>
						<td>今年发帖数量</td>
 						<td>操作</td>
  						<td>详情</td>
 					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.index+1}</td>
							<td>${item.name}</td>
							<td>
								<c:choose>
									<c:when test="${item.status == 0}">不显示</c:when>
									<c:when test="${item.status == 1}">显示</c:when>
 								</c:choose>
 							</td>
							<td>${item.displayorder}</td>
	 						<td>${item.threads}</td>
							<td>${item.posts}</td>
							<td>${item.todayposts}</td>
							<td>${item.yesterdayposts}</td>
							<td>
	 							<a class="btn btn-default" href="${basePath}/admin/preForumForum/updateView/${item.fid}">修改</a>
	 							<button class="btn btn-default"  onclick="preForumForum.pre_del('${item.fid}')">删除</button>
 	 						</td>
	 						<td>
	 							<button class="btn btn-default" onclick="preForumForum.pre_detail('${item.fid}')">详情</button>
	 						</td>
 						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>