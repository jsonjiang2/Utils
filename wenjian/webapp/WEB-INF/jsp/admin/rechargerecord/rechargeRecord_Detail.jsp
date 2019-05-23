<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>充值记录详情</title>

    <style type="text/css">
        #rechargei label{
            font-weight:normal;
        }
    </style>
</head>

<body style="font-family:'微软雅黑'; ">
<div class="col-md-12" id="rechargei">
    <div class="row text-center" style="line-height: 0px;">
        <font size="5" style="font-weight:500;">充值记录详情</font>
    </div><br>
    <div class="form-group ">
        <label class="col-sm-4 text-right">用户名：</label>
        <label class="col-md-4">${entity.username}</label>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">用户姓名：</lable>
        <lable class="col-md-4">${entity.realname}</lable>
    </div><br>
    <div class="form-group" >
        <lable class="col-sm-4 text-right">充值订单号：</lable>
        <lable class="col-md-4">${entity.rechargeorderno}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">支付流水号：</lable>
        <lable class="col-md-4">${entity.qmmorderno}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">支付公司类型：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.paycompanytype==1 }">双乾</c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">充值方式：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.rechargetype==1 }">二维码</c:if>
            <%--<c:if test="${entity.rechargetype==2 }">快捷</c:if>
            <c:if test="${entity.rechargetype==3 }">网银</c:if>--%>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">支付通道：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.paymentchannels==1 }">支付宝</c:if>
            <c:if test="${entity.paymentchannels==2 }">微信</c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">充值设备：</lable>
        <lable class="col-md-4">${entity.rechargesource}</lable>
    </div><br>

    <c:if test="${entity.rechargetype==2 or entity.rechargetype==3}">
        <div class="form-group ">
            <lable class="col-sm-4 text-right">银行：</lable>
            <lable class="col-md-4">${entity.bankname}</lable>
        </div><br>
        <div class="form-group ">
            <lable class="col-sm-4 text-right">银行卡号：</lable>
            <lable class="col-md-4">${entity.cardno}</lable>
        </div><br>
        <div class="form-group ">
            <lable class="col-sm-4 text-right">卡类型：</lable>
            <lable class="col-md-4">
                <c:if test="${entity.cardtype==1 }">信用卡</c:if>
                <c:if test="${entity.cardtype==2 }">借记卡</c:if>
                <c:if test="${entity.cardtype==3 }">企业账户</c:if>
            </lable>
        </div><br>
        <div class="form-group ">
            <lable class="col-sm-4 text-right">银行数字编号：</lable>
            <lable class="col-md-4">${entity.banknum}</lable>
        </div><br>
    </c:if>

    <div class="form-group ">
        <lable class="col-sm-4 text-right">银行编码：</lable>
        <lable class="col-md-4">${entity.bankcode}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">充值设置编号：</lable>
        <lable class="col-md-4">${rechargeSet.rsno}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">手续费类型：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.feetype==1 }">定额</c:if>
            <c:if test="${entity.feetype==2 }">倍率</c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">充值比率：</lable>
        <lable class="col-md-4">
            <c:choose>
                <c:when test="${entity.feetype==1 }">
                    <fmt:formatNumber type="number" value="${entity.rechargeratio}" pattern="0.00" maxFractionDigits="2"/>元
                </c:when>
                <c:otherwise>
                    <fmt:formatNumber type="number" value="${entity.rechargeratio * 100}" pattern="0.00" maxFractionDigits="2"/>%
                </c:otherwise>
            </c:choose>

        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">充值金额：</lable>
        <lable class="col-md-4">${entity.rechargeamount}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">到账金额：</lable>
        <lable class="col-md-4">${entity.arrivalamount}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">充值手续费：</lable>
        <lable class="col-md-4">${entity.rechargefee}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">充值时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.rechargetime}" var="rechargetime">
                ${empty rechargetime ? '无' : rechargetime}
            </wdb:formatDate>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">充值状态：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.status==1 }">取消</c:if>
            <c:if test="${entity.status==2 }"><span style="color: red;">失败</span></c:if>
            <c:if test="${entity.status==3 }"><span style="color: blue;">成功</span></c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">可用金额：</lable>
        <lable class="col-md-4"><fmt:formatNumber value="${entity.avlBalance}" pattern="0.00" maxFractionDigits="2" /></lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">响应码：</lable>
        <lable class="col-md-4">${entity.respcode}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">响应信息：</lable>
        <lable class="col-md-4">${entity.respmess}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">提交数据签名：</lable>
        <lable class="col-md-8">${entity.requestsignature}</lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">返回数据签名：</lable>
        <lable class="col-md-8">${entity.responsesignature}</lable>
    </div><br><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">异步返回数据：</lable>
        <lable class="col-md-8">${entity.responsedata}</lable>
    </div><br><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">应答时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.responsetime}" var="responsetime">
                ${empty responsetime ? '无' : responsetime}
            </wdb:formatDate>
        </lable>
    </div><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">勾兑查询返回数据：</lable>
        <lable class="col-md-8">
            <c:out value="${entity.gouduirespdata}" escapeXml="true"/>
        </lable>
    </div><br><br><br><br><br><br><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">是否人工勾兑：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.isgoudui==0 }">否</c:if>
            <c:if test="${entity.isgoudui==1 }">是</c:if>
        </lable>
    </div><br><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">勾兑人：</lable>
        <lable class="col-md-4">
            <wdb:getAdminUser uid="${entity.gouduiid}" var="auid">
                ${auid.username}-${auid.fullname ? '无' : auid.fullname}
            </wdb:getAdminUser>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">勾兑时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.gouduitime}" var="gouduitime">
                ${empty gouduitime ? '无' : gouduitime}
            </wdb:formatDate>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">是否系统勾兑：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.issystemgoudui==0 }">否</c:if>
            <c:if test="${entity.issystemgoudui==1 }">是</c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">系统勾兑时间：</lable>
        <lable class="col-md-4">
            <wdb:formatDate value="${entity.gouduisyetemtime}" var="gouduisyetemtime">
                ${empty gouduisyetemtime ? '无' : gouduisyetemtime}
            </wdb:formatDate>
        </lable>
    </div><br>
    <div class="form-group ">
        <lable class="col-sm-4 text-right">勾兑状态：</lable>
        <lable class="col-md-4">
            <c:if test="${entity.gouduistatus==0 }"><span style="color: red;">未勾兑</span></c:if>
            <c:if test="${entity.gouduistatus==1 }"><span style="color: blue;">勾兑成功</span></c:if>
            <c:if test="${entity.gouduistatus==2 }"><span style="color: red;">勾兑异常</span></c:if>
            <c:if test="${entity.gouduistatus==3 }"><span style="color: red;">勾兑未返回</span></c:if>
            <c:if test="${entity.gouduistatus==4 }"><span style="color: red;">勾兑中</span></c:if>
        </lable>
    </div><br>
    <div class="form-group ">
        <label class="col-sm-4 text-right">备注：</label>
        <label class="col-md-4">${entity.remark}</label>
    </div>

</div>
</body>
</html>