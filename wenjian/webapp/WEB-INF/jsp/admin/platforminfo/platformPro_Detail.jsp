<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>平台产品详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<center><h3>产品详情</h3></center>
<br>
<div class="row" style="line-height: 0px;">
    <table class="table table-hover" id="personList_table">
        <thead>
        <tr class="text-center" style="background: #ccc;">
            <td>产品编号</td>
            <td>产品名称</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pagehelper.list}" var="item" varStatus="status">
            <tr class="text-center">
                <td>
                    ${item.productno}
                </td>
                <td>
                    ${item.productname}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div id="page_div" style="margin-top: 20px;">
        <%@ include file="/WEB-INF/jsp/common/pagehelper2.jsp"%>
    </div>


</div>



</body>
</html>
