<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>平台评级添加页面</title>
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
            <%--<div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pname">评级编号</label>
                <div class="col-sm-3">
                    <input type="text" name="pname" id="pname" class="form-control" />
                </div>
            </div>--%>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pstatus">运营状态</label>
                <div class="col-sm-3">
                    <select name="pstatus" id="pstatus" class="form-control">
                        <option value=1>正常</option>
                        <option value=2>跑路</option>
                        <option value=3>清盘</option>
                        <option value=4>高风险</option>
                        <option value=5>有争议</option>
                        <option value=6>延期兑付</option>
                        <option value=7>停业</option>
                        <option value=8>经侦介入</option>
                        <option value=9>提现困难</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="organization">评级机构</label>
                <div class="col-sm-3">
                    <select name="organization" id="organization" class="form-control">
                        <option value="1">网贷之家</option>
                        <option value="2">网贷天眼</option>
                        <option value="3">网贷巴士</option>
                        <option value="4">融360 </option>
                        <option value="5">逸飞</option>
                    </select>
                </div>
            </div>
             <%-- 若使用时间控件，当输入时间，点击保存无反应，好像是转换问题。
            若该属性设为datetime类型，则好像可以保存
            解决:不通过bean属性自动注入值，定义一个与bean属性名不一样的id(name)参数，后台取该属性值，再设到bean
            要进行String时间字符串转为Long --%>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="gradetime1">评级时间</label>
                <div class="col-sm-3">
                    <input type="text" class="Wdate" id="gradetime1" name="gradetime1" style="width: 180px;height: 30px;"
                           onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                    <span id="publicTimeError" style="color:red"></span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="ranking">排名</label>
                <div class="col-sm-3">
                    <input type="text" name="ranking" id="ranking" class="form-control" />
                </div>
            </div>

            <%--<div class="form-group">--%>
                <%--<label class="col-sm-2 control-label laber_from" for="handlers">操作人</label>--%>
                <%--<div class="col-sm-3">--%>
                    <%--<input type="text" name="handlers" id="handlers" class="form-control" />--%>
                <%--</div>--%>
            <%--</div>--%>
            <%-- 操作时间，保存时后台生成 --%>
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
                    onclick="window.location.href='${pageContext.request.contextPath}/admin/platformGradeSummary/list';"
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
            // pno: {
            //     validators: {
            //         notEmpty: {
            //             message: "不能为空"
            //         }
            //     }
            // },
            // pname: {
            //     validators: {
            //         notEmpty: {
            //             message: "不能为空"
            //         },
            //         stringLength: {
            //             max: 30,
            //             message: "长度不能大于30"
            //         }
            //     }
            // },
            ranking: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    },
                    stringLength: {
                        max: 100,
                        message: "长度不能大于50"
                    }
                }
            },
            handlers: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    }
                }
            }
            // gradetime1: {
            //     validators: {
            //         notEmpty: {
            //             message: "不能为空"    输入了时间还是出现提示
            //         }
            //     }
            // }
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
            var action="/admin/platformGradeSummary/save";
            $.post(action,$("#inputForm").serialize(),function(data){
                alert(data.meta.message);
                window.location.href="${pageContext.request.contextPath}/admin/platformGradeSummary/list";
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