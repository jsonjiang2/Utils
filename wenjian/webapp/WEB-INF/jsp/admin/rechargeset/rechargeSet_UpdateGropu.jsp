<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>修改页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body>
<div class="">
    <form id="updateForm" action="" method="post" class="form-horizontal">
        <input type="hidden" name="id" id="id" value="${rechargeSet.id}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">设置类型：</label>
            <div class="col-sm-3">
                <c:if test="${rechargeSet.type eq 1}">
                    <input value="通用设置" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="type" id="type" value="1" class="form-control" />
                </c:if>
                <c:if test="${rechargeSet.type eq 2}">
                    <input value="特殊设置" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="type" id="type" value="2" class="form-control"/>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">充值设置编号：</label>
            <div class="col-sm-3">
                <input type="text" disabled="disabled" name="rsno" id="rsno1" value="${rechargeSet.rsno}" class="form-control" />
                <input type="hidden" name="rsno" id="rsno" value="${rechargeSet.rsno}" class="form-control" />
                <span id="rsnoError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">对象属性：</label>
            <div class="col-sm-3">
                <c:if test="${rechargeSet.objectproperties eq 1}">
                    <input value="所有用户" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="objectproperties" id="objectproperties" value="1" class="form-control" />
                </c:if>
                <c:if test="${rechargeSet.objectproperties eq 2}">
                    <input value="用户组" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="objectproperties" id="objectproperties" value="2" class="form-control"/>
                </c:if>
                <c:if test="${rechargeSet.objectproperties eq 3}">
                    <input value="用户名" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="objectproperties" id="objectproperties" value="3" class="form-control"/>
                </c:if>
            </div>
        </div>


        <%--指定用户组--排除用户--%>
        <div id="specificUserId3">
            <div class="form-group">

                <label class="col-sm-2 control-label">添加用户组</label>
                <div class="col-sm-2" style="width:220px;">
                    <input type="text" id="removenameId2forUserGroup" class="form-control" style="width:200px;" placeholder="添加名单编号" onblur="selectPersonalManagementByPmno(this,'pmnameId')"/>
                </div>

                <label class="col-sm-1 control-label" style="width:70px;"
                       onclick="addRemoveUser($('#removenameId2forUserGroup').val(),'userGroupId',$('#pmnameId').text())">添加&nbsp;+</label>
                <label class="col-sm-1 control-label" style="width:250px; text-align:left" id="pmnameId"></label>
            </div>

            <div class="form-group" id="userGroupId" style="color:red">
                <label class="col-sm-2 control-label">用户组展示</label>
                <c:if test="${!empty userGroupshow}">
                    <c:forEach items="${userGroupshow}" var="entity" varStatus="index">
                        <div>
                            <div class="col-sm-2" style="width:220px;">
                                <input type="text" name="pmnos" value="${entity.pmno}" readonly class="form-control" style="width:200px;"/>
                            </div>

                            <label class="col-sm-1 control-label" style="width:63px;" onclick="removeItSelf(this)">删除&nbsp;-</label>
                            <label class="col-sm-1 control-label" style="width:250px; text-align:left">
                                    ${entity.pmname}---
                                <c:if test="${entity.pmtype==1}">
                                    （大${entity.num}人）
                                </c:if>
                                <c:if test="${entity.pmtype==2}">
                                    （小${entity.num}人）
                                </c:if>
                            </label>
                            <br/> <br/>
                            <div style="width:145.66px;height:33px;display:inline-block;float:left"></div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <div class="form-group">

            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">排除用户组</label>
                <div class="col-sm-2" style="width:220px;">
                    <input type="text" id="excludeUserGroupId" class="form-control" style="width:200px;" onblur="selectPersonalManagementByPmno(this,'pmnameIdForExcludeUserGroup')"/>
                </div>
                <label class="col-sm-1 control-label" style="width:70px;" onclick="addRemoveUser($('#excludeUserGroupId').val(),'excludeUserGroupShowId',$('#pmnameIdForExcludeUserGroup').text())">添加&nbsp;+</label>
                <label class="col-sm-1 control-label" style="width:300px; text-align:left" id="pmnameIdForExcludeUserGroup"></label>
            </div>

            <div class="form-group" id="excludeUserGroupShowId" style="color:red">
                <label class="col-sm-2 control-label">排除用户组展示</label>
                <c:if test="${!empty excludeUserGroupshow}">
                    <c:forEach items="${excludeUserGroupshow}" var="entity" varStatus="index">
                        <div>
                            <div class="col-sm-2" style="width:220px;">
                                <input type="text" name="pmnosforexculde" value="${entity.pmno}" readonly class="form-control" style="width:200px;"/>
                            </div>

                            <label class="col-sm-1 control-label" style="width:63px;" onclick="removeItSelf(this)">删除&nbsp;-</label>
                            <label class="col-sm-1 control-label" style="width:300px; text-align:left">
                                    ${entity.pmname}---
                                <c:if test="${entity.pmtype==1}">
                                    （大${entity.num}人）
                                </c:if>
                                <c:if test="${entity.pmtype==2}">
                                    （小${entity.num}人）
                                </c:if>
                            </label>
                            <br/> <br/>
                            <div style="width:145.66px;height:33px;display:inline-block;float:left"></div>
                        </div>
                    </c:forEach>
                </c:if>

            </div>
            <div class="form-group">

            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">排除用户</label>
                <div class="col-sm-2" style="width:140px;">
                    <input type="text" id="removenameId4" class="form-control" style="width:130px;" onblur="findUserNameT(this,'UNameremovenameId4');" placeholder="添加用户名"/>
                </div>
                <label class="col-sm-1 control-label" style="width:70px;" onclick="addRemoveUser($('#removenameId4').val(),'removeUserId4',$('#UNameremovenameId4').text())">添加&nbsp;+</label>
                <label class="col-sm-1 control-label" style="display: none; width:300px; text-align:left" id="UNameremovenameId4"></label>
            </div>

            <div class="form-group" id="removeUserId4" style="color:red">
                <label class="col-sm-2 control-label">排除用户展示</label>
                <c:if test="${!empty excludeUsernameshow}">

                    <c:forEach items="${excludeUsernameshow}" var="entity" varStatus="index">
                        <input type="text" id="sum" style="display:none" value="${excludeUsernameshow.size()}" />
                        <div>
                            <div class="col-sm-2" style="width:140px;">
                                <input type="text" name="usernames" value="${entity.username}" readonly class="form-control" style="width:130px;"/>
                            </div>
                            <label class="col-sm-1 control-label" style="width:63px;" onclick="removeItSelf(this)">删除&nbsp;-</label>
                            <label class="col-sm-1 control-label" style="width:80px; text-align:left">
                                    ${entity.realname}
                            </label>
                        </div>
                        <c:if test="${index.count%2==0}">
                            <br/> <br/>
                            <div style="width:145.66px;height:33px;display:inline-block;float:left"></div>
                        </c:if>
                    </c:forEach>

                </c:if>
            </div>
            <div class="form-group">

            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">充值方式：</label>
            <div class="col-sm-3">
                <select class="form-control" id="rechargetypeT" name="rechargetype" disabled="disabled">
                    <option value="1" <c:if test="${rechargeSet.rechargetype eq 1}">selected="selected"</c:if>>二维码</option>
                    <%--<option value="2" <c:if test="${rechargeSet.rechargetype eq 2}">selected="selected"</c:if>>快捷</option>
                    <option value="3" <c:if test="${rechargeSet.rechargetype eq 3}">selected="selected"</c:if>>网银</option>--%>
                </select>

            </div>
            <c:if test="${rechargeSet.rechargetype eq 1}">
                <input type="hidden" name="rechargetype" id="rechargetype" value="1" class="form-control" />
            </c:if>
            <c:if test="${rechargeSet.rechargetype eq 2}">
                <input type="hidden" name="rechargetype" id="rechargetype" value="2" class="form-control"/>
            </c:if>
            <c:if test="${rechargeSet.rechargetype eq 3}">
                <input type="hidden" name="rechargetype" id="rechargetype" value="3" class="form-control"/>
            </c:if>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否开启：</label>
            <div class="col-sm-3">
                <c:if test="${rechargeSet.type eq 1}">
                    <select class="form-control" id="onoff" name="onoff" disabled="disabled">
                        <option value="1" <c:if test="${rechargeSet.onoff eq 1}">selected="selected"</c:if>>开</option>
                        <option value="0" <c:if test="${rechargeSet.onoff eq 0}">selected="selected"</c:if>>关</option>
                    </select>
                </c:if>
                <c:if test="${rechargeSet.type eq 2}">
                    <select class="form-control" id="onoff" name="onoff">
                        <option value="1" <c:if test="${rechargeSet.onoff eq 1}">selected="selected"</c:if>>开</option>
                        <option value="0" <c:if test="${rechargeSet.onoff eq 0}">selected="selected"</c:if>>关</option>
                    </select>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">优先级：</label>
            <div class="col-sm-3">
                <input type="text" name="priority" id="priority" value="${rechargeSet.priority}" class="form-control" onkeyup="checkNum(this)" onblur="checkSize(this)" />
                <span id="priorityError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label id="remarke" class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark">${userWithdrawalsFeeSet.remark}</textarea>
            </div>
        </div>
        <div class="form-group" style="margin-left: 11%">
            <span style="color: red">注意:1.修改对象名称的时候请填写真实存在的对象名称(用户名或大小名单名称)。</span><br/>
        </div>
    </form>
