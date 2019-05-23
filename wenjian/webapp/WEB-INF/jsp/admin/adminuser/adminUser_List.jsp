<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员用户列表</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <link href="<%=basePath%>/static/plugin/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
    </style>
    <script>
        function queryAllPerson(pageNum, pageSize) {
            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        $(function () {
            //查询条件重置
            $("#reset").click(function () {
                $("#userName_search").val("");
            });
        });



        /*
         全局的pageNum与pageSize
         */
        var pageNum = '${pagehelper.pageNum}';
        var pageSize = '${pagehelper.pageSize}';



        //修改页面
        function update_UI(id) {
            var action = "${pageContext.request.contextPath}/admin/adminUser/updateView/" + id;
            var callback = function (data) {
                $("#updateModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#update-modal-body").html(data);
            }
            $.post(action, callback);
        }

        //修改
        function update() {
            if (checkForm()) {
                var action = "${pageContext.request.contextPath}/admin/adminUser/updateUserss";
                var callback = insertOrUpdateCallback;
                $.post(action, $("#form").serialize(), callback);
            }

        }

        //详情
        function todetailUi(id) {
            var action = "${pageContext.request.contextPath}/admin/adminUser/detail/" + id;
            var callback = function (data) {
                $("#detailsModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#detail-modal-body").html(data);
            };
            $.post(action, callback);
        }

        function selectByBaseId(baseid) {
            $("#baseid").val(baseid);
            var newUrl="${pageContext.request.contextPath}/admin/adminUser/lists";
            $("#conditionForm").attr("action",newUrl);
            queryAllPerson(pageNum, pageSize);
        }

        /*
         * 删除页面
         */
        function deleteById(id) {
            var flag = confirm("确定要删除吗？");
            var action = "${pageContext.request.contextPath}/admin/adminUser/delete/" + id;
            var callback = function (data) {
                alert(data.Msg);
                if (data.Msg == "删除成功！") {
                    window.location.href="${pageContext.request.contextPath}/admin/adminUser/lists";
                   // queryAllPerson(pageNum, pageSize);
                }
            }
            if (flag) {
                $.post(action, callback);
            }
        }


        //新增页面
        function insert_UI() {
            var action = "${pageContext.request.contextPath}/admin/adminUser/insertView";
            var callback = function (data) {
                $("#insertModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#insert-modal-body").html(data);
            };
            $.post(action, callback);
        }

        //新增
        function insert() {
            if (checkForm()) {
                var action = "${pageContext.request.contextPath}/admin/adminUser/insert";
                var callback = insertOrUpdateCallback;
                $.post(action, $("#form").serialize(), callback);
            }

        }


        //新增  或  修改表单的回调函数
        var insertOrUpdateCallback = function (data) {
            if ("success" == data.result) {
                alert(data.Msg);
               // queryAllPerson(pageNum, pageSize);
                window.location.href="${pageContext.request.contextPath}/admin/adminUser/lists";
            }else if("email_error"== data.result){
                $("#emailError").html("邮箱已经存在");
            }else if("mobile_error"== data.result){
                $("#mobileError").html("手机已经存在");
            }
        }



    </script>
</head>

<body>

<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="margin-bottom:10px;"></div>
            <form action="${pageContext.request.contextPath}/admin/adminUser/lists" method="post" role="form"
                  id="conditionForm" class="form-inline">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="form-group">
                <label>用户名:</label><input class="form-control" type="text" style="text-align: center; line-height: 18px;" name="username" id="userName_search" value="${adminUser.username}">
                </div>
                <div style="margin: 10px;">
                    <button id="query_btn" class="btn btn-default" onclick="queryAllPerson(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>
            </form>

            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>用户名</td>
                    <td>全名</td>
                    <td>登录错误次数</td>
                    <td>最后登录时间</td>
                    <td>最后修改时间</td>
                    <td>最后一次登录IP</td>
                    <td>备注</td>
                    <td>操作</td>
                    <td>详细信息</td>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.username }</td>
                        <td>${entity.fullname }</td>

                        <td>${entity.errorcount}</td>
                        <td> <wdb:formatDate value="${entity.logintime}" var="logintime">
                            ${empty logintime ? '无' : logintime}
                        </wdb:formatDate></td>
                        <td><wdb:formatDate value="${entity.modifypwdtime}" var="modifypwdtime">
                            ${empty modifypwdtime ? '无' : modifypwdtime}
                        </wdb:formatDate></td>
                        <td>${entity.lastloginip}</td>

                        <td>  <c:choose>
                            <c:when test="${fn:length(entity.remark)>10 }">
                                ${ fn:substring( entity.remark ,0,10)}...
                            </c:when>
                            <c:otherwise>
                                ${entity.remark}
                            </c:otherwise>
                        </c:choose></td>
                        <td> <button class="btn btn-default" onclick="update_UI('${entity.id}')">修改</button>
                            <button class="btn btn-default" onclick="deleteById('${entity.id}')">删除</button>
                        </td>
                        <td>
                            <button class="btn btn-default" onclick="todetailUi('${entity.id}')">详细信息</button>
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
</body>
</html>
