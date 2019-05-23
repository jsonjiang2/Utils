<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <title>实名认证接口开关</title>
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
    <script type="text/javascript">

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
            $("#realname").val("");
            $("#bankmobile").val("");
            $("#bindstatus").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(username) {
            //清空查询条件
            // resetmeragent();
            if (username != "") {
                $("#username").val(username);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情页面跳转
        function deatilUI(id){
            var action = "${pageContext.request.contextPath}/admin/userBankCard/selectById/" + id;
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

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#username").val($.trim($("#username").val()));
            $("#realname").val($.trim($("#realname").val()));
            $("#bankmobile").val($.trim($("#bankmobile").val()));
            $("#bindstatus").val($.trim($("#bindstatus").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }

        function clearMode(id) {
            $("#" + id).html("");
        }
    </script>
</head>
<body style="font-size:12px;font-family: 微软雅黑">

<div class="container" style="width: 80%;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/userBankCard/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${userBankCard.username}" placeholder="填写用户名">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>姓名:</label>
                        <input type="text" class="form-control" name="realname" id="realname" value="${userBankCard.realname}" placeholder="填写姓名">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>手机号:</label>
                        <input type="text" class="form-control" name="bankmobile" id="bankmobile" value="${userBankCard.bankmobile}" placeholder="填写开卡手机号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>绑定状态:</label>
                        <select class="form-control" name="bindstatus" id="bindstatus">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${userBankCard.bindstatus==1}">selected</c:if>>已绑定</option>
                            <option value="2" <c:if test="${userBankCard.bindstatus==2}">selected</c:if>>已解绑</option>
                        </select>&nbsp;&nbsp;
                    </div>
                </div>
                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>

                <%--<button class="btn btn-default" type="button" id="add" onclick="insert_UI()"
                        style="float:right; margin-right:120px;margin-bottom: 5px;">新增设置
                </button>--%>
            </form>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr style="background-color: #CCCCCC;" class="text-center">
                    <td>序号</td>
                    <td>用户名</td>
                    <td>姓名</td>
                    <td>银行</td>
                    <td>卡号</td>
                    <td>绑定时间</td>
                    <td>是否默认取现卡</td>
                    <td>绑定状态</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list}" var="entity" varStatus="status">
                    <tr class="text-center">
                        <td>${status.count}</td>
                        <td>
                            <a href="javascript:selectByField('${entity.username}')" style="color: blue;">
                                    ${entity.username}
                            </a>
                        </td>
                        <td>${entity.realname}</td>
                        <td>${entity.bankname}</td>
                        <td>${entity.cardno}</td>
                        <td>
                            <c:if test="${not empty entity.bindtime}">
                                ${sf.format(entity.bindtime)}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${entity.isdefaultcard eq 1}"><span style="color: blue">是</span></c:if>
                            <c:if test="${entity.isdefaultcard eq 0}"><span style="color: red">否</span></c:if>
                        </td>
                        <td>
                            <c:if test="${entity.bindstatus eq 1}"><span style="color: blue">已绑定</span></c:if>
                            <c:if test="${entity.bindstatus eq 2}"><span style="color: red">已解绑</span></c:if>
                        </td>
                        <td>
                            <button class="btn btn-default"
                                    onclick="deatilUI('${entity.id}')">查看</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="page_div">
                <%@ include file="./../../common/pagehelper2.jsp"%>
            </div>

            <!-- 模态框 -->
            <div class="modal fade" id="Modal" tabindex="-1" role="dialog"
                 aria-labelledby="delModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" onclick="clearMode('modal-body')"
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
                            <button type="button" class="btn btn-default" onclick="clearMode('modal-body')" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
