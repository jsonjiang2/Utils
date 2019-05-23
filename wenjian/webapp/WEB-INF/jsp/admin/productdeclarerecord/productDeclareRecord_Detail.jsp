<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 申报记录详情</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
 </head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
		
				<!-- 投资标的start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">投资标的：</label>
 					<span class="col-md-6">
 						  <c:choose>
 						  	<c:when test="${productDeclareRecord.isoriginal eq 1}">
		 						  <wdb:getProductBid productno="${productDeclareRecord.productno}" bidno="${productDeclareRecord.bidno}" var="productno">
		 						  	${empty productno.bidname ? "无" : productno.bidname }
		 						  </wdb:getProductBid>
  						  	</c:when>
 						  	<c:otherwise>
 						  	  <wdb:getResourcesBid resourceno="${productDeclareRecord.resourceno}" bidno="${productDeclareRecord.bidno}" var="resourceno">
		 						  	${empty resourceno.bidname ? "无" : resourceno.bidname }
		 						  </wdb:getResourcesBid>
  						  	</c:otherwise>
 						  </c:choose>
  					</span>
  				</div>
 				<!-- 投资标的  end--> 
		
				<!-- 平台编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">平台编号：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.pno }
 					</span>
  				</div>
 				<!-- 平台编号  end-->
 				
 				<!-- 平台名称 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">平台名称：</label>
 					<span class="col-md-6">
 						 <wdb:getPlatFormInfo pno="${productDeclareRecord.pno }" var="platFormInfo">
 	 						 ${platFormInfo.pname}
 						 </wdb:getPlatFormInfo>
 					</span>
  				</div>
 				<!-- 平台名称  end-->

			<!-- 平台名称 start-->
			<div class="col-md-12" style="margin-top:10px;">
				<label class="col-md-4 text-right">标的编号：</label>
				<span class="col-md-6">
					${productDeclareRecord.bidno }
 					</span>
			</div>
			<!-- 平台名称  end-->

			<!-- 申报编号  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">申报编号 ：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.declareno }
 					</span>
  				</div>
 				<!-- 申报编号   end--> 
 				
 				<!-- 上级申报编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">上级申报编号：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.uporideclareno }
 					</span>
  				</div>
 				<!-- 上级申报编号 end--> 
 				 
 				<!-- 原始申报编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">原始申报编号：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.orideclareno }
 					</span>
  				</div>
 				<!-- 原始申报编号 end--> 
  				
 				<!-- 产品编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">产品编号：</label>
 					<span class="col-md-6">
 						 ${empty productDeclareRecord.productno ? '无' : productDeclareRecord.productno}
 					</span>
  				</div>
 				<!-- 产品编号  end--> 
 				
 				<!-- 发布资源编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">发布资源编号：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.resourceno }
 					</span>
  				</div>
 				<!-- 发布资源编号  end-->

			<!-- 承接资源编号 start-->
			<div class="col-md-12" style="margin-top:10px;">
				<label class="col-md-4 text-right">承接资源编号：</label>
				<span class="col-md-6">
					${productDeclareRecord.subresourceno }
				</span>
			</div>
			<!-- 承接资源编号  end-->
 				
 				<!-- 是否原始申报  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">是否原始申报 ：</label>
 					<span class="col-md-6">
 						 <c:choose>
 						 		<c:when test="${productDeclareRecord.isoriginal == 1 }">是</c:when>
 						 		<c:when test="${productDeclareRecord.isoriginal == 0}">否</c:when>
  						 </c:choose>
 					</span>
  				</div>
 				<!-- 是否原始申报   end--> 
 				
 				<!-- 级别  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">级别：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.level}
 					</span>
  				</div>
 				<!-- 级别   end--> 
 				 
 				<!-- 申报方式  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">申报方式：</label>
 					<span class="col-md-6">
 						 <c:choose>
 						 		<c:when test="${productDeclareRecord.type == 1 }">游客申报</c:when>
 						 		<c:when test="${productDeclareRecord.type == 2}"> 会员申报</c:when>
  						 </c:choose>
 					</span>
  				</div>
 				<!-- 申报方式   end--> 
 				
 				<!-- 审核状态  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">审核状态 ：</label>
 					<span class="col-md-6">
 						<c:choose>
 						 		<c:when test="${productDeclareRecord.auditstatus == 0}">待审核</c:when>
  						 		<c:when test="${productDeclareRecord.auditstatus == 1}">合格</c:when>
 						 		<c:when test="${productDeclareRecord.auditstatus == 2}">不合格</c:when>
   						 </c:choose>
 					</span>
  				</div>
 				<!-- 审核状态  end--> 
 				
 				<!-- 清算状态  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">已清算：</label>
 					<span class="col-md-6">
 						 <wdb:getProductLiquidationRecord declareno="${productDeclareRecord.declareno}" var="declareno">
 						 	 <c:choose>
 						 	 	<c:when test="${declareno.status == 0}">待清算</c:when>
 						 	 	<c:when test="${declareno.status == 1}">已清算 </c:when>
  						 	 </c:choose>
   						 </wdb:getProductLiquidationRecord>
 					</span>
  				</div>
 				<!-- 清算状态  end--> 
 				
 				<!-- 申报审核人类型 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">申报审核人类型：</label>
 					<span class="col-md-6">
 						<c:choose>
   						 		<c:when test="${productDeclareRecord.declaretype == 1}">平台官方</c:when>
 						 		<c:when test="${productDeclareRecord.declaretype == 2}">一级资源方</c:when>
   						 </c:choose>
 					</span>
  				</div>
 				<!-- 申报审核人类型  end--> 
 				
 			    <!-- 申报审核人 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">审核人：</label>
 					<span class="col-md-6">
 						<wdb:getUser uid="${productDeclareRecord.declareaudituid }" var="declareaudituid">
 							${declareaudituid.username }-${empty declareaudituid.realname ? '无' : declareaudituid.realname}
 						</wdb:getUser>
 					</span>
  				</div>
 				<!-- 申报审核人  end-->  
 				
 				<!-- 申报人 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">审核关联人 ：</label>
 					<span class="col-md-6">
 						<wdb:getUser uid="${productDeclareRecord.declareuid }" var="declareuid">
 							${declareuid.username }-${empty declareuid.realname ? '无' : declareuid.realname}
 						</wdb:getUser>
 					</span>
  				</div>
 				<!-- 申报人   end--> 
 				
 				<!-- 申报人 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">申报人 ：</label>
 					<span class="col-md-6">
 						  <c:choose>
 						 		<c:when test="${productDeclareRecord.type == 1 }">无</c:when>
 						 		<c:when test="${productDeclareRecord.type == 2}">
 						 			<wdb:getUser uid="${productDeclareRecord.baseid }" var="baseid">
 						 				${baseid.username }-${empty baseid.realname ? '无' : baseid.realname}
 						 			</wdb:getUser>
 						 		</c:when>
  						 </c:choose>
 					</span>
  				</div>
 				<!-- 申报人   end--> 
 				
 				<!-- 申报人手机号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">申报人手机号 ：</label>
 					<span class="col-md-6">
 						  <c:choose>
 						 		<c:when test="${productDeclareRecord.type == 1 }">${productDeclareRecord.declaremobile }</c:when>
 						 		<c:when test="${productDeclareRecord.type == 2}">
 						 			无
 						 		</c:when>
  						 </c:choose>
 					</span>
  				</div>
 				<!-- 申报人手机号   end--> 
 				
 				<!-- 申报人支付宝 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">申报人支付宝 ：</label>
 					<span class="col-md-6">
 						  <c:choose>
 						 		<c:when test="${productDeclareRecord.type == 1 }">${productDeclareRecord.declarezfb }</c:when>
 						 		<c:when test="${productDeclareRecord.type == 2}">
 						 			无
 						 		</c:when>
  						 </c:choose>
 					</span>
  				</div>
 				<!-- 申报人支付宝   end--> 
 				
 				<!-- 申报人微信号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">申报人微信号 ：</label>
 					<span class="col-md-6">
 						  <c:choose>
 						 		<c:when test="${productDeclareRecord.type == 1 }">${empty productDeclareRecord.declarewx ? '无':productDeclareRecord.declarewx}</c:when>
 						 		<c:when test="${productDeclareRecord.type == 2}">
 						 			无
 						 		</c:when>
  						 </c:choose>
 					</span>
  				</div>
 				<!-- 申报人微信号   end--> 
 				
 				<!-- 投资人真实姓名 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">投资人真实姓名 ：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.investorname }
 					</span>
  				</div>
 				<!-- 投资人真实姓名  end--> 
 				
 				<!-- 投资人手机号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">投资人手机号：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.investormobile }
 					</span>
  				</div>
 				<!-- 投资人手机号  end--> 
 				
 				<!-- 投标期  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">投标期 ：</label>
 					<span class="col-md-6">
 							<c:choose>
								<c:when test="${productDeclareRecord.tendertype ==1}">${productDeclareRecord.tenderperiod}--天</c:when>
								<c:when test="${productDeclareRecord.tendertype ==2}">${productDeclareRecord.tenderperiod}--月</c:when>
								<c:when test="${productDeclareRecord.tendertype ==3}">${productDeclareRecord.tenderperiod}--年</c:when>
							</c:choose>
 					</span>
  				</div>
 				<!-- 投标期   end--> 
 				
 				<!-- 投资金额  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">投资金额  ：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.investoramount }
 					</span>
  				</div>
 				<!-- 投资金额    end--> 
 				
 				<!-- 档位 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">档位：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.gear }
 					</span>
  				</div>
 				<!-- 档位  end--> 
 				
 				<!-- 平台活动码  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">平台活动码 ：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.pactivitycode }
 					</span>
  				</div>
 				<!-- 平台活动码  end--> 
 				
 				<!-- 预约码 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">预约码：</label>
 					<span class="col-md-6">
 						 ${productDeclareRecord.preservationcode}
 					</span>
  				</div>
 				<!-- 预约码  end--> 
 				
 				<!-- 保存时间  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">保存时间 ：</label>
 					<span class="col-md-6">
 						<wdb:formatDate value="${productDeclareRecord.dateline }" var="dateline">${empty dateline ? '无':dateline}</wdb:formatDate>
 					</span>
  				</div>
 				<!-- 保存时间   end-->
 				
 				<!-- 投资时间  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">投资时间 ：</label>
 					<span class="col-md-6">
 						<wdb:formatDate value="${productDeclareRecord.investortime }" var="investortime">${empty investortime ? '无':investortime}</wdb:formatDate>
 					</span>
  				</div>
 				<!-- 投资时间   end-->
 				
 				<!-- 审核时间   start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">审核时间  ：</label>
 					<span class="col-md-6">
 						<wdb:formatYYMMDDDate value="${productDeclareRecord.audittime }" var="audittime">${empty audittime ? '无':audittime}</wdb:formatYYMMDDDate>
 					</span>
  				</div>
 				<!-- 审核时间    end-->
 				
 				<!-- 审核备注 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">审核备注：</label>
 					<span class="col-md-6">
 						 ${empty productDeclareRecord.auditremark ? '无' : productDeclareRecord.auditremark}
 					</span>
  				</div>
 				<!-- 审核备注  end--> 
 				
 				<!-- 审报备注 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">审报备注：</label>
 					<span class="col-md-6">
 						 ${empty productDeclareRecord.declareremark ? '无' : productDeclareRecord.declareremark}
 					</span>
  				</div>
 				<!-- 审报备注  end--> 
 	</div>
 </div>
</body>
</html>