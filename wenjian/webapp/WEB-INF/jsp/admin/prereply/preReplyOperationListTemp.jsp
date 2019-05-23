<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>
							<input type="checkbox" id="allDel" class="myCheck" onclick="PreReply.checkDelAll()">
						</td>
						<td>序号</td>
						<td>发布人</td>
						<td>回复标题</td>
 						<td>回复内容  </td>
						<td>所属板块</td>
						<td>状态</td>
 						<td>发布时间</td>
  						<td>操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vos}" var="item" varStatus="status">
						<tr class="text-center">
							<td>
								<input type="checkbox" name="checkDelName" class="myCheck" value="${item.id}">
							</td>
							<td>${status.index+1}</td>
							<td>
								<a href="${basePath}/admin/preReply/operationList?uid=${item.uid }"  style="color:blue;">
 									<wdb:getUser uid="${item.uid }" var="user">
										${user.username}
									</wdb:getUser>
								</a>
							</td>
 							<td>
 								 <a href="${basePath}/admin/preReply/operationList?cid=${item.cid}" style="color:blue;">
								 	<span title="${item.subject }">${item.subsubject}</span>
								</a>
							</td>
							<td>
								 <a href="${item.subjecturl}" target="_blank" style="color:blue;">	
								  	${item.messagecutimg }
								  </a>
							</td>
	 						<td>	
	 							<a href="${basePath}/admin/preReply/operationList?typeid=${item.typeid}"  style="color:blue;">
		 							 <c:choose>
		 							 	<c:when test="${item.typeid == 1 }">巴士茶馆</c:when>
		 							 	<c:when test="${item.typeid == 2 }">网贷资讯</c:when>
		 							 	<c:when test="${item.typeid == 3 }">黑羊头</c:when>
										 <c:when test="${item.typeid == 4 }">曝光台</c:when>
										 <c:when test="${item.typeid == 5 }">需求撮合</c:when>
		 							 	<c:otherwise>
		 							 		未知
		 							 	</c:otherwise>
		 							 </c:choose>
	 							</a>
		 					</td>
		 					<td>
		 						<a href="${basePath}/admin/preReply/operationList?status=${item.status}"  style="color:blue;">
									<c:choose>
										<c:when test="${item.status == -1 }"><span style="color:#666;">审核中</span></c:when>
										<c:when test="${item.status == -2 }"><span style="color:red;">不合格</span></c:when>
										<c:when test="${item.status == -3 }"><span style="color:#DA70D6;">已删除</span></c:when>
	 									<c:when test="${item.status == 0 }">合格</c:when>
	 								</c:choose>
 								</a>
		 					</td>
							<td>
								<wdb:formatDate value="${item.dateline }" var="dateline">
									${dateline }
								</wdb:formatDate>
							</td>
  							<td>
 		  					    <a class="btn btn-default"  href="${basePath}/admin/preReply/editorPreReplyShow?opid=${item.id}&liststr=operationList">编辑</a>
    	 					    <button class="btn btn-default"  onclick="PreReply.del(this)" data-opid="${item.id}">删除</button>
 	 						    <button class="btn btn-default" onclick="PreReply.detail('${item.id}')">详情</button>
  	 						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
			<button class="btn btn-default"  onclick="PreReply.delBatch(this)">批量删除</button>
 			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper3.jsp"%>
			</div>