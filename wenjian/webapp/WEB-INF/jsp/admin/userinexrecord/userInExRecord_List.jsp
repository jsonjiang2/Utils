<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>收支记录列表页面</title>
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

        function selectButton(pageNum, pageSize) {
            $("#baseid").val("");
            queryAllPerson(pageNum, pageSize);
        }

        function queryAllPerson(pageNum, pageSize) {
            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#form-select").submit(); //conditionForm
        }

        $(function () {
            var type=$("#type").val();
            if(type!=''){
                $("#selectType").val(type);
            }
            getTotalData();
            //查询条件重置
            $("#reset").click(function () {
                $("#orderno_search").val("");
                $("#username_search").val("");
                $("#realname_search").val("");
                $("#startdate").val("");
                $("#enddate").val("");
            });
        });

        //详情
        function todetailUi(id) {
            var action = "${pageContext.request.contextPath}/admin/userInExRecord/detail/" + id;
            var callback = function (data) {
                $("#detailsModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#detail-modal-body").html(data);
            };
            $.post(action, callback);
        }
        //校验全部收支记录
        function checkAllRecord() {
            var action = "${pageContext.request.contextPath}/admin/userInExRecord/checkAllRecord";
            var callback = function (data) {
                $("#detailsModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#detail-modal-body").html(data);
            };
            $.post(action, callback);
        }
        //获取汇总数据
        function getTotalData() {
            var baseid = "${entity.baseid}";
            var type = "${entity.type}";
            var orderno = "${entity.orderno}";
            var username = "${username}";
            var realname = "${realname}";
            var startdate = "${startdate}";
            var enddate = "${enddate}";
            var action = "${pageContext.request.contextPath}/admin/userInExRecord/getTotalData";
            var data = {
                baseid: baseid, type: type, orderno: orderno, username: username,realname:realname,
                startdate: startdate, enddate: enddate
            };
            var callback = function (data) {
                var totalInAmount = data.totalInAmount;
                var totalOutAmount = data.totalOutAmount;
                var totalBalance = data.totalBalance;
                var totalFreebalance = data.totalFreebalance;
                var allTotalbalance = data.allTotalbalance;
                var str = "收入汇总：" + totalInAmount + "&emsp;支出汇总：" + totalOutAmount + "&emsp;可用余额汇总：" + totalBalance + "" +
                    "&emsp;冻结余额汇总：" + totalFreebalance + "&emsp;总金额汇总：" + allTotalbalance;
                $("#totalArea").html(str);

            };
            $.post(action, data, callback);
        }
		
        //选择类型的时候赋值隐藏输入框
        function changeType() {
            var type=$("#selectType").val();
            $("#type").val(type);
        }
        //重置
		function resetfun(){
			$("#baseid").val("");
			$("#type").val("");
			$("#orderno_search").val("");
			$("#username_search").val("");
			$("#realname_search").val("");
			$("#startdate").val("");
			$("#enddate").val("");
			$("#selectType").val(""); 
		}

        //点击List列表页面中字段进行查询
        function selectByField(username,type) {
            //清空查询条件
            resetfun();
            if (username != "") {
                $("#username_search").val(username);
            }
            if (type != "") {
                $("#type").val(type);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            queryAllPerson(pageNum, pageSize);
        }

    </script>
</head>

<body>

<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/userInExRecord/list" method="post" role="form"
                  id="form-select">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <input type="hidden" id="baseid" name="baseid" value="${userInExRecord.baseid}"/>
                <input type="hidden" id="type" name="type" value="${userInExRecord.type}"/>
                <div class="col-md-12 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>收支流水号:</label>
                        <input class="form-control" type="text" name="orderno" id="orderno_search" value="${userInExRecord.orderno}">
                    </div>
                    <div class="form-group">
                        <label>用户名:</label>
                        <input class="form-control" type="text" name="username" id="username_search" value="${username}">
                    </div>
                    <div class="form-group">
                        <label>真实姓名:</label>
                        <input class="form-control" type="text" name="realname" id="realname_search" value="${realname}">
                    </div>
                    <div class="form-group">
                        <label>发生时间：</label>
                        <input class="form-control" type="text" class="Wdate" id="startdate" name="startdate"
                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${startdate}"/> ---
                        <input class="form-control" type="text" class="Wdate" id="enddate" name="enddate"
                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${enddate}"/>&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>类型：</label>
                        <select class="form-control" id="selectType" onchange="changeType()">
                            <option value="">全部</option>
                            <c:forEach items="${typeMap}" var="type">
                                <option value="${type.key}">${type.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-md-12 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectButton(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset" onclick="resetfun();"/>
                    <span style="font-size: 16px" id="totalArea"></span>
                </div>
            </form>

            <p style="color: red">判断1：下总余额+上收支金额=上总余额 <button id="checkAllBtn" class="btn btn-default" onclick="checkAllRecord()">校验</button></p>
            <p style="color: red"> 判断2：可用余额+冻结金额=总余额</p>
            <p style="color: red"> 判断3：用户最新一条收支记录中的可用余额、冻结金额、总余额，与账户余额做对比</p>
            <p style="color: red"> 判断4：样式校验，三个余额字段金额都大于等于0，收支金额有一个大于0且另一个为0</p>

            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>收支流水号</td>
                    <td>用户名</td>
                    <td>发生时间</td>
                    <%--<td>业务流水号</td>--%>
                    <td>收入</td>
                    <td>支出</td>
                    <td>业务类型</td>
                    <%--<td>资金来源</td>--%>
                    <td>可用余额</td>
                    <td>冻结余额</td>
                    <td>总金额</td>
                    <%--<td>操作</td>--%>
                    <td>详细信息</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.orderno }</td>
                        <td>
                            <wdb:getUser uid="${entity.baseid}" var="user">
                                <a href="javascript:selectByField('${user.username}','')" style="color: blue;">
                                        ${user.username}--${user.realname}
                                </a>
                            </wdb:getUser>
                        </td>
                        <td>
                       		 <c:if test="${!empty entity.recordtime}">
                       		 	 ${sf.format(entity.recordtime)}
                       		 </c:if>
                        </td>
                        <%--<td>${entity.borderno }</td>--%>
                        <td>
	                        <font color="blue">
	                            <c:choose>
	                            	<c:when test="${entity.inamount > 0}">${entity.inamount}</c:when>
	                                <c:otherwise>-</c:otherwise>
	                            </c:choose>
	                        </font>
                        </td>
                        <td>
	                        <font color="red">
	                            <c:choose>
	                            	<c:when test="${entity.outamount > 0}">${entity.outamount}</c:when>
	                                <c:otherwise>-</c:otherwise>
	                            </c:choose>
	                        </font>
                        </td>
                        <td>
	                        <a style="color:blue" href="javascript:selectByField('','${entity.type}')">
                                <c:forEach items="${typeMap}" var="type">
                                    <c:if test="${entity.type==type.key }">${type.value}</c:if>
                                </c:forEach>
	                        </a>
                        </td>
                        <%--<td>${entity.description }</td>--%>
                        <td>${entity.balance }</td>
                        <td>${entity.freebalance }</td>
                        <td>${entity.totalbalance }</td>

                            <%--<td>--%>
                            <%--<button class="btn btn-default" onclick="update_UI('${entity.id}')">修改</button>--%>
                            <%--<button class="btn btn-default" onclick="deleteById('${entity.id}')">删除</button>--%>
                            <%--</td>--%>
                        <td>
                            <button class="btn btn-default" onclick="todetailUi('${entity.id}')">详细信息</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <%@ include file="../../common/modal.jsp" %>
            <div id="page_div">
                <%@ include file="../../common/pagehelper.jsp" %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
