<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
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
                        <td><input type="checkbox" name="allPass" id = "allSelect" onclick="ad.allSelect('tiqianzhongzhi')" title="全选" />&nbsp;全选</td>
						<td>序号</td>
						<td>板块</td>
						<td>标题</td>
						<td>广告位</td>
						<td>广告主</td>
						<td>广告费</td>
						<td>状态</td>
 						<td>操作</td>
                        <td>详情</td>
 					</tr>
				</thead>
				<tbody>
					<c:forEach items="${data}" var="item" varStatus="status">
						<tr class="text-center">
                            <td>
                                <c:choose>
                                    <c:when test="${item.isValid != 4}">
                                        <input type="checkbox" onclick="ad.checkboxFunction(${item.id})"  name="checkImage" value="${item.id}"/>
                                        <input type="text" style="display: none" name="statusCheck" value="${item.isValid}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" disabled="disabled" name="checkImage" value="${item.id}"/>
                                        <input type="text" style="display: none" name="statusCheck" disabled="disabled" value="${item.isValid}"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
							<td>${status.index+1}<input type="hidden" id="id" name="id" value="${item.id}"></td>
                            <td>
                                <a href="${basePath}/admin/Advertising/lists?moduleName=${item.moduleName}" style="color:#0060FF;">
                                    <c:if test="${item.moduleName==1}">
                                        首页
                                    </c:if>
                                    <c:if test="${item.moduleName==2}">
                                        资源主列表
                                    </c:if>
                                    <c:if test="${item.moduleName==3}">
                                        平台数据列表
                                    </c:if>
                                    <c:if test="${item.moduleName==4}">
                                        巴士茶馆
                                    </c:if>
                                    <c:if test="${item.moduleName==5}">
                                        网贷资讯
                                    </c:if>
                                </a>
                                <input type="hidden" id="adtid" name="adtid" value="${item.pid}"/>
                            </td>
                            <td>
                                <a href="${basePath}/admin/Advertising/lists?title=${item.title}" style="color:#0060FF;">${item.title}</a>
                            </td>
							<td>
                                    <wdb:getUser uid="${item.uid}" var="user">
                                        <a href="${basePath}/admin/Advertising/lists?adOwnUserName=${user.username}&uid=${item.uid}" style="color:#0060FF;">
                                            ${user.username}
                                        </a>
                                    </wdb:getUser>
                            </td>
							<td>
                                    <wdb:getUser uid="${item.adHostUid}" var="user">
                                        <a href="${basePath}/admin/Advertising/lists?adBuyUserName=${user.username}&adHostUid=${item.adHostUid}" style="color:#0060FF;">
                                            ${user.username}
                                        </a>
                                    </wdb:getUser>
                            </td>
							<td>${item.adTotalAllPrice}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.isValid == 1}">
                                        <a href="${basePath}/admin/Advertising/lists?isValid=${item.isValid}" style="color:#0060FF;">展示中</a>
                                    </c:when>
                                    <c:when test="${item.isValid == 2}">
                                        <a href="${basePath}/admin/Advertising/lists?isValid=${item.isValid}" style="color:#0060FF;">已完成</a>
                                    </c:when>
                                    <c:when test="${item.isValid == 3}">
                                        <a href="${basePath}/admin/Advertising/lists?isValid=${item.isValid}" style="color:#0060FF;">已暂停</a></c:when>
                                    <c:when test="${item.isValid == 4}">
                                        <a href="${basePath}/admin/Advertising/lists?isValid=${item.isValid}" style="color:#0060FF;">已下架</a>
                                    </c:when>
                                </c:choose>
                            </td>
							<td>
                                    <c:choose>
                                       <c:when test="${item.isValid != 4}">
                                           <%--<input type="button" id="onPass" style="background-color: #1E9FFF" onclick="ad.onePassDivShow('${item.id}',4,'lists')" value="提前终止" />--%>
                                           <button class="btn btn-default" id="onPass" onclick="ad.onePassDivShow('${item.id}',4,'lists')" style="color: blue;cursor: pointer;">提前终止</button>
                                       </c:when>
                                       <c:otherwise>
										   <button class="btn btn-default" id="onPass" href ="javascript:return false;" style="color: red;cursor: pointer;">提前终止</button>
                                           <%--<input type="button" id="onPass" disabled="disabled" style="background-color: red"  onclick="ad.onePassDivShow('${item.id}',4,'lists')" value="提前终止" />--%>
                                       </c:otherwise>
                                   </c:choose>
							</td>
							<td>
                                <button class="btn btn-default" data-backdrop="static"
                                        data-toggle="modal" data-dismiss="modal"
                                        data-target="#detailsModal"
                                        onclick="test('${item.id}')">查看
                                </button>
                                <%--<button class="btn" data-backdrop="static"
                                        data-toggle="modal" data-dismiss="modal"
                                        data-target="#updateModal"
                                        onclick="setAdShow('list')">修改
                                </button>--%>
							</td>
 						</tr>
 					</c:forEach>
				</tbody>
			</table>

            <input class="btn btn-default" type="button" id="pass" onclick="ad.passDivShow(4,'lists','tiqianzhongzhi')" value="提前终止"/>

            <div id="light" class="black_overlay">
                    <img src="" class="imag_relative" id="showImgId" style="text-align: center">
                    <a href="#" onclick="ad.onImageShow()" class="offWindows">关闭</a>
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
						</ul>
					</div>
			</div>
            <div class="remarkDiv" id = "remarkId" style="border: 1px solid #000000;text-align: center;display: none">
                备注信息：
                <textarea rows="8" cols="50" id="passText" style="width: 100%;height: 80%;"></textarea>
                <input type="text" id="passAdId" name="passAdId" style="display: none">
                <input type="text" id="imageStatus" name="imageStatus" style="display: none" >
                <input type="text" id="returnImageUrl" name="returnImageUrl" style="display: none" >
                <input type="text" id="code" name="code" style="display: none" >
                <input class="btn btn-default" type="button" onclick="ad.toDropOff()" value="确定"/>
                <input class="btn btn-default" type="button" onclick="document.getElementById('remarkId').style.display='none'" value="取消"/>
            </div>
        <script>
            function setAdShow(obj){
                var tid = document.getElementById("adtid").value;
                $.ajaxSettings.async = false;
                $.get(basePath+"/admin/Advertising/editAdShow",{"tid":tid,"returnUrl":obj},function(data){
                    $("#update-modal-body").html(data);
                });
            }
            function test(id){
                $.get(basePath+"/admin/Advertising/adOneData",{"id":id}, function(data){
                    $("#detail-modal-body").html(data);
                });
            }
            //查看图片
            function imgEye(img){
                $("#detailsModalLabel").html("<span class='glyphicon glyphicon-info-sign'></span>提示：正在进行图片查看操作");
                $("#detail-modal-body").html("<img style='max-width:100%;' src="+img+">");
                $("#detailsModal").modal("show");
            }
        </script>




