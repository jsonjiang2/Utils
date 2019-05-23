<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提现复位记录</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
</head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row clearfix">
   				<!-- 提现流水号  start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">提现流水号  ：</label>
					<div class="col-md-6">
						${userWithdrawalsResetrecord.uworderno}
					</div>
				</div>
				<!-- 提现流水号  end-->
		 
			 
				<!-- 操作人 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">操作人 ：</label>
					<div class="col-md-4">
						<c:if test="${not empty userWithdrawalsResetrecord.addid}">
							<wdb:getAdminUser uid="${userWithdrawalsResetrecord.addid}" var="auid">
								${auid.username}-${auid.fullname ? '无' : auid.fullname}
							</wdb:getAdminUser>
						</c:if>
					</div>
				</div>
				<!-- 操作人 end-->
				
				<!-- 操作时间 start-->
				<div class="col-md-12" style="margin-top:10px;">
					<label class="col-md-4 text-right">操作时间 ：</label>
					<div class="col-md-4">
						<wdb:formatDate value="${userWithdrawalsResetrecord.addtime}" var="addtime">
							${empty addtime ? '无' : addtime}
						</wdb:formatDate>
					</div>
				</div>
				<!-- 操作时间 end-->
				
  
				<!-- 备注 start -->
				<div class="col-md-12" style="margin-top:10px;"> 
 					<label class="col-md-4 text-right">备注：</label> 
 					<div class="col-md-4">
 						${userWithdrawalsResetrecord.remark} 
 					</div>
 				</div> 
				<!-- 备注 end -->
    	</div>
	</div>
</body>
</html>