</div>

<script>
    var num3 = 1;
    var num4;
    if($("#sum").val() == undefined){
        num4 = 1;
    }else{
        num4 = $("#sum").val();
    }
    var num5 = 1;

    var pmnoIsRight=false;
    var pmnoIsRightForExculde=false;

    function resetNum() {
        num3 = 1;
        if($("#sum").val() == undefined){
            num4 = 1;
        }else{
            num4 = $("#sum").val();
        }
        num5 = 1;
    }


    //人员名单onblur事件
    function selectPersonalManagementByPmno(t,id) {
        //人员名单编号
        var pmno = $(t).val();
        if (pmno == "") {
            return false;
        }
        $("#"+id).text("");
        var url = "${pageContext.request.contextPath}/admin/rechargeSet/selectPersonalManagementByPmno";
        var param = {
            "pmno": pmno
        };

        var callback = function (data) {
            var str;
            if (data.Msg == "人员名单编号有误") {
                alert(data.Msg);
                if(id=="pmnameId"){
                    pmnoIsRight=false;
                }else if(id=="pmnameIdForExcludeUserGroup"){
                    pmnoIsRightForExculde=false;
                }
                return;
            }
            if (data.noUser == "nouser") {
                var flag = window.confirm("此名单下没有用户,要添加此名单吗？")
                if (!flag) {
                    $(t).val("");
                    return;
                }
            }
            if (data.noMall == "noMall") {
                var flag = window.confirm("此名单属于大名单,请添加小名单")
                if (!flag) {
                    $(t).val("");
                    return;
                }
            }
            var pmtype = data.personalManagement.pmtype;
            if (pmtype == 1) {
                str = "(大";
            } else if (pmtype == 2) {
                str = "(小";
            }
            if (data.noUser == "nouser") {
                str += "0人)"
            } else {
                str += data.noUser + "人)";
            }
            $("#"+id).text(data.personalManagement.pmname + "---" + str);
            if(id=="pmnameId"){
                pmnoIsRight=true;
            }else if(id=="pmnameIdForExcludeUserGroup"){
                pmnoIsRightForExculde=true;
            }
        }
        $.post(url, param, callback);
    }

    //增加用户
    function addRemoveUser(username, id, pmname) {
        var username = $.trim(username);
        if (id == "userGroupId" && username == "") {
            alert("请填写名单编号")
            return;
        }
        if ((id=="removeUserId4") && username == "") {
            alert("请填写用户名");
            return;
        }
        var $id = "#" + id;
        var flag = false;
        if (id == "removeUserId4") {
            $($id + ' input[name="usernames"]').each(function (i) {
                var tname = $(this).val().toLocaleLowerCase();
                if (username.toLocaleLowerCase() == tname) {
                    alert(username + "已存在，请勿重复增加");
                    flag = true;
                    return false;
                }
            });
        } else if (id == "userGroupId") {
            $($id + ' input[name="pmnos"]').each(function (i) {
                var tname = $(this).val().toLocaleLowerCase();
                if (username.toLocaleLowerCase() == tname) {
                    alert(username + "已存在，请勿重复增加");
                    flag = true;
                    return false;
                }
            });
        }else if (id == "excludeUserGroupShowId") {
            $($id + ' input[name="pmnosforexculde"]').each(function (i) {
                var tname = $(this).val().toLocaleLowerCase();
                if (username.toLocaleLowerCase() == tname) {
                    alert(username + "已存在，请勿重复增加");
                    flag = true;
                    return false;
                }
            });
        }
        if (flag) {
            return;
        }
        var html;
        var temnum;
        switch (id) {
                //用户组
            case "userGroupId":
                if(!pmnoIsRight){
                    alert("人员名单编号有误");
                    return;
                }
                $('#excludeUserGroupShowId input[name="pmnosforexculde"]').each(function (i) {
                    var tname = $(this).val().toLocaleLowerCase();
                    if (username.toLocaleLowerCase() == tname) {
                        alert(username + "与排除用户组展示的编号有冲突，请勿增加");
                        flag = true;
                        return false;
                    }
                });
                if (flag) {
                    return;
                }
                $("#removenameId2forUserGroup").val("");
                $("#pmnameId").text("");
                temnum = num3;
                html = appendHtmlForGroup();
                num3 = ++temnum;
                break;
                //用户组时排除用户组
            case "excludeUserGroupShowId":
                if(!pmnoIsRightForExculde){
                    alert("人员名单编号有误");
                    return;
                }
                $('#userGroupId input[name="pmnos"]').each(function (i) {
                    var tname = $(this).val().toLocaleLowerCase();
                    if (username.toLocaleLowerCase() == tname) {
                        alert(username + "与用户组展示的编号有冲突，请勿增加");
                        flag = true;
                        return false;
                    }
                });
                if (flag) {
                    return;
                }
                $("#excludeUserGroupId").val("");
                $("#pmnameIdForExcludeUserGroup").text("");
                temnum = num5;
                html = appendHtmlForExculdeUserGroup();
                num5 = ++temnum;
                break;
                //用户组时排除用户
            case "removeUserId4":
                $("#removenameId4").val("");
                $("#UNameremovenameId4").text("");
                temnum = num4;
                html = appendHtml();
                num4 = ++temnum;
                break;
        }

        //用户组
        function appendHtmlForGroup() {
            var html = '';
            html += '<div style="margin-left:165px;">' +
                    '<div class="col-sm-2" style="width:220px;"> ' +
                    '<input type="text" name="pmnos" value="' + username + '" readonly class="form-control" style="width:200px;"/> ' +
                    '</div> ' +

                    '<label class="col-sm-1 control-label" style="width:63px;" onclick="removeItSelf(this)">删除&nbsp;-</label>' +
                    '<label class="col-sm-1 control-label" style="width:300px; text-align:left" id="pmnameId">' + pmname + '</label>' +
                    '<br/> <br/> ' +
                    '<div style="width:145.66px;height:33px;display:inline-block;float:left"></div>' +
                    '</div>';
            return html;
        }
        //用户组时排除用户组
        function appendHtmlForExculdeUserGroup() {
            var html = '';
            html += '<div style="margin-left:-35px;">' +
                    '<div class="col-sm-2" style="width:220px;"> ' +
                    '<input type="text" name="pmnosforexculde" value="' + username + '" readonly class="form-control" style="width:200px;"/> ' +
                    '</div> ' +

                    '<label class="col-sm-1 control-label" style="width:63px;" onclick="removeItSelf(this)">删除&nbsp;-</label>' +
                    '<label class="col-sm-1 control-label" style="width:300px; text-align:left">' + pmname + '</label>' +
                    '<br/> <br/> ' +
                    '<div style="width:199.66px;height:33px;display:inline-block;float:left"></div>' +
                    '</div>';
            return html;
        }
        //用户组时排除用户
        function appendHtml() {
            var html = '';
            //alert(temnum);
            if (temnum % 2 == 0) {
                html += '<div>' +
                        '<div class="col-sm-2" style="width:140px;"> ' +
                        '<input type="text" name="usernames" value="' + username + '" readonly id="activenameId" class="form-control" style="width:130px;"/>' +
                        ' </div>' +
                        ' <label class="col-sm-1 control-label" style="width:63px;" onclick="removeItSelf(this)">删除&nbsp;-</label>' +
                        '<label class="col-sm-1 control-label" style="width:80px; text-align:left">' + pmname + '</label>' +
                        '</div>';
            } else {
                html += '<div style="margin-left:-35px;">' +
                        '<div class="col-sm-2" style="width:140px;">' +
                        ' <input type="text" name="usernames" value="' + username + '" readonly id="activenameId" class="form-control" style="width:130px;"/>' +
                        ' </div>' +
                        ' <label class="col-sm-1 control-label" style="width:63px;" onclick="removeItSelf(this)">删除&nbsp;-</label>' +
                        '<label class="col-sm-1 control-label" style="width:80px; text-align:left">' + pmname + '</label>' +
                        '<br/> <br/> ' +
                        '<div style="width:199.66px;height:33px;display:inline-block;float:left"></div>' +
                        '</div>';
            }
            return html;
        }
        $("#" + id).append(html);
    }

    //删除用户
    function removeItSelf(t) {
        var id = $(t).parent().parent().attr("id");
        switch (id) {
            case "removeUserId4":
                num4--;
                break;
        }
        $(t).parent().remove();
    }

    //判断排除用户名
    function findUserNameT(t,id){
        //人员名单编号
        var username = $(t).val();
        if (username == "") {
            return false;
        }
        $("#"+id).text("");
        var url = "${pageContext.request.contextPath}/admin/rechargeSet/findUserNameT";
        var param = {
            "username": username
        };
        var callback = function (data) {
            if(data.unNull != undefined){
                alert(data.unNull);
            }else if(data.error != undefined){
                alert(data.error);
            }else{
                $("#"+id).text(data.userAccountInfoQuery.realname);
            }
        }
        $.post(url, param, callback);
    }

    //修改数据校验
    $(function(){
        $("#Modal").on("shown.bs.modal",function(){
            $("#updateForm").bootstrapValidator({
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    priority:{
                        validators:{
                            notEmpty:{
                                message:"请输入优先级"
                            },
                            regexp: {
                                regexp: /^[1-9]([0-9]*)$/,
                                message: '优先级不能输入0'
                            },
                        }
                    },
                }
            });
        });
    });

    function checkNum(obj){
        //处理第一个字符是小数点的情况.
        if (obj.value != '' && obj.value.substr(0, 1) == '0') {
            obj.value = "";
        }
        //处理第一个字符是0的情况.
        if (obj.value != '' && obj.value.substr(0, 1) == '0') {
            obj.value = "";
            return;
        }
        obj.value = obj.value.replace(/[^\d]/g, "");  //清除“数字”以外的字符
        if (obj.value.indexOf(".") < 0 && obj.value != "") {//如果没有小数点，首位不能为类似于 01、02的金额
            if (obj.value.substr(0, 1) == '0' && obj.value.length == 2) {
                obj.value = obj.value.substr(1, obj.value.length);
            }
        }
    }
    function checkSize(obj){
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/rechargeSet/checkSize",
            data: {
                id: function () {
                    return $("#id").val();
                },
                size: function () {
                    return obj.value;
                }
            },
            success: function (data) {
                if(data.Msg != undefined){
                    alert(data.Msg);
                }
            }
        });
    }
</script>

</body>
</html>