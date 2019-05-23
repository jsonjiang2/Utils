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

    <title>用户提现记录</title>
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
            $("#status").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(username) {
            //清空查询条件
            resetmeragent();
            if (username != "") {
                $("#username").val(username);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/userWithdrawals/selectById/" + id;
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

        //修改提现异常
        function withdrawalsNoemal(id, abnormalstatus, t) {
            var confirm = null;
            if(abnormalstatus==0){
                confirm=window.confirm("确定要设置为未验证吗？");
            }else if(abnormalstatus==1){
                confirm=window.confirm("确定要设置为验证通过吗？");
            }else if(abnormalstatus==2){
                alert("程序有误，请联系技术人员！");
                return false;
            }
            if (!confirm) {
                return false;
            }
            //a标签设置为不可用
            $(t).css("pointer-events", "none");
            var action = "${pageContext.request.contextPath}/admin/userWithdrawals/updateAbnormalstatus";
            var param = {
                "id": id,
                "abnormalstatus": abnormalstatus
            }
            var callback = function (data) {
                //a标签设置为可用
                $(t).css("pointer-events", "auto");
                if (data.result == "success") {
                    alert(data.Msg);
                    selectByCondition(pageNum, pageSize);
                }else if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }else if(data.Msg != undefined){
                    alert(data.Msg);
                    selectByCondition(pageNum, pageSize);
                }
            }
            $.post(action, param, callback);
        }

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#username").val($.trim($("#username").val()));
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
<div class="container" style="width:85%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/userWithdrawals/findUserWithdrawalsNormal" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${userWithdrawals.username}" placeholder="输入用户名查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>提现状态:</label>
                        <select class="form-control" name="status" id="status">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${userWithdrawals.status==1}">selected</c:if>>待处理</option>
                            <option value="2" <c:if test="${userWithdrawals.status==2}">selected</c:if>>打款中</option>
                            <option value="3" <c:if test="${userWithdrawals.status==3}">selected</c:if>>提现退回</option>
                            <option value="4" <c:if test="${userWithdrawals.status==4}">selected</c:if>>已打款</option>
                            <option value="5" <c:if test="${userWithdrawals.status==5}">selected</c:if>>审核失败</option>
                        </select>&nbsp;&nbsp;
                    </div>
                </div>
                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>

                <%--<button class="btn btn-default" type="button" id="add" onclick="insert_UI()"--%>
                <%--style="float: right; margin-right: 120px;margin-bottom: 5px;">添加--%>
                <%--</button>--%>
            </form>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>提现流水号</td>
                    <td>用户名-姓名</td>
                    <td>打款金额</td>
                    <td>提现金额</td>
                    <td>提现时间</td>
                    <td>提现状态</td>
                    <td>开户行</td>
                    <td>银行卡号</td>
                    <td>操作</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.uworderno }</td>
                        <td>
                            <wdb:getUser uid="${entity.baseid}" var="user">
                                <a href="javascript:selectByField('${user.username}')" style="color: blue;">
                                        ${user.username}-${empty user.realname? "无":user.realname}
                                </a>
                            </wdb:getUser>
                        </td>
                        <td>${entity.transferamount}</td>
                        <td>${entity.withdrawalsamount}</td>
                        <td>
                            <c:if test="${not empty entity.withdrawalstime}">
                                ${sf.format(entity.withdrawalstime)}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${entity.status==1 }">待处理</c:if>
                            <c:if test="${entity.status==2 }">打款中</c:if>
                            <c:if test="${entity.status==3 }"><span style="color:red;">提现退回</span></c:if>
                            <c:if test="${entity.status==4 }"><span style="color:blue;">已打款</span></c:if>
                            <c:if test="${entity.status==5 }"><span style="color:red;">审核失败</span></c:if>
                        </td>
                        <td>${entity.bankname}</td>
                        <td>${entity.cardno}</td>
                        <td>
                            <c:if test="${entity.abnormalstatus eq 0}">
                                <span style="color:gray;">未验证</span>&nbsp;&nbsp;
                                <span><a style="cursor:pointer;color:black" onclick="withdrawalsNoemal('${entity.id}','1',this)">验证通过</a></span>&nbsp;&nbsp;
                                <span><a style="cursor:pointer;color:black" onclick="withdrawalsNoemal('${entity.id}','2',this)">异常</a></span>
                            </c:if>
                            <c:if test="${entity.abnormalstatus eq 1 }">
                                <span><a style="cursor:pointer;color: black;" onclick="withdrawalsNoemal('${entity.id}','0',this)">未验证</a></span>&nbsp;&nbsp;
                                <span style="color: blue;">验证通过</span>&nbsp;&nbsp;
                                <span><a style="cursor:pointer;color:black" onclick="withdrawalsNoemal('${entity.id}','2',this)">异常</a></span>
                            </c:if>
                            <c:if test="${entity.abnormalstatus eq 2 }">
                                <span><a style="cursor:pointer;color: black;" onclick="withdrawalsNoemal('${entity.id}','0',this)">未验证</a></span>&nbsp;&nbsp;
                                <span><a style="cursor:pointer;color:black" onclick="withdrawalsNoemal('${entity.id}','1',this)">验证通过</a></span>&nbsp;&nbsp;
                                <span style="color: red;">异常</span>
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
