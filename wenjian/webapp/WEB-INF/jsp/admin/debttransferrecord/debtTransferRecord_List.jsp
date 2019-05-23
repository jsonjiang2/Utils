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
            $("#transferserialnum").val("");
            $("#transferman").val("");
            $("#transferstatus").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(username, rechargetype, feetype, status) {
            //清空查询条件
            resetmeragent();
            if (username != "") {
                $("#username").val(username);
            }
            if (rechargetype != "") {
                $("#rechargetype").val(rechargetype);
            }
            if (feetype != "") {
                $("#feetype").val(feetype);
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
            var action = "${pageContext.request.contextPath}/admin/debtTransferRecord/selectById/" + id;
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
            $("#transferserialnum").val($.trim($("#transferserialnum").val()));
            $("#transferman").val($.trim($("#transferman").val()));
            $("#transferstatus").val($.trim($("#transferstatus").val()));

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
<div class="container" style="font-size: 12px; width: 85%; font-family: 微软雅黑">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/debtTransferRecord/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;width:80%">
                    <div class="form-group">
                        <label>出让流水号:</label>
                        <input type="text" class="form-control" name="transferserialnum" id="transferserialnum" value="${debtTransfer.transferserialnum}" placeholder="输入出让流水号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>出让人:</label>
                        <input type="text" class="form-control" name="transferman" id="transferman" value="${debtTransfer.transferman}" placeholder="输入出让人">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>出让状态:</label>
                        <select class="form-control" name="transferstatus" id="transferstatus">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${debtTransfer.transferstatus==1}">selected</c:if>>部分</option>
                            <option value="2" <c:if test="${debtTransfer.transferstatus==2}">selected</c:if>>全部</option>
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
                    <td>出让流水号</td>
                    <td>出让人</td>
                    <td>平台名称</td>
                    <td>债转金额</td>
                    <td>承接金额</td>
                    <td>承接次数</td>
                    <td>出让折扣</td>
                    <td>出让状态</td>
                    <td>上架状态</td>
                    <td>交易状态</td>
                    <td>审核状态</td>
                    <td>备注</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.transferserialnum}</td>
                        <td>${entity.transferman}</td>
                        <td><span style="color: blue;">${entity.platformnum}--${entity.platformname}</span></td>
                        <td>${entity.debetransferamount}</td>
                        <td>${entity.receptamount}</td>
                        <td><span style="color: blue;">${entity.receptcount}</span></td>
                        <td><fmt:formatNumber value="${entity.transferdiscount *100}" pattern="0.00" maxFractionDigits="2"/></td>
                        <td>
                            <c:if test="${entity.transferstatus eq 1}"><span style="color: blue">部分出让</span></c:if>
                            <c:if test="${entity.transferstatus eq 2}"><span style="color: blue">全部出让</span></c:if>
                        </td>
                        <td>
                            <c:if test="${entity.shelvesstatus eq 1}"><span style="color: blue">上架中</span></c:if>
                            <c:if test="${entity.shelvesstatus eq 2}"><span style="color: blue">已下架</span></c:if>
                        </td>
                        <td>
                            <c:if test="${entity.shelvesstatus eq 1}"><span style="color: blue">可交易</span></c:if>
                            <c:if test="${entity.shelvesstatus eq 2}"><span style="color: blue">不可交易</span></c:if>
                        </td>
                        <td>
                            <c:if test="${entity.auditstatus eq 1}"><span style="color: blue">待审核</span></c:if>
                            <c:if test="${entity.auditstatus eq 2}"><span style="color: blue">审核通过</span></c:if>
                            <c:if test="${entity.auditstatus eq 3}"><span style="color: blue">审核退回</span></c:if>
                        </td>
                        <td>${entity.remark}</td>
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

