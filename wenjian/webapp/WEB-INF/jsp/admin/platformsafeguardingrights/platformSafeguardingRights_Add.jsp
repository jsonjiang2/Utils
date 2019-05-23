<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>平台维权添加页面</title>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
    <form id="inputForm" class="form-horizontal" >

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pno">平台编号</label>
            <div class="col-sm-3">
                <input type="text" name="pno" id="pno" class="form-control" readonly="readonly"/>
                <span id="errorPno" style="color:red;font-weight:bold;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
            <div class="col-sm-3">
                <input type="text" name="pname" id="pname" onblur="findPname()" class="form-control" />
                <span id="errorPname" style="color:red;font-weight:bold;"></span>  
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="status">维权状态</label>
            <div class="col-sm-3">
                <select name="status" id="status" class="form-control">
                    <option value="1">开启</option>
                    <option value="2">关闭</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="progress">维权进展</label>
            <div class="col-sm-3">
                <select name="progress" id="progress" class="form-control">
                    <option value="1">未立案</option>
                    <option value="2">已立案</option>
                    <option value="3">已结案</option>
                    <option value="4">已清退</option>
                </select>
            </div>
        </div>

        <%-- 若使用时间控件，当输入时间，点击保存无反应，好像是转换问题。
       若该属性设为datetime类型，则好像可以保存
       解决:不通过bean属性自动注入值，定义一个与bean属性名不一样的id(name)参数，后台取该属性值，再设到bean
       要进行String时间字符串转为Long --%>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="thunderstormtime1">爆雷时间</label>
            <div class="col-sm-3">
                <input type="text" class="Wdate" id="thunderstormtime1" name="thunderstormtime1" style="width: 180px;height: 30px;"
                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                <span id="publicTimeError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="lawer">维权律师</label>
            <div class="col-sm-3">
                <input type="text" name="lawer" id="lawer" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="days">维权天数</label>
            <div class="col-sm-3">
                <input type="text" name="days" id="days" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="number">维权人数</label>
            <div class="col-sm-3">
                <input type="text" name="number" id="number" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="tobecollected">待收统计</label>
            <div class="col-sm-3">
                <input type="text" name="tobecollected" id="tobecollected" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="qq">维权QQ群1</label>
            <div class="col-sm-3">
                <input type="text" name="qq" id="qq" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="qq2">维权QQ群2</label>
            <div class="col-sm-3">
                <input type="text" name="qq2" id="qq2" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="qq3">维权QQ群3</label>
            <div class="col-sm-3">
                <input type="text" name="qq3" id="qq3" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="leader">带头人姓名</label>
            <div class="col-sm-3">
                <input type="text" name="leader" id="leader" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="mobile">带头人手机</label>
            <div class="col-sm-3">
                <input type="text" name="mobile" id="mobile" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="wechat">带头人微信</label>
            <div class="col-sm-3">
                <input type="text" name="wechat" id="wechat" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="notice">维权公告</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="notice" id="notice"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark" id="remark"></textarea>
                <span id="remarkError" style="color:red"></span>
            </div>
        </div>

        <button id="insertButton" onclick="return checkForm()" class="btn btn-default" type="button"
                style="margin-top: 20px;margin-left:200px;">保存
        </button>
        <button class="btn btn-default" type="button"
                onclick="window.location.href='${pageContext.request.contextPath}/admin/platformSafeguardingRights/lists';"
                style="margin-top: 20px;margin-left:100px;">返回
        </button>
    </form>
    <div class="col-md-3"></div>
</div>
</body>

<script type="text/javascript">

    //验证
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            pname: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    },
                    stringLength: {
                        max: 10,
                        message: "长度不能大于10"
                    }
                }
            }
        }
    };

    $("#insertButton").click(function(){
        $("#inputForm").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#inputForm").data("bootstrapValidator");
        //手动触发验证
        bv.validate();
        //给表单字段定义验证规则
        if (bv.isValid()) {
            var action="/admin/platformSafeguardingRights/save";
            $.post(action,$("#inputForm").serialize(),function(data){
                alert(data.meta.message);
                window.location.href="${pageContext.request.contextPath}/admin/platformSafeguardingRights/lists";
            });

        }
    });

    // 判断编号是否存在
    function findPno() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/platformGradeSummary/findPno",
            data: {
                pno: function () {
                    return $("#pno").val();  // 获取输入的pno值，传给Controller
                }
            },
            success: function (data) {  // 处理Controller返回的结果
                document.getElementById('errorPno').innerHTML="";
                if (data == "null"){
                    document.getElementById('errorPno').innerHTML="平台编号不能为空";
                }else if(data == "notExist"){
                    document.getElementById('errorPno').innerHTML="平台编号不存在";
                    $("#insertButton").attr({"disabled":"disabled"}); // 禁用提交按钮，以防保存不存在的编号
                }else {
                    document.getElementById('errorPno').innerHTML="";
                    $("#pname").val(data);  // 如果平台编号已输入且存在，将其对应的平台名称自动显示
                    $("#insertButton").attr({"disabled":false});  // 解除禁用
                }
            }
        })
    }
    // 判断平台名称是否存在
    function findPname() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/platformGradeSummary/findPname",
            data: {
                pname: function () {
                    return $("#pname").val();
                }
            },
            success: function (data) {
                document.getElementById('errorPname').innerHTML="";
                if (data == "null"){
                    document.getElementById('errorPname').innerHTML="平台名称不能为空";
                }else if(data == "notExist"){
                    document.getElementById('errorPname').innerHTML="平台名称不存在";
                    $("#insertButton").attr({"disabled":"disabled"});
                }else{
                    document.getElementById('errorPname').innerHTML="";
                    $("#pno").val(data);  // 如果平台名称已输入且存在，将其对应的平台编号自动显示
                    $("#insertButton").attr({"disabled":false});
                }
            }
        })
    }

</script>


</html>