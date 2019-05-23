<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>全局配置</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <link href="<%=basePath%>/static/plugin/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
    </style>
    <script>
        function updateGloble(id){
            var action ="${basePath}/admin/global/getGlobal";
            $.ajax({
                type: "post",
                url: action,
                data: {"id":id},
                dataType: "json",
                async:false,
                success: function(data){



                },
                error: function (data) {
                    failPopup("系统异常，请稍候再试或联系客服");
                    PopupBtnClose();
                }
            });
        }

        function updateUI(id,code){
            var  action = "/admin/global/getGlobal";
            $.get(action,{"id":id,"code":code},function(data){
                $("#update-modal-body").html(data);
            });
        }
    </script>
</head>

<body>

<div class="container" style="width:100%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="margin-bottom:10px;"></div>
        <form id="globalForm">
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <%--<td>网站名称</td>
                    <td>网站抬头</td>
                    <td>网站关键词</td>
                    <td>网站描述</td>--%>
                    <td>提现异常判断时间间隔</td><%--单位（分钟）--%>
                    <td>广告图展示优先级</td>   <%--1：用户广告图；2：管理员广告图--%>
                    <%--<td>茶馆发帖审核开关</td>   &lt;%&ndash;0关  1开&ndash;%&gt;
                    <td>茶馆回复审核开关</td>
                    <td>资讯发帖审核开关</td>
                    <td>资讯回复审核开关</td>--%>
                    <td>增加最少数</td>
                    <td>增加最多数</td>
                    <td>单贴操作数</td>
                    <td>帖子查看最少数</td>
                    <td>帖子查看最大数</td>
                    <%--<td>帖子时间范围</td>--%><%--单位：天--%>
                    <td>帖子开始时间</td>
                    <td>帖子结束时间</td>
                    <td>执行次数</td>
                    <td>今日已执行次数</td>
                    <td>执行时间</td>
                    <td>排序方式</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                    <tr class="text-center">
                        <%--<td>${global.websitename}</td>
                        <td>${global.title }</td>
                        <td>${global.keyworld }</td>

                        <td>${global.description}</td>--%>
                        <td>
                            ${global.withdrawaltime}
                        </td>
                        <td>
                            ${global.postadway}
                        </td>
                       <%-- <td>${global.teastatus}</td>

                        <td>
                            ${global.tearpstatus}
                        </td>
                        <td>
                            ${global.messtatus}
                        </td>
                        <td>
                            ${global.mesrpstatus}
                        </td>--%>
                        <td>
                            ${global.addminview}
                        </td>
                        <td>
                            ${global.addmaxview}
                        </td>
                        <td>
                            ${global.threadadd}
                        </td>
                        <td>
                            ${global.minview}
                        </td>
                        <td>
                            ${global.maxview}
                        </td>
                        <%--<td>
                            ${global.dayrange}
                        </td>--%>
                        <td>
                            ${global.poststarttimes}
                        </td>
                        <td>
                            ${global.postendtimes}
                        </td>
                        <td>
                            ${global.exenumber}
                        </td>
                        <td>
                            ${global.dayexcount}
                        </td>
                        <td>
                            <jsp:useBean id="timestamp" class="java.util.Date"/>
                            <jsp:setProperty name="timestamp" property="time" value="${global.exedate}"/><%--
                            <fmt:formatDate value="${timestamp}" pattern="MM/dd/yyyy HH:mm:ss"/>--%>
                            <fmt:formatDate value="${timestamp}" pattern="yyyy/MM/dd HH:mm:ss"/>
                       <%-- ${dateUtils.formatDate(global.exedate)}--%>
                        </td>
                            <td>
                                <c:if test="${global.sorttype==1}">
                                    按最新排序
                                </c:if>
                                <c:if test="${global.sorttype==2}">
                                    按最新回复排序
                                </c:if>
                            </td>
                        <td>
                            <button type="button" class="btn btn-default" data-backdrop="static" data-toggle="modal"
                                    data-dismiss="modal" data-target="#updateModal"
                                    onclick="updateUI('${global.id}','update')">修改
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
            <%@ include file="../../common/modal.jsp" %>
        </div>
    </div>
</div>
</body>
</html>
