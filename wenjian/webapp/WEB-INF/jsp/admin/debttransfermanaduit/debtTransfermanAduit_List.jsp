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
            $("#platformmobile").val("");
            $("#platformname").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(platformmobile,platformnum) {
            //清空查询条件
            resetmeragent();
            if (platformmobile != "") {
                $("#platformmobile").val(platformmobile);
            }
            if (platformnum != "") {
                $("#platformnum").val(platformnum);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByAudit(pageNum, pageSize);
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/debtTransfermanAduit/selectById/" + id;
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

        //通过---跳到审核人填写页面
        function pass(){
            if(getCheckAudit()){
                var box = document.getElementsByName("checkbox");
                var check_val = [];
                for(var i = 0; i < box.length; i++){
                    if(box[i].checked){
                        check_val.push(box[i].value);
                    }
                }
                $("#checkvalue").val(check_val);
                var checkvalues = $("#checkvalue").val();
                var action = "${pageContext.request.contextPath}/admin/debtTransfermanAduit/auditDeal";
                var param = {
                    "checkVal": checkvalues,
                }
                var callback = function (data) {
                    $("#crud").val("update1");
                    $("#crudType").text("通过");
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
        //通过---点击通过
        function updateAuditPass(obj){
            if (checkFormAudit()){
                var remark = $("#remark").val();
                if(obj.id == ""){
                    alert("按钮已被修改！请改回来~~再操作！！");
                    return false;
                }
                //提交按钮设置为不可用
                $("#crudType").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/debtTransfermanAduit/auditUpdate";
                var param = {
                    /*"audiTman": audiTman,
                     "auditTime": auditTime,*/
                    "remark": remark,
                }
                var callback = function (data) {
                    alert(data.Msg);
                    $("#pass_btn").attr("disabled",false);
                    window.location.href = "${pageContext.request.contextPath}/admin/debtTransfermanAduit/lists";
                   /* if(data.status == "0"){
                        alert(data.msg);
                        //提交按钮设置为可用
                        $("#crudType").attr("disabled", false);
                        window.location.href = "${pageContext.request.contextPath}/admin/debtTransferAduit/lists";
                    }else if(data.status == "1"){
                        alert(data.msg);
                        window.location.href = "${pageContext.request.contextPath}/admin/debtTransferAduit/lists";
                    }*/
                }
                $.post(action, param, callback);
            }
        }

        //不通过---跳到审核人填写页面
        function noPass(){
            if(getCheck()){
                var box = document.getElementsByName("checkbox");
                var check_val = [];
                for(var i = 0; i < box.length; i++){
                    if(box[i].checked){
                        check_val.push(box[i].value);
                    }
                }
                $("#checkvalue").val(check_val);
                var checkvalues = $("#checkvalue").val();
                var action = "${pageContext.request.contextPath}/admin/debtTransfermanAduit/auditDeal";
                var param = {
                    "checkVal": checkvalues,
                }
                var callback = function (data) {
                    $("#crud").val("update2");
                    $("#crudType").text("不通过");
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
        //不通过---点击不通过
        function updateAuditNoPass(obj){
            if (checkFormAudit()){
                var remark = $("#remark").val();
                if(obj.id == ""){
                    alert("按钮已被修改！请改回来~~再操作！！");
                    return false;
                }
                //提交按钮设置为不可用
                $("#crudType").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/debtTransfermanAduit/auditNoPassUpdate";
                var param = {
                    "remark": remark,
                }
                var callback = function (data) {
                    alert(data.Msg);
                    $("#pass_btn").attr("disabled",false);
                    window.location.href = "${pageContext.request.contextPath}/admin/debtTransfermanAduit/lists";
                }
                   /* $("#auditError").text("");
                    $("#audittimeError").text("");
                    var errors = data.errors;
                    if (errors == "errors") {
                        if (data.auditManMsg != undefined) {
                            $("#auditError").text(data.auditManMsg);
                        }
                        if (data.auditTimeMsg != undefined) {
                            $("#audittimeError").text(data.auditTimeMsg);
                        }
                        if (data.remarkMsg != undefined) {
                            $("#remarkError").text(data.remarkMsg);
                        }
                        //提交按钮设置为可用
                        $("#crudType").attr("disabled", false);
                        return false;
                    }
                    if(data.failUpdate != undefined){
                        alert(data.failUpdate);
                        //提交按钮设置为可用
                        $("#crudType").attr("disabled", false);
                        selectByAudit(1,20);
                    }
                    if(data.successfully == "提交成功"){
                        alert(data.successfully);
                        //提交按钮设置为可用
                        $("#crudType").attr("disabled", false);
                        selectByAudit(1,20);
                    }

                    if(data.status == "0"){
                        $("#myalertModal").modal({
                            backdrop: 'static',
                            keyboard: false
                        });
                        $("#my_alert-modal-body").html(data.msg);
                    }
                }*/
                $.post(action, param, callback);
            }
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
            }else if(checkNum > 500){
                alert("选择的不能超过500条！！！");
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
            if (crud == "update1") {
                updateAuditPass(obj);
            }else if(crud == "update2"){
                updateAuditNoPass(obj);
            }
        }

        //确定
        function find() {
            selectByAudit(1,20);
        }

        function selectByAudit(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#transferserialnum").val($.trim($("#transferserialnum").val()));
            $("#transferman").val($.trim($("#transferman").val()));
            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionAuditForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            selectByAudit(pageNum, pageSize);
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
<div class="container" style="width:100%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/debtTransfermanAduit/lists" method="post" role="form"
                  id="conditionAuditForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;width:80%">
                <div class="form-group">
                    <label>平台手机号:</label>
                    <input type="text" class="form-control" name="platformmobile" id="platformmobile" value="${debtTransfermanAduit.platformmobile}" placeholder="输入出平台手机号">&nbsp;&nbsp;
                    <%-- 用来存放选中的ID值 --%>
                    <input type="hidden" name="checkvalue" id="checkvalue" class="form-control" />
                </div>
                <div class="form-group">
                    <label>开户平台:</label>
                    <input type="text" class="form-control" name="platformnum" id="platformnum" value="${debtTransfermanAduit.platformnum}" placeholder="输入出让编号">&nbsp;&nbsp;
                </div>
                </div>
                <%--<div class="col-md-3 form-inline" style="float:right;margin-top:23px;">
                    <span style="font-weight:bold;font-size:17px;">待处理总额：<span style="color:red;">${dealMoneySum}</span>元</span>
                </div>--%>
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
                    <td>平台名称</td>
                    <td>用户名-姓名</td>
                    <td>身份证号码(真实姓名)</td>
                    <td>平台手机号</td>
                    <td>开户时间</td>
                    <td>正面全身照</td>
                    <td>手持身份证照</td>
                    <td>身份证照(正)</td>
                    <td>身份证照(反)</td>
                    <td>手写承诺书</td>
                    <td>平台用户名</td>
                    <td>平台登录密码</td>
                    <td>充值银行卡扣款图</td>
                    <td>提现银行卡到账截图</td>
                    <td>开户状态</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td><input type="checkbox" name="checkbox" value="${entity.id}" style="width:27px;height:18px;text-align:center;"/></td>
                        <td>${tendsta.count}</td>
                        <td><span style="color: blue;">
                             <a href="javascript:selectByField('','${entity.platformnum}','')" style="color: blue;">
                        ${entity.platformnum}--${entity.platformname}
                        </span></td>
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
                        <td>
                            <a href="javascript:selectByField('${entity.platformmobile}','','')" style="color: blue;">
                        ${entity.platformmobile}
                            </a>
                        </td>
                        <td>
                            <wdb:formatDate value="${entity.registertime}" var="registertime">
                                ${empty registertime ? '无' : registertime}
                            </wdb:formatDate>
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
                            <c:if test="${entity.openaccountway eq 1}"><span style="color: blue">待审核</span></c:if>
                            <c:if test="${entity.openaccountway eq 2}"><span style="color: blue">成功</span></c:if>
                            <c:if test="${entity.openaccountway eq 3}"><span style="color: blue">失败</span></c:if>
                        </td>
                        <td>
                            <button type="button" class="btn btn-default" onclick="selectById('${entity.id}')">详细信息</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="col-md-12 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                <button type="button" id="pass_btn" class="btn btn-primary" onclick="pass()">
                    通过
                </button>&nbsp;&nbsp;&nbsp;
                <input type="button" value="不通过" class="btn btn-danger" id="nopass" onclick="noPass()"/>
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
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="delModalLabel">
                                <span class="glyphicon glyphicon-info-sign"></span>提示：正在进行出让审核操作
                            </h4>
                        </div>
                        <div id="modal-body" class="modal-body"></div>
                        <input type="hidden" id="crud"/>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" onclick="operate(this)" id="crudType">
                                操作
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 编辑 模态框   -->
            <div class="modal fade" id="myalertModal" tabindex="-1" role="dialog"
                 aria-labelledby="addModalLabel" style="">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width:600px;height: 273px;">
                        <div class="modal-header">
                            <h4 class="modal-title" id="editModalLabel">
                                <span class="glyphicon glyphicon-info-sign" style="font-weight:bold;font-size:20px;"></span>
                                <span style="font-weight:bold;font-size:20px;">提示：</span>
                            </h4>

                        </div>
                        <div id="my_alert-modal-body" style="font-weight:bold;font-size:15px;" class="modal-body"></div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" onclick="find()" id="crudTypeT">
                                确定
                            </button>
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearMode('my_alert-modal-body')">取消</button>--%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 查看详情模态框（图片展示） -->
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
