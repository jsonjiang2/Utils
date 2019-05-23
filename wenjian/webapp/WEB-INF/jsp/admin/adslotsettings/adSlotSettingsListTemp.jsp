<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<script type="text/javascript" src="${basePath}/static/js/admin/advertising/advertising.js"></script>
<style>
    .black_overlay{
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: black;
        z-index:1001;
        -moz-opacity: 0.2;
        opacity:.60;
        filter: alpha(opacity=20);
        text-align: center;
        overflow: scroll;
    }
    .imag_relative{
        position: relative;
        top: 40%;
        text-decoration: none;

    }
    .offWindows{
        position: absolute;
        right: 50px;
        top: 50px;
        color: white;
        font-size: 20px;
    }
    .remarkDiv{
        position: absolute;
        top: 20%;
        left: 35%;
        width: 30%;
        height: 40%;
        background-color: white;
        z-index:  9999;
        border: 5px;
        solid-color: #0f0f0f;
    }
    .iframeWindow{
        display: none;
    }
</style>
        <table class="table table-hover" id="personList_table" style="margin-top:25px;">
				<thead>
					<tr  rowspan="2" class="text-center" style="background: #ccc;">
						<td rowspan="2">序号</td>
						<td rowspan="2">属性</td>
						<td rowspan="2">广告位</td>
						<td rowspan="2">设置帖子</td>
						<td colspan="3">按天销售</td>
                        <td colspan="3">按周销售</td>
                        <td colspan="3">按年销售</td>
						<td rowspan="2">广告位锁定</td>
						<td rowspan="2">巴士广告位分润</td>
 						<td rowspan="2">操作</td>
 						<td rowspan="2">设置时间</td>
                        <td rowspan="2">设置人</td>
 					</tr>
                    <tr class="text-center" style="background: #ccc;">
                        <td>开关</td>
                        <td>价格</td>
                        <td>最底起购</td>
                        <td>开关</td>
                        <td>价格</td>
                        <td>最底起购</td>
                        <td>开关</td>
                        <td>价格</td>
                        <td>最底起购</td>
                    </tr>
				</thead>
				<tbody>
					<c:forEach items="${data}" var="item" varStatus="status">
						<tr class="text-center">
                            <td>
                                <c:choose>
                                    <c:when test="${item.adsort == 1}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?adsort=${item.adsort}" style="color:#0060FF;">
                                            特殊
                                        </a>
                                    </c:when>
                                    <c:when test="${item.adsort == 2}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?adsort=${item.adsort}" style="color:#0060FF;">
                                            通用
                                        </a>
                                    </c:when>
                                    <%--<c:when test="${item.adsort == 0}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?adsort=${item.adsort}" style="color:#0060FF;">
                                            通用
                                        </a>
                                    </c:when>
                                    <c:when test="${item.adsort == 2}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?adsort=${item.adsort}" style="color:#0060FF;">
                                            默认
                                        </a>
                                    </c:when>--%>
                                </c:choose>
                            </td>
                            <td>${status.index+1}</td>
                            <td>
                                <wdb:getUser uid="${item.uid}" var="user">
                                    <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?adUserName=${user.username}" style="color:#0060FF;">
                                            ${user.username}
                                    </a>
                                </wdb:getUser>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.adsort == 0}">
                                        ${item.tNum}篇
                                    </c:when>
                                    <c:when test="${item.adsort == 1}">
                                        <%-- -- --%>
                                        ${item.tNum}篇
                                    </c:when>
                                    <c:when test="${item.adsort == 2}">
                                        所有帖子
                                    </c:when>
                                </c:choose>

                            </td>

                            <td>
                                <c:choose>
                                    <c:when test="${item.addaystatus == 0}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?addaystatus=${item.addaystatus}" style="color:red;">
                                            关
                                        </a>
                                    </c:when>
                                    <c:when test="${item.addaystatus == 1}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?addaystatus=${item.addaystatus}" style="color:#0060FF;">
                                            开
                                        </a>
                                    </c:when>
                                </c:choose>
                            </td>
							<td>${item.addayprice}</td>
							<td>${item.adday}天</td>

                            <td>
                                <c:choose>
                                    <c:when test="${item.adweekstatus == 0}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?adweekstatus=${item.adweekstatus}" style="color:red;">
                                            关
                                        </a>
                                    </c:when>
                                    <c:when test="${item.adweekstatus == 1}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?adweekstatus=${item.adweekstatus}" style="color:#0060FF;">
                                            开
                                        </a>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>${item.adweekprice}</td>
                            <td>${item.adweek}周</td>

                            <td>
                                <c:choose>
                                    <c:when test="${item.adyearstatus == 0}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?adyearstatus=${item.adyearstatus}" style="color:red;">
                                            关
                                        </a>
                                    </c:when>
                                    <c:when test="${item.adyearstatus == 1}">
                                        <a href="${basePath}/admin/adSlotSettings/getAdSlotListByUserId?adyearstatus=${item.adyearstatus}" style="color:#0060FF;">
                                            开
                                        </a>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>${item.adyearprice}</td>
                            <td>${item.adyear}年</td>

                            <td>${item.adlock}</td>
                            <td>${item.busincome*100}%</td>
                            <td>
                                <button class="btn btn-default" data-backdrop="static" data-toggle="modal"
                                        data-dismiss="modal" data-target="#updateModal"
                                        onclick="updateUI('${item.id}','${item.adsort}')">修改
                                </button>

                                <button class="btn btn-default" data-backdrop="static" data-toggle="modal"
                                       <%-- data-dismiss="modal" data-target="#delModal"--%>
                                        onclick="deleteAdvertising('${item.id}')">删除
                                </button>

                            </td>
                            <td>
                                    ${dateUtils.formatDate(item.dateline)}
                            </td>
                            <td>
                                <wdb:getAdminUser uid="${item.operatorId}" var="admin">
                                    ${admin.username}
                                </wdb:getAdminUser>
                            </td>
 						</tr>
 					</c:forEach>
				</tbody>
			</table>

            <div id="page_div" style="margin-top: 20px;">
				<!-- 页数 -->
					<div class="message">
                        <input type="text" id="pageNums" name="pageNum" value="${pagehelper.pageNum}" style="display: none" />
                        <input type="text" id="pageSizes" name="pageSize" value="${pagehelper.pageSize}"  style="display: none" />
						共<i class="blue">${pagehelper.total}</i>条记录，当前显示第&nbsp;<i class="blue">${pagehelper.pageNum}/${pagehelper.pages}</i>&nbsp;页
					</div>
					<div style="text-align: center;" id="pageCon">
						<ul class="pagination">
							<!-- <li><a href="#">&laquo;</a></li> -->
							<li id="liOne">
								<a href="javascript:queryAllhistory(${pagehelper.firstPage}, ${pagehelper.pageSize});">&lt;&lt;首页</a>
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
            function deleteAdvertising(id) {
                if (!confirm("确认要删除？")) {
                    window.event.returnValue = false;
                }else{
                    $.ajax({
                        type: "post",
                        url: basePath+"/admin/adSlotSettings/DeleteAdSetting",
                        data: {"id":id},
                        dataType: "json",
                        async:false,
                        success: function(jsonResult){
                            alert("删除成功!")
                            window.location.reload(true);
                        },
                        error: function (data) {
                            alert("删除失败!")
                        }
                    });
                }
            }
            function updateUI(id,adsort){
                var  action = "/admin/adSlotSettings/getOneAdSlotAndPose/";
                $.post(action,{"id":id,"ad_sort":adsort},function(data){
                    $("#update-modal-body").html(data);
                });
            }
        </script>