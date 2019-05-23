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
            $("#awusername").val("");
            $("#paymenttype").val("");
            $("#rewardno").val("");
            $("#status").val("");
            $("#rewardtype").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(username,awusername,paymenttype,status) {
            //清空查询条件
            resetmeragent();
            if (username != "") {
                $("#username").val(username);
            }
            if (awusername != "") {
                $("#awusername").val(awusername);
            }
            if (paymenttype != "") {
                $("#paymenttype").val(paymenttype);
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
            var action = "${pageContext.request.contextPath}/admin/rewardRecord/selectById/" + id;
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

        //勾兑
        function blenDingByRewardOrderno(id) {
            $.ajax({
                type: "post",
                url : "${pageContext.request.contextPath}/admin/rewardRecord/blenDingByRewardOrderno",
                data : {"id":id},
                success:function (data) {
                    alert(data.message);
                    selectByCondition(1,20);
                }
            });
        }

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#username").val($.trim($("#username").val()));
            $("#awusername").val($.trim($("#awusername").val()));
            $("#paymenttype").val($.trim($("#paymenttype").val()));
            $("#rewardno").val($.trim($("#rewardno").val()));
            $("#status").val($.trim($("#status").val()));
            $("#rewardtype").val($.trim($("#rewardtype").val()));

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
            <form action="${pageContext.request.contextPath}/admin/rewardRecord/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-12 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>打赏人:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${RewardRecord.username}" placeholder="输入用户名查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>受赏人:</label>
                        <input type="text" class="form-control" name="awusername" id="awusername" value="${RewardRecord.awusername}" placeholder="输入用户名查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>打赏流水号:</label>
                        <input type="text" class="form-control" name="rewardno" id="rewardno" value="${RewardRecord.rewardno}" placeholder="输入打赏流水号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>付款方式:</label>
                        <select class="form-control" name="paymenttype" id="paymenttype">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${RewardRecord.paymenttype==1}">selected</c:if>>支付宝</option>
                            <option value="2" <c:if test="${RewardRecord.paymenttype==2}">selected</c:if>>微信</option>
                            <option value="3" <c:if test="${RewardRecord.paymenttype==3}">selected</c:if>>巴士余额</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>打赏状态:</label>
                        <select class="form-control" name="status" id="status">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${RewardRecord.status==1}">selected</c:if>>取消</option>
                            <option value="2" <c:if test="${RewardRecord.status==2}">selected</c:if>>打赏失败</option>
                            <option value="3" <c:if test="${RewardRecord.status==3}">selected</c:if>>打赏成功</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>打赏类型:</label>
                        <select class="form-control" name="rewardtype" id="rewardtype">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${RewardRecord.rewardtype==1}">selected</c:if>>网贷茶馆</option>
                            <option value="2" <c:if test="${RewardRecord.rewardtype==2}">selected</c:if>>网贷资讯</option>
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
                    <td>打赏流水号</td>
                    <td>打赏人</td>
                    <td>受赏人</td>
                    <td>打赏金额</td>
                    <td>付款方式</td>
                    <td>打赏主题</td>
                    <td>打赏状态</td>
                    <td>打赏类型</td>
                    <td>打赏时间</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.rewardno}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.rewardbaseid}">
                                    <wdb:getUser uid="${entity.rewardbaseid}" var="user">
                                        <a href="javascript:selectByField('${user.username}','','','')" style="color: blue;">
                                                ${user.username}-${user.realname}
                                        </a>
                                    </wdb:getUser>
                                </c:when>
                                <c:otherwise>
                                    匿名
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <wdb:getUser uid="${entity.awardbaseid}" var="user">
                                <a href="javascript:selectByField('','${user.username}','','')" style="color: blue;">
                                        ${user.username}-${user.realname}
                                </a>
                            </wdb:getUser>
                        </td>
                        <td><fmt:formatNumber value="${entity.rewardamount}" pattern="0.00" maxFractionDigits="2" /></td>
                        <td>
                            <a href="javascript:selectByField('','','${entity.paymenttype}','')" style="color: blue;">
                                <c:if test="${entity.paymenttype==1}">支付宝</c:if>
                                <c:if test="${entity.paymenttype==2}">微信</c:if>
                                <c:if test="${entity.paymenttype==3}">巴士余额</c:if>
                            </a>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.rewardtype==1}">
                                    <a target="_blank" href="${url}thread-${entity.pfttid}-1-1.html?wdaikey=fb9f74ac80fbf0d35ba2fcec10c93bff" class="btn btn-default">查看</a>
                                    <%--<a target="_blank" href="${basePath}/forumThreadView?tid=${entity.pfttid}" class="btn btn-default">查看</a>--%>
                                </c:when>
                                <c:otherwise>
                                    <a target="_blank" href="${url}article-${entity.pfttid}-1-1.html?wdaikey=fb9f74ac80fbf0d35ba2fcec10c93bff" class="btn btn-default">查看</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="javascript:selectByField('','','','${entity.status}')">
                                <c:if test="${entity.status==1}">取消</c:if>
                                <c:if test="${entity.status==2}"><span style="color:red;">打赏失败</span></c:if>
                                <c:if test="${entity.status==3}"><span style="color:blue;">打赏成功</span></c:if>
                            </a>
                        </td>
                        <td>
                            <c:if test="${entity.rewardtype==1}">网贷茶馆</c:if>
                            <c:if test="${entity.rewardtype==2}">网贷资讯</c:if>
                        </td>
                        <td>
                            <c:if test="${not empty entity.rewardtime}">
                                ${sf.format(entity.rewardtime)}
                            </c:if>
                        </td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="selectById('${entity.id}')">详情</button>
                            <c:if test="${entity.paymenttype != 3}">
                                <c:if test="${entity.gouduistatus == 0 or entity.gouduistatus == 4 }">
                                    <button type="button" id="gd" class="btn btn-default" onclick="blenDingByRewardOrderno('${entity.id}')">勾兑</button>
                                </c:if>
                            </c:if>
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
