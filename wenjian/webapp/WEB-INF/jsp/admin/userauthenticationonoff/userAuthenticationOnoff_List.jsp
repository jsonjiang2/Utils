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
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <title>实名认证接口开关</title>
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
    <script type="text/javascript">

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
            $("#name").val("");
            $("#company").val("");
            $("#type").val("");
            $("#isuse").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField() {
            //清空查询条件
            resetmeragent();

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情页面跳转
        function deatilUI(id){
            var action = "${pageContext.request.contextPath}/admin/userAuthenticationOnoff/selectById/" + id;
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

        //新增页面跳转
        function insert_UI(){
            var action = "${pageContext.request.contextPath}/admin/userAuthenticationOnoff/viewInsert";
            var callback = function (data) {
                $("#crud").val("insert");
                $("#crudType").text("添加");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            }
            $.post(action, callback);
        }
        //新增页面的数据校验
        function insert(){
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/userAuthenticationOnoff/insert";
            var callback = function (data) {
                if(data.Msg == "sessionOut"){
                    alert("请重新登录");
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.status == "0"){
                    alert(data.Msg);
                    $("#crudType").attr("disabled",false);
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    $("#crudType").attr("disabled",false);
                    selectByCondition(1,20);
                }
            }
            $.post(action, $("#userAuthenticationOnoff_insertForm").serialize(), callback);
        }

        // 修改页面跳转
        function updateUI(id){
            var action = "${pageContext.request.contextPath}/admin/userAuthenticationOnoff/viewUpdate/"+id;
            var callback = function(data){
                $("#crud").val("update");
                $("#crudType").text("修改");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    eyboard: false
                });
                $("#modal-body").html(data);
            }
            $.post(action, callback);
        }
        //修改
        function update(){
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/userAuthenticationOnoff/update";
            var callback = function (data) {
                if(data.Msg == "sessionOut"){
                    alert("请重新登录");
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.status == "0"){
                    alert(data.Msg);
                    $("#crudType").attr("disabled",false);
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    $("#crudType").attr("disabled",false);
                    selectByCondition(1,20);
                }
            }
            $.post(action, $("#updateForm").serialize(), callback);
        }

        //删除页面跳转
        function deleteUI(id){
            var action = "${pageContext.request.contextPath}/admin/userAuthenticationOnoff/viewDel/"+id;
            var callback = function (data) {
                $("#crud").val("delete");
                $("#crudType").text("删除");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            }
            $.post(action, callback);
        }
        //删除
        function delById() {
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/userAuthenticationOnoff/del";
            var param = {
                "id" : $("#delByid").val(),
            }
            var callback = function (data) {
                if(data.Msg == "sessionOut"){
                    alert("请重新登录");
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.status == "0"){
                    alert(data.Msg);
                    $("#crudType").attr("disabled",false);
                    selectByCondition(1,20);
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    $("#crudType").attr("disabled",false);
                    selectByCondition(1,20);
                }
            }
            $.post(action, param, callback);
        }

        //开启和关闭
        function startOrStop(id, onoff, t) {
            var confirm = null;
            if(onoff==0){
                confirm=window.confirm("确定要关闭吗？");
            }else if(onoff==1){
                confirm=window.confirm("确定要开启吗？");
            }
            if (!confirm) {
                return false;
            }
            //a标签设置为不可用
            $(t).css("pointer-events", "none");
            var action = "${pageContext.request.contextPath}/admin/userAuthenticationOnoff/updateOnoff";
            var param = {
                "id": id,
                "onoff": onoff
            }
            var callback = function (data) {
                //a标签设置为可用
                $(t).css("pointer-events", "auto");
                if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.status == "0"){
                    alert(data.Msg);
                    selectByCondition(1,20);
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    selectByCondition(1,20);
                }
            }
            $.post(action, param, callback);
        }

        //操作
        function operate() {
            var crud = $("#crud").val();
            if (crud == "insert") {
                insert()
            } else if (crud == "update") {
                update()
            }else if (crud == "delete") {
                delById()
            }
        }

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#name").val($.trim($("#name").val()));
            $("#company").val($.trim($("#company").val()));
            $("#type").val($.trim($("#type").val()));
            $("#isuse").val($.trim($("#isuse").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }

        function clearMode(id) {
            $("#" + id).html("");
        }
    </script>
</head>
<body style="font-size:12px;font-family: 微软雅黑">

<div class="container" style="width: 80%;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/userAuthenticationOnoff/lists" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>接口名称:</label>
                        <input type="text" class="form-control" name="name" id="name" value="${userAuthenticationOnoff.name}" placeholder="接口名称">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>接口公司:</label>
                        <input type="text" class="form-control" name="company" id="company" value="${userAuthenticationOnoff.company}" placeholder="接口公司">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>认证类型:</label>
                        <select class="form-control" name="type" id="type">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${userAuthenticationOnoff.type==1}">selected</c:if>>实名</option>
                            <option value="2" <c:if test="${userAuthenticationOnoff.type==2}">selected</c:if>>银行卡四要素</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>是否开启:</label>
                        <select class="form-control" name="isuse" id="isuse">
                            <option value="">全部</option>
                            <option value="0" <c:if test="${userAuthenticationOnoff.isuse==0}">selected</c:if>>关闭</option>
                            <option value="1" <c:if test="${userAuthenticationOnoff.isuse==1}">selected</c:if>>开启</option>
                        </select>&nbsp;&nbsp;
                    </div>
                </div>
                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>

                <button class="btn btn-default" type="button" id="add" onclick="insert_UI()"
                    style="float:right; margin-right:120px;margin-bottom: 5px;">新增设置
                </button>
            </form>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr style="background-color: #CCCCCC;" class="text-center">
                    <td>序号</td>
                    <td>接口名称</td>
                    <td>认证类型</td>
                    <td>接口公司</td>
                    <td>是否使用</td>
                    <td>操作时间</td>
                    <td>操作人</td>
                    <td>备注</td>
                    <td>详情</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <!-- 这里面${userRecharge.id }是点的model里面的属性 -->
                <c:forEach items="${pagehelper.list}" var="entity"
                           varStatus="status">
                    <tr class="text-center">
                        <td>${status.count}</td>
                        <td>${entity.name}</td>
                        <td>
                            <c:if test="${entity.type eq 1}">实名</c:if>
                            <c:if test="${entity.type eq 2}">银行卡四要素</c:if>
                        </td>
                        <td>${entity.company}</td>
                        <td>
                            <c:if test="${entity.isuse  eq 1}">
                                <span style="color:blue;">开启</span>&nbsp;&nbsp;
                                <span><a style="cursor:pointer;color:black" onclick="startOrStop('${entity.id}','0',this)">关闭</a></span>
                            </c:if>
                            <c:if test="${entity.isuse eq 0 }">
                                <span><a style="cursor:pointer;color: black;" onclick="startOrStop('${entity.id}','1',this)">开启</a></span>&nbsp;&nbsp;
                                <span style="color: red;">关闭</span>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty entity.modifytime}">
                                ${sf.format(entity.modifytime)}
                            </c:if>
                        </td>
                        <td>
                            <wdb:getAdminUser uid="${entity.modifyid}" var="auid">
                                ${auid.username}-${auid.fullname ? '无' : auid.fullname}
                            </wdb:getAdminUser>
                        </td>
                        <td class="remark-p" title="${entity.remark}">${entity.remark}</td>
                        <td>
                            <button class="btn btn-default"
                                    onclick="deatilUI('${entity.id}')">查看</button>
                        </td>
                        <td>
                            <button class="btn btn-default" onclick="updateUI('${entity.id}')">修改</button>
                            <button class="btn btn-default" onclick="deleteUI('${entity.id}')">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="page_div">
                <%@ include file="./../../common/pagehelper2.jsp"%>
            </div>

            <!-- 模态框 -->
            <div class="modal fade" id="Modal" tabindex="-1" role="dialog"
                 aria-labelledby="delModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" onclick="clearMode('modal-body')"
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
                            <button type="button" class="btn btn-default" onclick="clearMode('modal-body')" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
