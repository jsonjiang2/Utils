<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<table class="table table-hover" id="personList_table">
 				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="allDel" class="myCheck" onclick="PreForumThread.checkDelAll()">
						</td>
						<td>序号</td>
						<td>发布人</td>
 						<td>帖子标题</td>
 						<td>所属板块</td>
						<td>发布时间</td>
						<td>是否红包贴</td>
 						<td>精华排位</td>
						<td>普通排位</td>
   						<td>操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<input type="checkbox" name="checkDelName" class="myCheck" value="${item.tid}">
							</td>
							<td>${status.index+1}</td>
							<td>
								<a href="${basePath}/admin/preForumThread/delList?authorid=${item.authorid}"  style="color:blue;">
									<wdb:getUser uid="${item.authorid }" var="user">
										${user.username}-${user.realname == null ? "无" :user.realname }
									</wdb:getUser>
								</a>
							</td>
 							<td>
								 <a target="_blank" href="${url}thread-${item.tid}-1-1.html?wdaikey=fb9f74ac80fbf0d35ba2fcec10c93bff" style="color:blue;">${item.subjectsub}</a>
 							</td>
 	 						<td>
	 							<a href="${basePath}/admin/preForumThread/delList?fid=${item.fid }"  style="color:blue;">
		 							<wdb:getPreForumForum fid="${item.fid }" var="preForumForum" >
		 								${ preForumForum.name}
		 							</wdb:getPreForumForum>
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
								${item.dsort}
							</td>
							<td>
								${item.csort}
							</td>
							
 							<td>
 								<a class="btn btn-default" href="${basePath}/admin/preForumThread/editorThreadShow?tid=${item.tid}&liststr=delList">编辑</a>
 	 							<button class="btn btn-default"  onclick="PreForumThread.updShow(this)" data-opid="${item.tid}" >操作</button>
 	 							<c:if test="${item.ish5}">
 	 	 							<button class="btn btn-default"  onclick="PreForumThread.addMobileH5(this)" data-opid="${item.tid}" >添加到h5</button>
 	 							</c:if>
 	 							
  	 							<button class="btn btn-default"  onclick="PreForumThread.delShow(this)" data-opid="${item.tid}" >删除</button>
  	 							<button class="btn btn-default" onclick="PreForumThread.detail('${item.tid}')">详情</button>
   	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<button class="btn btn-default"  onclick="PreForumThread.delBatch(this)">批量删除</button>
 			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper3.jsp"%>
			</div>