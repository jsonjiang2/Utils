<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>
    <style>
        .text-center td {
            text-align: center;
            vertical-align: middle !important;
            border: 1px solid #666;
        }

        .myCheck{
            background-color: white;
            border-radius: 5px;
            border:1px solid #d3d3d3;
            width:16px;
            height:16px;
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            line-height: 16px;
        }

        .myCheck:checked{
            background-color: #eee;
        }


    </style>
    <title>工商数据查询记录列表</title>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="container" style="width: 85%;">
    <div class="row clearfix">
        <div style="margin-bottom: 10px;"></div>
        <form method="post" class="form-inline" id="form-select"
              action="/admin/businessQuery/cxList">
            <input type="hidden" id="pageNum" name="pageNum">
            <input type="hidden" id="pageSize" name="pageSize">
        </form>
        <div style="margin-top: 20px;"></div>

        <table class="table table-hover" id="personList_table">
            <thead>
            <tr class="text-center" style="background: #ccc;">
                <td>
                    <input type="checkbox" id="all" class="myCheck" onclick="">
                </td>
                <td>序号</td>
                <td>平台编号</td>
                <td>企业名称</td>
                <td>状态码</td>
                <td>结果信息</td>
                <td>查询时间</td>
                <td>导入方式</td>
                <td>是否成功</td>
                <td>手动操作人</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pagehelper.list}" var="item" varStatus="status">
                <tr class="text-center">
                    <td>
                        <input type="checkbox" name="checkname" class="myCheck" value="${item.id}">
                    </td>
                    <td>${status.index+1}</td>
                    <td>${empty item.pno ? '无':item.pno}</td>
                    <td>
                         ${item.keyword}
                    </td>
                    <td>
                         ${item.status}
                    </td>
                    <td>
                         ${item.messag}
                    </td>
                    <td>${empty item.dateline ? '':dateUtils.formatDate(item.dateline)}</td>
                    <td>
                        <c:if test="${item.reqstatus==1}">手工</c:if>
                        <c:if test="${item.reqstatus==2}">自动</c:if>
                    </td>
                    <td>
                        <c:if test="${item.workstatus==1}">是</c:if>
                        <c:if test="${item.workstatus==0}">否</c:if>
                    </td>
                    <td>
                         ${item.manager}
                    </td>

                    <%--<td>--%>
                        <%--<button class="btn btn-default" onclick="business_detail(${item.id})">详情</button>--%>
                        <%--<button class="btn" data-backdrop="static"--%>
                                <%--data-toggle="modal" data-dismiss="modal"--%>
                                <%--data-target="#updateModal"--%>
                                <%--onclick="updateUI('${item.id}')">修改</button>--%>
                        <%--<button class="btn btn-default" onclick="del('${item.id}')">删除</button>--%>
                    <%--</td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <script type="text/javascript">

            function business_detail(id){
                var action="/admin/platformBusinessRegistration/getById/"+id;
                $.post(basePath+action,function(data){
                    $("#detailsModal").modal({
                        backdrop: 'static',
                    });
                    $("#detail-modal-body").html(data);
                });
            }

            $(function() {
                $(".p-content").each(function() {
                    var content = $(this).html().trim();
                    if (content.length > 8) {
                        $(this).html(content.substr(0, 8) + "...");
                    }
                })
                $(".p-content").tzTip();
            });

        </script>
        <%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
    </div>



    </div>
</div>
<!-- 引入模态框 -->
<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>