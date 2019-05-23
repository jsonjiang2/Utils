<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<form>
    <table class="table table-hover" id="personList_table">
        <thead>
        <tr class="text-center" style="background: #ccc;">
            <td>序号</td>
            <td>提现流水号</td>
            <td>订单号（乾多多）</td>
            <td>用户名-姓名</td>
            <td>打款金额</td>
            <td>提现金额</td>
            <td>提现时间</td>
            <td>提现状态</td>
            <td>开户行</td>
            <td>银行卡号</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pagehelper.list}" var="entity" varStatus="tendsta">
            <tr class="text-center">
                <td>${tendsta.count}</td>
                <td>${entity.uworderno }</td>
                <td>${entity.qmmorderno }</td>
                <td>
                    <wdb:getUser uid="${entity.baseid}" var="user">
                        ${user.username}-${empty user.realname? "无":user.realname}
                    </wdb:getUser>
                </td>
                <td>${entity.transferamount}</td>
                <td>${entity.withdrawalsamount}</td>
                <td>
                    <c:if test="${not empty entity.withdrawalstime}">
                        ${sf.format(entity.withdrawalstime)}
                    </c:if>
                </td>
                <td>
                    <c:if test="${entity.status==1 }">待处理</c:if>
                    <c:if test="${entity.status==2 }">打款中</c:if>
                    <c:if test="${entity.status==3 }"><span style="color:red;">提现失败</span></c:if>
                    <c:if test="${entity.status==4 }"><span style="color:blue;">已打款</span></c:if>
                    <c:if test="${entity.status==5 }"><span style="color:red;">审核失败</span></c:if>
                </td>
                <td>${entity.bankname}</td>
                <td>${entity.cardno}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="c-page">
        <%@include file="/WEB-INF/jsp/common/pagehelper2.jsp"%>
    </div>
</form>
<div class="form-group ">
    <label class="col-sm-3 text-right">商户号：</label>
    <label class="col-sm-9">${entity.merno}</label>
</div><br>
<div class="form-group ">
    <label class="col-sm-3 text-right">发起时间：</label>
    <label class="col-sm-9">
        <c:if test="${not empty entity.submittime}">
            ${sf.format(entity.subtime)}
        </c:if>
    </label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">总金额(批次总金额)：</label>
    <label class="col-sm-9">
        <fmt:formatNumber type="number" value="${entity.totalamount}" pattern="0.00" maxFractionDigits="2"/>元
    </label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">笔数(上限500)：</label>
    <label class="col-sm-9">${entity.totalnum}</label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">成功笔数：</label>
    <label class="col-sm-9">${entity.successnum}</label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">失败笔数：</label>
    <label class="col-sm-9">${entity.failnum}</label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">手续费(总手续费)：</label>
    <label class="col-sm-9">
        <fmt:formatNumber type="number" value="${entity.poundage}" pattern="0.00" maxFractionDigits="2"/>
    </label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">批次号：</label>
    <label class="col-sm-9">${entity.batchno}</label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">提交数据签名：</label>
    <label class="col-sm-9">${entity.requestsignature}</label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">返回数据签名：</label>
    <label class="col-sm-9">${entity.responsesignature}</label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">状态：</label>
    <label class="col-sm-9">
        <c:if test="${entity.status==1 }">待处理</c:if>
        <c:if test="${entity.status==2 }">打款中</c:if>
        <c:if test="${entity.status==3 }"><span style="color:blue;">成功</span></c:if>
        <c:if test="${entity.status==4 }"><span style="color:red;">失败</span></c:if>
        <c:if test="${entity.status==5 }">部分成功</c:if>
    </label>
</div>
<div class="form-group ">
    <label class="col-sm-3 text-right">备注：</label>
    <label class="col-sm-9">${entity.remark}</label>
</div>