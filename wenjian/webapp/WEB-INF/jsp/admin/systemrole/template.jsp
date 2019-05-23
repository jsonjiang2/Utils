<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-hover">
	<thead>
		<tr class="text-center" style="background: #ccc;">
			<td>ID</td>
			<td>角色名称</td>
			<%--<td>菜单名称</td>--%>
			<td>操作</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pagehelper.list}" var="systemrole">
			<tr class="text-center" id="gj_systemrole_${systemrole.roleId}">
				<td>${systemrole.roleId }</td>
				<td><a href="javascript:void(0)">${systemrole.roleName}</a></td>
				<%--<gj:systemrole opid="${systemrole.id}" var="role">--%>
					<%--<td class="tzui-tips"--%>
						<%--tip="${role.adminResource.menuname==null?'暂无菜单':role.adminResource.menuname}">${gj:getSubStr(role.adminResource.menuname,'30')}</td>--%>
				<%--</gj:systemrole>--%>
				<td>
					<div class="btn-group">
                        <c:if test="${systemrole.roleId ne 1}">
						<button class="btn btn-default" data-roleid="${systemrole.roleId }"
							data-rolename="${systemrole.roleName}"
							onclick="systemrole.gave(this)">授权</button>

						<button class="btn btn-default" data-roleid="${systemrole.roleId }"
							data-rolename="${systemrole.roleName}"
							onclick="systemrole.gj_update(this)">修改</button>
						<button class="btn btn-default" data-roleid="${systemrole.roleId }"
							data-rolename="${systemrole.roleName}"
							onclick="systemrole.gj_delete(this)">删除</button>
                        </c:if>
						<button class="btn btn-default" data-roleid="${systemrole.roleId }"
							data-rolename="${systemrole.roleName}"
							onclick="systemrole.saveroleuser(this)">分配用户</button>
						<button class="btn btn-default" data-roleid="${systemrole.roleId }"
							data-rolename="${systemrole.roleName}"
							onclick="systemrole.findroleuser(this)">已分配用户</button>
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="page_div">
	<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div>


