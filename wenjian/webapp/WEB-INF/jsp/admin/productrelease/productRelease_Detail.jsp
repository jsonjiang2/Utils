<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主题回复详情</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript" src="${basePath}/static/js/admin/productrelease/productRelease.js"></script>
</head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
				<!-- 产品发布人 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">产品发布人：</label>
 					<span class="col-md-6">
 						<wdb:getUser uid="${productRelease.uid }" var="user">
 							${user.username }--${ user.realname == null ? '无':user.realname}
 						</wdb:getUser>
 					</span>
  				</div>
 				<!-- 产品发布人 end-->
 				
 				<!-- 发布时间 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">平台编号：</label>
 					<span class="col-md-6">
 						<wdb:formatDate value="${productRelease.release }" var="datetime">
 							${ datetime}
 						</wdb:formatDate>
 					</span>
  				</div>
 				<!-- 发布时间 end-->
		
				<!-- 平台编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">平台编号：</label>
 					<span class="col-md-6">${productRelease.pno}</span>
  				</div>
 				<!-- 平台编号 end-->
 				
 				<!-- 平台名称start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">平台名称：</label>
 					<span class="col-md-6">
						 ${productRelease.pname}
					</span>
  				</div>
 				<!-- 平台名称 end-->
 			 
				<!-- 产品资源编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">产品资源编号 ：</label>
					<div class="col-md-6">
						${productRelease.resourceno}
					</div>
				</div>
				<!-- 产品资源编号  end-->
 
				<!-- 产品编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">产品编号 ：</label>
					<div class="col-md-8">
						${productRelease.productno}
					</div>
				</div>
				<!-- 产品编号 end-->

				<!-- 产品编号帖子数量 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">产品名称：</label>
					<div class="col-md-4">
 					 	${productRelease.productname}
					</div>
				</div>
				<!-- 产品编号 end-->
 				
				<!-- 资源（活动）类型 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">资源（活动）类型：</label>
					<div class="col-md-4">
						<c:choose>
							<c:when test="${productRelease.type == 1}">首投</c:when>
							<c:when test="${productRelease.type == 2}">复投</c:when>
  							<c:otherwise>
 								  未知
 							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- 资源（活动）类型end-->

				<!-- 返利申报 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">返利申报 ：</label>
					<div class="col-md-4">
						<c:choose>
							<c:when test="${productRelease.rebate == 0}">关闭</c:when>
							<c:when test="${productRelease.rebate == 1}">开启</c:when>
  							<c:otherwise>
 								  未知
 							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- 返利申报  end-->

 				<!-- 是否加密浏览 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">是否加密浏览 ：</label>
					<div class="col-md-4">
						 <c:choose>
							<c:when test="${productRelease.isviewcode == 0}">否</c:when>
							<c:when test="${productRelease.isviewcode == 1}">是</c:when>
  							<c:otherwise>
 								  未知
 							</c:otherwise>
						</c:choose>
 					</div>
				</div>
				<!-- 是否加密浏览  end-->
				
				<!-- 是否加密浏览 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">是否投资限制 ：</label>
					<div class="col-md-4">
						 <c:choose>
							<c:when test="${productRelease.limit == 0}">否</c:when>
							<c:when test="${productRelease.limit == 1}">是</c:when>
  							<c:otherwise>
 								  未知
 							</c:otherwise>
						</c:choose>
 					</div>
				</div>
 				<!-- 是否加密浏览  end-->
 				
 				<!-- 预约码价格 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">预约码价格 ：</label>
					<div class="col-md-4">
						 ${productRelease.codeamount }
 					</div>
				</div>
 				<!-- 预约码价格  end-->
 				
 				<!-- 产品开关 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">是否投资限制 ：</label>
					<div class="col-md-4">
						 <c:choose>
							<c:when test="${productRelease.onoff == 0}">暂停投资</c:when>
							<c:when test="${productRelease.onoff == 1}">正常投资</c:when>
  							<c:otherwise>
 								  未知
 							</c:otherwise>
						</c:choose>
 					</div>
				</div>
 				<!-- 产品开关  end-->
 				
 				<!-- 是否个人专栏显示 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">是否个人专栏显示 ：</label>
					<div class="col-md-4">
						 <c:choose>
							<c:when test="${productRelease.display == 0}">否</c:when>
							<c:when test="${productRelease.display == 1}">是</c:when>
  							<c:otherwise>
 								  未知
 							</c:otherwise>
						</c:choose>
 					</div>
				</div>
 				<!-- 是否个人专栏显示 end-->
 				
 				<!-- 撸客排名 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">撸客排名 ：</label>
					<div class="col-md-4">
						 ${productRelease.rank }
 					</div>
				</div>
 				<!-- 撸客排名  end-->
 				
 				<!-- 平台背景 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">平台背景 ：</label>
					<div class="col-md-6">
						 ${productRelease.pbackground } 
 					</div>
				</div>
 				<!-- 平台背景  end-->
 				
 				<!-- 投资攻略 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">投资攻略 ：</label>
					<div class="col-md-6">
						 ${productRelease.bidstrategy } 
 					</div>
				</div>
 				<!-- 投资攻略  end-->
 				
 				<!-- 平台红包 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">平台红包 ：</label>
					<div class="col-md-6">
						 ${productRelease.redenvelopes } 
 					</div>
				</div>
 				<!-- 平台红包  end-->
 				
 				<!-- 其他网站链接 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">其他网站链接：</label>
					<div class="col-md-6">
						${productRelease.otherlink }
  					</div>
				</div>
 				<!-- 其他网站链接 end-->
 				
 				<!-- Pc端资源链接 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">Pc端资源链接：</label>
					<div class="col-md-6">
						 ${productRelease.pclink }
 					</div>
				</div>
 				<!-- Pc端资源链接  end-->
 				
 				<!-- 备注端资源链接 start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">手机端资源链接 ：</label>
					<div class="col-md-6">
						${productRelease.mlink }
 					</div>
				</div>
 				<!-- 备注端资源链接  end-->
 				
 				<!-- 备注  start-->
				<div class="col-md-12" style="margin-top:15px;">
					<label class="col-md-4 text-right">备注 ：</label>
					<div class="col-md-6">
						 ${productRelease.remark }
 					</div>
				</div>
 				<!-- 备注   end-->
 		
 		<!-- 产品标的设置详情 start -->
		<div class="col-md-12" style="margin-top: 15px;">
 			<div class="well text-center" style="font-size: 14px; background: #d6e9c6; line-height: 0px;">产品标的设置详情</div>
 				<table class="table table-hover">
					<thead>
						<tr class="text-center" style="background: #ccc;">
  							<td>标的编号</td>
							<td>标的状态</td>
 							<td>标的名称 </td>
							<td>标的周期说明</td>
  						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productRelease.productBids}" var="user" varStatus="index">
							<tr class="text-center">
								 <td>${user.bidno }</td>
								 <td>
								 	 <c:choose>
								 	 	<c:when test="${user.bidstatus == 1}">正常投资</c:when>
								 	    <c:when test="${user.bidstatus == 2}">暂停投资</c:when>
								 	 </c:choose>
								 </td>
	 							 <td>${user.bidname } </td>
								 <td>${user.biddetail }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
 			</div>
 			<!-- 产品标的设置详情 end -->
 			
 			<!-- 产品标的返利设置start -->
		<div class="col-md-12" style="margin-top: 15px;">
 			<div class="well text-center" style="font-size: 14px; background: #d6e9c6; line-height: 0px;">产品标的返利设置</div>
 				<table class="table table-hover">
					<thead>
						<tr class="text-center" style="background: #ccc;">
  							<td>标的编号</td>
							<td>标的状态</td>
 							<td>标的档位</td>
 							<td>最低投资额</td>
 							<td>最高投资额</td>
 							<td>平台利息</td>
 							<td>平台红包</td>
 							<td>返利方式</td>
 							<td>返利金额</td>
 							<td>综合收益</td>
  						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productRelease.productBidRebates}" var="user" varStatus="index">
							<tr class="text-center">
								 <td>${user.bidno }</td>
								 <td>
								 	 <c:choose>
								 	 	<c:when test="${user.bidstatus == 1}">正常</c:when>
								 	    <c:when test="${user.bidstatus == 2}">暂停</c:when>
								 	 </c:choose>
								 </td>
	 							 <td>${user.grade}</td>
	 							 <td>${user.bidamountmin}</td>
	 							 <td>${user.bidamountmax}</td>
	 							 <td>${user.platforminterest}</td>
	 							 <td>${user.redenvelopes}</td>
	 							 <td>
	 							 	<c:choose>
	 							 		<c:when test="${user.rebatemode == 1}">百分比</c:when>
	 							 		<c:when test="${user.rebatemode == 2}">定额</c:when>
 	 							 	</c:choose>
	 							 </td>
	 							 <td>
 	 							    <c:choose>
	 							 		<c:when test="${user.rebatemode == 1}">
	 							 		${user.rebateamount * 100} %
	 							 		</c:when>
	 							 		<c:otherwise>${user.rebateamount} </c:otherwise>
 	 							 	</c:choose>
 	 							 </td>
	 							 <td>${user.totalbenefit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
 			</div>
 			<!-- 产品标的返利设置 end -->
 			
 			
 	   <c:if test="${productRelease.limit == 1 }">
	  		<!-- 产品预约码start -->
			<div class="col-md-12" style="margin-top: 15px;">
	 			<div class="well text-center" style="font-size: 14px; background: #d6e9c6; line-height: 0px;">产品预约码</div>
	 				<table class="table table-hover">
						<thead>
							<tr class="text-center" style="background: #ccc;">
	  							<td>预约码编号</td>
								<td>预约码序号 </td>
	 							<td>预约码 </td>
								<td>预约码状态</td>
	    					</tr>
						</thead>
						<tbody>
							<c:forEach items="${productRelease.productCodes}" var="user" varStatus="index">
								<tr class="text-center">
									 <td>${user.codeno }</td>
									 <td>${user.serialno } </td>
									 <td>${user.code }</td>
		 							 <td>
		 							 	<c:choose>
		 							 		<c:when test="${ user.status == 0}">未使用</c:when>
		 							 		<c:when test="${ user.status == 1}">已购买</c:when>
		 							 		<c:when test="${ user.status == 2}">已使用</c:when>
		 							 		<c:otherwise>
		 							 			其他
		 							 		</c:otherwise>
		 							 	</c:choose>
		 							  </td>
	 							</tr>
							</c:forEach>
						</tbody>
					</table>
	 			</div>
	 			<!-- 产品预约码 end -->
 	   </c:if>
 	</div>
 </div>
</body>
</html>