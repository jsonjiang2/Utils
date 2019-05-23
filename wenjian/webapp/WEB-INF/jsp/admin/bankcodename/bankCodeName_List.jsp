<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>银行编码名称列表页面</title>
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

        function queryAllPerson2(pageNum, pageSize) {
            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        $(function () {
            //查询条件重置
            $("#reset").click(function () {
                $("#bankname_search").val("");
                $("#bankcode_search").val("");
            });
        });

        //新增页面
        function insert_UI() {
            var action = "${pageContext.request.contextPath}/admin/bankCodeName/viewInsert";
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
                $("#btn-insert").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/bankCodeName/insert";
                var callback = function (data) {
                    if(data.status == "0"){
                        alert(data.Msg);
                        $("#btn-insert").attr("disabled",false);
                    }
                    if(data.status == "2"){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                    if(data.status == "1"){
                        alert(data.Msg);
                        queryAllPerson2(1, 20);
                    }
                };
                $.post(action, $("#insertForm").serialize(), callback);
            }
        }

        //修改页面
        function update_UI(id) {
            var action = "${pageContext.request.contextPath}/admin/bankCodeName/viewUpdate/" + id;
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
                $("#btn-update").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/bankCodeName/updateById";
                var callback = function (data) {
                    if(data.status == "0"){
                        alert(data.Msg);
                        $("#btn-update").attr("disabled",false);
                    }
                    if(data.status == "2"){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                    if(data.status == "1"){
                        alert(data.Msg);
                        queryAllPerson2(1, 20);
                    }
                };;
                $.post(action, $("#updateForm").serialize(), callback);
            }

        }

        /*
         * 删除
         */
        function deleteById(id) {
            var flag = confirm("确定要删除吗？");
            var action = "${pageContext.request.contextPath}/admin/bankCodeName/deleteBy/" + id;
            var callback = function (data) {
                if(data.status == "0"){
                    alert(data.Msg);
                    queryAllPerson2(1, 20);
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    queryAllPerson2(1, 20);
                }
            }
            if (flag) {
                $("#del").attr("disabled",true);
                $.post(action, callback);
            }
        }

        //详情
        function todetailUi(id) {
            var action = "${pageContext.request.contextPath}/admin/bankCodeName/selectById/" + id;
            var callback = function (data) {
                $("#crudType").hide();
                $("#detailsModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#detail-modal-body").html(data);
            };
            $.post(action, callback);
        }

    </script>
</head>

<body>

<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="margin-bottom:10px;"></div>
            <form action="${pageContext.request.contextPath}/admin/bankCodeName/list" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;width:95%;">
                    <div class="form-group">
                        <label>银行名称:</label>
                        <input type="text" class="form-control" name="bankname" id="bankname_search" value="${bankCodeName.bankname}">
                    </div>
                    <div class="form-group">
                        <label>银行编码:</label>
                        <input type="text" class="form-control" name="bankcode" id="bankcode_search" value="${bankCodeName.bankcode}">
                    </div>
                </div>

                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="queryAllPerson2(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>

                <button class="btn btn-default" type="button" id="add" onclick="insert_UI()"
                        style="float: right; margin-right: 120px;margin-bottom: 5px;">添加
                </button>
            </form>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>银行名称</td>
                    <td>银行编码</td>
                    <td>操作时间</td>
                    <td>操作人</td>
                    <td>备注</td>
                    <td>操作</td>
                    <td>详细信息</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.bankname }</td>
                        <td>${entity.bankcode }</td>
                        <td>
                            <wdb:formatDate value="${entity.addtime}" var="addtime">
                                ${empty addtime ? '无' : addtime}
                            </wdb:formatDate>
                        </td>
                        <td>
                            <wdb:getAdminUser uid="${entity.addid}" var="auid">
                                ${auid.username}-${auid.fullname ? '无' : auid.fullname}
                            </wdb:getAdminUser>
                        </td>
                        <td>${entity.remark}</td>
                        <td>
                            <button class="btn btn-default" onclick="update_UI('${entity.id}')">修改</button>
                            <button class="btn btn-default" id="del" onclick="deleteById('${entity.id}')">删除</button>
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
                <%@ include file="../../common/pagehelper2.jsp" %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
