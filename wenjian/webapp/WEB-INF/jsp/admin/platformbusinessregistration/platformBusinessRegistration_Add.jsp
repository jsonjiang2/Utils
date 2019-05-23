<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>工商信息添加页面</title>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
        <form id="inputForm" class="form-horizontal" >

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pid">平台ID</label>
                <div class="col-sm-3">
                    <input type="text" name="pid" id="pid" class="form-control" readonly="readonly"/>
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
                <label class="col-sm-2 control-label laber_from" for="legalperson">法人代表</label>
                <div class="col-sm-3">
                    <input type="text" name="legalperson" id="legalperson" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="regaddress">注册地址</label>
                <div class="col-sm-3">
                    <input type="text" name="regaddress" id="regaddress" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="capital">注册资本</label>
                <div class="col-sm-3">
                    <input type="text" name="capital" id="capital" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="paidcapital">实缴资本</label>
                <div class="col-sm-3">
                    <input type="text" name="paidcapital" id="paidcapital" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="companytype">公司类型</label>
                <div class="col-sm-3">
                    <input type="text" name="companytype" id="companytype" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="regauthority">登记机关</label>
                <div class="col-sm-3">
                    <input type="text" name="regauthority" id="regauthority" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="recorddomain">备案域名</label>
                <div class="col-sm-3">
                    <input type="text" name="recorddomain" id="recorddomain" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="recordname">备案单位名称</label>
                <div class="col-sm-3">
                    <input type="text" name="recordname" id="recordname" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="recordtime">备案日期</label>
                <div class="col-sm-3">
                    <input type="text" name="recordtime" id="recordtime" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="companyattribute">备案单位性质</label>
                <div class="col-sm-3">
                    <input type="text" name="companyattribute" id="companyattribute" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="managementstate">经营状态</label>
                <div class="col-sm-3">
                    <input type="text" name="managementstate" id="managementstate" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="opentime">开业时间</label>
                <div class="col-sm-3">
                    <input type="text" name="opentime" id="opentime" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="businesstimelimit">营业期限(开始)</label>
                <div class="col-sm-3">
                    <input type="text" name="businesstimelimit" id="businesstimelimit" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="businesstimelimitend">营业期限(结束)</label>
                <div class="col-sm-3">
                    <input type="text" name="businesstimelimitend" id="businesstimelimitend" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="approvaldate">核准日期</label>
                <div class="col-sm-3">
                    <input type="text" name="approvaldate" id="approvaldate" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="icpauth">ICP经营许可证</label>
                <div class="col-sm-3">
                    <input type="text" name="icpauth" id="icpauth" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="icp">icp备案号</label>
                <div class="col-sm-3">
                    <input type="text" name="icp" id="icp" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="businessnumber">工商注册号</label>
                <div class="col-sm-3">
                    <input type="text" name="businessnumber" id="businessnumber" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="socialcreditcode">统一社会信用码</label>
                <div class="col-sm-3">
                    <input type="text" name="socialcreditcode" id="socialcreditcode" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="organizationcode">组织机构代码</label>
                <div class="col-sm-3">
                    <input type="text" name="organizationcode" id="organizationcode" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="licensenumber">营业执照号</label>
                <div class="col-sm-3">
                    <input type="text" name="licensenumber" id="licensenumber"  class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="oldname">平台曾用名</label>
                <div class="col-sm-3">
                    <input type="text" name="oldname" id="oldname" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="operationscope">经营范围</label>
                <div class="col-sm-3">
                    <textarea rows="6" name="operationscope" id="operationscope" class="form-control"></textarea>
                </div>
            </div>

            <button id="insertButton" onclick="save()" class="btn btn-default" type="button"
                    style="margin-top: 20px;margin-left:200px;">保存
            </button>
            <button class="btn btn-default" type="button"
                    onclick="window.location.href='${pageContext.request.contextPath}/admin/platformBusinessRegistration/cxList';"
                    style="margin-top: 20px;margin-left:100px;">返回
            </button>
        </form>
    <div class="col-md-3"></div>
</div>
</body>

<script type="text/javascript">

    function save(){
        var jsonData = $("#inputForm").serialize();
        var params = decodeURIComponent(jsonData,true);
        var action ="${pageContext.request.contextPath}/admin/platformBusinessRegistration/save";
        $.post(action,params, function(data){
            alert(data.meta.message);
            window.location.href="${pageContext.request.contextPath}/admin/platformBusinessRegistration/cxList";
        });
    }

    // 判断平台名称是否存在
    function findPname() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/platformBackground/findPname",
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
                    $("#pid").val(data);  // 如果平台名称已输入且存在，将其对应的平台编号自动显示
                    $("#insertButton").attr({"disabled":false});
                }
            }
        })
    }

</script>


</html>