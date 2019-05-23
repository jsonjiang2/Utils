<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>审核页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>


</head>
<body style="font-family:'微软雅黑'; ">
<div class="container" style="width: 100%;">
    <div class="row clearfix">
        <div style="margin-bottom: 10px;"></div>
        <form id="update-form" class="form-horizontal bv-form" novalidate="novalidate">
            <!-- 是否审核通过 -->
            <div class="form-group has-feedback">
                <label class="col-md-4 control-label">是否审核通过：</label>
                <div class="col-md-2">
                    <input type="hidden" name="id" value="${systemRoleAudit.id}">
                    <select name="isAudit">
                        <option value="1">通过</option>
                        <option value="2">不通过</option>
                    </select>
                </div>
            </div>
            <!-- 审核人 -->
            <div class="form-group has-feedback">
                <label class="col-md-4 control-label">审核人：</label>
                <div class="col-md-2">
                    <input class="form-control" type="text" style=" width: 200px; " name="auditMan" required>
                </div>
            </div>
            <!-- 审核备注 -->
            <div class="form-group has-feedback">
                <label class="col-md-4 control-label">审核备注：</label>
                <div class="col-md-2">
                    <textarea class="form-control" name="auditRemark"
                              style=" width: 230px; max-width: 500px;"></textarea>
                </div>
            </div>

            <!-- 巴士特殊备注 -->
            <div class="form-group has-feedback">
                <label class="col-md-4 control-label">巴士特殊备注：</label>
                <div class="col-md-2">
                    <textarea class="form-control" name="busRemark" style=" width: 230px; max-width: 500px;"></textarea>
                </div>
            </div>

        </form>


    </div>
</div>


</body>
</html>
