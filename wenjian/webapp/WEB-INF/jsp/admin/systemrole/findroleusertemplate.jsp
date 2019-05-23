<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tld/gj.tld" prefix="gj"%>
<div class="btn-group"  style="margin-top: -117px;">
	<button class="btn btn-default" onclick="backmenu()">返回</button>
</div>
<table class="table table-hover">
	<thead>
		<tr class="text-center">
			<td>当前角色</td>
			<td>用户名</td>
			<td>邮箱</td>
			<td>已有角色</td>
			<td>操作</td>
		</tr>
	</thead>
	<tbody id="checkbox">
		<c:forEach items="${pagehelper.list}" var="roleuser">
			<div id="role_id" data-roleId="${roleuser.systemRole.roleId}"></div>
			<tr class="text-center roleuser role_opid_${roleuser.id}">
				<td  title="${roleuser.systemRole.roleName}">${gj:getSubStr(roleuser.systemRole.roleName,'15')}</td>
				<td  title="${roleuser.username}">${gj:getSubStr(roleuser.username,'15')}</td>
				<td  title="${roleuser.email}">${gj:getSubStr(roleuser.email,'20')}</td>
				<gj:systemuserRole opid="${roleuser.id}" var="role">
					<td title="${role.systemRole.roleName==null?'暂无角色':role.systemRole.roleName}">${gj:getSubStr(role.systemRole.roleName,'20') }</td>
				</gj:systemuserRole>
				<td>
					<button class="btn" onclick="delete_findroleuser(this)"
							data-opid="${roleuser.id}"
							data-roleopid="${roleuser.systemRole.roleId}">移除</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="page_div">
	<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div>

<script type="text/javascript">
    function backmenu() {
        window.location.href="${basePath}/admin/systemrole/list"
    }
</script>