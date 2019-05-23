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
    <form class="form-horizontal" role="form" id="deleteForm">
        <input type="hidden" id="delByid" value="${userAuthenticationOnoff.id}">
        <span style="font-weight: bold;">
        是否删除：
        <span style="color: red;">
            <label>
                ${userAuthenticationOnoff.company}-
                <c:choose>
                    <c:when test="${userAuthenticationOnoff.type==1}">
                        实名
                    </c:when>
                    <c:otherwise>
                        银行卡四要素
                    </c:otherwise>
                </c:choose>
            </label>
        </span>
        &nbsp;&nbsp;的通道?
    </span>
    </form>
</div>
</body>
</html>