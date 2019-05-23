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

    <title>打赏记录</title>
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
            $("#redpacketno").val("");
            $("#status").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(username,status,paymenttype) {
            //清空查询条件
            resetmeragent();
            if (username != "") {
                $("#username").val(username);
            }
            if (status != "") {
                $("#status").val(status);
            }
            if (paymenttype != "") {
                $("#paymenttype").val(paymenttype);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/redpacketDetail/selectById/" + id;
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

        //主题查看
        /*function lookes(id) {
         window.location.href = "/forumThreadViewReward?tid=" + id;
         }*/

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#username").val($.trim($("#username").val()));
            $("#redpacketno").val($.trim($("#redpacketno").val()));
            $("#status").val($.trim($("#status").val()));
            $("#paymenttype").val($.trim($("#paymenttype").val()));

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
            <form action="${pageContext.request.contextPath}/admin/redpacketDetail/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-12 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>发起人:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${redpacketDetail.username}" placeholder="输入用户名查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>红包编号:</label>
                        <input type="text" class="form-control" name="redpacketno" id="redpacketno" value="${redpacketDetail.redpacketno}" placeholder="输入红包编号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>红包状态:</label>
                        <select class="form-control" name="status" id="status">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${redpacketDetail.status==1}">selected</c:if>>待领取</option>
                            <option value="2" <c:if test="${redpacketDetail.status==2}">selected</c:if>>已领完</option>
                            <option value="3" <c:if test="${redpacketDetail.status==3}">selected</c:if>>已过期</option>
                            <option value="-1" <c:if test="${redpacketDetail.status==-1}">selected</c:if>>审核中</option>
                            <option value="-2" <c:if test="${redpacketDetail.status==-2}">selected</c:if>>审核失败</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>付款方式:</label>
                        <select class="form-control" name="paymenttype" id="paymenttype">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${redpacketRechargeRecord.paymenttype==1}">selected</c:if>>支付宝</option>
                            <option value="2" <c:if test="${redpacketRechargeRecord.paymenttype==2}">selected</c:if>>微信</option>
                            <option value="3" <c:if test="${redpacketRechargeRecord.paymenttype==3}">selected</c:if>>巴士余额</option>
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
                    <td>红包编号</td>
                    <td>发起人</td>
                    <td>红包口令</td>
                    <td>剩余份数</td>
                    <td>红包单笔金额</td>
                    <td>总份数</td>
                    <td>红包总金额</td>
                    <td>付款方式</td>
                    <td>红包主题</td>
                    <td>红包状态</td>
                    <td>发起时间</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <c:if test="${entity.status != -3}">
                        <tr class="text-center">
                            <td>${tendsta.count}</td>
                            <td>${entity.redpacketno}</td>
                            <td>
                                <wdb:getUser uid="${entity.baseid}" var="user">
                                    <a href="javascript:selectByField('${user.username}','','')" style="color: blue;">
                                            ${user.username}-${empty user.realname? "无":user.realname}
                                    </a>
                                </wdb:getUser>
                            </td>
                            <td class="remark-p" title="${entity.rpacketcommand }">${entity.rpacketcommand}</td>
                            <td>${entity.remaindernumber}份</td>
                            <td><fmt:formatNumber value="${entity.rpacketamount}" pattern="0.00" maxFractionDigits="2" /></td>
                            <td>${entity.totalnumber}份</td>
                            <td><fmt:formatNumber value="${entity.rpackettotalamount}" pattern="0.00" maxFractionDigits="2" /></td>
                            <td>
                                <a href="javascript:selectByField('','','${entity.paymenttype}')" style="color: blue;">
                                    <c:if test="${entity.paymenttype==1}">支付宝</c:if>
                                    <c:if test="${entity.paymenttype==2}">微信</c:if>
                                    <c:if test="${entity.paymenttype==3}">巴士余额</c:if>
                                </a>
                            </td>
                            <td>
                                <a target="_blank" href="${url}thread-${entity.pfttid}-1-1.html?wdaikey=fb9f74ac80fbf0d35ba2fcec10c93bff" class="btn btn-default">查看</a>
                            </td>
                            <td>
                                <a href="javascript:selectByField('','${entity.status}','')">
                                    <c:if test="${entity.status==1}"><span style="color: blue;">待领取</span></c:if>
                                    <c:if test="${entity.status==2}"><span style="color: #6A6AFF">已领完</span></c:if>
                                    <c:if test="${entity.status==3}"><span style="color: #7C7C7C;">已过期</span></c:if>
                                    <c:if test="${entity.status==-1}">审核中</c:if>
                                    <c:if test="${entity.status==-2}"><span style="color: red;">审核失败</span></c:if>
                                    <c:if test="${entity.status==-3}">取消</c:if>
                                </a>
                            </td>
                            <td>
                                <c:if test="${not empty entity.sendtime}">
                                    ${sf.format(entity.sendtime)}
                                </c:if>
                            </td>
                            <td>
                                <button type="button" class="btn btn-default" onclick="selectById('${entity.id}')">详情</button>
                            </td>
                        </tr>
                    </c:if>
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
