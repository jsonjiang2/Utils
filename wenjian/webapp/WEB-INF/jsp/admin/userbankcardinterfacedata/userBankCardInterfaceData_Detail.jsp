<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">流水号&nbsp;:</span> 
			<span id="tenderidlb"> ${userBankCardInterfaceData.orderno} </span>
		</div>
		<hr/>
	</div>
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">用户名&nbsp;:</span> 
			<span id="tenderidlb"> ${userBankCardInterfaceData.useraccountinfoname} </span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">姓名&nbsp;:</span> 
			<span id="tenderidlb"> ${userBankCardInterfaceData.username} </span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">身份证号&nbsp;:</span> 
			<span id="tenderidlb"> ${userBankCardInterfaceData.certno} </span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">卡号&nbsp;:</span> 
			<span id="tenderidlb"> ${userBankCardInterfaceData.cardno} </span>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">预留手机号&nbsp;:</span> 
			<span id="tenderidlb"> ${userBankCardInterfaceData.bankmobile} </span>
		</div>
		<hr/>
	</div>

	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">银行编号&nbsp;:</span> 
			<c:if test="${!empty userBankCardInterfaceData.bankcode}">
				<span id="tenderidlb"> ${userBankCardInterfaceData.bankcode}</span>
			</c:if>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">银行数字编号&nbsp;:</span> 
			<c:if test="${!empty userBankCardInterfaceData.banknum}">
				<span id="tenderidlb"> ${userBankCardInterfaceData.banknum}</span>
			</c:if>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">银行&nbsp;:</span> 
			<c:if test="${!empty userBankCardInterfaceData.bankname}">
				<span id="tenderidlb"> ${userBankCardInterfaceData.bankname}</span>
			</c:if>
		</div>
		<hr/>
	</div>

	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">绑定银行卡时间&nbsp;:</span> 
			<c:if test="${!empty userBankCardInterfaceData.bindtime}">
				<span id="tenderidlb">${sf.format(userBankCardInterfaceData.bindtime)}</span>
			</c:if>
			
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">绑定状态&nbsp;:</span> 
			<c:if test="${!empty userBankCardInterfaceData.bindstatus}">
				<span style="color: red">失败</span>
			</c:if>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">响应码&nbsp;:</span> 
			<c:if test="${!empty userBankCardInterfaceData.responsecode}">
				${userBankCardInterfaceData.responsecode}
			</c:if>
		</div>
		<hr/>
	</div>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">结果&nbsp;:</span> 
			<c:if test="${!empty userBankCardInterfaceData.result}">
				<span>${userBankCardInterfaceData.result}</span>
			</c:if>
		</div>
	</div>
		<hr/>
	
	<div class="row" style="margin-top: 10px;">
		<div class="col-md-10 col-md-offset-1">
			<span class="col-sm-4 text-right">备注&nbsp;:</span> 
			<c:if test="${!empty userBankCardInterfaceData.remark}">
				<span id="tenderidlb" style="width:80%;word-break:normal;display:block;white-space:pre-wrap;overflow:hidden;"> ${userBankCardInterfaceData.remark}</span>
			</c:if>
		</div>
	</div>

</div>
