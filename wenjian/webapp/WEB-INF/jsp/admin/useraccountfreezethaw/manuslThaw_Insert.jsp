<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>手动解冻</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>

    <script type="text/javascript">
        //查询
        function findBy() {
            //添加按钮设置为不可用
            $("#selectaa").attr("disabled",true);
            var ftorderno = $("#ftordernoInput").val();
            if(ftorderno == ""){
                alert("请输入冻结流水号");
                $("#selectaa").attr("disabled",false);
                return false;
            }
            var action = "${pageContext.request.contextPath}/admin/userAccountFreezeThaw/selectByFtorderno";
            var callback = function (data) {
                if (data.Msg != undefined) {
                    alert(data.Msg);
                    $("#selectaa").attr("disabled",false);
                    return false;
                }
                $("#manusl_thaw_select").show();
                $("#baseid").text(data.preCommonMember.username+"---"+data.preCommonMember.realname);
                //$("#baseid").text(data.entity.baseid);
                $("#ftorderno").text(data.entity.ftorderno);
                $("#ftordernoY").text(data.entity.ftorderno);
                if(data.entity.orderno == null){
                    $("#orderno").text("无");
                }
                if(data.entity.orderno != ""){
                    $("#orderno").text(data.entity.orderno);
                }
                $("#amount").text(data.entity.amount);
                if(data.entity.type == 1){
                    $("#type").text("提现");
                }
                if(data.entity.type == 2){
                    $("#type").text("差错");
                }
                if(data.entity.type == 3){
                    $("#type").text("产品预约");
                }
                if(data.entity.type == 4){
                    $("#type").text("手动冻结");
                }
                $("#description").text(data.entity.description);
                $("#balance").text(data.entity.balance);
                $("#freebalance").text(data.entity.freebalance);
                $("#totalbalance").text(data.entity.totalbalance);
                if(data.entity.status == 1){
                    $("#status").text("冻结");
                }
                if(data.entity.status == 2){
                    $("#status").text("解冻");
                }
                $("#freezetime").text(data.entity.sdthawtime);
                $("#freezeman").text(data.entity.adminUser+"---"+data.entity.adminName);
                $("#remark").text(data.entity.remark);

                $("#selectaa").attr("disabled",false);
            }
            $.post(action, $("#insertThawForm").serialize(), callback);
        }

        //解冻
        function insertThaw() {
            $("#JD").attr("disabled",true);
            var ftorderno = $("#ftordernoInput").val();
            var remarkInput = $("#remarkInput").val();
            var action = "${pageContext.request.contextPath}/admin/userAccountFreezeThaw/insetThawSd";
            var param = {"ftorderno":ftorderno,"remarkInput":remarkInput};
            var callback = function (data) {
                if(data.Msg == "sessionOut"){
                    window.location.href = "${pageContext.request.contextPath}/";
                }
                if(data.status == "0"){
                    alert(data.Msg);
                    $("#JD").attr("disabled",false);
                    return false;
                }
                if(data.status == "1"){
                    alert(data.Msg);
                    window.location.href = "${pageContext.request.contextPath}/admin/userAccountFreezeThaw/insertTh";
                }
            }
            $.post(action, param, callback);
        }
    </script>

</head>
<body>
<div class="container" style="width: 100%;">
    <div class="row clearfix">
        <div style="margin-bottom: 10px;"></div>
        <form id="insertThawForm" class="form-horizontal">
            <div class="row" style="line-height: 0px;">
                <div class="col-md-4 col-md-offset-3" style="text-align:center;padding-top:23px;font-size:17px;">
                    <font color="red"><b>手动解冻</b></font>
                </div>
            </div>
            <hr>

            <div id="manusl_thaw_top_div">
                <div style="font-size:15px;margin-left:450px;margin-top: 12px;">
                    <label class="control-label" style="padding-left: 33px;">冻结流水号：</label>
                    <label class="control-label" style="padding-left: 12px;">
                        <input class="form-control" id="ftordernoInput" name="ftordernoInput" type="text"
                               style="text-align: center; width: 270px; line-height: 18px;">
                    </label>
                    <label class="control-label" style="padding-left: 12px;">
                        <button class="btn btn-default" type="button" id="selectaa" onclick="findBy()"
                                style="margin-bottom: 5px;">查询
                        </button>
                    </label>
                </div>
            </div>

            <div id="manusl_thaw_select" style="display:none;margin-top:23px;font-size: 12px;">
                <div id="remark-div">
                    <label class="col-sm-5 text-right">用户名-姓名：</label>
                    <label class="col-sm-7" id="baseid"></label>

                    <label class="col-sm-5 text-right">冻结解冻流水号：</label>
                    <label class="col-sm-7" id="ftorderno"></label>

                    <label class="col-sm-5 text-right">关联流水号：</label>
                    <label class="col-sm-7" id="orderno"></label>

                    <label class="col-sm-5 text-right">冻结金额(元)：</label>
                    <label class="col-sm-7" id="amount"></label>

                    <label class="col-sm-5 text-right">业务类型：</label>
                    <label class="col-sm-7" id="type"></label>

                    <label class="col-sm-5 text-right">资金来源（用途）：</label>
                    <label class="col-sm-7" id="description"></label>

                    <label class="col-sm-5 text-right">用户可用余额(元)：</label>
                    <label class="col-sm-7" id="balance"></label>

                    <label class="col-sm-5 text-right">用户冻结余额(元)：</label>
                    <label class="col-sm-7" id="freebalance"></label>

                    <label class="col-sm-5 text-right">用户总金额(元)：</label>
                    <label class="col-sm-7" id="totalbalance"></label>

                    <label class="col-sm-5 text-right">状态：</label>
                    <label class="col-sm-7" id="status" style="color:red;"></label>

                    <label class="col-sm-5 text-right">操作时间：</label>
                    <label class="col-sm-7" id="freezetime"></label>

                    <label class="col-sm-5 text-right">操作人：</label>
                    <label class="col-sm-7" id="freezeman"></label>

                    <label class="col-sm-5 text-right">备注：</label>
                    <label class="col-sm-7" id="remark"></label>
                </div>
            </div>
            <div>
                <label class="control-label" style="padding-left: 33px;"></label>
                <label class="control-label" style="padding-left: 12px;"></label>
            </div>

            <div id="manusl_thaw_top_diva">
                <div style="font-size:15px;margin-left:450px;margin-top: 8px;">
                    <label class="control-label" style="padding-left: 33px;">解冻备注：</label>
                    <label class="control-label" style="padding-left: 12px;">
                        <input class="form-control" id="remarkInput" name="remarkInput" type="text"
                               style="text-align: center; width: 330px; line-height: 18px;">
                    </label>
                </div>
            </div>

            <div class="manusl_thaw_select2">
                <div style="font-size:15px;margin-left:500px;margin-top:17px;">
                    <label class="control-label" style="padding-left:350px;">
                        <button id="JD" class="btn btn-primary" type="button"
                                onclick="insertThaw()">确认解冻
                        </button>
                    </label>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
