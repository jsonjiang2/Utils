<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>手动冻结</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>

    <script type="text/javascript">
        //添加
        function createManuslFreeze() {
            var valueXH = $("#xhSS").html();
            var valueID = $("#idSS").html();
            //序号显示
            var xhSS;
            //序号显示
            xhSS = parseFloat(valueXH)+1;

            //id显示
            var idSS;
            //id显示
            idSS = parseFloat(valueID)+1;

            $("#xhSS").html(xhSS);
            $("#idSS").html(idSS);

            var $div = $("#remark-div");
            var $inputProfit = ""
                    + "<div class='form-group manuslfreeze' id='"+idSS+"'>"
                    + "<div style='margin-left:450px;'>"
                    + "<label class='control-label xhSS' id='xh' style='padding-left:56px;'>"+xhSS+"</label>"
                    + "<label class='control-label' style='padding-left:20px;'>"
                    + "<input class='form-control' name='userName' type='text' onblur='queryUserName("+idSS+",this);' "
                    + "style='text-align:center;width:108px;line-height:18px;'>"
                    + "</label>"
                    + "<label class='control-label' style='padding-left:9px;'>"
                    + "<input class='form-control' name='realName' type='text' disabled='disabled' "
                    + "style='text-align:center;width:100px;line-height:18px;'>"
                    + "</label>"
                    + "<label class='control-label' style='padding-left:9px;'>"
                    + "<input class='form-control' name='avlBalance' type='text' disabled='disabled' "
                    + "style='text-align:center;width:100px;line-height:18px;'>"
                    + "</label>"
                    + "<label class='control-label' style='padding-left:9px;'>"
                    + "<input class='form-control' name='freezeBalance' type='text' disabled='disabled' "
                    + "style='text-align:center;width:100px;line-height:18px;'>"
                    + "</label>"
                    + "<label class='control-label' style='padding-left:9px;'>"
                    + "<input class='form-control' name='freezeAmount' type='text' onblur='judgeSize("+idSS+",this);' onkeyup='checkNum(this)' "
                    + "style='text-align:center;width:100px;line-height:18px;'>"
                    + "</label>"
                    + "<label class='control-label' style='padding-left:9px;'>"
                    + "<input class='form-control' name='remark' type='text' "
                    + "style='text-align:center;width:233px;line-height:18px;'>"
                    + "</label>"
                    + "<label class='control-label' style='padding-left:9px;'>"
                    + "<button type='button' class='btn btn-danger sc' onclick='removeContent(this,"+xhSS+")'>-</button>"
                    + "</label>"
                    + "</div>"
                    + "</div>";
            $div.append($inputProfit);
        }

        //移除
        function removeContent(obj,idz) {
            if(idz == "1"){
                alert("不能删除默认填写框");
                return false;
            }
            $(obj).parent().parent().parent().remove();

            var xhsl = $("#remark-div").children().length;
            if(xhsl == 0){
                $("#xhSS").html(1);
                return false;
            }
            for (var i = 0; i < xhsl; i++) {
                $("#remark-div").find(".manuslfreeze").eq(i).find(".xhSS").text(i+2);
                $("#xhSS").html(i+2);
            }
        }

        //通过用户名--查询用户姓名、账户可用余额和冻结余额
        function queryUserName(idz,obj) {
            //var username = $("#"+idz+" input[name='userName']").val();
            //alert(obj.value);
            var action = "${pageContext.request.contextPath}/admin/userAccountFreezeThaw/findUserName";
            var param = {"username":obj.value};
            var callback = function(data){
                if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.Msg != undefined){
                    alert(data.Msg);
                    $("#"+idz+" input[name='realName']").val("");
                    $("#"+idz+" input[name='avlBalance']").val("");
                    $("#"+idz+" input[name='freezeBalance']").val("");
                    return false;
                }
                if(data.realName != undefined){
                    $("#"+idz+" input[name='realName']").val(data.realName);
                }
                if(data.avlBalance != undefined){
                    $("#"+idz+" input[name='avlBalance']").val(data.avlBalance);
                }
                if(data.freezeBalance != undefined){
                    $("#"+idz+" input[name='freezeBalance']").val(data.freezeBalance);
                }
            }
            $.post(action,param,callback);
        }

        //判断输入的冻结金额是否小于可用余额
        function judgeSize(idz,obj){
            //输入的冻结金额
            var freezeAmount = obj.value;
            if(freezeAmount == ""){
                alert("请输入冻结金额");
                $("#rs").html("");
                $("#totalf").html("");
                return false;
            }
            //可用余额
            var avlBalance = $("#"+idz+" input[name='avlBalance']").val();
            if(avlBalance == ""){
                alert("请先获取可用余额");
                $("#rs").html("");
                $("#totalf").html("");
                return false;
            }
            if(parseFloat(freezeAmount) > avlBalance){
                alert("输入的冻结金额不能大于可用余额");
                $("#rs").html("");
                $("#totalf").html("");
                return false;
            }
            var action = "${pageContext.request.contextPath}/admin/userAccountFreezeThaw/total";
            var callback = function (data) {
                if(data.Msg != undefined){
                    alert(data.Msg);
                    return false;
                }
                if(data.RS != undefined){
                    $("#rs").html(data.RS);
                }
                if(data.totalFreezeAmount != undefined){
                    $("#totalf").html(data.totalFreezeAmount);
                }
            }
            $.post(action, $("#insertFreezeForm").serialize(), callback);
        }

        function insertFreeze() {
            //添加按钮设置为不可用
            $("#DJ").attr("disabled",true);
            var action = "${pageContext.request.contextPath}/admin/userAccountFreezeThaw/insertFreezeS";
            var callback = function (data) {
                if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.status == "0"){
                    alert(data.Msg);
                    //添加按钮设置为可用
                    $("#DJ").attr("disabled",false);
                    return false;
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    window.location.href = "${pageContext.request.contextPath}/admin/userAccountFreezeThaw/insertF";
                }
            }
            $.post(action, $("#insertFreezeForm").serialize(), callback);
        }

        //判断数字规则
        function checkNum(obj){
            //处理第一个字符是小数点的情况.
            if (obj.value != '' && obj.value.substr(0, 1) == '.') {
                obj.value = "";
            }
            //处理第一个字符是0的情况.
            if (obj.value != '' && obj.value.substr(0, 1) == '0') {
                obj.value = "";
                return;
            }
            obj.value = obj.value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符
            obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
            obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");//禁止输入33.3.3.3
            obj.value = obj.value.replace(/^(\-)*(\d+)\d*\.(\d\d).*$/, '$1$2.$3');//只能输入两位小数
            if (obj.value.indexOf(".") < 0 && obj.value != "") {//如果没有小数点，首位不能为类似于 01、02的金额
                if (obj.value.substr(0, 1) == '0' && obj.value.length == 2) {
                    obj.value = obj.value.substr(1, obj.value.length);
                }
            }
        }
    </script>

