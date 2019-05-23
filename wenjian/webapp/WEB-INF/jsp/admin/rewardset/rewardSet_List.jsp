<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <title>打赏设置</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>

    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
        #personList_table{
            font-style: normal;
            font-variant-ligatures: normal;
            font-variant-caps: normal;
            font-variant-numeric: normal;
            font-weight: normal;
            font-stretch: normal;
            font-size: 12px;
            line-height: 24px;
            font-family: "Microsoft Yahei", "冬青黑体简体中文 w3", 宋体;
            overflow-y: auto;
        }
        #tableId tr td{
            border:none;
        }
    </style>
    <script>
        /*
         全局的pageNum与pageSize
         */
        var pageNum='${pagehelper.pageNum}';
        var pageSize='${pagehelper.pageSize}';

        $(function () {
            $(".remark-p").each(function (i) {
                var num = $(this).text();
                if (num.length > 5) {
                    $(this).text(num.substr(0, 5) + "...");
                }
            });
            //重置
            $("#reset").click(function () {
                resetmeragent();
            });
        });

        //清空查询条件(重置)
        function resetmeragent() {
            $("#username").val("");
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/rewardSet/selectById/" + id;
            var callback = function (data) {
                $("#crudType").hide();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            };
            $.post(action, callback);
        }

        //添加页面
        function insert_UI(){
            var action = "${pageContext.request.contextPath}/admin/rewardSet/viewInsert";
            var callback = function (data) {
                $("#crud").val("insert");
                $("#crudType").text("添加");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            }
            $.post(action, callback);
        }
        //添加
        function insert(){
            //获取定义好规则的代理对象
            var bv = $("#insertForm").data("bootstrapValidator");
            //手动触发验证
            bv.validate();
            if(bv.isValid()){
                //修改按钮设置为不可用
                $("#crudType").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/rewardSet/insert";
                var callback = function (data) {
                    $("#errorUserName").text("");
                    $("#errorlowamount").text("");
                    $("#errorhighamount").text("");
                    $("#erroronOff").text("");
                    var errors = data.errors;
                    if (errors == "errors") {
                        if (data.userNameNull != undefined) {
                            $("#errorUserName").text(data.userNameNull);
                        }
                        if (data.userNameEro != undefined) {
                            $("#errorUserName").text(data.userNameEro);
                        }
                        if (data.userNameErorr != undefined) {
                            $("#errorUserName").text(data.userNameErorr);
                        }
                        if (data.errorLowAmount != undefined) {
                            $("#errorlowamount").text(data.errorLowAmount);
                        }
                        if (data.dDYh != undefined) {
                            $("#errorlowamount").text(data.dDYh);
                        }
                        if (data.errorHighAmount != undefined) {
                            $("#errorhighamount").text(data.errorHighAmount);
                        }
                        if (data.onOFF != undefined) {
                            $("#erroronOff").text(data.onOFF);
                        }
                        //添加按钮设置为可用
                        $("#crudType").attr("disabled",false);
                        return false;
                    }
                    if(data.Msg == "sessionOut"){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                    if(data.status == "1"){
                        alert(data.Msg);
                        document.getElementById("query_btn").onclick();
                    }
                    if(data.status == "0"){
                        alert(data.Msg);
                        //添加按钮设置为可用
                        $("#crudType").attr("disabled",false);
                        return false;
                    }
                }
                $.post(action, $("#insertForm").serialize(), callback);
            }
        }

        //修改页面
        function update_UI(id) {
            var action = "${pageContext.request.contextPath}/admin/rewardSet/viewUpdate/" + id;
            var callback = function (data) {
                $("#crud").val("update");
                $("#crudType").text("修改");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            }
            $.post(action, callback);
        }
        //修改后保存
        function update(){
            //修改按钮设置为不可用
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/rewardSet/updateById";
            var callback = function (data) {
                $("#errorUserName").text("");
                $("#errorlowamount").text("");
                $("#errorhighamount").text("");
                $("#erroronOff").text("");
                var errors = data.errors;
                if (errors == "errors") {
                    if (data.userNameNull != undefined) {
                        $("#errorUserName").text(data.userNameNull);
                    }
                    if (data.userNameEro != undefined) {
                        $("#errorUserName").text(data.userNameEro);
                    }
                    if (data.userNameErorr != undefined) {
                        $("#errorUserName").text(data.userNameErorr);
                    }
                    if (data.errorLowAmount != undefined) {
                        $("#errorlowamount").text(data.errorLowAmount);
                    }
                    if (data.dDYh != undefined) {
                        $("#errorlowamount").text(data.dDYh);
                    }
                    if (data.errorHighAmount != undefined) {
                        $("#errorhighamount").text(data.errorHighAmount);
                    }
                    //修改按钮设置为可用
                    $("#crudType").attr("disabled",false);
                    return false;
                }
                if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    selectByCondition(pageNum,pageSize);
                }
                if(data.status == "0"){
                    alert(data.Msg);
                    //添加按钮设置为可用
                    $("#crudType").attr("disabled",false);
                    return false;
                }
            }
            $.post(action, $("#updateForm").serialize(), callback);
        }

        //删除页面
        function deleteById(id){
            var action = "${pageContext.request.contextPath}/admin/rewardSet/viewDelete/" + id;
            var callback = function (data) {
                $("#crud").val("delete");
                $("#crudType").text("删除");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            }
            $.post(action, callback);
        }
        //删除
        function deletes(){
            var id = $("#delByid").val();
            //修改按钮设置为不可用
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/rewardSet/deleteBy";
            var param = {
                "id" : id,
            }
            var callback = function (data) {
                if(data.status == "0"){
                    alert(data.Msg);
                    //添加按钮设置为可用
                    $("#crudType").attr("disabled",false);
                    return false;
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    selectByCondition(pageNum,pageSize);
                }
            }
            $.post(action, param, callback);
        }

        //操作
        function operate() {
            var crud = $("#crud").val();
            if (crud == "insert") {
                insert()
            } else if (crud == "update") {
                update()
            }else if (crud == "delete") {
                deletes()
            }
        }

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#username").val($.trim($("#username").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }

        function clearMode(id){
            $("#"+id).html("");
        }
    </script>

