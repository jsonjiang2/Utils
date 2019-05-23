<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<table class="table table-hover" id="personList_table">
	<thead>
		<tr class="text-center" style="background: #ccc;">
			<td>序号</td>
			<td>平台名称</td>
			<td>设置时间</td>
			<td>设置人</td>
			<td>备注</td>
			<td>操作</td>
  		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
			<tr class="text-center">
				<td>${status.index+1}</td>
				 <td>${item.pname}</td>
				 <td>
 				 	<wdb:formatDate value="${item.dateline }" var="dateline">
						${dateline }
					</wdb:formatDate>
				 </td>
				 <td>
				 		<wdb:getAdminUser uid="${item.baseid }" var="baseid">
								${baseid.username}
						</wdb:getAdminUser>
				  </td>
				 <td>${item.remark}</td>
				 <td>
				 	<button type="button" onclick="del(this)" class="btn btn-default" data-opid="${ item.id}" data-pname="${ item.pname}">删除</button>
				 	<button type="button" onclick="settingShow(this)" class="btn btn-default" data-opid="${ item.id}" data-pname="${ item.pname}">修改</button>
				 	
				 </td>
			</tr>
		</c:forEach>
	</tbody>
</table>
