<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover" id="personList_table">
    <thead>
    <tr class="text-center" style="background: #ccc;">   <!--复选框-->
        <td>
            <input type="checkbox" id="allDel" class="myCheck" onclick="checkDelAll()">
        </td>
        <td>序号</td>
        <td>平台编号</td>
        <td>平台名称</td>
        <td>平台背景</td>
        <td>背景说明</td>
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
                <a onclick="querypname('${item.pname}')" style="cursor:pointer;color: blue">${item.pname}</a>
            </td>
            <td>
                <a onclick="querybackground('${item.background}')" style="cursor:pointer;color: blue">
                    <c:if test="${empty item.background}">---</c:if>
                    <c:if test="${item.background==1}">国资控股</c:if>
                    <c:if test="${item.background==2}">国资参股</c:if>
                    <c:if test="${item.background==3}">上市控股</c:if>
                    <c:if test="${item.background==4}">上市参股</c:if>
                    <c:if test="${item.background==5}">风投系</c:if>
                    <c:if test="${item.background==6}">银行系</c:if>
                    <c:if test="${item.background==7}">民营系</c:if>
                    <c:if test="${item.background==8}">知名风投</c:if>
                </a>
            </td>
            <td class="p-content" tip="${item.backgrounddepict}">
                    ${item.backgrounddepict}
            </td>
            <td>
                <button class="btn" data-backdrop="static"
                        data-toggle="modal" data-dismiss="modal"
                        data-target="#updateModal"
                        onclick="updateUI('${item.id}')">修改</button>
                <button class="btn btn-default" onclick="del('${item.id}')">删除</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%--<button class="btn btn-default" onclick="delBatch()">批量删除</button>--%>

<script type="text/javascript">

    function updateUI(id){
        var action = "/admin/loanplatformBackground/updateView2/"+id;
        $.post(action,function(data){
            $("#update-modal-body").html(data);
        });
    }
    function update(){
        var jsonData = $("#platformBackground_updateForm").serialize();
        var params = decodeURIComponent(jsonData,true);
        var action ="/admin/loanplatformBackground/update";
        $.post(action,params, function(data){
            alert(data.meta.message);
            window.location.href="${pageContext.request.contextPath}/admin/loanplatformBackground/cxList";
        });
    }

    function del(id){
        if(confirm("确认删除吗？")){
            var action ="/admin/loanplatformBackground/del/"+id;
            $.post(action, function(data){
                alert(data.meta.message);
                window.location.href="${pageContext.request.contextPath}/admin/loanplatformBackground/cxList";
            });
        }
    }

    $(function() {
        $(".p-content").each(function() {
            var content = $(this).html().trim();
            if (content.length > 12) {
                $(this).html(content.substr(0, 12) + "...");
            }
        })
        $(".p-content").tzTip();
    });

</script>

<div id="page_div" style="margin-top: 20px;">
    <%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div>