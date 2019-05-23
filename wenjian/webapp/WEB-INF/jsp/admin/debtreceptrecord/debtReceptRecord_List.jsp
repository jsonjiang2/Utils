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
            $("#receptman").val("");
            $("#receptstatus").val("");
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
            var action = "${pageContext.request.contextPath}/admin/debtReceptRecord/selectById/" + id;
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
            $("#receptman").val($.trim($("#receptman").val()));
            $("#receptstatus").val($.trim($("#receptstatus").val()));

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
            <form action="${pageContext.request.contextPath}/admin/debtReceptRecord/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;width:80%">
                    <div class="form-group">
                        <label>承接流水号:</label>
                        <input type="text" class="form-control" name="transferserialnum" id="transferserialnum" value="${debtRecept.transferserialnum}" placeholder="输入出让流水号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>承接人:</label>
                        <input type="text" class="form-control" name="receptman" id="receptman" value="${debtRecept.receptman}" placeholder="输入出让人">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>承接状态:</label>
                        <select class="form-control" name="receptstatus" id="receptstatus">
                            <option value="1" <c:if test="${debtRecept.receptstatus==1}">selected</c:if>>取消</option>
                            <option value="2" <c:if test="${debtRecept.receptstatus==2}">selected</c:if>>待处理</option>
                            <option value="2" <c:if test="${debtRecept.receptstatus==3}">selected</c:if>>成功</option>
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
                    <td>承接流水号</td>
                    <td>承接人</td>
                    <td>出让人</td>
                    <td>承接金额</td>
                    <td>承接时间</td>
                    <td>平台名称</td>
                    <td>承接状态</td>
                    <td>出让流水号</td>
                    <td>出让手续费</td>
                    <td>承接手续费</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.transferserialnum}</td>
                        <td>${entity.receptman}</td>
                        <td>${entity.transferman}</td>
                        <td>${entity.receptamount}</td>
                        <td>
                            <wdb:formatDate value="${entity.recepttime}" var="recepttime">
                                ${empty recepttime ? '无' : recepttime}
                            </wdb:formatDate>
                        </td>
                        <td><span style="color: blue;">${entity.platformnum}--${entity.platformname}</span></td>
                        <td>
                            <c:if test="${entity.receptstatus eq 1}"><span style="color: blue">取消</span></c:if>
                            <c:if test="${entity.receptstatus eq 2}"><span style="color: blue">待处理</span></c:if>
                            <c:if test="${entity.receptstatus eq 3}"><span style="color: blue">成功</span></c:if>
                        </td>
                        <td>${entity.transferserialnum}</td>
                        <td>${entity.transferfee}</td>
                        <td>${entity.receptfee}</td>
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

