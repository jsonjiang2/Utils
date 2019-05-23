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

    <title>骗返押金余额</title>
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
            $("#pno").val("");
            $("#type").val("");
            $("#borderno").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(pno) {
            //清空查询条件
            resetmeragent();
            if (pno != "") {
                $("#pno").val(pno);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/platformDepositInEx/selectById/" + id;
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
            $("#pno").val($.trim($("#pno").val()));
            $("#type").val($.trim($("#type").val()));
            $("#borderno").val($.trim($("#borderno").val()));

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
<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/platformDepositInEx/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>平台编号:</label>
                        <input type="text" class="form-control" name="pno" id="pno" value="${platformDepositInEx.pno}" placeholder="输入平台编号查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>关联流水号:</label>
                        <input type="text" class="form-control" name="borderno" id="borderno" value="${platformDepositInEx.borderno}" placeholder="输入关联流水号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>业务类型:</label>
                        <select class="form-control" name="type" id="type">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${platformDepositInEx.type==1}">selected</c:if>>缴纳</option>
                            <option value="2" <c:if test="${platformDepositInEx.type==2}">selected</c:if>>退款</option>
                            <option value="3" <c:if test="${platformDepositInEx.type==3}">selected</c:if>>手充</option>
                            <option value="4" <c:if test="${platformDepositInEx.type==4}">selected</c:if>>充值</option>
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
                    <td>关联流水号</td>
                    <td>押金类型</td>
                    <td>平台编号-平台名</td>
                    <td>缴纳</td>
                    <td>退款</td>
                    <td>业务类型</td>
                    <td>冻结余额</td>
                    <td>可用余额</td>
                    <td>总余额</td>
                    <td>发生时间</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.borderno}</td>
                        <td>
                            <c:if test="${entity.deposittype==1 }">平台押金</c:if>
                        </td>
                        <td>
                            <a href="javascript:selectByField('${entity.pno}')" style="color: blue;">
                                    ${entity.pno}-${entity.ptname}
                            </a>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.type==1 || entity.type==3 || entity.type==4}">
                                    <span style="color:blue;">${entity.depositamount}</span>
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.type==2}">
                                    <span style="color:red;">${entity.depositamount}</span>
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${entity.type==1}">缴纳</c:if>
                            <c:if test="${entity.type==2}">退款</c:if>
                            <c:if test="${entity.type==3}">手充</c:if>
                            <c:if test="${entity.type==4}">充值</c:if>
                        </td>
                        <td><fmt:formatNumber value="${entity.freezebalance}" pattern="0.00" maxFractionDigits="2" /></td>
                        <td><fmt:formatNumber value="${entity.avlbalance}" pattern="0.00" maxFractionDigits="2" /></td>
                        <td><fmt:formatNumber value="${entity.totalbalance}" pattern="0.00" maxFractionDigits="2" /></td>
                        <td>
                            <c:if test="${not empty entity.happentime}">
                                ${sf.format(entity.happentime)}
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
