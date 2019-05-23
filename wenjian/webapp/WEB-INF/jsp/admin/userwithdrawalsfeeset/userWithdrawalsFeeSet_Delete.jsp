<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div align="center">
    <c:choose>
        <c:when test="${not empty userWithdrawalsFeeSet }">
            <form class="form-horizontal" role="form" id="deleteForm">
                <input type="hidden" id="delByid" value="${userWithdrawalsFeeSet.id}">
                <span style="font-weight: bold;">
                是否删除---用户名为：
                    <span style="color: red;">
                        <label>
                                ${userWithdrawalsFeeSet.username}-${userWithdrawalsFeeSet.realname}
                        </label>
                    </span>
                &nbsp;&nbsp;的用户?
                </span>
            </form>
        </c:when>
        <c:otherwise>
            <%--<input type="hidden" id="delByid2" value="0">--%>
            <span style="font-weight: bold;">
                此用户设置已删除过！请刷新页面
            </span>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>