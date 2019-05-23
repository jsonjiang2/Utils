<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>清算记录详情</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
 </head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
				<!-- 平台编号  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">平台编号：</label>
 					<span class="col-md-6">
 						${productLiquidationRecord.pno}
 					</span>
  				</div>
 				<!-- 平台编号 end-->
 				
 				<!-- 清算编号  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">清算编号 ：</label>
 					<span class="col-md-6">
 						 ${productLiquidationRecord.liqno }
 					</span>
  				</div>
 				<!-- 清算编号  end-->
		
				<!-- 申报编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">申报编号：</label>
 					<span class="col-md-6">${productLiquidationRecord.declareno}</span>
  				</div>
 				<!-- 申报编号 end-->
 				
 				<!-- 原始申报编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">原始申报编号：</label>
 					<span class="col-md-6">
						 ${productLiquidationRecord.orideclareno}
					</span>
  				</div>
 				<!-- 原始申报编号  end-->
 			 
				<!-- 产品编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">产品编号 ：</label>
					<div class="col-md-6">
						${productLiquidationRecord.productno}
					</div>
				</div>
				<!-- 产品编号  end-->
				
				<!-- 发布资源编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">发布资源编号 ：</label>
					<div class="col-md-6">
						${productLiquidationRecord.resourceno}
					</div>
				</div>
				<!-- 发布资源编号  end-->

			<!-- 承接资源编号 start-->
			<div class="col-md-12" style="margin-top:10px;">
				<label class="col-md-4 text-right">承接资源编号 ：</label>
				<div class="col-md-6">
					${productLiquidationRecord.subresourceno}
				</div>
			</div>
			<!-- 承接资源编号  end-->
				 
				<!-- 申报人 start-->
				<wdb:getProductDeclareRecord declareno="${productLiquidationRecord.declareno}" var="declareno">
				
					<!-- 投标产品 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">投标产品 ：</label>
						<div class="col-md-6">
	 						${declareno.pname}-${declareno.pno}
	 					</div>
					</div>
					<!-- 投标产品  end-->
				
					<!-- 申报人 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">申报人 ：</label>
						<div class="col-md-6">
								<wdb:getUser uid="${declareno.baseid}" var="user">
									${user.username }-${empty user.realname ? '无' : user.realname }
								</wdb:getUser>
						</div>
					</div>
					<!-- 申报人 end-->
					
					<!-- 申报人手机号 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">申报人手机号 ：</label>
						<div class="col-md-6">
							 	<c:choose>
									<c:when test="${declareno.type == 1 }">${declareno.declaremobile }</c:when>
									<c:when test="${declareno.type == 2 }">无</c:when>
   								</c:choose>
						</div>
					</div>
					<!-- 申报人手机号 end-->
					
					<!-- 申报人支付宝 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">申报人支付宝 ：</label>
						<div class="col-md-6">
							 	<c:choose>
									<c:when test="${declareno.type == 1 }">${declareno.declarezfb }</c:when>
									<c:when test="${declareno.type == 2 }">无</c:when>
   								</c:choose>
						</div>
					</div>
					<!-- 申报人支付宝 end-->
					
					<!-- 申报人微信号 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">申报人手机号 ：</label>
						<div class="col-md-6">
							 	<c:choose>
									<c:when test="${declareno.type == 1 }">${declareno.declarewx }</c:when>
									<c:when test="${declareno.type == 2 }">无</c:when>
   								</c:choose>
						</div>
					</div>
					<!-- 申报人微信号 end-->
					
					<!-- 申报时间 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">申报时间 ：</label>
						<div class="col-md-6">
 							   <wdb:formatDate value="${declareno.dateline }" var="dateline">
 							  		 ${dateline}
 							   </wdb:formatDate>
 						</div>
					</div>
					<!-- 申报时间 end-->
					
					<!-- 申报金额 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">申报金额 ：</label>
						<div class="col-md-6">
 								${declareno.investoramount }
 						</div>
					</div>
					<!-- 申报金额 end-->
					
					<!-- 审核状态 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">审核状态 ：</label>
						<div class="col-md-6">
  							<c:choose>
								<c:when test="${declareno.auditstatus == 0 }">待审核</c:when>
								<c:when test="${declareno.auditstatus == 1 }">合格</c:when>
								<c:when test="${declareno.auditstatus == 2 }">不合格</c:when>
  						</c:choose>
 						</div>
					</div>
					<!-- 审核状态  end-->
				</wdb:getProductDeclareRecord>
				
				
				<!-- 活动类型 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">活动类型 ：</label>
					<div class="col-md-6">
						<c:choose>
							<c:when test="${productLiquidationRecord.activitytype == 1 }">首投</c:when>
							<c:when test="${productLiquidationRecord.activitytype == 2 }">复投</c:when>
 						</c:choose>
					</div>
				</div>
				<!-- 活动类型  end-->
				
				<!-- 清算方式 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">清算方式 ：</label>
					<div class="col-md-6">
						<c:choose>
							<c:when test="${productLiquidationRecord.liqtype == 1 }">线上</c:when>
							<c:when test="${productLiquidationRecord.liqtype == 2 }">线下</c:when>
 						</c:choose>
					</div>
				</div>
				<!-- 清算方式 end-->
				
				<!-- 清算人 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">清算人 ：</label>
					<div class="col-md-6">
						<wdb:getUser uid="${productLiquidationRecord.liqbaseid}" var="user">
							${user.username }-${empty user.realname ? '无' : user.realname }
						</wdb:getUser>
 					</div>
				</div>
				<!-- 清算人  end-->
				
				<!-- 清算级别 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">清算级别 ：</label>
					<div class="col-md-6">
						<wdb:getResourcesUserLink subresourceno="${productLiquidationRecord.subresourceno }" var="subresourceno">
							${subresourceno.level}
						</wdb:getResourcesUserLink>
 					</div>
				</div>
				<!-- 清算级别  end-->

			<!-- 投资金额  start-->
			<div class="col-md-12" style="margin-top:10px;">
				<label class="col-md-4 text-right">投资金额  ：</label>
				<div class="col-md-6">
					${productLiquidationRecord.investoramount}
				</div>
			</div>
			<!-- 投资金额   end-->

			<!-- 返利金额  start-->
			<div class="col-md-12" style="margin-top:10px;">
				<label class="col-md-4 text-right">返利金额  ：</label>
				<div class="col-md-6">
					${productLiquidationRecord.rebateamount}
				</div>
			</div>
			<!-- 返利金额   end-->

			<!-- 返利金额/百分比  start-->
			<div class="col-md-12" style="margin-top:10px;">
				<label class="col-md-4 text-right">返利金额/百分比  ：</label>
				<div class="col-md-6">
					${productLiquidationRecord.bidrebateamount}
				</div>
			</div>
			<!-- 返利金额/百分比   end-->

			<!-- 返利方式  start-->
			<div class="col-md-12" style="margin-top:10px;">
				<label class="col-md-4 text-right">返利方式  ：</label>
				<div class="col-md-6">
					<c:choose>
							<c:when test="${productLiquidationRecord.rebatemode == 1}">百分比</c:when>
							<c:when test="${productLiquidationRecord.rebatemode == 2}">定额</c:when>
 					</c:choose>
				</div>
			</div>
			<!-- 返利方式  end-->
				
				<!-- 清算状态 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">清算状态 ：</label>
					<div class="col-md-6">
 						<c:choose>
							<c:when test="${productLiquidationRecord.status == 0 }">待清算</c:when>
							<c:when test="${productLiquidationRecord.status == 1 }">已清算</c:when>
 						</c:choose>
					</div>
				</div>
				<!-- 清算状态  end-->
				
				<!-- 返利档位start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">返利档位 ：</label>
					<div class="col-md-6">
						${productLiquidationRecord.gear}
					</div>
				</div>
				<!-- 返利档位  end-->
				
				<!-- 制表时间 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">制表时间 ：</label>
					<div class="col-md-6">
 						<wdb:formatDate value="${productLiquidationRecord.dateline }" var="dateline">${dateline }</wdb:formatDate>
					</div>
				</div>
				<!-- 制表时间  end-->
				
				<!-- 原始申报人 start-->
				<wdb:getProductDeclareRecord declareno="${productLiquidationRecord.orideclareno}" var="orideclareno">
				 
					<!-- 原始申报人 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">原始申报人 ：</label>
						<div class="col-md-6">
								<wdb:getUser uid="${orideclareno.baseid}" var="user">
									${user.username }-${empty user.realname ? '无' : user.realname }
								</wdb:getUser>
						</div>
					</div>
					<!-- 原始申报人 end-->
					
					<!-- 原始申报人手机号 start-->
					<div class="col-md-12" style="margin-top:10px;">
						<label class="col-md-4 text-right">原始申报人手机号 ：</label>
						<div class="col-md-6">
							 	<c:choose>
									<c:when test="${orideclareno.type == 1 }">${orideclareno.declaremobile }</c:when>
									<c:when test="${orideclareno.type == 2 }">无</c:when>
   								</c:choose>
						</div>
					</div>
					<!-- 原始申报人手机号 end-->
					
				</wdb:getProductDeclareRecord>
				
				<!-- 清算备注 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">清算备注：</label>
					<div class="col-md-6">
						${productLiquidationRecord.remark}
					</div>
				</div>
				<!-- 清算备注  end-->
				 
  	</div>
 </div>
</body>
</html>