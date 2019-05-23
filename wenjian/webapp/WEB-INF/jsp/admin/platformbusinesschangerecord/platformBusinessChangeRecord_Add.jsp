<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>工商变更添加页面</title>
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
                <label class="col-sm-2 control-label laber_from" for="changetype">变更类型</label>
                <div class="col-sm-3">
                    <input type="text" name="changetype" id="changetype" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="changetime1">变更时间</label>
                <div class="col-sm-3">
                    <input type="text" class="Wdate" id="changetime1" name="changetime1" style="width: 180px;height: 30px;"
                           onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                    <span id="publicTimeError" style="color:red"></span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">变更前信息</label>
                <div class="col-sm-3">
                    <textarea rows="5" class="form-control" name="aheadinfo" id="aheadinfo"></textarea>
                    <span id="remarkError" style="color:red"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">变更后信息</label>
                <div class="col-sm-3">
                    <textarea rows="5" class="form-control" name="afterinfo" id="afterinfo"></textarea>
                </div>
            </div>

            <button id="insertButton" onclick="save()" class="btn btn-default" type="button"
                    style="margin-top: 20px;margin-left:200px;">保存
            </button>
            <button class="btn btn-default" type="button"
                    onclick="window.location.href='${pageContext.request.contextPath}/admin/platformBusinessChangeRecord/cxList';"
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
        var action ="${pageContext.request.contextPath}/admin/platformBusinessChangeRecord/save";
        $.post(action,params, function(data){
            alert(data.meta.message);
            window.location.href="${pageContext.request.contextPath}/admin/platformBusinessChangeRecord/cxList";
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