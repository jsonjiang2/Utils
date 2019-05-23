<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<script type="text/javascript" src="${basePath}/static/js/admin/adImage/adImage.js"></script>
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
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>
                            <input type="checkbox" name="allPass" id = "allSelect" onclick="ad.allSelect('xiajia')" title="全选" />&nbsp;全选
                        </td>
						<td>广告主</td>
						<td>广告图</td>
						<td>广告链接</td>
						<td>尺寸</td>
						<td>状态</td>
						<td>引用次数</td>
 						<td>操作</td>
						<td>操作备注</td>
                        <td>详情</td>
 					</tr>
				</thead>
				<tbody>
					<c:forEach items="${data}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.index+1}</td>
                            <td style="display: none">
                                <input type="hidden" id="id" name="id" value="${item.id}">
                            </td>
							<td>
                                <c:choose>
                                    <c:when test="${item.reviewStatus == 2}">
                                        <input type="checkbox"   name="checkImage" value="${item.id}"/>
                                        <input type="text" style="display: none" name="statusCheck" value="${item.reviewStatus}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" disabled="disabled" name="checkImage" value="${item.id}"/>
                                        <input type="text" style="display: none" name="statusCheck" disabled="disabled" value="${item.reviewStatus}"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:if test="${item.uid!=null and item.usermark==1}">
                                    <wdb:getAdminUser uid="${item.uid}" var="imagehistoryListAdminUser11">
                                        <a href="${basePath}/admin/adImage/adImageHistory?userName=${imagehistoryListAdminUser11.username}&uid=${item.uid}" style="color:#0060FF;">${imagehistoryListAdminUser11.username}</a>
                                    </wdb:getAdminUser>
                                </c:if>
                                <c:if test="${item.uid!=null and item.usermark==2}">
                                    <wdb:getUser uid="${item.uid}" var="imagehistoryListUser2">
                                        <a href="${basePath}/admin/adImage/adImageHistory?userName=${imagehistoryListUser2.username}&uid=${item.uid}" style="color:#0060FF;">${imagehistoryListUser2.username}</a>
                                    </wdb:getUser>
                                </c:if>
                            </td>
                            <td>
								<%--<a href = "javascript:void(0)" onclick = "ad.imageShow('${item.imageAddress}')">查看</a>--%>
								<button class="btn btn-default" onclick="imgEye('${hostUrl}${item.imageAddress}')">查看</button>
							</td>
							<td>${item.imageHyperlink}</td>
							<td>
                                <c:if test="${item.imageSize==null}">
                                    --
                                </c:if>
                                <c:if test="${item.imageSize!=null}">
                                    ${item.imageSize}
                                </c:if>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.reviewStatus == 1}">
                                    <a href="${basePath}/admin/adImage/adImageHistory?reviewStatus=${item.reviewStatus}" style="color:#0060FF;">待审核</a>
                                    </c:when>
                                    <c:when test="${item.reviewStatus == 2}">
                                        <a href="${basePath}/admin/adImage/adImageHistory?reviewStatus=${item.reviewStatus}" style="color:#0060FF;">已合格</a>
                                    </c:when>
                                    <c:when test="${item.reviewStatus == 3}">
                                        <a href="${basePath}/admin/adImage/adImageHistory?reviewStatus=${item.reviewStatus}" style="color:#0060FF;">不合格</a>
                                    </c:when>
                                    <c:when test="${item.reviewStatus == 4}">
                                        <a href="${basePath}/admin/adImage/adImageHistory?reviewStatus=${item.reviewStatus}" style="color:#0060FF;">已下架</a>
                                    </c:when>
                                </c:choose>
                            </td>
							<td>${item.reference}</td>
							<td>
                                    <c:choose>
                                       <c:when test="${item.reviewStatus == 2}">
                                           <%--<input type="button" id="onPass" style="background-color: #1E9FFF" onclick="ad.onePassDivShow('${item.id}',4,'adImageHistory')" value="下架" />--%>
                                           <button class="btn btn-default"  id="onPass" onclick="ad.onePassDivShow('${item.id}',4,'adImageHistory')" style="color: blue;cursor: pointer;">下架</button>
                                       </c:when>
                                       <c:otherwise>
                                           <%--<input type="button" id="onPass" disabled="disabled" style="background-color: red"  onclick="ad.onePassDivShow('${item.id}',4,'adImageHistory')" value="下架" />--%>
                                           <button class="btn btn-default"  id="onPass" href ="javascript:return false;" style="color: red">下架</button>
                                       </c:otherwise>
                                   </c:choose>
							</td>
							<td>
                                <c:if test="${item.operatorremark==null or item.remark==''}">
                                    --
                                </c:if>
                                <c:if test="${item.operatorremark!=null}">
                                    ${item.operatorremark}
                                </c:if>
                            </td>
							<td>
                                <button class="btn btn-default" data-backdrop="static"
                                        data-toggle="modal" data-dismiss="modal"
                                        data-target="#detailsModal"
                                        onclick="ad.showManager('${item.id}','${item.usermark}')">查看
                                </button>
							</td>
 						</tr>
 					</c:forEach>
				</tbody>
			</table>

            <input type="button" class="btn btn-default" id="onPass"  onclick="ad.passDivShow(4,'adImageHistory','xiajia')" value="下架" />
            <div id="light" class="black_overlay">
                    <img src="" class="imag_relative" id="showImgId" style="text-align: center">
                    <button href="#" onclick="ad.onImageShow()" class="offWindows">关闭</button>
            </div>
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
							<!-- <li><a href="#">&raquo;</a></li> -->
						</ul>
					</div>
			</div>
            <div class="remarkDiv" id = "remarkId" style="border: 1px solid #000000;text-align: center;display: none">
                下架备注信息：
                <textarea rows="8" cols="50" id="passText" style="width: 100%;height: 80%;"></textarea>
                <input type="text" id="passAdId" name="passAdId" style="display: none">
                <input type="text" id="imageStatus" name="imageStatus" style="display: none" >
                <input type="text" id="returnImageUrl" name="returnImageUrl" style="display: none" >
                <input type="text" id="code" name="code" style="display: none" >
                <input class="btn btn-default"  type="button" onclick="ad.pass()" value="确定"/>
                <input class="btn btn-default"  type="button" onclick="document.getElementById('remarkId').style.display='none'" value="取消"/>
            </div>
<script>
    //查看图片
    function imgEye(img){
        $("#detailsModalLabel").html("<span class='glyphicon glyphicon-info-sign'></span>提示：正在进行图片查看操作");
        $("#detail-modal-body").html("<img style='max-width:100%;' src="+img+">");
        $("#detailsModal").modal("show");
    }
</script>




