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

    <title>提现设置</title>
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
            var action = "${pageContext.request.contextPath}/admin/userWithdrawalsFeeSet/selectById/" + id;
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
            var action = "${pageContext.request.contextPath}/admin/userWithdrawalsFeeSet/viewInsert";
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
                var action = "${pageContext.request.contextPath}/admin/userWithdrawalsFeeSet/insert";
                var callback = function (data) {
                    $("#errorUserName").text("");
                    $("#errorfeetype").text("");
                    $("#errorfeerate").text("");
                    $("#errorminfee").text("");
                    $("#errormaxfee").text("");
                    $("#erroronOff").text("");
                    $("#errorlowamount").text("");
                    //$("#errorauditonOff").text("");
                    var errors = data.errors;
                    if (errors == "errors") {
                        if (data.userName != undefined) {
                            $("#errorUserName").text(data.userName);
                        }
                        if (data.userNameEro != undefined) {
                            $("#errorUserName").text(data.userNameEro);
                        }
                        if (data.userNameErorr != undefined) {
                            $("#errorUserName").text(data.userNameErorr);
                        }
                        if (data.dDYh != undefined) {
                            $("#errorlowamount").text(data.dDYh);
                        }
                        if (data.feeType != undefined) {
                            $("#errorfeetype").text(data.feeType);
                        }
                        if (data.feeRate != undefined) {
                            $("#errorfeerate").text(data.feeRate);
                        }
                        if (data.minFee != undefined) {
                            $("#errorminfee").text(data.minFee);
                        }
                        if (data.maxFee != undefined) {
                            $("#errormaxfee").text(data.maxFee);
                        }
                        if (data.sdDYsh != undefined) {
                            $("#errormaxfee").text(data.sdDYsh);
                        }
                        if (data.onOFF != undefined) {
                            $("#erroronOff").text(data.onOFF);
                        }
                        /*if (data.auditonOff != undefined) {
                         $("#errorauditonOff").text(data.auditonOff);
                         }*/
                        //修改按钮设置为可用
                        $("#crudType").attr("disabled",false);
                        return false;
                    }
                    if ("添加成功" == data.Msg) {
                        alert(data.Msg);
                        document.getElementById("query_btn").onclick();
                    }else if(data.Msg == "sessionOut"){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                }
                $.post(action, $("#insertForm").serialize(), callback);
            }
        }

        //修改页面
        function update_UI(id) {
            var action = "${pageContext.request.contextPath}/admin/userWithdrawalsFeeSet/viewUpdate/" + id;
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
            var action = "${pageContext.request.contextPath}/admin/userWithdrawalsFeeSet/updateById";
            var callback = function (data) {
                $("#lowamountError").text("");
                $("#feerateError").text("");
                $("#minfeeError").text("");
                var errors = data.errors;
                if (errors == "errors") {
                    if (data.lowamount != undefined) {
                        $("#lowamountError").text(data.lowamount);
                    }
                    if (data.dDYh != undefined) {
                        $("#lowamountError").text(data.dDYh);
                    }
                    if (data.sdDYsh != undefined) {
                        $("#minfeeError").text(data.sdDYsh);
                    }
                    if (data.feerate != undefined) {
                        $("#feerateError").text(data.feerate);
                    }
                    //修改按钮设置为可用
                    $("#crudType").attr("disabled",false);
                    return false;
                }
                if ("修改成功" == data.Msg) {
                    alert(data.Msg);
                    selectByCondition(pageNum,pageSize);
                }else if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }
            }
            $.post(action, $("#updateForm").serialize(), callback);
        }

        //删除页面
        function deleteById(id){
            var action = "${pageContext.request.contextPath}/admin/userWithdrawalsFeeSet/viewDelete/" + id;
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
            var action = "${pageContext.request.contextPath}/admin/userWithdrawalsFeeSet/deleteBy";
            var param = {
                "id" : id,
            }
            var callback = function (data) {
                if ("false" == data.Msg) {
                    alert("数据有误");
                    selectByCondition(pageNum,pageSize);
                }
                if("fal" == data.Msg){
                    alert("此用户设置已删除过");
                    selectByCondition(pageNum,pageSize);
                }
                if ("删除成功" == data.Msg) {
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
    </script>

</head>
<body>
<div class="container" style="font-size: 12px; font-family: 微软雅黑">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/userWithdrawalsFeeSet/list" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${userWithdrawalsFeeSet.username}" placeholder="输入用户名查询">&nbsp;&nbsp;
                    </div>
                </div>

                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>
                <button class="btn btn-default" type="button" id="add" onclick="insert_UI()"
                        style="float: right; margin-right: 120px;margin-bottom: 5px;">新增提现手续费设置
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
                    <td>用户名-姓名</td>
                    <td>单笔最低</td>
                    <td>单笔最高</td>
                    <td>手续费类型</td>
                    <td>提现定额(百分比)</td>
                    <td>手续费最低</td>
                    <td>手续费最高</td>
                    <td>是否开启</td>
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
                                <c:otherwise>
                                    <wdb:getUser uid="${entity.baseid}" var="user">
                                        ${user.username}-${empty user.realname? "无":user.realname}
                                    </wdb:getUser>
                                </c:otherwise>
                                <%--<c:when test="${not empty entity.baseid}">${entity.realname}</c:when>--%>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.lowamount}">无</c:when>
                                <c:when test="${not empty entity.lowamount}">${entity.lowamount}元</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.highamount}">无</c:when>
                                <c:when test="${not empty entity.highamount}">${entity.highamount}元</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${entity.feetype==1 }"><span style="color: blue;">定额</span></c:if>
                            <c:if test="${entity.feetype==2 }"><span style="color: red;">百分比</span></c:if>
                        </td>
                        <td>
                            <c:if test="${entity.feetype==1 }">
                                <fmt:formatNumber value="${entity.feerate}" pattern="0.00" maxFractionDigits="2" />元
                            </c:if>
                            <c:if test="${entity.feetype==2 }">
                                <fmt:formatNumber value="${entity.feerate *100}" pattern="0.00" maxFractionDigits="2" />%
                            </c:if>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.minfee > 0}">${entity.minfee}元</c:when>
                                <c:otherwise>
                                    无
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.maxfee > 0}">${entity.maxfee}元</c:when>
                                <c:otherwise>
                                    无
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${entity.onOff==0 }"><span style="color: red;">关</span></c:if>
                            <c:if test="${entity.onOff==1 }"><span style="color: blue;">开</span></c:if>
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
                                <span aria-hidden="true">&times;</span>
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
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

