<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>批次详情</title>

    <script type="text/javascript">
        function queryAllPerson2(pageNum,pageSize){
            var id ="${entity.id}";
            var params={"id":id,"pageNum":pageNum};
            $.post("/admin/userWithdrawalsBatch/selectById/"+id,params,function(data){
                $("#userWithdrawalsjsp").html(data);
            });
        }
    </script>

</head>
<body>
    <div class="col-md-12" id="userWithdrawalsjsp">
        <%@include file="/WEB-INF/jsp/admin/userwithdrawalsbatch/userWithdrawalsBatch_DetailTwo.jsp" %>
    </div>
</body>
</html>