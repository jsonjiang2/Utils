<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>资源信息详情页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
</head>
<body style="font-family:'微软雅黑'; ">

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台编号：</font>
    <font class="col-md-4">${resourcesInfo.pno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台名称：</font>
    <font class="col-md-4">${resourcesInfo.pname}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源编号：</font>
    <font class="col-md-4">${resourcesInfo.resourceno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">上级资源编号：</font>
    <font class="col-md-4">${resourcesInfo.upresourceno}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">资源开关：</font>
    <font class="col-md-4">${resourcesInfo.onoff}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">专栏显示：</font>
    <font class="col-md-4">${resourcesInfo.display}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台背景：</font>
    <font class="col-md-4">${resourcesInfo.pbackground}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">投资攻略：</font>
    <font class="col-md-4">${resourcesInfo.bidstrategy}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">平台红包：</font>
    <font class="col-md-4">${resourcesInfo.redenvelopes}</font>
    <hr>
</div>

<div class="row" style="line-height: 0px;">
    <font class="col-sm-4 text-right">备注：</font>
    <font class="col-md-4">${resourcesInfo.remark}</font>
    <hr>
</div>

<br/><br/><br/>
<p>推广注册链接</p>
<div class="row" style="line-height: 0px;">
		<table class="table table-hover" id="personList_table">
			<thead>
				<tr class="text-center" style="background: #ccc;">
					
					<td>序号</td>
					<!-- <td>资源编号</td> -->
					<td>pc链接</td>
					<td>手机端链接</td>
 					</tr>
			</thead>
			<tbody>
				<c:forEach items="${resourcesLinkList}" var="item" varStatus="status">
					<tr class="text-center">
						
						<td>${item.serialno}</td>
						<td>${item.resourceno}</td>
						<td>${item.pclink}</td>
						<td>
							 ${item.mlink}
							</td>
 						</tr>
					</c:forEach>
			</tbody>
		</table>
</div>
<br/>
<br/>
<br/>
<p>用户推广注册链接</p>
<div class="row" style="line-height: 0px;">
		<table class="table table-hover" id="personList_table">
			<thead>
				<tr class="text-center" style="background: #ccc;">
					
					<td>序号</td>
					<td>用户-姓名</td>
					<!-- <td>资源编号</td> -->
					<td>pc链接</td>
					<td>手机端链接</td>
 					</tr>
			</thead>
			<tbody>
				<c:forEach items="${resourcesUserLinkList}" var="item" varStatus="status">
					<tr class="text-center">
						
						<td>${item.resourcesLink.serialno}</td>
						<td>${item.preCommonMember.username}--${item.preCommonMember.realname}</td>
						<td>${item.resourcesLink.resourceno}</td>
						<td>${item.resourcesLink.pclink}</td>
						<td>
							 ${item.resourcesLink.mlink}
							</td>
 						</tr>
					</c:forEach>
			</tbody>
		</table>
</div>
<br/>
<br/>
<br/>
<p>资源标的信息</p>
<div class="row" style="line-height: 0px;">
		<table class="table table-hover" id="personList_table">
			<thead>
				<tr class="text-center" style="background: #ccc;">
					
					<td>标的编号</td>
					<td>资源编号</td>
					<td>标的状态</td>
					<td>标的名称</td>
					<td>标的周期说明</td>
 					</tr>
			</thead>
			<tbody>
				<c:forEach items="${resourcesBidList}" var="item" varStatus="status">
					<tr class="text-center">
						
						<td>${item.bidno}</td>
						<td>${item.resourceno}</td>
						<td>
							<c:if test="${item.bidstatus==1}">正常投资</c:if>
							<c:if test="${item.bidstatus==2}">暂停投资</c:if>
						</td>
						<td>${item.bidname}</td>
						<td>${item.bidcycle}${item.biddetail}</td>
 						</tr>
					</c:forEach>
			</tbody>
		</table>
</div>
<br/>
<br/>
<br/>
<p>资源标的返利信息</p>
<div class="row" style="line-height: 0px;">
		<table class="table table-hover" id="personList_table">
			<thead>
				<tr class="text-center" style="background: #ccc;">
					
					<td>标的编号</td>
					<td>标的名称</td>
					<td>资源编号</td>
					<td>档位投标状态</td>
					<td>标的档位</td>
					<td>最低投资额</td>
					<td>最高投资额</td>
					<td>平台利息</td>
					<td>平台红包</td>
					<td>返利方式</td>
					<td>返利金额(百分比)</td>
					<td>综合预期收益</td>
					
 					</tr>
			</thead>
			<tbody>
				<c:forEach items="${resourcesBidRebateList}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${item.bidno}</td>
							<td>${item.resourcesBid.bidname}</td>
							<td>${item.resourceno}</td>
							<td>
								<c:if test="${item.bidstatus==1}">正常投资</c:if>
								<c:if test="${item.bidstatus==2}">暂停投资</c:if>
							</td>
							<td>${item.grade}</td>
							<td>${item.bidamountmin}</td>
							<td>${item.bidamountmax}</td>
							<td>${item.platforminterest*100}%</td>
							<td>${item.redenvelopes}元</td>
							<td>
								<c:if test="${item.rebatemode==1}">百分比</c:if>
								<c:if test="${item.rebatemode==2}">定额</c:if> 
							</td>
							<td>${item.rebateamount}</td>
							<td>${item.totalbenefit*100}%</td>
 						</tr>
					</c:forEach>
			</tbody>
		</table>
</div>

</body>
</html>
 --%>