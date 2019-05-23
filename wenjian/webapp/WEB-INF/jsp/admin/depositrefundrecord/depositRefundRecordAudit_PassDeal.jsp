<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>退款审核人页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <script>

    </script>
</head>
<body>
<div class="container">
    <form id="auditForm" action="" method="post" class="form-horizontal">

        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark" id="remark"></textarea>
                <span id="remarkError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group" style="margin-left: 11%">
            <span style="color:red;font-weight:bold;">* 注意:&nbsp;&nbsp;审核失败时，须备注清楚。</span><br/>
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