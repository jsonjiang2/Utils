<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>平台维权修改页面</title>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
    <form id="platformSafeguardingRights_updateForm" class="form-horizontal" >
        <input type="hidden" name="id" value="${platformSafeguardingRights.id}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pno">平台编号</label>
            <div class="col-sm-3">
                <input type="text" name="pno" id="pno" class="form-control" value="${platformSafeguardingRights.pno}" readonly="readonly"/>
                <span id="errorPno" style="color:red;font-weight:bold;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
            <div class="col-sm-3">
                <input type="text" name="pname" id="pname" onblur="findPname()" value="${platformSafeguardingRights.pname}" class="form-control" />
                <span id="errorPname" style="color:red;font-weight:bold;"></span>  
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="status">维权状态</label>
            <div class="col-sm-3">
                <select name="status" id="status" class="form-control">
                    <option value="1" <c:if test="${platformSafeguardingRights.status eq '1'}">selected="selected"</c:if>>开启</option>
                    <option value="2" <c:if test="${platformSafeguardingRights.status eq '2'}">selected="selected"</c:if>>关闭</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="progress">维权进展</label>
            <div class="col-sm-3">
                <select name="progress" id="progress" class="form-control">
                    <option value="1" <c:if test="${platformSafeguardingRights.progress eq '1'}">selected="selected"</c:if>>未立案</option>
                    <option value="2" <c:if test="${platformSafeguardingRights.progress eq '2'}">selected="selected"</c:if>>已立案</option>
                    <option value="3" <c:if test="${platformSafeguardingRights.progress eq '3'}">selected="selected"</c:if>>已结案</option>
                    <option value="4" <c:if test="${platformSafeguardingRights.progress eq '4'}">selected="selected"</c:if>>已清退</option>
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
                <input type="text" class="Wdate" id="thunderstormtime1" name="thunderstormtime1"
                       value="${dateUtils.formatDate(platformSafeguardingRights.thunderstormtime)}" style="width: 180px;height: 30px;"
                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                <span id="publicTimeError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="lawer">维权律师</label>
            <div class="col-sm-3">
                <input type="text" name="lawer" id="lawer" value="${platformSafeguardingRights.lawer}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="days">维权天数</label>
            <div class="col-sm-3">
                <input type="text" name="days" id="days" value="${platformSafeguardingRights.days}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="number">维权人数</label>
            <div class="col-sm-3">
                <input type="text" name="number" id="number" value="${platformSafeguardingRights.number}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="tobecollected">待收统计</label>
            <div class="col-sm-3">
                <input type="text" name="tobecollected" id="tobecollected" value="${platformSafeguardingRights.tobecollected}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="qq">维权QQ群1</label>
            <div class="col-sm-3">
                <input type="text" name="qq" id="qq" value="${platformSafeguardingRights.qq}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="qq2">维权QQ群2</label>
            <div class="col-sm-3">
                <input type="text" name="qq2" id="qq2" value="${platformSafeguardingRights.qq2}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="qq3">维权QQ群3</label>
            <div class="col-sm-3">
                <input type="text" name="qq3" id="qq3" value="${platformSafeguardingRights.qq3}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="leaderusername">带头人用户名</label>
            <div class="col-sm-3">
                <input type="text" name="leaderusername" id="leaderusername" value="${platformSafeguardingRights.leaderusername}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="leader">带头人姓名</label>
            <div class="col-sm-3">
                <input type="text" name="leader" id="leader" value="${platformSafeguardingRights.leader}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="mobile">带头人手机</label>
            <div class="col-sm-3">
                <input type="text" name="mobile" id="mobile" value="${platformSafeguardingRights.mobile}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="wechat">带头人微信</label>
            <div class="col-sm-3">
                <input type="text" name="wechat" id="wechat" value="${platformSafeguardingRights.wechat}" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="notice">维权公告</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="notice" id="notice">${platformSafeguardingRights.notice}</textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark" id="remark">${platformSafeguardingRights.remark}</textarea>
                <span id="remarkError" style="color:red"></span>
            </div>
        </div>

    </form>
    <div class="col-md-3"></div>
</div>
</body>

<script type="text/javascript">

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