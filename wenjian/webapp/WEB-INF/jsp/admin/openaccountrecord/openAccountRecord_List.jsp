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
            $("#platformnum").val("");
            $("#openaccountstatus").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(platformnum) {
            //清空查询条件
            resetmeragent();
            if (platformnum != "") {
                $("#platformnum").val(platformnum);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/openAccountRecord/selectById/" + id;
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
            $("#platformnum").val($.trim($("#platformnum").val()));
            $("#openaccountstatus").val($.trim($("#openaccountstatus").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }

        //查看图片
        function imgEye(img) {
            $("#detailsModalLabel").html("<span class='glyphicon glyphicon-info-sign'></span>提示：正在进行图片查看操作");
            $("#detail-modal-body").html("<img style='max-width:100%;' src=" + img + ">");
            $("#detailsModal").modal("show");
        }


    </script>

</head>
<body>
<div class="container" style="font-size: 12px; width: 85%; font-family: 微软雅黑">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/openAccountRecord/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;width:80%">
                    <div class="form-group">
                        <label>平台编号:</label>
                        <input type="text" class="form-control" name="platformnum" id="platformnum" value="${openAccountRecord.platformnum}" placeholder="输入出平台编号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>审核状态:</label>
                        <select class="form-control" name="openaccountstatus" id="openaccountstatus">
                            <option value="1" <c:if test="${openAccountRecord.openaccountstatus==1}">selected</c:if>>待审核</option>
                            <option value="2" <c:if test="${openAccountRecord.openaccountstatus==2}">selected</c:if>>成功</option>
                            <option value="2" <c:if test="${openAccountRecord.openaccountstatus==3}">selected</c:if>>失败</option>
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
                    <td>平台名称</td>
                    <td>用户名-姓名</td>
                    <td>身份证号码(真实姓名)</td>
                    <td>平台手机号</td>
                    <td>开户时间</td>
                    <td>开户方式</td>
                    <td>正面全身证照</td>
                    <td>手持身份证照</td>
                    <td>身份证照(正)</td>
                    <td>身份证照(反)</td>
                    <td>手写承诺书</td>
                    <td>平台用户名</td>
                    <td>平台登录密码</td>
                    <td>充值银行卡扣款图</td>
                    <td>提现银行卡到账截图</td>
                    <td>开户状态</td>
                    <td>备注</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td><span style="color: blue;"><a href="javascript:selectByField('${entity.platformnum}')" style="color: blue;">
                                ${entity.platformnum}--${entity.platformname}</a></span></td>
                        <td>
                            <wdb:getUser uid="${entity.baseid}" var="user">
                                ${user.username}-${user.realname}
                            </wdb:getUser>
                        </td>
                        <td>
                            <c:if test="${ not empty entity.baseid}">
                                ${entity.certno}(${entity.realname})
                            </c:if>
                        </td>
                        <td>${entity.platformmobile}</td>
                        <td>
                            <wdb:formatDate value="${entity.registertime}" var="registertime">
                                ${empty registertime ? '无' : registertime}
                            </wdb:formatDate>
                        </td>
                        <td>
                            <c:if test="${entity.openaccountway eq 1}"><span style="color: blue">正开户</span></c:if>
                            <c:if test="${entity.openaccountway eq 2}"><span style="color: blue">反开户</span></c:if>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.fullpicpath}">
                                    <button class="btn btn-default" onclick="imgEye('${entity.fullpicpath }')">查看</button>
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.certpicinhandpath }">
                                    <button class="btn btn-default" onclick="imgEye('${entity.certpicinhandpath }')">查看</button>
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.certpicfrontpath }">
                                    <button class="btn btn-default" onclick="imgEye('${entity.certpicfrontpath }')">查看</button>
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.certpicversopath }">
                                    <button class="btn btn-default" onclick="imgEye('${entity.certpicversopath }')">查看</button>
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.handpromisepath }">
                                    <button class="btn btn-default" onclick="imgEye('${entity.handpromisepath }')">查看</button>
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                        <td>${entity.platformusername}</td>
                        <td>${entity.platformpassword}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.bankcarddeductpicpath }">
                                    <button class="btn btn-default" onclick="imgEye('${entity.bankcarddeductpicpath }')">查看</button>
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.bankcardtoaccountpicpath }">
                                    <button class="btn btn-default" onclick="imgEye('${entity.bankcardtoaccountpicpath }')">查看</button>
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${entity.openaccountstatus eq 1}"><span style="color: blue">待审核</span></c:if>
                            <c:if test="${entity.openaccountstatus eq 2}"><span style="color: blue">成功</span></c:if>
                            <c:if test="${entity.openaccountstatus eq 3}"><span style="color: blue">失败</span></c:if>
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
            <!-- 查看详情模态框 （图片展示） -->
            <div class="modal fade" id="detailsModal" tabindex="-1" role="dialog"
                 aria-labelledby="detailsModalLabel">
                <div id="detail-modal" class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="detailsModalLabel">
                                <span class="glyphicon glyphicon-info-sign"></span>提示：正在进行查看详情操作
                            </h4>
                        </div>
                        <div id="detail-modal-body" class="modal-body" style="display: block">

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>

