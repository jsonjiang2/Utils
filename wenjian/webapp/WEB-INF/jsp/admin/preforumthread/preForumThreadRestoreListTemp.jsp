<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<table class="table table-hover" id="personList_table">
 				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="allRestore" class="myCheck" onclick="PreForumThread.checkRestoreDelAll()">
						</td>
						<td>序号</td>
						<td>发布人</td>
 						<td>帖子标题</td>
 						<td>所属板块</td>
						<td>发布时间</td>
						<td>是否红包贴</td>
 						<td>状态</td>
 						<td>精华排位</td>
						<td>普通排位</td>
   						<td>操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<input type="checkbox" name="checkRestorename" class="myCheck" value="${item.tid}">
							</td>
							<td>${status.index+1}</td>
							<td>
								<a href="${basePath}/admin/preForumThread/delList?authorid=${item.authorid}"  style="color:blue;">
									<wdb:getUser uid="${item.authorid }" var="authorid">
										${authorid.username}-${authorid.realname == null ? "无" :authorid.realname }
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
									<c:choose>
										<c:when test="${item.displayorder == -1 }"><span style="color:red;">不合格</span></c:when>
										<c:when test="${item.displayorder == -2 }"><span style="color:#666;">审核中</span></c:when>
										<c:when test="${item.displayorder == -3 }"><span style="color:#DA70D6;">已删除</span></c:when>
	 									<c:when test="${item.displayorder == 0 }">合格</c:when>
	 								</c:choose>
	 						</td>
							<td>
								${item.dsort}
							</td>
							<td>
								${item.csort}
							</td>
							
 							<td>
 								<a class="btn btn-default" href="${basePath}/admin/preForumThread/editorThreadShow?tid=${item.tid}">编辑</a>
 	 							<button class="btn btn-default"  onclick="PreForumThread.updShow(this)" data-opid="${item.tid}" >操作</button>
  	 							<button class="btn btn-default"  onclick="PreForumThread.restoreThread(this)" data-opid="${item.tid}" >恢复</button>
  	 							<button class="btn btn-default" onclick="PreForumThread.detail('${item.tid}')">详情</button>
   	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<button class="btn btn-default"  onclick="PreForumThread.delRestoreThread(this)">批量恢复</button>
			
 			<div id="page_div" style="margin-top: 20px;">
				<!-- 页数 开始-->
				<div class="message">
					共<i class="blue">${pagehelper.total}</i>条记录，当前显示第&nbsp;<i class="blue">${pagehelper.pageNum}/${pagehelper.pages}</i>&nbsp;页
				</div>
				<div style="text-align: center;" id="pageCon">
					<ul class="pagination">
						<!-- <li><a href="#">&laquo;</a></li> -->
						<li id="liOne">
							<a href="javascript:queryAllPerson4(${pagehelper.firstPage}, ${pagehelper.pageSize});">&lt;&lt;首页</a>
						</li>
						<c:if test="${!pagehelper.isFirstPage}">
							<li>
								<a href="javascript:queryAllPerson4(${pagehelper.prePage}, ${pagehelper.pageSize});">&lt;前一页</a>
							</li>
						</c:if>
						<c:forEach items="${pagehelper.navigatepageNums}"
							var="navigatepageNum">
				
							<c:if test="${navigatepageNum==pagehelper.pageNum}">
								<li class="active">
									<a href="javascript:queryAllPerson4(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a>
								</li>
							</c:if>
							<c:if test="${navigatepageNum!=pagehelper.pageNum}">
								<li>
									<a href="javascript:queryAllPerson4(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${!pagehelper.isLastPage}">
							<li> 
								<a href="javascript:queryAllPerson4(${pagehelper.nextPage}, ${pagehelper.pageSize});">下一页&gt;</a>
							</li>
				
						</c:if>
						<li>
							<a href="javascript:queryAllPerson4(${pagehelper.lastPage}, ${pagehelper.pageSize});">尾页&gt;&gt;</a>
						</li>
						<!-- <li><a href="#">&raquo;</a></li> -->
					</ul>
				</div>
				<!-- 页数 结束-->
 			</div>