</head>
<body>
<div class="container" style="width: 100%;">
    <span id="xhSS" style="display:none;">1</span>
    <span id="idSS" style="display:none;">1</span>
    <div class="row clearfix">
        <div style="margin-bottom: 10px;"></div>
        <form id="insertFreezeForm" class="form-horizontal">
            <div class="row" style="line-height: 0px;">
                <div class="col-md-4 col-md-offset-3" style="text-align:center;padding-top:23px;font-size:23px;">
                    <font color="red"><b>手动冻结</b></font>
                </div>
            </div>
            <hr>

            <div id="manusl_freeze_insert_top1_div">
                <button class="btn btn-default" type="button" id="add" onclick="createManuslFreeze()"
                        style="margin-left: 1100px;margin-bottom: 5px;">新增手动冻结
                </button>
            </div>

            <div id="manusl_freeze_Insert_top_div">
                <div style="font-size:15px;margin-left:450px;margin-top: 12px;">
                    <label class="control-label" style="padding-left: 33px;">编号</label>
                    <label class="control-label" style="padding-left: 33px;">用户名</label>
                    <label class="control-label" style="padding-left: 55px;">真实姓名</label>
                    <label class="control-label" style="padding-left: 45px;">可用余额</label>
                    <label class="control-label" style="padding-left: 45px;">冻结余额</label>
                    <label class="control-label" style="padding-left: 45px;">冻结金额</label>
                    <label class="control-label" style="padding-left: 100px;">冻结备注</label>
                    <label class="control-label" style="padding-left: 108px;">删除</label>
                </div>
            </div>

            <div id="manusl_freeze_Insert_div">
                <div class="form-group manuslfreeze" id="1">
                    <div style="margin-left:450px;">
                        <label class="control-label" style="padding-left:56px;">1</label>
                        <label class="control-label" style="padding-left: 17px;">
                            <input class="form-control" name="userName" type="text" onblur="queryUserName(1,this);"
                                   style="text-align: center; width: 108px; line-height: 18px;">
                        </label>
                        <label class="control-label" style="padding-left: 5px;">
                            <input class="form-control" name="realName" type="text" disabled="disabled"
                                   style="text-align: center; width: 100px; line-height: 18px;">
                        </label>
                        <label class="control-label" style="padding-left: 5px;">
                            <input class="form-control" name="avlBalance" type="text" disabled="disabled"
                                   style="text-align: center; width: 100px; line-height: 18px;">
                        </label>
                        <label class="control-label" style="padding-left: 5px;">
                            <input class="form-control" name="freezeBalance" type="text" disabled="disabled"
                                   style="text-align: center; width: 100px; line-height: 18px;">
                        </label>
                        <label class="control-label" style="padding-left: 5px;">
                            <input class="form-control" id="freezeAmount1" name="freezeAmount" type="text" onblur="judgeSize(1,this);" onkeyup="checkNum(this)"
                                   style="text-align: center; width: 100px; line-height: 18px;">
                        </label>
                        <label class="control-label" style="padding-left: 5px;">
                            <input class="form-control" name="remark" type="text"
                                   style="text-align: center; width: 233px; line-height: 18px;">
                        </label>
                        <label class="control-label" style="padding-left: 5px;">
                            <button type='button' class='btn btn-danger' onclick='removeContent(this,1)'>-</button>
                        </label>
                    </div>
                </div>

                <div id="remark-div"></div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-2" style="margin-top:13px;font-size: 15px;">
                    <label>人数：<span id="rs" style="color:#ff8200"></span></label>
                    <label>，冻结总额：<span id="totalf" style="color:#ff8200"></span></label>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-2">
                    <button id="DJ" class="btn btn-default" type="button" style="margin-left:-68px;"
                            onclick="insertFreeze()">确认冻结</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
