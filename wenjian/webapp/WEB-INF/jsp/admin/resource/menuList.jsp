<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>菜单列表</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <link href="${basePath}/static/treeTable/themes/vsStyle/treeTable.min.css"
          rel="stylesheet" type="text/css">
    <script type="text/javascript"
            src="${basePath}/static/treeTable/jquery.treeTable.js"></script>
    <style>
        .row {
            margin-bottom: 20px
        }
    </style>
</head>
<script type="text/javascript">
    $(function () {
        $("#treeTable").treeTable();
    });

    var menu = {
        //跳转添加页面
        menu_add_button: function () {
            $("#queryall_list").load(basePath + "/admin/resource/add");
        },
        //更新按钮
        menu_update_button: function (obj) {
            var resourceId = $(obj).data("resourceid");
            var resourceName = $(obj).data("resourcename");
            var color = $(obj).data("color");
            if (isEmpty(resourceName)) {
                loading("请输入菜单名称..", 4);
                $("#resourceName").select();
                return false;
            }
            var resourceUrl = $(obj).data("resourceurl");
            var sort = $(obj).data("sort");
            var params = {
                "resourceId": resourceId,
                "resourceName": resourceName,
                "resourceUrl": resourceUrl,
                "color": color,
                "sort": sort
            };
            $.tzAjax.request({
                model: "/admin/resource",
                method: "/add",
                callback: function (data) {
                    $("#queryall_list").html(data);
                }
            }, params);
        },
        //删除
        menu_delete_button: function (obj) {
            var resourceId = $(obj).data("resourceid");
            var resourceName = $(obj).data("resourcename");
            $.tzAlert({
                "title": "删除提示",
                "content": "您确定删除<span class='red'>" + resourceName + "</span>菜单吗？",
                callback: function (ok) {
                    if (ok) {
                        $.tzAjax.request({
                            model: "/admin/resource",
                            method: "/delete",
                            callback: function (data) {
                                var obj = $.parseJSON(data);
                                if (obj.result == "resourceId_null") {
                                    loading("网络异常", 4);
                                } else if (obj.result == "fail") {
                                    loading("删除失败", 4);
                                } else if (obj.result == "success") {
                                    loading("删除成功", 4);
                                    $("#" + resourceId + "").remove();
                                    $("." + resourceId + "").remove();
                                }
                            }
                        }, {"resourceId": resourceId});
                    }
                }
            });
        },
        //添加下级菜单
        menu_childrensave_button: function (obj) {
            var resourceId = $(obj).data("resourceid");
            var resourceName = $(obj).data("resourcename");
            var color = $(obj).data("color");
            if (isEmpty(resourceName)) {
                loading("请输入菜单名称..", 4);
                $("#resourceName").select();
                return false;
            }
            var params = {"parentId": resourceId, "fatherMenuName": resourceName};
            $.tzAjax.request({
                model: "/admin/resource",
                method: "/add",
                callback: function (data) {
                    $("#queryall_list").html(data);
                }
            }, params);
        },
        //保存或更新操作
        menu_save: function () {
            var parentId = $("#parentId").val();
            var resourceId = $("#resourceId").val();
            var resourceName = $("#resourceName").val();
            var color = $("#color").val();
            if (isEmpty(resourceName)) {
                loading("请输入菜单名称..", 4);
                $("#resourceName").select();
                return false;
            }
            var resourceUrl = $("#resourceUrl").val();
            var sort = $("#sort").val();

            var action = "/save";
            if (isNotEmpty(resourceId)) {
                action = "/update";
            }
            if (isNotEmpty(sort)) {
                var reg = new RegExp("^[0-9]*$");
                if (!reg.test(sort)) {
                    alert("菜单编号,请输入数字!");
                    return;
                }
            }

            var params = {
                "resourceName": resourceName,
                "resourceUrl": resourceUrl,
                "sort": sort,
                "resourceId": resourceId,
                "parentId": parentId,
                "color": color
            };
            $.tzAjax.request({
                model: "/admin/resource",
                method: action,
                callback: function (data) {
                    var obj = $.parseJSON(data);
                    if (obj.result == "success") {
                        alert("保存成功");
                        window.location.href = basePath + "/admin/resource/list";
                    } else if (obj.result == "fail") {
                        loading("保存失败", 4);
                    } else if (obj.result == "update_success") {
                        alert("更新成功");
                        window.location.href = basePath + "/admin/resource/list";
                    } else if (obj.result == "update_fail") {
                        loading("更新失败", 4);
                    } else if (obj.result == "resource_null") {
                        loading("网络异常", 4);
                    }
                }
            }, params);
        },
        //返回页面
        menu_back: function () {
            window.location.href = basePath + "/admin/resource/list";
        }
    };
</script>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12" style="margin-top: 15px;">
            <div class="btn-group">
                <button class="btn btn-default" onclick="menu.menu_add_button()">增加菜单</button>
            </div>
            <div id="queryall_list" style="margin-top: 30px;">
                <table id="treeTable" class="table table-striped table-bordered table-condensed">
                    <thead>
                    <tr>
                        <th>菜单名称</th>
                        <th>菜单链接</th>
                        <th>菜单编号</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${menuList}" var="father">
                        <tr id="${father.resourceId}"
                            pId="${father.parentId==null?'0':father.parentId}">
                            <td nowrap><i class="icon- hide"></i><a>${father.resourceName}</a></td>
                            <td title="">${father.resourceUrl}</td>
                            <td title="">${father.sort}</td>

                            <td nowrap><a href="javascript:void(0)"
                                          onclick="menu.menu_update_button(this)"
                                          data-resourceId="${father.resourceId}"
                                          data-resourceName="${father.resourceName}"
                                          data-resourceUrl="${father.resourceUrl}"
                                          data-sort="${father.sort}"
                                          data-color="${father.color}"
                                          data-operate="update"> 修改 </a> <a
                                    href="javascript:void(0)"
                                    onclick="menu.menu_delete_button(this)" data-resourceId="${father.resourceId}"
                                    data-resourceName="${father.resourceName}"> 删除 </a> <a
                                    href="javascript:void(0)"
                                    onclick="menu.menu_childrensave_button(this)"
                                    data-resourceId="${father.resourceId}"
                                    data-resourceName="${father.resourceName}"
                                    data-resourceUrl="${father.resourceUrl}"
                                    data-color="${father.color}"
                                    data-sort="${father.sort}"> 添加下级菜单 </a></td>
                        </tr>

                        <c:forEach var="child" items="${father.childrenList}">
                            <tr id="${child.resourceId}"
                                pId="${child.parentId==null?'0':child.parentId}">
                                <td nowrap><i class="icon- hide"></i><a>${child.resourceName}</a></td>
                                <td title="">${child.resourceUrl}</td>
                                <td title="">${child.sort}</td>
                                <td nowrap><a href="javascript:void(0)"
                                              onclick="menu.menu_update_button(this)"
                                              data-resourceId="${child.resourceId}"
                                              data-resourceName="${child.resourceName}"
                                              data-resourceUrl="${child.resourceUrl}"
                                              data-sort="${child.sort}"
                                              data-color="${child.color}"
                                              data-operate="update"
                                > 修改 </a> <a
                                        href="javascript:void(0)"
                                        onclick="menu.menu_delete_button(this)"
                                        data-resourceId="${child.resourceId}" data-resourceName="${child.resourceName}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
