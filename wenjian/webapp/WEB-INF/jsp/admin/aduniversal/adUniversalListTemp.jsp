<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
    .black_overlay {
		display: none;
		position: absolute;
		top: 0%;
		left: 0%;
		width: 100%;
		height: 100%;
		background-color: black;
		z-index: 1001;
		/*-moz-opacity: 0.6;*/
		opacity: .7;
		filter: alpha(opacity=50);
		text-align: center;
		overflow: scroll;
	}
</style>
        <table class="table table-hover" id="personList_table" style="margin-top:25px;">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>广告序号</td>
						<td>所在页面</td>
						<td>广告位置</td>
						<td>终端</td>
						<td>属性</td>
						<td>广告词</td>
						<td>广告图</td>
						<td>有效性</td>
						<td>展示开关</td>
                        <td>详情</td>
                        <td>操作</td>
 					</tr>
				</thead>
				<tbody>
					<c:forEach items="${data}" var="item" varStatus="status">
						<tr class="text-center">
                            <td style="display: none">
                                <input type="hidden" id="id" name="id" value="${item.id}">
                            </td>
							<td>${item.serial}</td>
                            <td>
                                <c:if test="${item.current_page==1}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color:#0060FF;">首页</a>
                                </c:if>
								<c:if test="${item.current_page==2}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color:#0060FF;">资源主列表</a>
								</c:if>
								<c:if test="${item.current_page==3}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">平台数据列表</a>
								</c:if>
								<c:if test="${item.current_page==4}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">巴士茶馆</a>
								</c:if>
								<c:if test="${item.current_page==5}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">网贷咨询</a>
								</c:if>
								<c:if test="${item.current_page==8}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">钱多多</a>
								</c:if>
								<c:if test="${item.current_page==9}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">个人中心</a>
								</c:if>
								<c:if test="${item.current_page==6}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">巴士茶馆详情页</a>
								</c:if>
								<c:if test="${item.current_page==7}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">网贷资讯详情页</a>
								</c:if>
								<c:if test="${item.current_page==10}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">钱多多侧边栏</a>
								</c:if>
								<c:if test="${item.current_page==11}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">羊头黑名单</a>
								</c:if>
								<c:if test="${item.current_page==12}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">巴士日报</a>
								</c:if>
								<c:if test="${item.current_page==13}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">羊头黑名单详情页</a>
								</c:if>
								<c:if test="${item.current_page==14}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">平台评价</a>
								</c:if>
								<c:if test="${item.current_page==15}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">今日暴雷</a>
								</c:if>
								<c:if test="${item.current_page==16}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">h5帖子回复</a>
								</c:if>
								<c:if test="${item.current_page==17}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">h5资讯回复</a>
								</c:if>
								<c:if test="${item.current_page==19}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">首页滚动广告</a>
								</c:if>
								<c:if test="${item.current_page==20}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">茶馆列表滚动广告</a>
								</c:if>
								<c:if test="${item.current_page==21}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">h5平台数据详情页</a>
								</c:if>
								<c:if test="${item.current_page==22}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">H5小蜜蜂首页</a>
								</c:if>
								<c:if test="${item.current_page==23}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">H5巴士日报</a>
								</c:if>
								<c:if test="${item.current_page==24}">
									<a href="${basePath}/admin/aduniversal/getCurrentAdList?current_page=${item.current_page}" style="color: #0060FF">h5巴士日报详情页</a>
								</c:if>

                            </td>
                            <td>${item.adplacement}</td>
							<td>
                                <c:if test="${item.terminal==1}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?terminal=${item.terminal}" style="color: #0060FF">PC</a>
                                </c:if>
                                <c:if test="${item.terminal==2}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?terminal=${item.terminal}" style="color: #0060FF">手机</a>
                                </c:if>
                            </td>
							<td>
                                <c:if test="${item.attributes==1}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?attributes=${item.attributes}" style="color: #0060FF">文字广告</a>
                                </c:if>
                                <c:if test="${item.attributes==2}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?attributes=${item.attributes}" style="color: #0060FF">图片广告</a>
                                </c:if>
                            </td>
							<td>${item.adword}</td>
							<td>
								<c:if test="${item.attributes==1}">
									<span style="color: red">无</span>
								</c:if>
								<c:if test="${item.attributes==2}">
									<%--<button class="btn" data-backdrop="static"
									onclick = "ad.imageShow('${item.image_address}')">查看
									</button>--%>
                                    <button class="btn btn-default" onclick="imgEye('${item.image_address}')">查看</button>
								</c:if>
                            </td>
							<td>
                                <c:if test="${item.effectiveness==0}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?effectiveness=${item.effectiveness}" style="color: #0060FF">展示中</a>
                                </c:if>
                                <c:if test="${item.effectiveness==1}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?effectiveness=${item.effectiveness}" style="color: red">已过期</a>
                                </c:if>
                            </td>
							<td>
                                <c:if test="${item.display_switch==0}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?display_switch=${item.display_switch}" style="color: #0060FF">开</a>
                                </c:if>
                                <c:if test="${item.display_switch==1}">
                                    <a href="${basePath}/admin/aduniversal/getCurrentAdList?display_switch=${item.display_switch}" style="color: red">关</a>
                                </c:if>
                            </td>
							<td>
                                <button class="btn btn-default" data-backdrop="static"
                                        data-toggle="modal" data-dismiss="modal"
                                        data-target="#detailsModal"
                                        onclick="showmanage('${item.id}')">查看
                                </button>
							</td>
							<td>
								<button class="btn btn-default" data-backdrop="static" data-toggle="modal"
										data-dismiss="modal" data-target="#updateModal"
										onclick="updateUI('${item.id}')">修改
								</button>
							</td>
 						</tr>
 					</c:forEach>
				</tbody>
			</table>

            <div id="light" class="black_overlay">
                    <img src="" class="imag_relative" id="showImgId" style="text-align: center">
                    <a href="#" onclick="ad.onImageShow()" class="offWindows">关闭</a>
            </div>
            <div id="page_div" style="margin-top: 20px;">
				<!-- 页数 -->
					<div class="message">
                        <input type="text" id="pageNums" name="pageNum" value="${pagehelper.pageNum}" style="display: none" />
                        <input type="text" id="pageSizes" name="pageSize" value="${pagehelper.pageSize}"  style="display: none" />
						共<i class="#0060FF">${pagehelper.total}</i>条记录，当前显示第&nbsp;<i class="#0060FF">${pagehelper.pageNum}/${pagehelper.pages}</i>&nbsp;页
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
                审核备注信息：
                <textarea rows="8" cols="50" id="passText" style="width: 100%;height: 80%;"></textarea>
                <input type="text" id="passAdId" name="passAdId" style="display: none">
                <input type="text" id="imageStatus" name="imageStatus" style="display: none" >
                <input type="text" id="returnImageUrl" name="returnImageUrl" style="display: none" >
                <input type="text" id="code" name="code" style="display: none" >
                <input type="button" onclick="ad.pass()" value="确定"/>
                <input type="button" onclick="document.getElementById('remarkId').style.display='none'" value="取消"/>
            </div>
<script>
    var  action = basePath+"/admin/aduniversal/";

    //查看图片
    function imgEye(img){
        $("#detailsModalLabel").html("<span class='glyphicon glyphicon-info-sign'></span>提示：正在进行图片查看操作");
        $("#detail-modal-body").html("<img style='max-width:100%;' src="+img+">");
        $("#detailsModal").modal("show");
    }

    function changeColor(colorValue,id){
        alert(123)
        alert(colorValue+"===="+id);
	}

    function updateUI(id){
        $.ajaxSettings.async = false;
        $.get(action+"getOneCurrentAd",{"id":id,"resultPage":"update"},function(data){
            $("#update-modal-body").html(data);
        });
    }
    function showmanage(id){
        $.ajaxSettings.async = false;
        $.get(action+"getOneCurrentAd",{"id":id,"resultPage":"detail"}, function(data){
            $("#detail-modal-body").html(data);
        });
    }
    function queryAllhistory(pageNum,pageSize){
        $.ajaxSettings.async = false;
        $("#pageNum").val(pageNum);
        $("#pageSize").val(pageSize);
        $("#adUniversal_list_form").submit();
    }
</script>




