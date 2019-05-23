<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>审核页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
</head>
<body>
<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table  table-hover" id="personList_table" style="margin-top: 10px">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>申请人用户名</td>
                    <td>申请人姓名</td>
                    <td>申请时间</td>
                    <td>申请角色</td>
                    <td>审核状态</td>
                    <td>巴士特殊备注</td>
                    <td>审核人</td>
                    <td>审核时间</td>
                    <td>银行卡验证</td>
                    <td>审核备注</td>
                    <td>详细信息</td>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.userName}</td>
                        <td>${entity.realName}</td>
                        <td><fmt:formatDate value="${entity.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${entity.roleName}</td>
                        <td><c:choose>
                            <c:when test="${entity.isAudit==1}">
                                通过
                            </c:when>
                            <c:when test="${entity.isAudit==2}">
                                不通过
                            </c:when>
                            <c:otherwise>
                                待审核
                            </c:otherwise>
                        </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.busRemark}">
                                   -
                                </c:when>
                                <c:otherwise>
                                    ${ entity.busRemark}
                                </c:otherwise>
                            </c:choose>


                        </td>
                        <td>${entity.auditMan}</td>
                        <td><fmt:formatDate value="${entity.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.bindStatus==1}">
                                    已绑定
                                </c:when>
                                <c:otherwise>
                                    未绑定
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="remark-p">
                            <c:choose>
                                <c:when test="${empty entity.auditRemark}">
                                    -
                                </c:when>
                                <c:otherwise>
                                    ${ entity.auditRemark}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <button class="btn" data-backdrop="static" data-toggle="modal"
                                    data-dismiss="modal" data-target="#detailsModal"
                                    onclick="detailUI('${entity.id}')">详细信息
                            </button>
                            <c:if test="${entity.isAudit ne 2 && entity.isAudit ne 1 }">
                                <button class="btn" data-backdrop="static" data-toggle="modal"
                                        data-dismiss="modal" data-target="#updateModal"
                                        onclick="auditUI('${entity.id}')">审核
                                </button>
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <%@ include file="../../common/modal.jsp" %>
            <div id="page_div">
                <%@ include file="../../common/pagehelper.jsp" %>
            </div>
        </div>
    </div>
</div>
<script>


    //详情页面跳转
    function detailUI(id) {
        var action = "${pageContext.request.contextPath}/admin/systemrole/auditDetail/" + id;
        var callback = function (data) {

            $("#detail-modal-body").html(data);
        };
        $.post(action, callback);
    }
    //审核页面
    function auditUI(id) {
        var action = "${pageContext.request.contextPath}/admin/systemrole/toAuditPage/" + id;
        var callback = function (data) {
            $("#update-modal-body").html(data);
        };
        $.post(action, callback);
    }

    function update() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "${pageContext.request.contextPath}/admin/systemrole/saveAuditResult",
            data: $('#update-form').serialize(),
            success: function (result) {

                alert(result);

            },
            error: function () {
                alert("异常！");
            }
        });
    }
</script>
</body>
</html>