</head>
<body>
<div class="container" style="font-size: 12px; font-family: 微软雅黑">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/rewardSet/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${rewardSet.username}" placeholder="输入用户名查询">&nbsp;&nbsp;
                    </div>
                </div>

                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>
                <button class="btn btn-default" type="button" id="add" onclick="insert_UI()"
                        style="float: right; margin-right: 120px;margin-bottom: 5px;">新增打赏设置
                </button>
            </form>

            <%--<div class="col-md-12" style="margin-bottom: 15px;">
                <div class="btn btn-default" onclick="add();" style="margin-left: 92%"
                     class="btn" data-backdrop="static" data-toggle="modal" data-dismiss="modal"
                     data-target="#insertModal">新增提现手续费设置</div>
            </div>--%>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>设置类型</td>
                    <td>受赏人</td>
                    <td>最低打赏</td>
                    <td>最高打赏</td>
                    <td>是否开启</td>
                    <td>操作人</td>
                    <td>操作时间</td>
                    <td>操作</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>
                            <c:if test="${entity.type eq 1}"><span style="color: blue">通用设置</span></c:if>
                            <c:if test="${entity.type eq 2}">特殊设置</c:if>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.baseid}">所有</c:when>
                                <c:when test="${not empty entity.baseid}">
                                    <wdb:getUser uid="${entity.baseid}" var="user">
                                        ${user.username}-${user.realname}
                                    </wdb:getUser>
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.lowamount}">无</c:when>
                                <c:when test="${not empty entity.lowamount}">
                                    <fmt:formatNumber value="${entity.lowamount}" pattern="0.00" maxFractionDigits="2" />元
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.highamount}">无</c:when>
                                <c:when test="${not empty entity.highamount}">
                                    <fmt:formatNumber value="${entity.highamount}" pattern="0.00" maxFractionDigits="2" />元
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${entity.onoff==0 }"><span style="color: red;">关</span></c:if>
                            <c:if test="${entity.onoff==1 }"><span style="color: blue;">开</span></c:if>
                        </td>
                        <td>
                            <wdb:getAdminUser uid="${entity.addid}" var="auid">
                                ${auid.username}-${auid.fullname ? '无' : auid.fullname}
                            </wdb:getAdminUser>
                        </td>
                        <td>
                            <wdb:formatDate value="${entity.addtime}" var="addtime">
                                ${empty addtime ? '无' : addtime}
                            </wdb:formatDate>
                        </td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="update_UI('${entity.id}')">修改</button>
                            <c:if test="${entity.type eq 2}">
                                <button type="button" class="btn btn-default" onclick="deleteById('${entity.id}')">删除</button>
                            </c:if>
                        </td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="selectById('${entity.id}')">详情</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="page_div" style="margin-top:20px;">
                <%@ include file="/WEB-INF/jsp/common/pagehelper2.jsp"%>
            </div>
            <!-- 模态框 -->
            <div class="modal fade" id="Modal" tabindex="-1" role="dialog"
                 aria-labelledby="delModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true" onclick="clearMode('modal-body')">&times;</span>
                            </button>
                            <h4 class="modal-title" id="delModalLabel">
                                <span class="glyphicon glyphicon-info-sign"></span>提示：
                            </h4>
                        </div>
                        <div id="modal-body" class="modal-body"></div>
                        <input type="hidden" id="crud"/>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" onclick="operate()" id="crudType">
                                操作
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearMode('modal-body')">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

