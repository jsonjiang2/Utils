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
        <input type="hidden" id="delByid" value="${rechargeSet.id}">
        <span style="font-weight: bold;">是否删除：</span><br>

        <span style="font-weight: bold;">
            <span>
                <span>用户组为：</span>
                <span style="color: red;">
                    <c:forEach items="${userGroupshow}" var="entity" varStatus="index">
                        <label>
                            ${entity.pmno}---${entity.pmname}
                        </label><br>
                    </c:forEach>
                </span>
            </span>
            <span>
                <span>排除用户组为：</span>
                <c:choose>
                    <c:when test="${not empty excludeUserGroupshow}">
                        <span style="color: red;">
                            <c:forEach items="${excludeUserGroupshow}" var="entity" varStatus="index">
                                <label>
                                    ${entity.pmno}---${entity.pmname}
                                </label><br>
                            </c:forEach>
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span style="color: red;">无</span><br>
                    </c:otherwise>
                </c:choose>
            </span>
            <span>
                <span>排除用户为：</span>
                <c:choose>
                    <c:when test="${not empty excludeUsernameshow}">
                        <span style="color: red;">
                            <c:forEach items="${excludeUsernameshow}" var="entity" varStatus="index">
                                <label>
                                    ${entity.username}---${entity.realname}
                                </label><br>
                            </c:forEach>
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span style="color: red;">无</span><br>
                    </c:otherwise>
                </c:choose>
            </span>
        </span>

        <span style="font-weight: bold;">的充值设置？</span>
        <%--<span style="font-weight: bold;">
            是否删除---：<br>
                用户组为:
                <span style="color: red;">
                    <c:forEach items="${userGroupshow}" var="entity" varStatus="index">
                        <label>
                            ${entity.pmno}---${entity.pmname}
                        </label><br>
                    </c:forEach>
                </span><br>
                <c:if test="${not empty excludeUserGroupshow}">
                    排除用户组为:
                    <span style="color: red;">
                        <c:forEach items="${excludeUserGroupshow}" var="entity" varStatus="index">
                            <label>
                                ${entity.pmno}---${entity.pmname}
                            </label>
                        </c:forEach>
                    </span><br>
                </c:if>
                <c:if test="${not empty excludeUsernameshow}">
                    排除用户为:
                    <span style="color: red;">
                        <c:forEach items="${excludeUsernameshow}" var="entity" varStatus="index">
                            <label>
                                ${entity.username}---${entity.realname}
                            </label>
                        </c:forEach>
                    </span>
                </c:if><br>
            &nbsp;&nbsp;的充值设置?
        </span>--%>
    </form>
</div>
</body>
</html>