<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover" id="personList_table">
    <thead>
    <tr class="text-center" style="background: #ccc;">
        <td>
            <input type="checkbox" id="all" class="myCheck" onclick="">
        </td>
        <td>序号</td>
        <td>平台名称</td>
        <td>平台用户名</td>
        <td>真实姓名</td>
        <td>投资手机号</td>
        <td>待收金额</td>
        <td>登记时间</td>
        <td>维权描述</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pagehelper.list}" var="item" varStatus="status">
        <tr class="text-center">
            <td>
                <input type="checkbox" name="checkname" class="myCheck" value="${item.id}">
            </td>
            <td>${status.index+1}</td>
            <td>
                <a onclick="querypname('${item.pname}')" style="cursor:pointer;color: blue">${item.pname}</a>
            </td>
            <td>
                ${item.username}
            </td>
            <td>
                ${item.realname}
            </td>
            <td>
                ${item.mobile}
            </td>
            <td>
                ${item.pendingamount}
            </td>
            <td>
                ${empty item.time ? '':dateUtils.formatDate(item.time)}
            </td>

            <td class="p-content" tip="${item.desc}">
                    ${item.desc}
            </td>
            <td>
                <button class="btn btn-default" onclick="rights_detail(${item.id})">详情</button>
                <button class="btn btn-default" onclick="del('${item.id}')">删除</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script type="text/javascript">

    //查看详情
    function rights_detail(id){
        var action="/admin/userSafeguardingRights/detail1/"+id;
        $.post(basePath+action,function(data){
            $("#detailsModal").modal({
                backdrop: 'static',
            });
            $("#detail-modal-body").html(data);
        });
    }

    function del(id){
        if(confirm("确认删除吗？")){
            var action ="/admin/userSafeguardingRights/del/"+id;
            $.post(action, function(data){
                alert(data.meta.message);
                window.location.href="${pageContext.request.contextPath}/admin/userSafeguardingRights/lists";
            });
        }
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

</script>
<div id="page_div" style="margin-top: 20px;">
    <%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div>