<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
        <table class="table table-hover"  style="margin-top:25px;" border="1">
				<thead>
					<tr class="text-center" style="background: #ccc;">
						<td>序号</td>
						<td>一级项目</td>
						<td>二级项目</td>
						<td>三级项目</td>
						<td>排序</td>
                        <td>添加人</td>
                        <td>添加时间</td>
						<td>备注</td>
 						<td>操作</td>
 					</tr>
				</thead>
				<tbody>
					<c:forEach items="${data}" var="item" varStatus="status">
						<tr class="text-center">
                            <td>${status.index+1}</td>
                            <td>
                                    ${item.itemNameThree}
                            </td>
                            <td>
                                    ${item.itemNameTwo}
                            </td>
                            <td>
                                    ${item.itemNameOne}
                            </td>
                            <td>${item.itemNumber}</td>
                            <td>${item.userName}</td>
                            <td>
                                    ${empty item.addTime ? '':dateUtils.formatYY_MM_DD(item.addTime)}
                            </td>
                            <td>${item.itemRemark}</td>
                            <td>
                                <button class="btn btn-default" data-backdrop="static" data-toggle="modal"
                                    data-dismiss="modal" data-target="#updateModal"
                                    onclick="updateUI('${item.id}')">修改
                                </button>
                                <button class="btn btn-default" data-backdrop="static" data-toggle="modal"
                                    <%-- data-dismiss="modal" data-target="#delModal"--%>
                                        onclick="deleteFrontManage('${item.id}')">删除
                                </button>
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
            function deleteFrontManage(id) {
                if (!confirm("确认要删除？")) {
                    window.event.returnValue = false;
                }else{
                    $.ajax({
                        type: "post",
                        url: basePath+"/admin/frontmanage/deleteFrontManage",
                        data: {"id":id},
                        dataType: "json",
                        async:false,
                        success: function(data){
                            var msg = data.meta.message;
                            alert(msg)
                            window.location.reload(true);
                        },
                        error: function (data) {
                            alert("程序异常，请刷新重试!")
                        }
                    });
                }
            }
            function updateUI(id,adsort){
                var  action = "/admin/frontmanage/getOneFrontmanage/";
                $.post(action,{"id":id,"ad_sort":adsort},function(data){
                    $("#update-modal-body").html(data);
                });
            }

            function queryAllhistory(pageNum,pageSize){
                $("#pageNum").val(pageNum);
                $("#pageSize").val(pageSize);
                $("#form-frontmanage-history").submit();
            }

        </script>