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

    <title>押金冻结解冻</title>
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
            $("#ftorderno").val("");
            $("#orderno").val("");
            $("#deposittype").val("");
            $("#status").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(username,orderno,deposittype,status) {
            //清空查询条件
            resetmeragent();
            if (username != "") {
                $("#username").val(username);
            }
            if (orderno != "") {
                $("#orderno").val(orderno);
            }
            if (deposittype != "") {
                $("#deposittype").val(deposittype);
            }
            if (status != "") {
                $("#status").val(status);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/depositFreezeThaw/selectById/" + id;
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
            $("#ftorderno").val($.trim($("#ftorderno").val()));
            $("#orderno").val($.trim($("#orderno").val()));
            $("#deposittype").val($.trim($("#deposittype").val()));
            $("#status").val($.trim($("#status").val()));

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
<div class="container" style="width:90%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/depositFreezeThaw/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;width:95%;">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${depositFreezeThaw.username}" placeholder="输入用户名">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>押金冻解流水号:</label>
                        <input type="text" class="form-control" name="ftorderno" id="ftorderno" value="${depositFreezeThaw.ftorderno}" placeholder="输入押金冻解流水号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>关联流水号:</label>
                        <input type="text" class="form-control" name="orderno" id="orderno" value="${depositFreezeThaw.orderno}" placeholder="输入关联流水号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>押金类型:</label>
                        <select class="form-control" name="deposittype" id="deposittype">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${depositFreezeThaw.deposittype==1}">selected</c:if>>骗返押金</option>
                            <option value="2" <c:if test="${depositFreezeThaw.deposittype==2}">selected</c:if>>平台押金</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>状态:</label>
                        <select class="form-control" name="status" id="status">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${depositFreezeThaw.status==1}">selected</c:if>>冻结</option>
                            <option value="2" <c:if test="${depositFreezeThaw.status==2}">selected</c:if>>解冻</option>
                        </select>&nbsp;&nbsp;
                    </div>
                </div>
                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>
            </form>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>押金冻解流水号</td>
                    <td>押金类型</td>
                    <td>用户名-姓名</td>
                    <td>冻结金额</td>
                    <td>解冻金额</td>
                    <td>关联流水号</td>
                    <td>退款状态</td>
                    <td>可用余额</td>
                    <td>冻结总额</td>
                    <td>总金额</td>
                    <td>操作时间</td>
                    <td>状态</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.ftorderno }</td>
                        <td>
                            <a href="javascript:selectByField('','','${entity.deposittype}','')" style="color: blue;">
                                <c:if test="${entity.deposittype==1 }">骗返押金</c:if>
                                <c:if test="${entity.deposittype==2 }">平台押金</c:if>
                            </a>
                        </td>
                        <td>
                            <wdb:getUser uid="${entity.baseid}" var="user">
                                <a href="javascript:selectByField('${user.username}','','','')" style="color: blue;">
                                        ${user.username}-${empty user.realname? "无" : user.realname}
                                </a>
                            </wdb:getUser>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.status==1 }">
                                    ${entity.amount}
                                </c:when>
                                <c:otherwise>
                                    --
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.status==2 }">
                                    ${entity.amount}
                                </c:when>
                                <c:otherwise>
                                    --
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.orderno }">
                                    <a href="javascript:selectByField('','${entity.orderno}','','')" style="color: blue;">
                                            ${entity.orderno}
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    无
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${entity.depositstatus==1 }">待处理</c:if>
                            <c:if test="${entity.depositstatus==2 }"><span style="color: blue">退款成功</span></c:if>
                            <c:if test="${entity.depositstatus==3 }"><span style="color: red">退款失败</span></c:if>
                        </td>
                        <td>${entity.avlbalance}</td>
                        <td>${entity.freebalance}</td>
                        <td>${entity.totalbalance}</td>
                        <td>
                            <wdb:formatDate value="${entity.freezetime}" var="freezetime">
                                ${empty freezetime ? '无' : freezetime}
                            </wdb:formatDate>
                        </td>
                        <td>
                            <c:if test="${entity.status==1 }"><span style="color:red;">冻结</span></c:if>
                            <c:if test="${entity.status==2 }"><span style="color:blue;">解冻</span></c:if>
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
                                <span class="glyphicon glyphicon-info-sign"></span>提示：正在进行查看详情操作
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
