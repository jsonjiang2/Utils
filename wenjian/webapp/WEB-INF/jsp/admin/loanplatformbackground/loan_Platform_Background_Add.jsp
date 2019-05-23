<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>平台背景新增页面</title>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
        <form id="inputForm" class="form-horizontal" >

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pid">平台ID</label>
                <div class="col-sm-3">
                    <input type="text" name="pid" id="pid" class="form-control" readonly="readonly"/>
                </div>   <%--用来显示提示信息--%>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
                <div class="col-sm-3">
                    <input type="text" name="pname" id="pname" onblur="findPname()" class="form-control" />
                    <span id="errorPname" style="color:red;font-weight:bold;"></span>  
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="background">平台背景</label>
                <div class="col-sm-3">
                    <select name="background" id="background" class="form-control">
                        <option value="1">国资控股</option>
                        <option value="2">国资参股</option>
                        <option value="3">上市控股</option>
                        <option value="4">上市参股</option>
                        <option value="5">风投系</option>
                        <option value="6">银行系</option>
                        <option value="7">民营系</option>
                        <option value="8">知名风投</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">背景说明</label>
                <div class="col-sm-3">
                    <textarea rows="12" class="form-control" name="backgrounddepict" id="backgrounddepict"></textarea>
                    <span id="remarkError" style="color:red"></span>
                </div>
            </div>s

            <button id="insertButton" onclick="save()" class="btn btn-default" type="button"
                    style="margin-top: 20px;margin-left:200px;">保存
            </button>
            <button class="btn btn-default" type="button"
                    onclick="window.location.href='${pageContext.request.contextPath}/admin/loanplatformBackground/cxList';"
                    style="margin-top: 20px;margin-left:100px;">返回
            </button>
        </form>
    <div class="col-md-3"></div>
</div>
</body>

<script type="text/javascript">

    function save(){
        var pname = $("#pname").val();
        if (isEmpty(pname)){
            alert("请输入平台名称！");
            return;
        }
        var jsonData = $("#inputForm").serialize();
        var params = decodeURIComponent(jsonData,true);
        var action ="${pageContext.request.contextPath}/admin/loanplatformBackground/save";
        $.post(action,params, function(data){
            alert(data.meta.message);
            $("#pid").val('');
            $("#pname").val('');
            $("#backgrounddepict").val('');
            window.location.href="${pageContext.request.contextPath}/admin/loanplatformBackground/cxList";
        });
    }

    // 判断平台名称是否存在
    function findPname() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/admin/loanplatformBackground/findPname",
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