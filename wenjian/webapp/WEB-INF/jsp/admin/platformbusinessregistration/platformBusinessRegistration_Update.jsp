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
    <form class="form-horizontal" role="form" id="platformInfo_updateForm">
        <c:if test="${empty platformBusinessRegistration}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty platformBusinessRegistration}">
            <input type="hidden" name="id" value="${platformBusinessRegistration.id}"/>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
                <div class="col-sm-3">
                    <input type="text" name="pname" id="pname" value="${platformBusinessRegistration.pname}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="legalperson">法人代表</label>
                <div class="col-sm-3">
                    <input type="text" name="legalperson" id="legalperson" value="${platformBusinessRegistration.legalperson}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="regaddress">注册地址</label>
                <div class="col-sm-3">
                    <input type="text" name="regaddress" id="regaddress" value="${platformBusinessRegistration.regaddress}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="capital">注册资本</label>
                <div class="col-sm-3">
                    <input type="text" name="capital" id="capital" value="${platformBusinessRegistration.capital}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="paidcapital">实缴资本</label>
                <div class="col-sm-3">
                    <input type="text" name="paidcapital" id="paidcapital" value="${platformBusinessRegistration.paidcapital}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="companytype">公司类型</label>
                <div class="col-sm-3">
                    <input type="text" name="companytype" id="companytype" value="${platformBusinessRegistration.companytype}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="regauthority">登记机关</label>
                <div class="col-sm-3">
                    <input type="text" name="regauthority" id="regauthority" value="${platformBusinessRegistration.regauthority}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="recorddomain">备案域名</label>
                <div class="col-sm-3">
                    <input type="text" name="recorddomain" id="recorddomain" value="${platformBusinessRegistration.recorddomain}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="recordname">备案单位名称</label>
                <div class="col-sm-3">
                    <input type="text" name="recordname" id="recordname" value="${platformBusinessRegistration.recordname}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="recordtime">备案日期</label>
                <div class="col-sm-3">
                    <input type="text" name="recordtime" id="recordtime" value="${platformBusinessRegistration.recordtime}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="companyattribute">备案单位性质</label>
                <div class="col-sm-3">
                    <input type="text" name="companyattribute" id="companyattribute" value="${platformBusinessRegistration.companyattribute}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="managementstate">经营状态</label>
                <div class="col-sm-3">
                    <input type="text" name="managementstate" id="managementstate" value="${platformBusinessRegistration.managementstate}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="opentime">开业时间</label>
                <div class="col-sm-3">
                    <input type="text" name="opentime" id="opentime" value="${platformBusinessRegistration.opentime}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="businesstimelimit">营业期限(开始)</label>
                <div class="col-sm-3">
                    <input type="text" name="businesstimelimit" id="businesstimelimit" value="${platformBusinessRegistration.businesstimelimit}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="businesstimelimitend">营业期限(结束)</label>
                <div class="col-sm-3">
                    <input type="text" name="businesstimelimitend" id="businesstimelimitend" value="${platformBusinessRegistration.businesstimelimitend}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="approvaldate">核准日期</label>
                <div class="col-sm-3">
                    <input type="text" name="approvaldate" id="approvaldate" value="${platformBusinessRegistration.approvaldate}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="icpauth">ICP经营许可证</label>
                <div class="col-sm-3">
                    <input type="text" name="icpauth" id="icpauth" value="${platformBusinessRegistration.icpauth}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="icp">icp备案号</label>
                <div class="col-sm-3">
                    <input type="text" name="icp" id="icp" value="${platformBusinessRegistration.icp}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="businessnumber">工商注册号</label>
                <div class="col-sm-3">
                    <input type="text" name="businessnumber" id="businessnumber" value="${platformBusinessRegistration.businessnumber}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="socialcreditcode">统一社会信用码</label>
                <div class="col-sm-3">
                    <input type="text" name="socialcreditcode" id="socialcreditcode" value="${platformBusinessRegistration.socialcreditcode}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="organizationcode">组织机构代码</label>
                <div class="col-sm-3">
                    <input type="text" name="organizationcode" id="organizationcode" value="${platformBusinessRegistration.organizationcode}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="licensenumber">营业执照号</label>
                <div class="col-sm-3">
                    <input type="text" name="licensenumber" id="licensenumber" value="${platformBusinessRegistration.licensenumber}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="oldname">平台曾用名</label>
                <div class="col-sm-3">
                    <input type="text" name="oldname" id="oldname" value="${platformBusinessRegistration.oldname}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="operationscope">经营范围</label>
                <div class="col-sm-3">
                    <textarea rows="5" name="operationscope" id="operationscope" class="form-control">${platformBusinessRegistration.operationscope}</textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="remark">备注</label>
                <div class="col-sm-3">
                    <input type="text" name="remark" id="remark" value="${platformBusinessRegistration.remark}" class="form-control" />
                </div>
            </div>


        </c:if>
    </form>
</div>

</body>
</html>
