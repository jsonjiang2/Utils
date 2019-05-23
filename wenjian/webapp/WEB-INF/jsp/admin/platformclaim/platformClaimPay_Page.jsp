<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <style type="text/css">
        *{margin: 0px;padding: 0px;}
        .laber_from {color: #222;font-weight: normal;}
        .route_bg{ background-color: #E7E7E7; border-radius: 4px; padding: 5px; margin-right: 5px;margin-left: 5px;margin-top: 5px; }
        .route_bg i{ color: #ccc;font-weight: 400;font-size: 12px;padding-right: 5px;line-height: 25px; }
        .route_bg a{ font-size: 12px; color: #666; text-decoration: none;line-height: 1.6;font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif !important; }
        .route_bg a:hover{ color: #888; text-decoration: none;}
        hr{
            margin: 5px;
        }
    </style>


</head>
<body  style="font-family:'微软雅黑'; ">

<script type="text/javascript">

</script>


<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form" id="payForm">
        <input type="hidden" name="id" id="id" value="${platformClaim.id}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
            <div class="col-sm-3">
                <input type="text" name="pname" id="pname" value="${platformClaim.pname}" disabled="disabled" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="payamount">打款金额</label>
            <div class="col-sm-3">
                <input type="text" name="payamount" id="payamount" value="${platformClaim.payamount}元" disabled="disabled" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="paytype">打款方式</label>
            <div class="col-sm-3">
                <select name="paytype" id="paytype" class="form-control">
                    <option value="1" >支付宝转账</option>
                    <option value="2" >微信转账</option>
                    <option value="3" >银行卡转账</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="claimdate1">打款时间</label>
            <div class="col-sm-3">
                <input type="text" class="Wdate" id="claimdate1" name="claimdate1" style="width: 180px;height: 30px;"
                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                <span id="publicTimeError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="payman">打款人</label>
            <div class="col-sm-3">
                <input type="text" name="payman" id="payman" class="form-control" />
            </div>
        </div>

    </form>
</div>

</body>
</html>
