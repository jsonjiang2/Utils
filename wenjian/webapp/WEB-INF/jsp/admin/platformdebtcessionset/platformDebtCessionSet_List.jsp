<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        #personList_table {
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

        #tableId tr td {
            border: none;
        }
    </style>
    <script>
        /*
         全局的pageNum与pageSize
         */
        var pageNum = '${pagehelper.pageNum}';
        var pageSize = '${pagehelper.pageSize}';

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
            $("#platformnumId").val("");
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/platformDebtCessionSet/selectById/" + id;
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
        function insert_UI() {
            var action = "${pageContext.request.contextPath}/admin/platformDebtCessionSet/viewInsert";
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
        function insert() {
            //获取定义好规则的代理对象
            var bv = $("#insertForm").data("bootstrapValidator");
            //手动触发验证
            bv.validate();
            if (bv.isValid()) {
                //修改按钮设置为不可用
                $("#crudType").attr("disabled", true);
                var action = "${pageContext.request.contextPath}/admin/platformDebtCessionSet/insert";
                var callback = function (data) {
                    $("#errortransferway").text("");
                    $("#errorreceptway").text("");
                    $("#errordiscountmax").text("");
                    $("#errorrecordedway").text("");
                    $("#errortransferfee").text("");
                    $("#errorrecepterfee").text("");
                    $("#errordebtstatus").text("");
                    var errors = data.errors;
                    if (errors == "errors") {
                        if (data.transferwaynotnull != undefined) {
                            $("#errortransferway").text(data.transferwaynotnull);
                        }
                        if (data.receptwaynotnull != undefined) {
                            $("#errorreceptway").text(data.receptwaynotnull);
                        }
                        if (data.discountminnotnull != undefined) {
                            $("#errordiscountmax").text(data.discountminnotnull);
                        }
                        if (data.discountmaxnotnull != undefined) {
                            $("#errordiscountmax").text(data.discountmaxnotnull);
                        }
                        if (data.discountcopare != undefined) {
                            $("#errordiscountmax").text(data.discountcopare);
                        }
                        if (data.recordedwaynotnull != undefined) {
                            $("#errorrecordedway").text(data.recordedwaynotnull);
                        }
                        if (data.transferfeenotnull != undefined) {
                            $("#errortransferfee").text(data.transferfeenotnull);
                        }
                        if (data.recepterfeenotnull != undefined) {
                            $("#errorrecepterfee").text(data.recepterfeenotnull);
                        }
                        if (data.debtstatusnotnull != undefined) {
                            $("#errordebtstatus").text(data.debtstatusnotnull);
                        }
                        //修改按钮设置为可用
                        $("#crudType").attr("disabled", false);
                        return false;
                    }
                    if ("添加成功" == data.Msg) {
                        alert(data.Msg);
                        document.getElementById("query_btn").onclick();
                    }
                }
                $.post(action, $("#insertForm").serialize(), callback);
            }
        }

        //修改页面
        function update_UI(id) {
            var action = "${pageContext.request.contextPath}/admin/platformDebtCessionSet/viewUpdate/" + id;
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
        function update() {
            //修改按钮设置为不可用
            $("#crudType").attr("disabled", true);
            var action = "${pageContext.request.contextPath}/admin/platformDebtCessionSet/updateById";
            var callback = function (data) {
                $("#errortransferway").text("");
                $("#errorreceptway").text("");
                $("#errordiscountmax").text("");
                $("#errorrecordedway").text("");
                $("#errortransferfee").text("");
                $("#errorrecepterfee").text("");
                $("#errordebtstatus").text("");
                var errors = data.errors;
                if (errors == "errors") {
                    if (data.transferwaynotnull != undefined) {
                        $("#errortransferway").text(data.transferwaynotnull);
                    }
                    if (data.receptwaynotnull != undefined) {
                        $("#errorreceptway").text(data.receptwaynotnull);
                    }
                    if (data.discountminnotnull != undefined) {
                        $("#errordiscountmax").text(data.discountminnotnull);
                    }
                    if (data.discountmaxnotnull != undefined) {
                        $("#errordiscountmax").text(data.discountmaxnotnull);
                    }
                    if (data.discountcopare != undefined) {
                        $("#errordiscountmax").text(data.discountcopare);
                    }
                    if (data.recordedwaynotnull != undefined) {
                        $("#errorrecordedway").text(data.recordedwaynotnull);
                    }
                    if (data.transferfeenotnull != undefined) {
                        $("#errortransferfee").text(data.transferfeenotnull);
                    }
                    if (data.recepterfeenotnull != undefined) {
                        $("#errorrecepterfee").text(data.recepterfeenotnull);
                    }
                    if (data.debtstatusnotnull != undefined) {
                        $("#errordebtstatus").text(data.debtstatusnotnull);
                    }

                    //修改按钮设置为可用
                    $("#crudType").attr("disabled", false);
                    return false;
                }
                if ("修改成功" == data.Msg) {
                    alert(data.Msg);
                    selectByCondition(pageNum, pageSize);
                }
            }
            $.post(action, $("#updateForm").serialize(), callback);
        }

        //删除页面
        function deleteById(id) {
            var flag = confirm("确定要删除吗？");
            var action = "${pageContext.request.contextPath}/admin/platformDebtCessionSet/deleteBy/" + id;
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
        //删除
        function deletes() {
            var id = $("#delByid").val();
            //修改按钮设置为不可用
            $("#crudType").attr("disabled", true);
            var action = "${pageContext.request.contextPath}/admin/platformDebtCessionSet/deleteBy";
            var param = {
                "id": id,
            }
            var callback = function (data) {
                if ("false" == data.Msg) {
                    alert("此用户设置已删除过");
                    selectByCondition(pageNum, pageSize);
                }
                if ("删除成功" == data.Msg) {
                    alert(data.Msg);
                    selectByCondition(pageNum, pageSize);
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
            } else if (crud == "delete") {
                deletes()
            }
        }

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#platformnumId").val($.trim($("#platformnumId").val()));

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
            <form action="${pageContext.request.contextPath}/admin/platformDebtCessionSet/list" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>平台编号:</label>
                        <input type="text" class="form-control" name="platformnum" id="platformnumId" value="${platformDebtCessionSet.platformnum}" placeholder="输入平台编号查询">&nbsp;&nbsp;
                    </div>
                </div>

                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>
                <button class="btn btn-default" type="button" id="add" onclick="insert_UI()"
                        style="float: right; margin-right: 120px;margin-bottom: 5px;">新增平台
                </button>
            </form>

            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>平台名称</td>
                    <td>出让方式</td>
                    <td>承接方式</td>
                    <td>最小折扣</td>
                    <td>最大折扣</td>
                    <td>入账方式</td>
                    <td>出让人手续费率</td>
                    <td>承接人手续费率</td>
                    <td>债转状态</td>
                    <td>备注</td>
                    <td>操作</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.platformnum}--${entity.platformname}</td>
                        <td>
                            <c:if test="${entity.transferway eq 1}"><span style="color: blue">部分</span></c:if>
                            <c:if test="${entity.transferway eq 2}"><span style="color: blue">全部</span></c:if>
                        </td>
                        <td>
                            <c:if test="${entity.receptway eq 1}"><span style="color: blue">部分</span></c:if>
                            <c:if test="${entity.receptway eq 2}"><span style="color: blue">全部</span></c:if>
                        </td>
                        <td>
                            <fmt:formatNumber value="${entity.discountmin *100}" pattern="0.00" maxFractionDigits="2"/>
                        </td>
                        <td>
                            <fmt:formatNumber value="${entity.discountmax *100}" pattern="0.00" maxFractionDigits="2"/>
                        </td>

                        <td>
                            <c:if test="${entity.recordedway eq 1}"><span style="color: blue">及时</span></c:if>
                            <c:if test="${entity.recordedway eq 2}"><span style="color: blue">冻结</c:if>
                        </td>
                        <td>
                            <fmt:formatNumber value="${entity.transferfee *100}" pattern="0.00" maxFractionDigits="2"/>%
                        </td>
                        <td>
                            <fmt:formatNumber value="${entity.recepterfee *100}" pattern="0.00" maxFractionDigits="2"/>%
                        </td>
                        <td>
                            <c:if test="${entity.debtstatus==1 }"><span style="color: red;">开启</span></c:if>
                            <c:if test="${entity.debtstatus==2 }"><span style="color: blue;">关闭</span></c:if>
                        </td>
                       <%-- <td>
                            <wdb:formatDate value="${entity.settime}" var="settime">
                                ${empty settime ? '无' : settime}
                            </wdb:formatDate>
                        </td>--%>


                      <%--  <td>${entity.setman}</td>--%>
                        <td>${entity.remark}</td>
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
                <%@ include file="/WEB-INF/jsp/common/pagehelper2.jsp" %>
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

