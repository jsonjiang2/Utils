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

    <title>提现设置</title>
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
            $("#qmmorderno").val("");
            $("#rsno").val("");
            $("#rechargetype").val("");
            $("#feetype").val("");
            $("#status").val("");
            $("#rechargeorderno").val("");
            $("#gouduistatus").val("");
            $("#paymentchannels").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(username,rechargetype,feetype,status,paymentchannels) {
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
            if (paymentchannels != "") {
                $("#paymentchannels").val(paymentchannels);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/rechargeRecord/selectById/" + id;
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

        //勾兑
        function blenDingByRechargeorderno(id) {
            $.ajax({
                type: "post",
                url : "${pageContext.request.contextPath}/admin/rechargeRecord/blenDingByRechargeOrderNo",
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
            $("#qmmorderno").val($.trim($("#qmmorderno").val()));
            $("#rsno").val($.trim($("#rsno").val()));
            $("#rechargetype").val($.trim($("#rechargetype").val()));
            $("#feetype").val($.trim($("#feetype").val()));
            $("#status").val($.trim($("#status").val()));
            $("#rechargeorderno").val($.trim($("#rechargeorderno").val()));
            $("#gouduistatus").val($.trim($("#gouduistatus").val()));
            $("#paymentchannels").val($.trim($("#paymentchannels").val()));

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
            <form action="${pageContext.request.contextPath}/admin/rechargeRecord/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;width:80%">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${rechargeRecord.username}" placeholder="输入用户名查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>支付流水号:</label>
                        <input type="text" class="form-control" name="qmmorderno" id="qmmorderno" value="${rechargeRecord.qmmorderno}" placeholder="输入流水号查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>充值设置编号:</label>
                        <input type="text" class="form-control" name="rsno" id="rsno" value="${rechargeRecord.rsno}" placeholder="输入充值设置编号查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>手续费类型:</label>
                        <select class="form-control" name="feetype" id="feetype">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${rechargeRecord.feetype==1}">selected</c:if>>定额 </option>
                            <option value="2" <c:if test="${rechargeRecord.feetype==2}">selected</c:if>>百分比</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>充值状态:</label>
                        <select class="form-control" name="status" id="status">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${rechargeRecord.status==1}">selected</c:if>>取消</option>
                            <option value="2" <c:if test="${rechargeRecord.status==2}">selected</c:if>>失败</option>
                            <option value="3" <c:if test="${rechargeRecord.status==3}">selected</c:if>>成功</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    <div class="form-group" style="padding-top: 8px;">
                        <label>充值订单号:</label>
                        <input type="text" class="form-control" name="rechargeorderno" id="rechargeorderno" value="${rechargeRecord.rechargeorderno}" placeholder="输入订单号查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group" style="margin-top: 8px;">
                        <label>勾兑状态:</label>
                        <select class="form-control" name="gouduistatus" id="gouduistatus">
                            <option value="">全部</option>
                            <option value="0" <c:if test="${rechargeRecord.gouduistatus==0}">selected</c:if>>未勾兑</option>
                            <option value="1" <c:if test="${rechargeRecord.gouduistatus==1}">selected</c:if>>勾兑成功</option>
                            <option value="2" <c:if test="${rechargeRecord.gouduistatus==2}">selected</c:if>>勾兑失败</option>
                            <option value="3" <c:if test="${rechargeRecord.gouduistatus==3}">selected</c:if>>勾兑未返回</option>
                            <option value="4" <c:if test="${rechargeRecord.gouduistatus==4}">selected</c:if>>勾兑中</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    <div class="form-group" style="margin-top: 8px;">
                        <label>充值方式:</label>
                        <select class="form-control" name="paymentchannels" id="paymentchannels">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${rechargeRecord.paymentchannels==1}">selected</c:if>>支付宝</option>
                            <option value="2" <c:if test="${rechargeRecord.paymentchannels==2}">selected</c:if>>微信 </option>
                        </select>&nbsp;&nbsp;
                    </div>
                </div>

                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>

                <div style="float: right;margin-top: -63px;margin-bottom: 5px;">
                    <table id="tableId" class="table-hover" style="font-weight:bold;" frame=void>
                        <tr class="text-center" >
                            <td></td>
                            <td>笔数</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>充值总金额(元)</td>
                            <td>到账总金额(元)</td>
                            <td>手续费总金额(元)</td>
                        </tr>
                        <tr class="text-center">
                            <td>取消：</td>
                            <td>${callOffCount}</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>${callOffCZSum}</td>
                            <td>${callOffDZSum}</td>
                            <td>${callOffSXFSum}</td>
                        </tr>
                        <tr class="text-center">
                            <td><span style="color:red;">失败：</span></td>
                            <td>${failCount}</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>${failCZSum}</td>
                            <td>${failDZSum}</td>
                            <td>${failSXFSum}</td>
                        </tr>
                        <tr class="text-center">
                            <td><span style="color:blue;">成功：</span></td>
                            <td>${successCount}</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>${successCZSum}</td>
                            <td>${successDZSum}</td>
                            <td>${successSXFSum}</td>
                        </tr>
                    </table>
                </div>
            </form>

            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>充值订单号</td>
                    <td>充值时间</td>
                    <td>用户名</td>
                    <td>充值方式</td>
                    <td>手续费类型</td>
                    <td>充值金额</td>
                    <td>到账金额</td>
                    <td>手续费</td>
                    <td>充值状态</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.rechargeorderno}</td>
                        <td>
                            <wdb:formatDate value="${entity.rechargetime}" var="rechargetime">
                                ${empty rechargetime ? '无' : rechargetime}
                            </wdb:formatDate>
                        </td>
                        <td>
                            <a href="javascript:selectByField('${entity.username}','','','','')" style="color: blue;">
                                    ${entity.username}---${entity.realname}
                            </a>
                        </td>
                        <td>
                            <a href="javascript:selectByField('','','','','${entity.paymentchannels}')">
                                <c:if test="${entity.paymentchannels==1 }">支付宝</c:if>
                            </a>
                            <a href="javascript:selectByField('','','','','${entity.paymentchannels}')">
                                <c:if test="${entity.paymentchannels==2 }">微信</c:if>
                            </a>
                        </td>
                        <td>
                            <a href="javascript:selectByField('','','${entity.feetype}','','')">
                                <c:if test="${entity.feetype==1 }">定额</c:if>
                            </a>
                            <a href="javascript:selectByField('','','${entity.feetype}','','')">
                                <c:if test="${entity.feetype==2 }">百分比</c:if>
                            </a>
                        </td>
                        <td><span style="color: blue;">${entity.rechargeamount}</span></td>
                        <td>${entity.arrivalamount}</td>
                        <td>${entity.rechargefee}</td>
                        <td>
                            <a href="javascript:selectByField('','','','${entity.status}','')">
                                <c:if test="${entity.status==1 }">取消</c:if>
                            </a>
                            <a href="javascript:selectByField('','','','${entity.status}','')">
                                <c:if test="${entity.status==2 }"><span style="color: red;">失败</span></c:if>
                            </a>
                            <a href="javascript:selectByField('','','','${entity.status}','')">
                                <c:if test="${entity.status==3 }"><span style="color: blue;">成功</span></c:if>
                            </a>
                        </td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="selectById('${entity.id}')">详情</button>
                            <c:choose>
                                <c:when test="${entity.gouduistatus == 0 or entity.gouduistatus == 4 }">
                                    <button type="button" id="gd" class="btn btn-default" onclick="blenDingByRechargeorderno('${entity.id}')">勾兑</button>
                                </c:when>
                            </c:choose>
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
                <div class="modal-dialog" role="document" style="width:800px">
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

