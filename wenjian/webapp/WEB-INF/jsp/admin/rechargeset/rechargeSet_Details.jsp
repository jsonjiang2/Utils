<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>名单匹配</title>
    <script type="text/javascript">
        function queryAllPerson2(pageNum,pageSize){
            var id ="${id}";
            var excludetype ="${excludetype}";
            var params={"id":id,"excludetype":excludetype,"pageNum":pageNum};
            $.post("/admin/rechargeSet/details/"+id,params,function(data){
                $("#usersjsp").html(data);
            });
        }
    </script>
</head>
<body>
<div class="col-md-12" id="usersjsp">
    <form>
        <table class="table table-hover" id="personList_table">
            <thead>
            <tr class="text-center" style="background: #ccc;">
                <td>序号</td>
                <td>名单编号</td>
                <td>名单名称</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pagehelper.list}" var="item" varStatus="status">

                <tr class="text-center">
                    <td>${status.count}</td>
                    <td>${item.pmno }</td>
                    <td>${item.pmname }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="c-page">
            <%@include file="/WEB-INF/jsp/common/pagehelper2.jsp"%>
        </div>
    </form>
    <hr>
</div>
</body>
</html>