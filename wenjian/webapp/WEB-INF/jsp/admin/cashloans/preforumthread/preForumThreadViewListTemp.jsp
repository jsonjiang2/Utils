<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
 
<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
 						<td>序号</td>
						<td>发布人</td>
						<td>帖子标题</td>
 						<td>所属板块</td>
						<td>发布状态</td>
						<td>发布时间</td>
						<td>是否红包贴</td>
  						<td>详情</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
 							<td>${status.index+1}</td>
							<td>
								<a href="${basePath}/admin/cashloans/preForumThread/viewList?authorid=${item.authorid}"  style="color:blue;">
	  								<wdb:getUser uid="${item.authorid}" var="user">
										${user.username}-${empty user.realname ? '无' : user.realname}
									</wdb:getUser>
								</a>
							</td>
							<td>
								<c:if test="${item.fid eq '101'}">
									<a target="_blank" href="${url}lighthouseDetail-${item.tid}-1-1.html?wdaikey=fb9f74ac80fbf0d35ba2fcec10c93bff" style="color:blue;"> ${item.subjectsub}</a>
								</c:if>
								<c:if test="${item.fid eq '102'}">
									<a target="_blank" href="${url}demandmatchDetail-${item.tid}-1-1.html?wdaikey=fb9f74ac80fbf0d35ba2fcec10c93bff" style="color:blue;"> ${item.subjectsub}</a>
								</c:if>
 							</td>
 	 						<td>	
	 							 <a href="${basePath}/admin/cashloans/preForumThread/viewList?fid=${item.fid}"  style="color:blue;">
	 	 							<wdb:getPreForumForum fid="${item.fid }" var="preForumForum" >
		 								${ preForumForum.name}
		 							</wdb:getPreForumForum>
		 						</a>
	 						</td>
							<td>
								<a href="${basePath}/admin/cashloans/preForumThread/viewList?displayorder=${item.displayorder}"  style="color:blue;">
									<c:choose>
										<c:when test="${item.displayorder == -1 }"><span style="color:red;">不合格</span></c:when>
										<c:when test="${item.displayorder == -2 }"><span style="color:#666;">审核中</span></c:when>
 										<c:when test="${item.displayorder == -3 }"><span style="color:#DA70D6;">已删除</span></c:when>
	 									<c:when test="${item.displayorder == -4 }"><span style="color:#000;">草稿</span></c:when>
 	 									<c:when test="${item.displayorder == 0 }">合格</c:when>
	 								</c:choose>
 								</a>
							</td>
							<td>
								<wdb:formatDate value="${item.dateline }" var="dateline">
									${dateline }
								</wdb:formatDate>
							</td>
							<td>
								<c:choose>
									<c:when test="${item.isredpacket == 1}"><span style="color:red">是</span></c:when>
									<c:otherwise>否</c:otherwise>	
								</c:choose>
							</td>
							<td>
								<button class="btn btn-default" onclick="PreForumThread.detail('${item.tid}')">详情</button>
								<a class="btn btn-default" href="${basePath}/admin/cashloans/preForumThread/editorThreadShow?tid=${item.tid}&liststr=viewList">编辑</a>
 							</td>
						 </tr>
 					</c:forEach>
				</tbody>
			</table>
			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper2.jsp"%>
			</div>