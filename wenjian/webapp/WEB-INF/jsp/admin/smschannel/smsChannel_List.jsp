<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>短信通道管理列表页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
    </style>
    <script>
        function queryAllPerson(pageNum, pageSize) {
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
                $("#smscname_search").val("");
                $("#smsccompany_search").val("");
                $("#pusername_search").val("");
                $("#isuse_search").val("");
            });
        });

        //新增页面
        function insert_UI() {
            var action = "${pageContext.request.contextPath}/admin/smsChannel/insertView";
            var callback = function (data) {
                $("#crud").val("insert");
                $("#crudType").text("新增");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            };
            $.post(action, callback);
        }

        //新增
        function insert() {
            if (checkForm()) {

                //提交按钮设置为不可用
                $("#crudType").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/smsChannel/insert";
                var callback = insertOrUpdateCallback;
                $.post(action, $("#form").serialize(), callback);
            }

        }

        /*
         全局的pageNum与pageSize
         */
        var pageNum = '${pagehelper.pageNum}';
        var pageSize = '${pagehelper.pageSize}';

        //修改页面
        function update_UI(id) {
            var action = "${pageContext.request.contextPath}/admin/smsChannel/updateView/" + id;
            var callback = function (data) {
                $("#crud").val("update");
                $("#crudType").text("修改");
                $("#crudType").show();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            }
            $.post(action, callback);
        }

        //修改
        function update() {
            if (checkForm()) {

                //提交按钮设置为不可用
                $("#crudType").attr("disabled",true);
                var action = "${pageContext.request.contextPath}/admin/smsChannel/update";
                var callback = insertOrUpdateCallback;
                $.post(action, $("#form").serialize(), callback);
            }

        }



        //新增  或  修改表单的回调函数
        var insertOrUpdateCallback = function (data) {
        	alert( data.errors);

            //提交按钮设置为可用
            $("#crudType").attr("disabled",false);
            $("#smscnameError").text("");
            $("#smsccompanyError").text("");
            $("#smsvertionError").text("");
            $("#smsurlError").text("");
            $("#serialnoError").text("");
            $("#keynoError").text("");
            $("#passError").text("");
            $("#actionError").text("");
            $("#extnoError").text("");
            $("#pusernameError").text("");
            $("#ppasswordError").text("");
            $("#isuseError").text("");
            $("#channelremarkError").text("");
            $("#remarkError").text("");
            var errors = data.errors;
            if (errors == "errors") {

                //重新给formtoken赋值
                $("#formTokenId").val(data.formtoken);
                if (data.smscname != undefined) {
                    $("#smscnameError").text(data.smscname);
                }
                if (data.smsccompany != undefined) {
                    $("#smsccompanyError").text(data.smsccompany);
                }
                if (data.smsvertion != undefined) {
                    $("#smsvertionError").text(data.smsvertion);
                }
                if (data.smsurl != undefined) {
                    $("#smsurlError").text(data.smsurl);
                }
                if (data.serialno != undefined) {
                    $("#serialnoError").text(data.serialno);
                }
                if (data.keyno != undefined) {
                    $("#keynoError").text(data.keyno);
                }
                if (data.pass != undefined) {
                    $("#passError").text(data.pass);
                }
                if (data.action != undefined) {
                    $("#actionError").text(data.action);
                }
                if (data.extno != undefined) {
                    $("#extnoError").text(data.extno);
                }
                if (data.pusername != undefined) {
                    $("#pusernameError").text(data.pusername);
                }
                if (data.ppassword != undefined) {
                    $("#ppasswordError").text(data.ppassword);
                }
                if (data.isuse != undefined) {
                    $("#isuseError").text(data.isuse);
                }
                if (data.channelremark != undefined) {
                    $("#channelremarkError").text(data.channelremark);
                }
                if (data.remark != undefined) {
                    $("#remarkError").text(data.remark);
                }

                return false;
            }
            alert(data.Msg);
            if ("更新成功" == data.Msg) {
                selectByCondition(pageNum, pageSize);
            }
        }




        /*
         * 删除页面
         */
        function deleteById(id) {
            var flag = confirm("确定要删除吗？");
            var action = "${pageContext.request.contextPath}/admin/smsChannel/delete";
            var params = {
            		"id":id
            }
            var callback = function (data) {
                if (data.meta.message == "删除成功！") {
                    selectByCondition(pageNum, pageSize);
                }else{
                	 alert(data.meta.message);
                }
            }
            if (flag) {
                $.post(action, params, callback);
            }
        }


        //详情
        function todetailUi(id) {
            var action = "${pageContext.request.contextPath}/admin/smsChannel/detail/" + id;
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

        //停用和启用
        function startOrStop(id, tag) {
            var action = "${pageContext.request.contextPath}/admin/smsChannel/startOrStop";
            var param = {
                "id": id,
                "isuse": tag
            }
            var callback = function (data) {
                data.Msg = "修改成功！" ? alert(data.Msg) : selectByCondition(pageNum, pageSize);
                window.location.href = "${pageContext.request.contextPath}/admin/smsChannel/list?pageNum="+pageNum+"&&pageSize"+pageSize;
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
            }

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
            <form action="${pageContext.request.contextPath}/admin/smsChannel/list" method="post" role="form" id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <label>通道名称:</label><input type="text" name="smscname" id="smscname_search" class="form-control" placeholder="输入短信接口名称" value="${smsChannel.smscname}">
                <label>短信接口公司:</label><input type="text" name="smsccompany" id="smsccompany_search" class="form-control" placeholder="输入短信接口公司" value="${smsChannel.smsccompany}">
                <label>平台登录名:</label><input type="text" name="pusername" id="pusername_search" class="form-control" placeholder="输入平台登录名" value="${smsChannel.pusername}">
                <label>是否可用:</label>
                <select name="isuse" id="isuse_search" class="form-control">
                    <option value="">--选择是否可用--</option>
                    <option value="1" <c:if test="${smsChannel.isuse==1}">selected</c:if>>启用</option>
                    <option value="0" <c:if test="${smsChannel.isuse==0}">selected</c:if>>停用</option>
                </select>
                <div style="margin: 10px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>
            </form>
            <button class="btn btn-default" type="button" id="add" onclick="insert_UI()"
                    style="float: right; margin-right: 120px;margin-bottom: 5px;">添加
            </button>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>通道名称</td>
                    <td>短信公司</td>
                    <td>通道号</td>
                    <td>短信类型</td>
                    <td>是否可用</td>
                    <td>添加人</td>
                    <td>添加时间</td>
                    <td>备注</td>
                    <td>操作</td>
                    <td>详细信息</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.smscname}</td>
                        <td>${entity.smsccompany}</td>
                        <td>${entity.passno}</td>
                        <td>
                            <c:if test="${entity.smstype  eq 1}"><span style="color:blue">通知类</span></c:if>
                            <c:if test="${entity.smstype  eq 2}"><span style="color:blue">营销类</span></c:if>
                        </td>
                        <td>
                            <c:if test="${entity.isuse  eq 1}"><span style="color:blue">启用</span>&nbsp;&nbsp;
                                <span>
                                <a style="cursor:pointer;color:black" onclick="startOrStop('${entity.id}','0')">停用</a>
                                </span>
                            </c:if>
                            <c:if test="${entity.isuse eq 0 }">
                                <span>
                                <a style="cursor:pointer;color: black;" onclick="startOrStop('${entity.id}','1')">启用</a>
                                </span>&nbsp;&nbsp;
                                <span style="color: red;">停用
                                </span>
                            </c:if>
                        </td>
                        <td>${entity.addman}</td>
                        <td><%-- <fmt:formatDate value="${entity.addtime}" type="both"/> --%>
                        	<c:if test="${empty entity.addtime}">                     		
								Don't have the time
                        	</c:if>
                        	<c:if test="${!empty entity.addtime}">                     		
								${sf.format(entity.addtime)}
                        	</c:if>
                        </td>
                        <td>
                            <c:if test="${empty entity.remark}">无</c:if>
                            <c:if test="${!empty entity.remark}">${entity.remark }</c:if>
                        </td>

                        <td>
                            <button class="btn btn-default" onclick="update_UI('${entity.id}')">修改</button>
                            <button class="btn btn-default" onclick="deleteById('${entity.id}')">删除</button>
                        </td>
                        <td>
                            <button class="btn btn-default" onclick="todetailUi('${entity.id}')">详细信息</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div id="page_div">
                <%@ include file="../../common/pagehelper.jsp" %>
            </div>
        </div>
    </div>
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
</body>
</html>
