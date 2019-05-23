<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover" id="personList_table">
    <thead>
    <tr class="text-center" style="background: #ccc;">
        <td>
            <input type="checkbox" id="allDel" class="myCheck" onclick="checkDelAll()">
        </td>
        <td>序号</td>
        <td>平台编号</td>
        <td>平台名称</td>
        <td>运营状态</td>
        <td>平台关注</td>
        <td>资源主数</td>
        <td>产品数</td>
        <td>认领状态</td>
        <td>平台押金</td>
        <td>负面曝光</td>
        <td>用户评价</td>
        <td>管理员备注</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pagehelper.list}" var="item" varStatus="status">
        <tr class="text-center">
            <td>
                <input type="checkbox" name="checkDelName" class="myCheck" value="${item.id}">
            </td>
            <td>${status.index+1}</td>
            <td>${item.pno}</td>
            <td>
                ${item.pname}
            </td>
            <td>
                <a onclick="queryoperatingstatus('${item.operatingstatus}')" style="cursor:pointer;color:blue">
                    <c:if test="${item.operatingstatus==1}">正常</c:if>
                    <c:if test="${item.operatingstatus==2}">跑路</c:if>
                    <c:if test="${item.operatingstatus==3}">清盘</c:if>
                    <c:if test="${item.operatingstatus==4}">高风险</c:if>
                    <c:if test="${item.operatingstatus==5}">有争议</c:if>
                    <c:if test="${item.operatingstatus==6}">延期兑付</c:if>
                    <c:if test="${item.operatingstatus==7}">停业</c:if>
                    <c:if test="${item.operatingstatus==8}">经侦介入</c:if>
                    <c:if test="${item.operatingstatus==9}">提现困难</c:if>
                </a>
            </td>
            <td>
                ${empty item.attentionrate ? 0:item.attentionrate}
            </td>
            <td>
                <a onclick="rMan_detail('${item.pno}')" style="cursor:pointer;color:blue">
                    ${item.rManCount}
                </a>
            </td>
            <td>
                <a onclick="pro_detail('${item.pno}')" style="cursor:pointer;color:blue">
                    ${item.productAmount}
                </a>
            </td>
            <td>
                <c:if test="${empty item.claimstatus}">---</c:if>
                <c:if test="${item.claimstatus==1}">待处理</c:if>
                <c:if test="${item.claimstatus==2}">待激活</c:if>
                <c:if test="${item.claimstatus==3}">已认领</c:if>
                <c:if test="${item.claimstatus==4}">认领失败</c:if>
                <c:if test="${item.claimstatus==5}">已撤销</c:if>
                <c:if test="${item.claimstatus==6}">打款失败</c:if>
            </td>
            <td>
                ${empty item.deposit ? 0:item.deposit}
            </td>
            <td>
                ${item.badInfoAmount}
            </td>
            <td>
                ${item.evaluateAmount}
            </td>
            <td class="p-content" tip="${item.remark}">
                    ${item.remark}
            </td>

            <td>
                <c:if test="${not empty item.isupdate}">
                    <button class="btn btn-default" onclick="updateData(${item.id})">${item.isupdate}</button>
                </c:if>
                <button class="btn btn-default" onclick="platformManage_detail(${item.id})">详情</button>
                <button class="btn" data-backdrop="static"
                        data-toggle="modal" data-dismiss="modal"
                        data-target="#updateModal"
                        onclick="updateUI('${item.id}')">修改</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<script type="text/javascript">

    function platformManage_detail(id) {
        var action="/admin/platformInfo/getManageById/"+id;
        $.post(basePath+action,function(data){
            $("#detailsModal").modal({
                backdrop: 'static',
            });
            $("#detail-modal-body").html(data);
        });
    }
    function updateUI(id){
        var action = "/admin/platformInfo/getUpdateById/"+id;
        $.post(action,function(data){
            $("#update-modal-body").html(data);
        });
    }

    function rMan_detail(pno) {
        var action = "/admin/platformInfo/getRManByPno/"+pno;
        $.post(basePath+action,function (data) {
            $("#detailsModal").modal({
                backdrop: 'static',
            });
            $("#detail-modal-body").html(data);
        });
    }
    function pro_detail(pno) {
        var action = "/admin/platformInfo/getProductByPno/"+pno;
        $.post(basePath+action,function (data) {
            $("#detailsModal").modal({
                backdrop: 'static',
            });
            $("#detail-modal-body").html(data);
        });
    }

    $(function() {
        $(".p-content").each(function() {
            var content = $(this).html().trim();
            if (content.length > 8) {
                $(this).html(content.substr(0, 8) + "...");
            }
        })
        $(".p-content").tzTip();
    });

    // 导入工商数据
    function updateData(pid) {
        var dateObj = {};
        var action = basePath + "/admin/platformInfo/updateData/"+pid;
        var callback = function (data) {
            if (data.code == "88") {
                alert(data.message);
            } else {
                alert(data.message);
            }
        }
        $.post(action, dateObj, callback);
    }

</script>

<div id="page_div" style="margin-top: 20px;">
    <%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div>