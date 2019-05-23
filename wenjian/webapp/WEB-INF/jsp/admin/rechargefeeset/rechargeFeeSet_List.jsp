<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            $("#objectname").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(objectname) {
            //清空查询条件
            resetmeragent();
            if (objectname != "") {
                $("#objectname").val(objectname);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/rechargeFeeSet/selectById/" + id;
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

        //添加页面--网银、快捷insert_UIT
        function insert_UI(){
            var reid = $("#reid").val();
            var action = "${pageContext.request.contextPath}/admin/rechargeFeeSet/viewInsert";
            var param = {
                "reid" : reid,
            }
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
            $.post(action, param, callback);
        }
        //添加
        function insert(){
            //获取定义好规则的代理对象
            var bv = $("#insertForm").data("bootstrapValidator");
            //手动触发验证
            bv.validate();
            if(bv.isValid()){
                var id = $("#reid").val();
                //修改按钮设置为不可用
                $("#crudType").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/rechargeFeeSet/insert";
                var callback = function (data) {
                    $("#errorbankname").text("");
                    $("#errorlowamount").text("");
                    $("#errorhighamount").text("");
                    $("#errorfeetype").text("");
                    $("#errorfeerate").text("");
                    $("#errorminfee").text("");
                    $("#errormaxfee").text("");
                    //$("#errorauditonOff").text("");
                    var errors = data.errors;
                    if (errors == "errors") {
                        if (data.bknmnull != undefined) {
                            $("#errorbankname").text(data.bknmnull);
                        }
                        if (data.bnYsz != undefined) {
                            $("#errorbankname").text(data.bnYsz);
                        }
                        if (data.yszDbk != undefined) {
                            $("#errorbankname").text(data.yszDbk);
                        }
                        if (data.yszSbk != undefined) {
                            $("#errorbankname").text(data.yszSbk);
                        }
                        if (data.lownull != undefined) {
                            $("#errorlowamount").text(data.lownull);
                        }
                        if (data.dDYh != undefined) {
                            $("#errorlowamount").text(data.dDYh);
                        }
                        if (data.dDh != undefined) {
                            $("#errorhighamount").text(data.dDh);
                        }
                        if (data.hightnull != undefined) {
                            $("#errorhighamount").text(data.hightnull);
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
                        if (data.sdDYsh != undefined) {
                            $("#errorminfee").text(data.sdDYsh);
                        }
                        if (data.maxFee != undefined) {
                            $("#errormaxfee").text(data.maxFee);
                        }
                        $("#crudType").attr("disabled",false);
                        return false;
                    }
                    if ("添加成功" == data.Msg) {
                        alert(data.Msg);
                        selectByCondition(pageNum, pageSize,id);
                    }else if(data.Msg == "sessionOut"){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                }
                $.post(action, $("#insertForm").serialize(), callback);
            }
        }

        //添加页面--二维码
        function insert_UIT(){
            var reid = $("#reid").val();
            var action = "${pageContext.request.contextPath}/admin/rechargeFeeSet/viewInsertEWM";
            var param = {
                "reid" : reid,
            }
            var callback = function (data) {
                $("#crud").val("insertT");
                $("#crudType").text("添加");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            }
            $.post(action, param, callback);
        }
        //添加--二维码
        function insertT(){
            //获取定义好规则的代理对象
            var bv = $("#insertTForm").data("bootstrapValidator");
            //手动触发验证
            bv.validate();
            if(bv.isValid()){
                var id = $("#reid").val();
                //修改按钮设置为不可用
                $("#crudType").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/rechargeFeeSet/insertT";
                var callback = function (data) {
                    if("添加成功" == data.Msg) {
                        alert(data.Msg);
                        selectByCondition(pageNum, pageSize,id);
                    }else if(data.Msg != undefined){
                        alert(data.Msg);
                        //修改按钮设置为可用
                        $("#crudType").attr("disabled",false);
                        return false;
                    }else if(data.Msg == "sessionOut"){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                }
                $.post(action, $("#insertTForm").serialize(), callback);
            }
        }

        //修改页面
        function update_UI(id) {
            var reid = $("#reid").val();
            var action = "${pageContext.request.contextPath}/admin/rechargeFeeSet/viewUpdate/" + id;
            var param = {
                "reid" : reid,
            }
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
            $.post(action, param, callback);
        }
        //修改后保存
        function update(){
            var id = $("#reid").val();
            //修改按钮设置为不可用
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/rechargeFeeSet/updateById";
            var callback = function (data) {
                $("#lowamountError").text("");
                $("#highamountError").text("");
                $("#feerateError").text("");
                $("#minfeeError").text("");
                $("#maxfeeError").text("");
                var errors = data.errors;
                if (errors == "errors") {
                    if (data.lowamountNull != undefined) {
                        $("#lowamountError").text(data.lowamountNull);
                    }
                    if (data.highamountNull != undefined) {
                        $("#highamountError").text(data.highamountNull);
                    }
                    if (data.dDYh != undefined) {
                        $("#lowamountError").text(data.dDYh);
                    }
                    if (data.dDh != undefined) {
                        $("#highamountError").text(data.dDh);
                    }
                    if (data.feerateNull != undefined) {
                        $("#feerateError").text(data.feerateNull);
                    }
                    if (data.minfeeNull != undefined) {
                        $("#minfeeError").text(data.minfeeNull);
                    }
                    if (data.maxfeeNull != undefined) {
                        $("#maxfeeError").text(data.maxfeeNull);
                    }
                    if (data.sdDYsh != undefined) {
                        $("#minfeeError").text(data.sdDYsh);
                    }
                    //修改按钮设置为可用
                    $("#crudType").attr("disabled",false);
                    return false;
                }
                if ("修改成功" == data.Msg) {
                    alert(data.Msg);
                    selectByCondition(pageNum,pageSize,id);
                }else if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }
            }
            $.post(action, $("#updateForm").serialize(), callback);
        }

        //删除页面
        function deleteById(id){
            var action = "${pageContext.request.contextPath}/admin/rechargeFeeSet/viewDelete/" + id;
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
            var id2 = $("#reid").val();
            //修改按钮设置为不可用
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/rechargeFeeSet/deleteBy";
            var param = {
                "id" : id,
            }
            var callback = function (data) {
                if ("删除成功" == data.Msg) {
                    alert(data.Msg);
                    selectByCondition(pageNum,pageSize,id2);
                }else if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }
            }
            $.post(action, param, callback);
        }

        //根据订单号去充值设置List页面查询
        function findByRsno(){
            var rsno = $("#RSNO").html();
            window.location.href = "${pageContext.request.contextPath}/admin/rechargeSet/findByRsno/"+rsno;
        }

        //操作
        function operate() {
            var crud = $("#crud").val();
            if (crud == "insert") {
                insert()
            }else if (crud == "insertT") {
                insertT()
            }else if (crud == "update") {
                update()
            }else if (crud == "delete") {
                deletes()
            }
        }

        function selectByCondition(pageNum, pageSize,id) {
            //去掉查询条件两边的空格
            //$("#objectname").val($.trim($("#objectname").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            window.location.href = "${pageContext.request.contextPath}/admin/rechargeSet/lookes/" + id;
            //$("#conditionForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            var id = $("#reid").val();
            selectByCondition(pageNum, pageSize,id);
        }
    </script>

</head>
<body>
<div class="container" style="font-size: 12px; width: 85%; font-family: 微软雅黑">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/rechargeFeeSet/list" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <input type="hidden" id="reid" name="reid" value="${reid}"/>
                <button class="btn btn-default" type="button"
                        onclick="window.location.href='${pageContext.request.contextPath}/admin/rechargeSet/list';"
                        style="float: left;margin-top:33px;margin-left:33px;margin-bottom: 5px;">返回
                </button>
                <div class="col-md-9 form-inline" style="margin-top:33px;text-align: center;">
                    <div class="form-group">
                        <label>
                            <c:if test="${rechargeSet.rechargetype==1 }">二维码</c:if>
                            <c:if test="${rechargeSet.rechargetype==2 }">快捷</c:if>
                            <c:if test="${rechargeSet.rechargetype==3 }">网银</c:if>：
                            <a onclick="findByRsno()" style="cursor:pointer;"><span id="RSNO">${rechargeSet.rsno}</span></a>
                        </label>
                    </div>
                </div>
                <c:if test="${empty rechargeFeeSet and rechargeSet.rechargetype==1}">
                    <button class="btn btn-default" type="button" id="add" onclick="insert_UIT()"
                            style="float: right; margin-top: 33px; margin-right: 120px;margin-bottom: 5px;">新增
                    </button>
                </c:if>
                <c:if test="${empty rechargeFeeSet and rechargeSet.rechargetype==3 or rechargeSet.rechargetype==2 }">
                    <button class="btn btn-default" type="button" id="add" onclick="insert_UI()"
                            style="float: right; margin-top: 33px; margin-right: 120px;margin-bottom: 5px;">新增
                    </button>
                </c:if>
            </form>

            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>银行名称</td>
                    <td>单笔最低</td>
                    <td>单笔最高</td>
                    <td>收费方式</td>
                    <td>定额/百分比</td>
                    <td>手续费最低</td>
                    <td>手续费最高</td>
                    <td>操作</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.bankname}</td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.lowamount}">0.00</c:when>
                                <c:when test="${not empty entity.lowamount}">${entity.lowamount}元</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.highamount}">0.00</c:when>
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
                            <c:if test="${entity.feetype==2 }">${entity.feerate}%</c:if>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.minfee > 0}">${entity.minfee}元</c:when>
                                <c:otherwise>
                                    0.00
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.maxfee > 0}">${entity.maxfee}元</c:when>
                                <c:otherwise>
                                    0.00
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="update_UI('${entity.id}')">修改</button>
                            <button type="button" class="btn btn-default" onclick="deleteById('${entity.id}')">删除</button>
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

