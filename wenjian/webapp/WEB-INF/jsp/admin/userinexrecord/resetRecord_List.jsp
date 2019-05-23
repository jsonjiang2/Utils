<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>账户余额列表页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
    </style>
    <script>
        /*
         全局的pageNum与pageSize
         */
        var pageNum = '${pagehelper.pageNum}';
        var pageSize = '${pagehelper.pageSize}';

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#username_search").val($.trim($("#username_search").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        function queryAllPerson2(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize)
        }

        //点击List列表页面中字段进行查询
        function selectByField(username) {
            //清空查询条件
            resetfun();
            if (username != "") {
                $("#username_search").val(username);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情
        function todetailUi(id) {
            var action = "${pageContext.request.contextPath}/admin/resetRecord/detail/" + id;
            var callback = function (data) {
                $("#detailsModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#detail-modal-body").html(data);
            };
            $.post(action, callback);
        }

        //重置
        function resetfun(){
            $("#username_search").val("");
            $("#realname_search").val("");
        }

    </script>
</head>

<body>

<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="margin-bottom:10px;"></div>

            <form action="${pageContext.request.contextPath}/admin/resetRecord/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-12 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input class="form-control" type="text" name="username" id="username_search" value="${userName}">
                    </div>
                    <%--<div class="form-group">
                        <label>真实姓名:</label>
                        <input class="form-control" type="text" name="realName" id="realname_search" value="${realName}">
                    </div>--%>
                </div>

                <div style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset" onclick="resetfun();"/>
                </div>
            </form>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>收支记录订单号</td>
                    <td>用户名-真实姓名</td>
                    <td>复位时间</td>
                    <td>复位人</td>
                    <td>备注</td>
                    <%--<td>详细信息</td>--%>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>
                            <a style="color: red" href="${pageContext.request.contextPath}/admin/userInExRecord/list?orderno=${entity.orderno}">
                                ${entity.orderno}
                            </a>
                        </td>
                        <td>
                            <wdb:getUser uid="${entity.baseid}" var="user">
                                <a href="javascript:selectByField('${user.username}')" style="color: blue;">
                                    ${user.username}-${empty user.realname ? '无':user.realname}
                                </a>
                            </wdb:getUser>
                        </td>
                        <td>${sf.format(entity.resettime)}</td>
                        <td>
                            <wdb:getAdminUser uid="${entity.resetid}" var="auid">
                                ${auid.username}-${auid.fullname ? '无' : auid.fullname}
                            </wdb:getAdminUser>
                        </td>
                        <td>${entity.remark }</td>
                        <%--<td>
                            <button class="btn btn-default" onclick="todetailUi('${entity.id}')">详细信息</button>
                        </td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>



            <%@ include file="../../common/modal.jsp" %>
            <div id="page_div" style="margin-top:20px;">
                <%@ include file="/WEB-INF/jsp/common/pagehelper2.jsp"%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
