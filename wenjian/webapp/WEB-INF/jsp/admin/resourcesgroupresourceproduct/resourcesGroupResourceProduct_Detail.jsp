<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>组别资源和产品信息详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">一级资源主：</font>
    <font class="col-md-4">
		<wdb:getUser uid="${resourcesGroupResourceProduct.uid }" var="rsuser">
			${rsuser.username}--${rsuser.realname}
		</wdb:getUser>
	</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源编号：</font>
    <font class="col-md-4">${resourcesGroupResourceProduct.resourceno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">产品编号：</font>
    <font class="col-md-4">${resourcesGroupResourceProduct.productno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">开关：</font>
    <font class="col-md-4">
    	<c:if test="${resourcesGroupResourceProduct.onoff==0}">关闭</c:if>
    	<c:if test="${resourcesGroupResourceProduct.onoff==1}">开启</c:if> 
    </font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${resourcesGroupResourceProduct.remark}</font>
    <hr>
</div>

<br/>
<p>承接该资源的用户</p>
<div class="row" style="line-height: 0px;">
		<table class="table table-hover" id="personList_table">
			<thead>
				<tr class="text-center" style="background: #ccc;">
					
					<td>序号</td>
					<td>资源编号</td>
					<td>承接编号</td>
					<td>承接时间</td>
					<td>发布人</td>
					<td>承接人</td>
 					</tr>
			</thead>
			<tbody>
				<c:forEach items="${resourcesUserLinkList}" var="item" varStatus="status">
					<tr class="text-center">
						<td>${status.index+1}</td>
						<td>${item.originno}</td>
						<td>${item.subresourceno}</td>
						<td>${sf.format(item.undertaketime)}</td>
						<td>
							<wdb:getUser uid="${item.rruid }" var="rsuser">
								${rsuser.username}--${rsuser.realname}
							</wdb:getUser>
						</td>
						<td>
							<wdb:getUser uid="${item.uid }" var="rsuser">
								${rsuser.username}--${rsuser.realname}
							</wdb:getUser>
						</td>
 						</tr>
					</c:forEach>
			</tbody>
		</table>
</div>
<br/>
<br/>
<p>承接该资源的用户发布的产品</p>
<div class="row" style="line-height: 0px;">
		<table class="table table-hover" id="personList_table">
			<thead>
				<tr class="text-center" style="background: #ccc;">
					<td>序号</td>
					<td>用户名</td>
					<td>产品名称</td>
					<td>产品编号</td>
					<td>资源编号</td>
					<td>承接编号</td>
					<td>发布时间</td>
					<td>平台名称</td>
 					</tr>
			</thead>
			<tbody>
				<c:forEach items="${productReleaseList}" var="item" varStatus="status">
					<tr class="text-center">
						<td>${status.index+1}</td>
						<td>
							<wdb:getUser uid="${item.uid }" var="rsuser">
								${rsuser.username}--${rsuser.realname}
							</wdb:getUser>
						</td>
						<td>${item.productname}</td>
						<td>${item.productno}</td>
						<td>${item.resourceno}</td>
						<td>${item.subresourceno}</td>
						<td>${sf.format(item.release)}</td>
						<td>${item.pname}</td>
						
 						</tr>
					</c:forEach>
			</tbody>
		</table>
</div>
<br/>
<br/>
<br/>

</body>
</html>
