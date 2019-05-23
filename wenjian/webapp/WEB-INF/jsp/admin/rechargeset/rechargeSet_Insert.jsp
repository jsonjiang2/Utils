<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <style type="text/css">
        *{margin: 0px;padding: 0px;}
        .laber_from {color: #222;font-weight: normal;}
        .route_bg{ background-color: #E7E7E7; border-radius: 4px; padding: 5px; margin-right: 5px;margin-left: 5px;margin-top: 5px; }
        .route_bg i{ color: #ccc;font-weight: 400;font-size: 12px;padding-right: 5px;line-height: 25px; }
        .route_bg a{ font-size: 12px; color: #666; text-decoration: none;line-height: 1.6;font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif !important; }
        .route_bg a:hover{ color: #888; text-decoration: none;}
        hr{
            margin: 5px;
        }
    </style>
    <!-- 注意文件的引入顺序 -->

</head>
<body>
<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form" id="insertForm">
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="type">设置类型：</label>
            <div class="col-sm-3">
                <input value="特殊设置" disabled="disabled" class="form-control"/>
                <input type="hidden" name="type" id="type" value="2" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">对象属性：</label>
            <div class="col-sm-3">
                <select class="form-control" id="objectpropertiesT" name="objectproperties" onchange="typeChange(this)">
                    <option value="">--请选择--</option>
                    <option value="2">用户组</option>
                    <option value="3">用户名</option>
                </select>
                <span id="errorobjectproperties" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div id="addUserName" style="display: none;">
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="uName">用户名：</label>
                <div class="col-sm-3">
                    <input type="text" name="uname" id="uName" class="form-control" onblur="findUserName();"/>
                    <span id="errorObjectName" style="color:red;font-weight:bold;"></span>
                </div>
            </div>
        </div>
        <div id="addUserGroup" style="display: none;">
            <%--用户组--%>
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
            </div>

            <div class="form-group">

            </div>
            <%--排除用户组--%>
            <div class="form-group">
                <label class="col-sm-2 control-label">排除用户组</label>
                <div class="col-sm-2" style="width:220px;">
                    <input type="text" id="excludeUserGroupId" class="form-control" style="width:200px;" onblur="selectPersonalManagementByPmno(this,'pmnameIdForExcludeUserGroup')" placeholder="添加名单编号"/>
                </div>
                <label class="col-sm-1 control-label" style="width:70px;" onclick="addRemoveUser($('#excludeUserGroupId').val(),'excludeUserGroupShowId',$('#pmnameIdForExcludeUserGroup').text())">添加&nbsp;+</label>
                <label class="col-sm-1 control-label" style="width:300px; text-align:left" id="pmnameIdForExcludeUserGroup"></label>
            </div>
            <div class="form-group" id="excludeUserGroupShowId" style="color:red">
                <label class="col-sm-2 control-label">排除用户组展示</label>

            </div>
            <div class="form-group">

            </div>
            <%--排除用户名--%>
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

            </div>
            <div class="form-group">

            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">充值方式：</label>
            <div class="col-sm-3">
                <select class="form-control" id="rechargetypeT" name="rechargetype" disabled="disabled">
                    <%--<option value="">--请选择--</option>--%>
                    <option value="1">二维码</option>
                    <%--<option value="2">快捷</option>
                    <option value="3">网银</option>--%>
                </select>
                <input type="hidden" name="rechargetype" id="rechargetype" value="1" class="form-control" />
                <span id="errorrechargetype" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否开启：</label>
            <div class="col-sm-3">
                <select class="form-control" id="onoffT" name="onoff" disabled="disabled">
                    <%--<option value="">--选择是否开启--</option>
                    <option value="1">开</option>--%>
                    <option value="0">关</option>
                </select>
                <input type="hidden" name="onoff" id="onoff" value="0" class="form-control" />
                <span id="erroronoff" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark"></textarea>
            </div>
        </div>

        <div class="form-group" style="margin-left: 11%">
            <span style="color: red">注意:1.添加对象名称的时候请添加已经存在的对象名称(用户名或大小名单编号)。</span><br/>
        </div>

    </form>
</div>

<script type="text/javascript">
    $(function(){
        $("#Modal").on("shown.bs.modal",function(){
            $("#insertForm").bootstrapValidator({
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    uName:{
                        validators:{
                            notEmpty:{
                                message:"请输入对象名称"
                            },
                        }
                    },
                    objectproperties:{
                        validators:{
                            notEmpty:{
                                message:"请选择对象属性"
                            },
                        }
                    },
                    rechargetype:{
                        validators:{
                            notEmpty:{
                                message:"请选择充值方式"
                            },
                        }
                    },
                    onoff:{
                        validators:{
                            notEmpty:{
                                message:"请选择是否开启"
                            },
                        }
                    },
                }
            });
        });
    });

    //判断对象名称
    function findUserName(){
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/rechargeSet/findByObjectName",
            data: {
                uname: function () {
                    return $("#uName").val();
                },
                objectproperties: function () {
                    return $("#objectpropertiesT option:selected").val();
                }
            },
            success: function (data) {
                document.getElementById('errorObjectName').innerHTML="";
                if(data.Msg != undefined){
                    alert(data.Msg);
                }else{
                    if(data.userAccountInfoQuery != undefined){
                        document.getElementById('errorObjectName').innerHTML=data.userAccountInfoQuery.realname;
                    }
                }
            }
        });
    }

    var num3 = 1;
    var num4 = 1;
    var num5 = 1;

    var pmnoIsRight=false;
    var pmnoIsRightForExculde=false;
    //添加时排版问题
    function resetNum() {
        num3 = 1;
        num4 = 1;
        num5 = 1;
    }

    //对象属性切换---2用户组 3用户名
    function typeChange(t) {
        var val = $(t).val();
        if(val == 0){
            $("#addUserGroup").hide();
            $("#addUserName").hide();
        }else if(val == 3){//3用户名
            $("#addUserGroup").hide();
            $("#addUserName").show();
        }else if(val == 2){//2用户组
            $("#addUserName").hide();
            $("#addUserGroup").show();
            resetNum();
        }
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
            html += '<div style="margin-left: -5px;">' +
                    '<div class="col-sm-2" style="width:220px;"> ' +
                    '<input type="text" name="pmnos" value="' + username + '" readonly class="form-control" style="width:200px;"/> ' +
                    '</div> ' +

                    '<label class="col-sm-1 control-label" style="width:63px;" onclick="removeItSelf(this)">删除&nbsp;-</label>' +
                    '<label class="col-sm-1 control-label" style="width:175px; text-align:left" id="pmnameId">' + pmname + '</label>' +
                    '<br/> <br/> ' +
                    '<div style="width:199.66px;height:33px;display:inline-block;float:left"></div>' +
                    '</div>';
            return html;
        }
        //用户组时排除用户组
        function appendHtmlForExculdeUserGroup() {
            var html = '';
            html += '<div style="margin-left: -5px;">' +
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
            if (temnum % 2 != 0) {
                html += '<div>' +
                        '<div class="col-sm-2" style="width:140px;"> ' +
                        '<input type="text" name="usernames" value="' + username + '" readonly id="activenameId" class="form-control" style="width:130px;"/>' +
                        ' </div>' +
                        ' <label class="col-sm-1 control-label" style="width:63px;" onclick="removeItSelf(this)">删除&nbsp;-</label>' +
                        '<label class="col-sm-1 control-label" style="width:80px; text-align:left">' + pmname + '</label>' +
                        '</div>';
            } else {
                html += '<div style="margin-left: -5px;">' +
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
</script>

</body>
</html>