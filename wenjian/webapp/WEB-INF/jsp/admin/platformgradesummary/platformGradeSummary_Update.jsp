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
    <form class="form-horizontal" role="form" id="platformGradeSummary_updateForm">
        <c:if test="${empty platformGradeSummary}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty platformGradeSummary}">
            <input type="hidden" name="id" value="${platformGradeSummary.id}"/>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pno">平台编号</label>
                <div class="col-sm-3">
                    <input type="text" name="pno" id="pno" onblur="findPno()" value="${platformGradeSummary.pno}" class="form-control" />
                    <span id="errorPno" style="color:red;font-weight:bold;"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
                <div class="col-sm-3">
                    <input type="text" name="pname" id="pname" onblur="findPname()" value="${platformGradeSummary.pname}" class="form-control" />
                    <span id="errorPname" style="color:red;font-weight:bold;"></span>  
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pstatus">平台运营状态</label>
                <div class="col-sm-3">
                    <select name="pstatus" id="pstatus" class="form-control">
                        <option value="1" <c:if test="${platformGradeSummary.pstatus eq '1'}">selected="selected"</c:if>>正常</option>
                        <option value="2" <c:if test="${platformGradeSummary.pstatus eq '2'}">selected="selected"</c:if>>跑路</option>
                        <option value="3" <c:if test="${platformGradeSummary.pstatus eq '3'}">selected="selected"</c:if>>清盘</option>
                        <option value="4" <c:if test="${platformGradeSummary.pstatus eq '4'}">selected="selected"</c:if>>高风险</option>
                        <option value="5" <c:if test="${platformGradeSummary.pstatus eq '5'}">selected="selected"</c:if>>有争议</option>
                        <option value="6" <c:if test="${platformGradeSummary.pstatus eq '6'}">selected="selected"</c:if>>延期兑付</option>
                        <option value="7" <c:if test="${platformGradeSummary.pstatus eq '7'}">selected="selected"</c:if>>停业</option>
                        <option value="8" <c:if test="${platformGradeSummary.pstatus eq '8'}">selected="selected"</c:if>>经侦介入</option>
                        <option value="9" <c:if test="${platformGradeSummary.pstatus eq '9'}">selected="selected"</c:if>>提现困难</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="organization">评级机构</label>
                <div class="col-sm-3">
                    <select name="organization" id="organization" class="form-control">
                        <option value="1" <c:if test="${platformGradeSummary.organization eq '1'}">selected="selected"</c:if>>网贷之家</option>
                        <option value="2" <c:if test="${platformGradeSummary.organization eq '2'}">selected="selected"</c:if>>网贷天眼</option>
                        <option value="3" <c:if test="${platformGradeSummary.organization eq '3'}">selected="selected"</c:if>>网贷巴士</option>
                        <option value="4" <c:if test="${platformGradeSummary.organization eq '4'}">selected="selected"</c:if>>融360</option>
                        <option value="5" <c:if test="${platformGradeSummary.organization eq '5'}">selected="selected"</c:if>>逸飞</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="gradetime1">评级时间</label>
                <div class="col-sm-3">
                    <input type="text" class="Wdate" id="gradetime1" name="gradetime1"
                           value="${dateUtils.formatDate(platformGradeSummary.gradetime)}" style="width: 180px;height: 30px;"
                           onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                    <span id="publicTimeError" style="color:red"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="ranking">排名</label>
                <div class="col-sm-3">
                    <input type="text" name="ranking" id="ranking" value="${platformGradeSummary.ranking}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="handlers">操作人</label>
                <div class="col-sm-3">
                    <input type="text" name="handlers" id="handlers" value="${platformGradeSummary.handlers}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="remark">备注</label>
                <div class="col-sm-3">
                    <input type="text" name="remark" id="remark" value="${platformGradeSummary.remark}" class="form-control" />
                </div>
            </div>

        </c:if>
    </form>
</div>

<script>

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


</body>
</html>
