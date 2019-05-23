<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品详情</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
 </head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
 				<!-- 贷款平台 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">贷款平台:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.loanPlatformInfo.pname}
   					</span>
  				</div>
 				<!-- 贷款平台   end-->
 				
				<!-- 产品编号 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">产品编号:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.productno}
   					</span>
  				</div>
 				<!-- 产品编号   end--> 
 				
 				<!-- 产品开关 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">产品开关:</label>
 					<span class="col-md-6">
 						<c:choose>
 							<c:when test="${loanProductInfo.status == 1 }">开</c:when>
 							<c:otherwise>关 </c:otherwise>
  						</c:choose>
   					</span>
  				</div>
 				<!-- 产品开关   end--> 
 				
 				<!-- 产品类型 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">产品类型:</label>
 					<span class="col-md-6">
 						<c:choose>
 							<c:when test="${loanProductInfo.ptype == 1 }">现金贷</c:when>
 							<c:when test="${loanProductInfo.ptype == 2 }">银行贷 </c:when>
  						</c:choose>
   					</span>
  				</div>
 				<!-- 产品类型   end--> 
 				
 				<!-- 产品属性 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">产品属性:</label>
 					<span class="col-md-6">
 						<c:choose>
 							<c:when test="${loanProductInfo.pattribute == 1 }">信用贷</c:when>
 							<c:when test="${loanProductInfo.pattribute == 2 }">芝麻分 </c:when>
 							<c:when test="${loanProductInfo.pattribute == 3 }">微粒贷 </c:when>
 							<c:when test="${loanProductInfo.pattribute == 4 }">车贷 </c:when>
 							<c:when test="${loanProductInfo.pattribute == 5 }">房贷 </c:when>
   						</c:choose>
   					</span>
  				</div>
 				<!-- 产品属性   end--> 
 				
 				<!-- 平台特色 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">平台特色:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.feature}
   					</span>
  				</div>
 				<!-- 平台特色   end--> 
 				
 				<!-- 最低金额 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">最低金额:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.loanminamout}
   					</span>
  				</div>
 				<!-- 最低金额   end--> 
		
				<!-- 最高金额 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">最高金额:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.loanmaxamout}
   					</span>
  				</div>
 				<!-- 最高金额   end--> 
 				
 				<!-- 放款时间 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">放款时间:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.loantime}
   					</span>
  				</div>
 				<!-- 放款时间  end--> 
 				
 				<!-- 利息类型start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">利息类型:</label>
 					<span class="col-md-6">
 						<c:choose>
 							<c:when test="${loanProductInfo.interesttype == 1 }">日息</c:when>
 							<c:when test="${loanProductInfo.interesttype == 2 }">月息 </c:when>
      					</c:choose>
   					</span>
  				</div>
 				<!-- 利息类型   end--> 
 				
 				<!-- 平台利息start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">平台利息:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.loaninterest}
   					</span>
  				</div>
 				<!-- 平台利息   end--> 
 				
 				<!-- 贷款期限 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">贷款期限:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.loantimelimit}
   					</span>
  				</div>
 				<!-- 贷款期限 end--> 
 				
 				<!-- 申请条件 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">申请条件:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.appconditions}
   					</span>
  				</div>
 				<!-- 申请条件   end--> 
 				
 				<!-- 还款方式 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">还款方式:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.repaymode}
   					</span>
  				</div>
 				<!-- 还款方式  end--> 
 				
 				<!-- 逾期罚息 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">逾期罚息:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.latecharge}
   					</span>
  				</div>
 				<!-- 逾期罚息   end--> 
 				
 				<!-- 提前还款 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">提前还款:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.prepayment}
   					</span>
  				</div>
 				<!-- 提前还款   end--> 
 				
 				<!-- 操作人 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">操作人:</label>
 					<span class="col-md-6">
 						<wdb:getAdminUser uid="${loanProductInfo.updateuid}" var="updateuid">
 							${updateuid.username }
 						</wdb:getAdminUser> 
   					</span>
  				</div>
 				<!-- 操作人  end--> 
 				
 				<!-- 操作时间 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">操作时间 :</label>
 					<span class="col-md-6">
 						<wdb:formatDate value="${loanProductInfo.updatetime}" var="updatetime">
 							${updatetime }
 						</wdb:formatDate>
   					</span>
  				</div>
 				<!-- 操作时间   end--> 
 				
 				 				
 				<!-- 是否需要实名认证 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">是否实名认证:</label>
 					<span class="col-md-6">
  						<c:choose>
 							<c:when test="${loanProductInfo.isrealnameauth == 1 }">是</c:when>
 							<c:when test="${loanProductInfo.isrealnameauth == 0 }">否 </c:when>
      					</c:choose>
   					</span>
  				</div>
 				<!-- 是否需要实名认证   end--> 
 				
 				<!-- 是否需要手机认证  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">是否手机认证 :</label>
 					<span class="col-md-6">
  						<c:choose>
 							<c:when test="${loanProductInfo.isphoneauth == 1 }">是</c:when>
 							<c:when test="${loanProductInfo.isphoneauth == 0 }">否 </c:when>
      					</c:choose>
   					</span>
  				</div>
 				<!-- 是否需要手机认证    end--> 
 				
 				<!--  是否个人资料认证 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right"> 是否个人认证:</label>
 					<span class="col-md-6">
  						<c:choose>
 							<c:when test="${loanProductInfo.ispersonaldataauth == 1 }">是</c:when>
 							<c:when test="${loanProductInfo.ispersonaldataauth == 0 }">否 </c:when>
      					</c:choose>
   					</span>
  				</div>
 				<!--  是否个人资料认证   end--> 
 				
 				<!-- 是否芝麻分认证 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">是否芝麻分认证:</label>
 					<span class="col-md-6">
  						<c:choose>
 							<c:when test="${loanProductInfo.issesameauth == 1 }">是</c:when>
 							<c:when test="${loanProductInfo.issesameauth == 0 }">否 </c:when>
      					</c:choose>
   					</span>
  				</div>
 				<!-- 是否芝麻分认证   end--> 
 				
 				<!-- 是否微粒贷认证  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">是否微粒贷认证 :</label>
 					<span class="col-md-6">
  						<c:choose>
 							<c:when test="${loanProductInfo.isweilidaiauth == 1 }">是</c:when>
 							<c:when test="${loanProductInfo.isweilidaiauth == 0 }">否 </c:when>
      					</c:choose>
   					</span>
  				</div>
 				<!-- 是否微粒贷认证    end--> 
  				 
 				<!-- 排序 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">排序:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.sort}
   					</span>
  				</div>
 				<!-- 排序   end--> 
 				
 				<!-- 平台注册链接 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">平台注册链接:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.prlink}
   					</span>
  				</div>
 				<!-- 平台注册链接   end--> 
 				
 				<!-- 申请人数 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">申请人数:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.applycount}
   					</span>
  				</div>
 				<!-- 申请人数   end--> 
 				
 				<!-- 放款金额 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">放款金额:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.lendingamout}
   					</span>
  				</div>
 				<!-- 放款金额   end--> 
 				
 				<!-- 详情页最高金额  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">详情页最高金额 :</label>
 					<span class="col-md-6">
 						${ loanProductInfo.loanamout}
   					</span>
  				</div>
 				<!-- 详情页最高金额    end--> 
 				
 				<!-- 备注 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-3 text-right">备注:</label>
 					<span class="col-md-6">
 						${ loanProductInfo.remark}
   					</span>
  				</div>
 				<!-- 备注   end--> 
  	</div>
 </div>
</body>
</html>