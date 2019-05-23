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
            $("#rsno").val("");
            $("#username").val("");
            $("#objectnamegroup").val("");
            $("#objectproperties").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(username,rechargetype) {
            //清空查询条件
            resetmeragent();
            if (username != "") {
                $("#username").val(username);
            }
            if (rechargetype != "") {
                $("#rechargetype").val(rechargetype);
            }

            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //详情
        function selectById(id) {
            var action = "${pageContext.request.contextPath}/admin/rechargeSet/selectById/" + id;
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

        //添加页面
        function insert_UI(){
            var action = "${pageContext.request.contextPath}/admin/rechargeSet/viewInsert";
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
        //添加
        function insert(){
            //获取定义好规则的代理对象
            var bv = $("#insertForm").data("bootstrapValidator");
            //手动触发验证
            bv.validate();
            if(bv.isValid()){
                //修改按钮设置为不可用
                $("#crudType").attr("disabled",true);

                // 2.用户组  3.用户名
                var objectproperties = $("#objectproperties").val();
                if(objectproperties == "2"){
                    var excludeUserGroup=$.trim($("#excludeUserGroupId").val());
                    if(excludeUserGroup!=""){
                        var confirm = window.confirm("确定不添加排除用户组："+excludeUserGroup+"？如要添加别忘记点‘添加+’");
                        if(!confirm){
                            return false;
                        }
                    }

                    var removename=$.trim($("#removenameId4").val());
                    if(removename!=""){
                        var confirm = window.confirm("确定不添加排除用户："+removename+"？如要添加别忘记点‘添加+’");
                        if(!confirm){
                            return false;
                        }
                    }
                }
                var action = "${pageContext.request.contextPath}/admin/rechargeSet/inserts";
                var callback = function (data) {
                    if ("添加成功" == data.Msg) {
                        alert(data.Msg);
                        document.getElementById("query_btn").onclick();
                    }else if(data.Msg != undefined){
                        alert(data.Msg);
                        //修改按钮设置为可用
                        $("#crudType").attr("disabled",false);
                        return false;
                    }else if(data.Msg == "sessionOut"){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                }
                $.post(action, $("#insertForm").serialize(), callback);
            }
        }

        //修改页面
        function update_UI(id) {
            var action = "${pageContext.request.contextPath}/admin/rechargeSet/viewUpdate/" + id;
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
        //修改后保存
        function update(){
            //修改按钮设置为不可用
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/rechargeSet/updateById";
            var callback = function (data) {
                if ("修改成功" == data.Msg) {
                    alert(data.Msg);
                    selectByCondition(pageNum,pageSize);
                }else if(data.Msg != undefined){
                    alert(data.Msg);
                    //修改按钮设置为可用
                    $("#crudType").attr("disabled",false);
                    return false;
                }else if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }
            }
            $.post(action, $("#updateForm").serialize(), callback);
        }

        //删除页面
        function deleteById(id){
            var action = "${pageContext.request.contextPath}/admin/rechargeSet/viewDelete/" + id;
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
        function deletes(){
            var id = $("#delByid").val();
            //修改按钮设置为不可用
            $("#crudType").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/rechargeSet/deleteBy";
            var param = {
                "id" : id,
            }
            var callback = function (data) {
                if ("删除成功" == data.Msg) {
                    alert(data.Msg);
                    selectByCondition(pageNum,pageSize);
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
            var action = "${pageContext.request.contextPath}/admin/rechargeSet/updateOnoff";
            var param = {
                "id": id,
                "onoff": onoff
            }
            var callback = function (data) {
                //a标签设置为可用
                $(t).css("pointer-events", "auto");
                if (data.result == "success") {
                    alert(data.Msg);
                    selectByCondition(pageNum, pageSize);
                }else if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }else{
                    alert(data.Msg);
                }
            }
            $.post(action, param, callback);
        }

        //手续费详情查看
        function lookes(id) {
            window.location.href = "${pageContext.request.contextPath}/admin/rechargeSet/lookes/" + id;
        }

        //查询引用的用户组大小名单列表---排除的用户组
        function detail(id,type) {
            var params={"excludetype":type};
            $.post("details/" + id, params,function(data) {
                $("#detail-modal-body").html(data);
            });
        }
        //查询排除的用户组大小名单列表
        function excludeUnDetail(id) {
            $.post("excludeUnDetail/" + id, function(data) {
                $("#detail-modal-body").html(data);
            });
        }

        //操作
        function operate() {
            var crud = $("#crud").val();
            if (crud == "insert") {
                insert()
            } else if (crud == "update") {
                update()
            }else if (crud == "delete") {
                deletes()
            }
        }

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#rsno").val($.trim($("#rsno").val()));
            $("#username").val($.trim($("#username").val()));
            $("#rechargetype").val($.trim($("#rechargetype").val()));
            $("#objectproperties").val($.trim($("#objectproperties").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }

        function clearMode(id){
            $("#"+id).html("");
        }
    </script>

</head>
<body>
<div class="container" style="font-size: 12px; width: 85%; font-family: 微软雅黑">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/rechargeSet/list" method="post" role="form"
                  id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>充值编号:</label>
                        <input type="text" class="form-control" name="rsno" id="rsno" value="${rechargeSet.rsno}" placeholder="输入充值编号查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${rechargeSet.username}" placeholder="输入对象名称查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>用户组:</label>
                        <input type="text" class="form-control" name="objectnamegroup" id="objectnamegroup" value="${rechargeSet.objectnamegroup}" placeholder="输入对象名称查询">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>对象属性:</label>
                        <select class="form-control" name="objectproperties" id="objectproperties">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${rechargeSet.objectproperties==1}">selected</c:if>>所有用户</option>
                            <option value="2" <c:if test="${rechargeSet.objectproperties==2}">selected</c:if>>用户组</option>
                            <option value="3" <c:if test="${rechargeSet.objectproperties==3}">selected</c:if>>用户名</option>
                        </select>&nbsp;&nbsp;
                    </div>
                </div>

                <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;">
                    <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询
                    </button>
                    <input type="button" value="重置" class="btn btn-default" id="reset"/>
                </div>
                <button class="btn btn-default" type="button" id="add" onclick="insert_UI()"
                        style="float: right; margin-right: 120px;margin-bottom: 5px;">新增特殊设置
                </button>
            </form>

            <%--<div class="col-md-12" style="margin-bottom: 15px;">
                <div class="btn btn-default" onclick="add();" style="margin-left: 92%"
                     class="btn" data-backdrop="static" data-toggle="modal" data-dismiss="modal"
                     data-target="#insertModal">新增提现手续费设置</div>
            </div>--%>
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>设置类型</td>
                    <td>设置编号</td>
                    <td>对象属性</td>
                    <td>对象名称</td>
                    <%--<td colspan="2" style="margin: 0px;padding: 0px;border:none; ">
                        <table class="table table-hover" style="margin: 0px;padding: 0px;">
                            <tbody><tr style="background: #ccc;height: 50%;">
                                <td colspan="2" style="background: #ccc;border-left:none;border-right: none;">对象设置</td>
                            </tr>
                            <tr style="background: #ccc;height: 50%;">
                                <td style="width:50%;height: 100%;border-left: none;">对象属性</td>
                                <td style="width:50%;border-left: none;border-right: none;">对象名称</td>
                            </tr>
                            </tbody>
                        </table>
                    </td>--%>
                    <td>排除用户组</td>
                    <td>排除用户名</td>
                    <td>充值方式</td>
                    <td>手续费详情</td>
                    <td>优先级</td>
                    <td>开关</td>
                    <%--<td>操作人</td>
                    <td>操作时间</td>--%>
                    <%--<td>备注</td>--%>
                    <td>操作</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>
                            <c:if test="${entity.type eq 1}"><span style="color: blue">通用设置</span></c:if>
                            <c:if test="${entity.type eq 2}">特殊设置</c:if>
                        </td>
                        <td>${entity.rsno}</td>
                        <td>
                            <c:if test="${entity.objectproperties==1 }">所有用户</c:if>
                            <c:if test="${entity.objectproperties==2 }">用户组</c:if>
                            <c:if test="${entity.objectproperties==3 }">用户名</c:if>
                        </td>
                        <td>
                            <c:if test="${entity.objectproperties==1 }">
                                所有用户
                            </c:if>
                            <c:if test="${entity.objectproperties==2 }">
                                <button class="btn btn-default" data-toggle="modal"
                                        data-target="#detailsModal" data-backdrop="static"
                                        onclick="detail('${entity.id}','1')">${entity.pName}个
                                </button>
                            </c:if>
                            <c:if test="${entity.objectproperties==3 }">
                                <wdb:getUser uid="${entity.baseid}" var="user">
                                    <a href="javascript:selectByField('${user.username}','')" style="color: blue;">
                                            ${user.username}-${user.realname}
                                    </a>
                                </wdb:getUser>
                            </c:if>
                        </td>
                            <%--<td colspan="2">
                                    <table style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
                                        <tbody>
                                        <tr style="text-align: center;">
                                            <td style="width: 50%;height:100%; border:none;text-align: center;">
                                                <c:if test="${entity.objectproperties==1 }">所有用户</c:if>
                                                <c:if test="${entity.objectproperties==2 }">用户组</c:if>
                                                <c:if test="${entity.objectproperties==3 }">用户名</c:if>
                                            </td>
                                            <td style="border-right: 13px;"></td>
                                            <td style="border:none;text-align: center;width: 50%;height:100%;">
                                                <c:if test="${entity.objectproperties==1 }">
                                                    所有用户
                                                </c:if>
                                                <c:if test="${entity.objectproperties==2 }">
                                                    <button class="btn btn-default" data-toggle="modal"
                                                            data-target="#detailsModal" data-backdrop="static"
                                                            onclick="detail('${entity.id}','1')">${entity.pName}个
                                                    </button>
                                                </c:if>
                                                <c:if test="${entity.objectproperties==3 }">
                                                    <a href="javascript:selectByField('${entity.objectname}')" style="color: blue;">
                                                            ${entity.objectname}---${entity.realname}
                                                    </a>
                                                </c:if>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>--%>
                        <td>
                            <c:choose>
                                <c:when test="${entity.objectproperties==2 }">
                                    <button class="btn btn-default" data-toggle="modal"
                                            data-target="#detailsModal" data-backdrop="static"
                                            onclick="detail('${entity.id}','2')">${entity.excludePm}个
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    无
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.objectproperties==2 }">
                                    <button class="btn btn-default" data-toggle="modal"
                                            data-target="#detailsModal" data-backdrop="static"
                                            onclick="excludeUnDetail('${entity.id}')">${entity.excludeUn }个
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    无
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <%--<a href="javascript:selectByField('','${entity.rechargetype}')" style="color: blue;">
                                <c:if test="${entity.rechargetype==1 }">二维码</c:if>
                                &lt;%&ndash;<c:if test="${entity.rechargetype==2 }">快捷</c:if>
                                <c:if test="${entity.rechargetype==3 }">网银</c:if>&ndash;%&gt;
                            </a>--%>
                            <c:if test="${entity.rechargetype==1 }">二维码</c:if>
                        </td>
                        <td>
                            <c:if test="${entity.lookfee==1 }">
                                <a style="cursor:pointer;color:blue;" onclick="lookes('${entity.id}')">查看</a>
                            </c:if>
                            <c:if test="${entity.lookfee==2 }">
                                <a style="cursor:pointer;color:red;" onclick="lookes('${entity.id}')">无</a>
                            </c:if>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty entity.priority}">
                                    ${entity.priority}
                                </c:when>
                                <c:otherwise>无</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.type==1 }">
                                    <c:if test="${entity.onoff==1 }"><span style="color: blue;">开启</span></c:if>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${entity.onoff  eq 1}">
                                        <span style="color:blue;">开启</span>&nbsp;&nbsp;
                                        <span><a style="cursor:pointer;color:black" onclick="startOrStop('${entity.id}','0',this)">关闭</a></span>
                                    </c:if>
                                    <c:if test="${entity.onoff eq 0 }">
                                        <span><a style="cursor:pointer;color: black;" onclick="startOrStop('${entity.id}','1',this)">开启</a></span>&nbsp;&nbsp;
                                        <span style="color: red;">关闭</span>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </td>
                            <%--<td>${entity.addman }</td>
                            <td><fmt:formatDate value="${entity.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>--%>
                            <%--<td>
                                <c:choose>
                                    <c:when test="${not empty entity.remark }">
                                        ${entity.remark}
                                    </c:when>
                                    <c:otherwise>
                                        无
                                    </c:otherwise>
                                </c:choose>
                            </td>--%>
                        <td>
                            <button type="button" class="btn btn-default" onclick="update_UI('${entity.id}')">修改</button>
                            <c:if test="${entity.type eq 2}">
                                <button type="button" class="btn btn-default" onclick="deleteById('${entity.id}')">删除</button>
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
                <div class="modal-dialog" role="document" style="width:1000px;"
                >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true" onclick="clearMode('modal-body')">&times;</span>
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
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearMode('modal-body')" >取消</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 引入模态框 -->
            <%@ include file="../../common/modal.jsp"%>
        </div>
    </div>
</div>
</body>
</html>

