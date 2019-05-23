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
    <script type="text/javascript">
        //修改数据校验
        $(function(){
            $("#Modal").on("shown.bs.modal",function(){
                $("#updateForm").bootstrapValidator({
                    icon: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields:{
                        username:{
                            validators:{
                                notEmpty:{
                                    message:"请输入用户名"
                                },
                            }
                        },
                        lowamount:{
                            validators:{
                                notEmpty:{
                                    message:"请输入最低打赏额"
                                },
                            }
                        },
                        highamount:{
                            validators:{
                                notEmpty:{
                                    message:"请输入最高打赏额"
                                },
                            }
                        },
                        onoff:{
                            validators:{
                                notEmpty:{
                                    message:"请选择是否开启"
                                },
                            }
                        },
                    }
                });
            });
        });

        function findUserName(){
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/rewardSet/findByName",
                data: {
                    username: function () {
                        return $("#usernameT").val();
                    }
                },
                success: function (data) {
                    document.getElementById('errorUserName').innerHTML="";
                    if (data == "false"){
                        document.getElementById('errorUserName').innerHTML="用户名不存在";
                    }else if(data == "true"){
                        document.getElementById('errorUserName').innerHTML="";
                    }else if(data == "1"){
                        document.getElementById('errorUserName').innerHTML="用户名不能为空";
                    }
                }
            });
        }

        function checkNum(obj){
            //处理第一个字符是小数点的情况.
            if (obj.value != '' && obj.value.substr(0, 1) == '.') {
                obj.value = "";
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
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="updateForm">
        <input type="hidden" name="id" id="id" value="${rewardSet.id}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">设置类型：</label>
            <div class="col-sm-3">
                <c:if test="${rewardSet.type eq 1}">
                    <input value="通用设置" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="type" id="type" value="1" class="form-control" />
                </c:if>
                <c:if test="${rewardSet.type eq 2}">
                    <input value="特殊设置" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="type" id="type" value="2" class="form-control"/>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">用户名：</label>
            <div class="col-sm-3">
                <c:if test="${rewardSet.type eq 1}">
                    <input type="text" name="username" id="username" value="${rewardSet.username}" class="form-control" disabled="disabled"/>
                </c:if>
                <c:if test="${rewardSet.type eq 2}">
                    <input type="text" name="username" id="usernameT" value="${rewardSet.username}" class="form-control" onblur="findUserName();"/>
                </c:if>
                <span id="errorUserName" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">最低打赏额(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="lowamount" id="lowamount" onkeyup="checkNum(this)" class="form-control" value="${rewardSet.lowamount}"/>
                <span id="errorlowamount" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">最高打赏额(元)：</label>
            <div class="col-sm-3">
                <input type="text" name="highamount" id="highamount" onkeyup="checkNum(this)" class="form-control" value="${rewardSet.highamount}"/>
                <span id="errorhighamount" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否开启：</label>
            <div class="col-sm-3">
                <c:if test="${rewardSet.type eq 1}">
                    <select class="form-control" id="onoff" name="onoff" disabled="disabled">
                        <option value="1" <c:if test="${rewardSet.onoff eq 1}">selected="selected"</c:if>>开</option>
                        <option value="0" <c:if test="${rewardSet.onoff eq 0}">selected="selected"</c:if>>关</option>
                    </select>
                </c:if>
                <c:if test="${rewardSet.type eq 2}">
                    <select class="form-control" id="onoff" name="onoff">
                        <option value="1" <c:if test="${rewardSet.onoff eq 1}">selected="selected"</c:if>>开</option>
                        <option value="0" <c:if test="${rewardSet.onoff eq 0}">selected="selected"</c:if>>关</option>
                    </select>
                </c:if>
                <span id="erroronOff" style="color:red;font-weight:bold;"></span>
            </div>
        </div>

        <div class="form-group">
            <label id="remarke" class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark">${rewardSet.remark}</textarea>
            </div>
        </div>
        <div class="form-group" style="margin-left: 11%">
            <span style="color: red">注意:1.修改用户名的时候请填写真实存在的用户。</span><br/>
            <span style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.修改用户名的时候请确保打赏设置表中没有相同用户名的设置。</span>
        </div>
    </form>
</div>

</body>
</html>
