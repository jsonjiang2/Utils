<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>短信发送记录列表页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
    </style>
    <script>
	    /*
	    全局的pageNum与pageSize
	    */
	   var pageNum = '${pagehelper.pageNum}';
	   var pageSize = '${pagehelper.pageSize}';
    
    
        function queryAllPerson2(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }
        $(function () {
            $(".remark-p").each(function (i) {
                var num = $(this).text();
                if (num.length > 5) {
                    $(this).text(num.substr(0, 5) + "...");
                }
            });
            //查询条件重置
            $("#reset").click(function () {
                $("#smstype_search").val("");
                $("#mobile_search").val("");
                $("#sendtype_search").val("");
                $("#status_search").val("");
            });
        });


        //点击List列表页面中字段进行查询
        function selectByField(smstype) {
            $("#smstype_search").val(smstype);
            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }
        
        //点击List列表页面中字段进行查询
        function selectByField2(mobile) {
            $("#mobile_search").val(mobile);
            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }
        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#smstype_search").val($.trim($("#smstype_search").val()));
            $("#mobile_search").val($.trim($("#mobile_search").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }
        //清空查询条件(重置)
        function resetmeragent() {
            $("#mobile_search").val("");
            $("#smstype_search").val("");
        }



        /*
         * 删除页面
         */
        function deleteById(id) {
            var flag = confirm("确定要删除吗？");
            var action = "${pageContext.request.contextPath}/admin/smsRecord/delete/" + id;
            var callback = function (data) {
                alert(data.Msg);
                if (data.Msg == "删除成功！") {
                    selectByCondition(pageNum, pageSize);
                }
            }
            if (flag) {
                $.post(action, callback);
            }
        }


        //详情
        function todetailUi(id) {
            var action = "${pageContext.request.contextPath}/admin/smsRecord/detail/" + id;
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
            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }
    </script>
</head>

<body>

<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 form-inline column">
            <div style="margin-bottom:10px;"></div>
            <form action="${pageContext.request.contextPath}/admin/smsRecord/list" method="post" role="form" id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <label>短信类型:</label><input type="text" name="smstype" id="smstype_search" class="form-control" placeholder="输入发送短信类型" value="${smsRecord.smstype}">
                <label>接收信息电话:</label><input type="text" name="mobile" id="mobile_search" class="form-control" placeholder="输入接收信息电话" value="${smsRecord.mobile}">
                <label>发送方式:</label>
                <select name="sendtype" id="sendtype_search" class="form-control">
                    <option value="">--选择发送方式--</option>
                    <option value="1" <c:if test="${smsRecord.sendtype==1}">selected</c:if>>手工</option>
                    <option value="2" <c:if test="${smsRecord.sendtype==2}">selected</c:if>>系统</option>
                </select>
                <label>发送状态:</label>
                <select name="status" id="status_search" class="form-control">
                    <option value="">--选择发送状态--</option>
                    <option value="1" <c:if test="${smsRecord.status==1}">selected</c:if>>成功</option>
                    <option value="0" <c:if test="${smsRecord.status==0}">selected</c:if>>失败</option>
                </select>
                <div style="margin: 10px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>

            </form>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>短信类型</td>
                    <td>接收信息电话</td>
                    <td>发送方式</td>
                    <td>发送状态</td>
                    <td>发送时间</td>
                    <td>短信流水号</td>
                    <td>备注</td>
                    <td>详细信息</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                       <%-- <td>${entity.smstype}</td>--%>
                        <td><a href="javascript:selectByField('${entity.smstype}')" style="color: blue;">${entity.smstype}</a></td>
                        <td><a href="javascript:selectByField2('${entity.mobile}')" style="color: blue;">${entity.mobile}</a></td>
                        <td>
                            <c:if test="${entity.sendtype==1}">手工</c:if>
                            <c:if test="${entity.sendtype==2}">系统</c:if>
                        </td>
                        <td>
                        	<c:if test="${!empty entity.status}">
	                            <c:if test="${entity.status==1}"><span style="color:blue">成功</span></c:if>
	                            <c:if test="${entity.status==0}"><span style="color:red">失败</span></c:if> 
                        	</c:if>
                        </td>
                        <td><%-- <fmt:formatDate value="${entity.sendtime}" type="both"/> --%>
                        	<c:if test="${!empty entity.sendtime}">
                        		${sf.format(entity.sendtime)}
                        	</c:if>
                        
                        </td>
                        <td>
                            <c:if test="${entity.status==1}"><span style="color:blue">${entity.orderno}</span></c:if>
                            <c:if test="${entity.status==0}"><span style="color:red">${entity.orderno}</span></c:if>
                        </td>
                    <%--    <td>${entity.orderno}</td>--%>
                        <td class="remark-p" title="${entity.remark}">${entity.remark}</td>
                        <%--<td>
                            <button class="btn btn-default" onclick="deleteById('${entity.id}')">删除</button>
                        </td>--%>
                        <td>
                            <button class="btn btn-default" onclick="todetailUi('${entity.id}')">详细信息</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="page_div">
                <%@ include file="../../common/pagehelper2.jsp" %>
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
