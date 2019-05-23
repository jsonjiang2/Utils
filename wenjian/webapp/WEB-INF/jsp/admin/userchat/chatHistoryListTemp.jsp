<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
        <table class="table table-hover"  style="margin-top:25px;" border="1">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>发送者</td>
						<td>接收者</td>
						<td>信息时间</td>
                        <td>内容</td>
 						<td>操作</td>
 					</tr>
				</thead>
				<tbody>
					<c:forEach items="${data}" var="item" varStatus="status">
						<tr class="text-center">
                            <td style="width: 5%">${status.index+1}</td>
                            <td style="width: 15%">
									<wdb:getUser uid="${item.senduid}" var="SendUserChatHistory">
										<a style="color: blue" href="${basePath}/admin/userChatHistory/getFrontContentListAdmin?sendName=${SendUserChatHistory.username}">${SendUserChatHistory.username }</a>
									</wdb:getUser>
                            </td>
                            <td style="width: 15%">
									<wdb:getUser uid="${item.receiveuid}" var="ReceiveUserChatHistory">
										<a style="color: blue" href="${basePath}/admin/userChatHistory/getFrontContentListAdmin?recevName=${ReceiveUserChatHistory.username}">${ReceiveUserChatHistory.username }</a>
									</wdb:getUser>
                            </td>
                            <td style="width: 15%">
                                    <wdb:formatDate value="${item.receivedate}" var="receivedates">
                                        ${receivedates}
                                    </wdb:formatDate>
                            </td>
                            <td>
                                <c:if test="${item.chatmessage!=null and item.chatmessage!=''}">
                                    <c:choose>
                                        <c:when test="${fn:length(item.chatmessage)>70}">
                                            ${fn:substring(item.chatmessage, 0, 70)}...
                                        </c:when>
                                        <c:otherwise>${item.chatmessage}</c:otherwise>
                                    </c:choose>
                                </c:if>
                            </td>
                            <td style="width: 5%">
								<button class="btn btn-default" data-backdrop="static" data-toggle="modal"
										data-dismiss="modal" data-target="#detailsModal2"
										onclick="getChatHistoryById('${item.id}')">查看
								</button>
                            </td>
 						</tr>
 					</c:forEach>
				</tbody>
			</table>

            <div style="margin-top: 20px;">
				<!-- 页数 -->
					<div class="message">
                        <input type="text" id="pageNums" name="pageNum" value="${pagehelper.pageNum}" style="display: none" />
                        <input type="text" id="pageSizes" name="pageSize" value="${pagehelper.pageSize}"  style="display: none" />
						共<i class="blue">${pagehelper.total}</i>条记录，当前显示第&nbsp;<i class="blue">${pagehelper.pageNum}/${pagehelper.pages}</i>&nbsp;页
					</div>
					<div style="text-align: center;">
						<ul class="pagination">
							<!-- <li><a href="#">&laquo;</a></li> -->
							<li id="liOne">
								<a href="javascript:queryAllhistory(${pagehelper.firstPage},${pagehelper.pageSize})">&lt;&lt;首页</a>
							</li>
							<c:if test="${!pagehelper.isFirstPage}">
								<li>
									<a href="javascript:queryAllhistory(${pagehelper.prePage}, ${pagehelper.pageSize});">&lt;前一页</a>
								</li>
							</c:if>
							<c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">
								<c:if test="${navigatepageNum==pagehelper.pageNum}">
									<li class="active">
										<a href="javascript:queryAllhistory(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a>
									</li>
								</c:if>
								<c:if test="${navigatepageNum!=pagehelper.pageNum}">
									<li>
										<a href="javascript:queryAllhistory(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${!pagehelper.isLastPage}">
								<li>
									<a href="javascript:queryAllhistory(${pagehelper.nextPage}, ${pagehelper.pageSize});">下一页&gt;</a>
								</li>
							</c:if>
							<li>
								<a href="javascript:queryAllhistory(${pagehelper.lastPage}, ${pagehelper.pageSize});">尾页&gt;&gt;</a>
							</li>
						</ul>
					</div>
			</div>

        <script>
            //查看内容
            function getChatHistoryById(id){
                var  action = "/admin/userChatHistory/getChatHistoryById/";
                $.post(action,{"id":id},function(data){
                    var content = data;
                    $("#detail-modal-body2").html(content);
                    $("#detailsModal2").modal("show");
                });
            }

            function queryAllhistory(pageNum,pageSize){
                $("#pageNum").val(pageNum);
                $("#pageSize").val(pageSize);
                $("#getFrontContentListAdmin").submit();
            }

            //清楚内容缓存
            function clearContent(){
                $("#detail-modal-body2").html("");
            }

        </script>