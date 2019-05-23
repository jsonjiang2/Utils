<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>入账审核人页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
</head>
<body>
<div class="container">
    <form id="auditForm" action="" method="post" class="form-horizontal">
        <input type="hidden" name="channo" id="hidden_channo1"/>
        <input type="hidden" name="channame" id="hidden_channame"/>
        <%--<div class="form-group">--%>
        <%--<label class="col-sm-2 control-label">审核人：</label>--%>
        <%--<div class="col-sm-3">--%>
        <%--<input type="text" name="auditman" id="auditman" value="${adminName}" class="form-control"/>--%>
        <%--<span id="auditError" style="color:red"></span>--%>
        <%--</div>--%>
        <%--</div>--%>

        <%--<div class="form-group">
            <label class="col-sm-2 control-label">审核时间：</label>
            <div class="col-sm-3">
                <input type="text" id="audittime" class="form-control" name="audittime" class="Wdate"
                       onclick="Times()">
                <span id="audittimeError" style="color:red"></span>
            </div>
        </div>--%>
        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark" id="remark"></textarea>
                <span id="remarkError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group" style="margin-left: 11%">
            <span style="color:red;font-weight:bold;">* 注意:&nbsp;&nbsp;不通过时，须备注清楚。</span><br/>
        </div>
    </form>
</div>


<script type="text/javascript">
    //验证
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            //审核人
            /*auditman: {
             validators: {
             notEmpty: {
             message: "审核人不能为空"
             },
             }
             },*/
            //审核时间
            /*audittime: {
             validators: {
             notEmpty: {
             message: "审核时间不能为空"
             },
             }
             },*/
        }
    };

    //客户端验证
    function checkFormAudit() {

        //给表单字段定义验证规则
        $("#auditForm").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#auditForm").data("bootstrapValidator");
        //手动触发验证
        bv.validate();
        if(bv.isValid()){
            return true;
        }
    }

    function Times(){
        $("#audittime").value(WdatePicker({dateFmt:"yyyy-MM-dd HH:mm:ss"}));
    }
</script>
</body>
</html>