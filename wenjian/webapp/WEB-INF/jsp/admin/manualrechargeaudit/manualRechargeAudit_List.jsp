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

    <title>提现审核</title>
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
            selectByAudit(pageNum, pageSize);
        }

        //审核成功---点击成功---多笔
        function updateAuditPass(obj){
            if(getCheckAudit()){
                $("#pass_btn").attr("disabled",true);
                if(obj.id == ""){
                    alert("按钮已被修改！请改回来~~再操作！！");
                    $("#pass_btn").attr("disabled",false);
                    return false;
                }

                var confirm = window.confirm("确定充值成功吗？");
                if (!confirm) {
                    $("#pass_btn").attr("disabled",false);
                    return false;
                }

                var box = document.getElementsByName("checkbox");
                var check_val = [];
                for(var i = 0; i < box.length; i++){
                    if(box[i].checked){
                        check_val.push(box[i].value);
                    }
                }
                $("#checkvalue").val(check_val);
                var checkvalues = $("#checkvalue").val();

                var action = "${pageContext.request.contextPath}/admin/manualRechargeAudit/auditSuccess";
                var param = {
                    "checkVal": checkvalues,
                }
                var callback = function (data) {
                    if(data.Msg == "sessionOut"){
                        alert("请重新登录");
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                    if(data.status == "0"){
                        alert(data.Msg);
                        //按钮设置为可用
                        $("#pass_btn").attr("disabled",false);
                        selectByAudit(1,20);
                    }
                    if(data.status == "1"){
                        alert(data.Msg);
                        //按钮设置为可用
                        $("#pass_btn").attr("disabled", false);
                        selectByAudit(1,20);
                    }
                }
                $.post(action, param, callback);
            }
        }

        //审核失败---跳到审核人填写页面---多笔
        function noPass(){
            if(getCheck()){
                $("#nopass").attr("disabled",true);
                var box = document.getElementsByName("checkbox");
                var check_val = [];
                for(var i = 0; i < box.length; i++){
                    if(box[i].checked){
                        check_val.push(box[i].value);
                    }
                }
                $("#checkvalue").val(check_val);
                var checkvalues = $("#checkvalue").val();
                var action = "${pageContext.request.contextPath}/admin/manualRechargeAudit/auditDeal";
                var param = {
                    "checkVal": checkvalues,
                }
                var callback = function (data) {
                    $("#nopass").attr("disabled",false);
                    $("#crud").val("update2");
                    $("#crudType").text("失败");
                    $("#crudType").show();
                    $("#Modal").modal({
                        backdrop: 'static',
                        keyboard: false
                    });
                    $("#modal-body").html(data);
                };
                $.post(action, param, callback);
            }
        }
        //审核失败---点击失败---多笔
        function updateAuditNoPass(obj){
            if (checkFormAudit()){
                var remark = $("#remark").val();
                if(obj.id == ""){
                    alert("按钮已被修改！请改回来~~再操作！！");
                    return false;
                }
                //按钮设置为不可用
                $("#crudType").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/manualRechargeAudit/auditFail";
                var param = {
                    "remark": remark,
                }
                var callback = function (data) {
                    if(data.Msg == "sessionOut"){
                        alert("请重新登录");
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                    if(data.status == "0"){
                        alert(data.Msg);
                        //按钮设置为可用
                        $("#crudType").attr("disabled",false);
                        selectByAudit(1,20);
                    }
                    if(data.status == "1"){
                        alert(data.Msg);
                        //按钮设置为可用
                        $("#crudType").attr("disabled", false);
                        selectByAudit(1,20);
                    }
                }
                $.post(action, param, callback);
            }
        }


        //审核成功---点击成功---单笔
        function updateAuditPassSingle(obj){
            //提交按钮设置为不可用
            $("#passSingle").attr("disabled",true);
            if(obj.id == ""){
                alert("按钮已被修改！请改回来~~再操作！！");
                $("#passSingle").attr("disabled",false);
                return false;
            }
            var confirm = window.confirm("确定充值成功吗？");
            if (!confirm) {
                $("#passSingle").attr("disabled",false);
                return false;
            }
            var action = "${pageContext.request.contextPath}/admin/manualRechargeAudit/auditSuccessSingle";
            var param = {
                "mraid": obj,
            }
            var callback = function (data) {
                if(data.Msg == "sessionOut"){
                    alert("请重新登录");
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.status == "0"){
                    alert(data.Msg);
                    //按钮设置为可用
                    $("#passSingle").attr("disabled",false);
                    selectByAudit(1,20);
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    //按钮设置为可用
                    $("#passSingle").attr("disabled", false);
                    selectByAudit(1,20);
                }
            }
            $.post(action, param, callback);
        }

        //审核失败---跳到审核人填写页面---单笔
        function NoPassSingle(objId){
            $("#nopassSingle").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/manualRechargeAudit/auditDealSingle";
            var param = {
                "mraid": objId,
            }
            var callback = function (data) {
                $("#nopassSingle").attr("disabled",false);
                $("#crud").val("update4");
                $("#crudType").text("失败");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            };
            $.post(action, param, callback);
        }
        //审核失败---点击失败---单笔
        function updateAuditNoPassSingle(obj){
            var remark = $("#remark").val();
            if(obj.id == ""){
                alert("按钮已被修改！请改回来~~再操作！！");
                return false;
            }
            //按钮设置为不可用
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/manualRechargeAudit/auditFailSingle";
            var param = {
                "remark": remark,
            }
            var callback = function (data) {
                if(data.Msg == "sessionOut"){
                    alert("请重新登录");
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.status == "0"){
                    alert(data.Msg);
                    //按钮设置为可用
                    $("#crudType").attr("disabled",false);
                    selectByAudit(1,20);
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    //按钮设置为可用
                    $("#crudType").attr("disabled", false);
                    selectByAudit(1,20);
                }
            }
            $.post(action, param, callback);
        }


        //判断是否选中
        function getCheck(){
            var num = 0;
            //获取所有box名字的checkBox组件
            var box = document.getElementsByName("checkbox");
            for(var i = 0; i < box.length; i++){
                if(!box[i].checked){
                    num++;
                }
            }
            if(num == box.length){
                alert("请至少选择一项进行操作！！！");
                return false;
            }else{
                return true;
            }
        }
        //判断是否选中,并且选择数不能多余10条
        function getCheckAudit(){
            var num = 0;
            //选中的个数统计
            var checkNum = 0;
            //获取所有box名字的checkBox组件
            var boxs = document.getElementsByName("checkbox");
            for(var i = 0; i < boxs.length; i++){
                //没选中
                if(!boxs[i].checked){
                    num++;
                }
                //选中
                if(boxs[i].checked){
                    checkNum++;
                }
            }
            if(num == boxs.length){
                alert("请至少选择一项进行操作！！！");
                return false;
            }else if(checkNum > 20){
                alert("选择的不能超过20条！！！");
                return false;
            }else {
                return true;
            }
        }

        //全选、取消全选的事件
        function selectAll(){
            //console.log(1);
            console.log($("#checkall").prop("checked"));
            if ($("#checkall").prop("checked")) {
                //console.log(2);
                $("input[type='checkbox'][name='checkbox']").prop("checked",true);//全选
            } else {
                //console.log(3);
                $("input[type='checkbox'][name='checkbox']").prop("checked",false);  //取消全选
            }
        }

        //操作
        function operate(obj) {
            var crud = $("#crud").val();
            if(crud == "update2"){
                updateAuditNoPass(obj);
            }else if(crud == "update4"){
                updateAuditNoPassSingle(obj);
            }
        }

        function selectByAudit(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#username").val($.trim($("#username").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionAuditForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            selectByAudit(pageNum, pageSize);
        }

        function clearMode(id){
            $("#"+id).html("");
        }
    </script>

</head>

<body>
<div class="container" style="width:100%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/manualRechargeAudit/lists" method="post" role="form"
                  id="conditionAuditForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${manualRechargeAudit.username}" placeholder="输入用户名查询">&nbsp;&nbsp;
                        <%-- 用来存放选中的ID值 --%>
                        <input type="hidden" name="checkvalue" id="checkvalue" class="form-control" />
                    </div>
                </div>
                <div class="col-md-12 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByAudit(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>

            </form>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>
                        <input type="checkbox" id="checkall" name="checkall" onclick="selectAll()" style="width:27px;height:18px;text-align:center;" />
                        全选
                    </td>
                    <td>序号</td>
                    <td>用户名</td>
                    <td>姓名</td>
                    <td>手充金额</td>
                    <td>手充流水号</td>
                    <td>充值人</td>
                    <td>充值时间</td>
                    <td>充值备注</td>
                    <td>操作</td>
                    <%--<td>详情</td>--%>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td><input type="checkbox" name="checkbox" value="${entity.id}" style="width:27px;height:18px;text-align:center;"/></td>
                        <td>${tendsta.count}</td>
                        <td>
                            <a href="javascript:selectByField('${entity.username}')" style="color: blue;">
                                    ${entity.username}
                            </a>
                        </td>
                        <td>${entity.realname}</td>
                        <td>${entity.mramount}</td>
                        <td>${entity.mrno}</td>
                        <td>
                            <wdb:getAdminUser uid="${entity.addid}" var="auid">
                                ${auid.username}-${auid.fullname ? '无' : auid.fullname}
                            </wdb:getAdminUser>
                        </td>
                        <td>
                            <c:if test="${not empty entity.addtime}">
                                ${sf.format(entity.addtime)}
                            </c:if>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.remark}">
                                    ${entity.remark}
                                </c:when>
                                <c:otherwise>
                                    --
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" id="passSingle" onclick="updateAuditPassSingle('${entity.id}')">充值成功</button>
                            <button type="button" class="btn btn-danger" id="nopassSingle" onclick="NoPassSingle('${entity.id}')">充值失败</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="col-md-12 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                <button type="button" id="pass_btn" class="btn btn-primary" onclick="updateAuditPass(this)">
                    充值成功
                </button>&nbsp;&nbsp;&nbsp;
                <input type="button" value="充值失败" class="btn btn-danger" id="nopass" onclick="noPass()"/>
            </div>

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
                                <span aria-hidden="true" onclick="clearMode('modal-body')">&times;</span>
                            </button>
                            <h4 class="modal-title" id="delModalLabel">
                                <span class="glyphicon glyphicon-info-sign"></span>提示：正在进行提现审核操作
                            </h4>
                        </div>
                        <div id="modal-body" class="modal-body"></div>
                        <input type="hidden" id="crud"/>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" onclick="operate(this)" id="crudType">
                                操作
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearMode('modal-body')">取消</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
