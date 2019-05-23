<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="/WEB-INF/tld/gj.tld" prefix="gj"%>

<table class="table table-hover">
    <thead>
    <tr class="text-center">
        <td>操作</td>
        <td>用户名</td>
        <td>邮箱</td>
        <td>已有角色</td>
    </tr>
    </thead>
    <tbody id="checkbox">
    <c:forEach items="${pagehelper.list}" var="user">
        <tr class="text-center roleuser role_opid_${user.id}">
            <td><label><input type="checkbox" class="checks"
                              value="${user.id}" /></label></td>
            <td  title="${user.username}">${gj:getSubStr(user.username,'15')}</td>
            <td  title="${user.email}">${gj:getSubStr(user.email,'20')}</td>
            <gj:systemuserRole opid="${user.id}" var="role">
                <td  title="${role.systemRole.roleName==null?'暂无角色':role.systemRole.roleName}">
                        ${gj:getSubStr(role.systemRole.roleName,'25') }
                </td>
            </gj:systemuserRole>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div id="page_div">
    <%@ include file="/WEB-INF/jsp/common/pagehelper.jsp" %>
</div>

