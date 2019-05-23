<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<script type="text/javascript" charset="utf-8" src="${basePath}/static/subjectrelease/js/wangEditor.js"></script>
<table class="table table-hover" style="margin-top:25px;" border="1">
    <thead>
    <tr class="text-center" style="background: #ccc;">
        <td>序号</td>
        <td>一级项目</td>
        <td>二级项目</td>
        <td>三级项目</td>
        <td>主标题</td>
        <td>主标题链接</td>
        <td>副标题1</td>
        <td>副标题2</td>
        <td>主题图1</td>
        <td>主题图链接</td>
        <td>发布时间</td>
        <td>内容</td>
        <td>定位</td>
        <td>详情</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${data}" var="item" varStatus="status">
        <tr class="text-center">
            <td style="padding-top: 1%;">${status.index+1}</td>
            <td style="padding-top: 1%;">
                    ${item.itemNameThree}
            </td>
            <td style="padding-top: 1%;">
                    ${item.itemNameTwo}
            </td>
            <td style="padding-top: 1%;">
                    ${item.itemNameOne}
            </td>
            <td style="padding-top: 1%;">${item.maintitless}</td>
            <td style="padding-top: 1%;">${item.maintitlelink}</td>
            <td style="padding-top: 1%;">${item.subtitleone}</td>
            <td style="padding-top: 1%;">${item.subtitletwo}</td>
            <td>
                <c:if test="${item.titleimg!=null and item.titleimg!=''}">
                    <a href="javascript:void(0);" type="button" class="btn btn-default"  onclick="imgEye('${xmfImgUrl}${item.titleimg}?x-oss-process=image/resize,w_260,h_750')">查看</a>
                </c:if>
                <c:if test="${item.titleimg==null or item.titleimg==''}">
                    <a href="javascript:void(0);" type="button" class="btn btn-default" onclick="imgEye('${xmfImgUrl}${item.titleimg}')">查看</a>
                </c:if>
            </td>
            <td style="padding-top: 1%;">${item.subtitleimgurl}</td>
            <td style="padding-top: 1%;">
                    ${empty item.addtime ? '':dateUtils.formatYY_MM_DD(item.addtime)}
            </td>
            <td>
                <button class="btn btn-default" data-backdrop="static" data-toggle="modal"
                        data-dismiss="modal" data-target="#detailsModal2"
                        onclick="getContentById('${item.id}')">查看
                </button>
            </td>
            <td style="padding-top: 1%;">${item.position}</td>
            <td>
                <button class="btn btn-default" data-backdrop="static" data-toggle="modal"
                        data-dismiss="modal" data-target="#detailsModal3"
                        onclick="getOneFrontManageContentById('${item.id}')">查看
                </button>
            </td>
            <td>
                <button class="btn btn-default" data-backdrop="static" data-toggle="modal"
                        data-dismiss="modal" data-target="#updateModal"
                        onclick="updateUI('${item.id}')">修改
                </button>
                <button class="btn btn-default" onclick="deleteFrontManage('${item.id}')">删除
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
    //查看详情
    function getOneFrontManageContentById(id){
        var  action = "/admin/frontmanagecontent/beforUpdateFMCById/";
        $.post(action,{"id":id,"pageType":"descriptCount"},function(data){
            $("#detail-modal-body3").html(data);
            $("#detailsModal3").modal("show");
        });
    }

    //查看内容
    function getContentById(id){
        var  action = "/admin/frontmanagecontent/getContentById/";
        $.post(action,{"id":id},function(data){
            var content = data.data;
            $("#detail-modal-body2").html(content);
            $("#detailsModal2").modal("show");
        });
    }

    //清楚内容缓存
    function clearContent(){
        $("#detail-modal-body2").html("");
    }

    //查看图片
    function imgEye(img){
        if(img==null||img==""){
            alert("图片不存在")
            return false;
        }
        $("#detailsModalLabel").html("<span class='glyphicon glyphicon-info-sign'></span>提示：正在进行图片查看操作");
        $("#detail-modal-body").html("<img style='max-width:100%;' src="+img+">");
        $("#detailsModal").modal("show");
    }

    //删除信息
    function deleteFrontManage(id) {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }else{
            $.ajax({
                type: "post",
                url: basePath+"/admin/frontmanagecontent/deleteFMS",
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

    //更新
    function updateUI(id){
        var  action = "/admin/frontmanagecontent/beforUpdateFMCById/";
        $.post(action,{"id":id,"pageType":"beforUpdate"},function(data){
            $("#update-modal-body").html(data);
        });
    }

    //条件查询
    function queryAllhistory(pageNum,pageSize){
        $("#pageNum").val(pageNum);
        $("#pageSize").val(pageSize);
        $("#form-frontmanagecontent").submit();
    }

</script>