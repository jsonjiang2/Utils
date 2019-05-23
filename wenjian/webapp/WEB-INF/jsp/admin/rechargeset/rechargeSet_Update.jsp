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
                        objectname:{
                            validators:{
                                notEmpty:{
                                    message:"请输入对象名称"
                                },
                            }
                        },
                        priority:{
                            validators:{
                                notEmpty:{
                                    message:"请输入优先级"
                                },
                                regexp: {
                                    regexp: /^[1-9]([0-9]*)$/,
                                    message: '优先级不能输入0'
                                },
                            }
                        },
                    }
                });
            });
        });

        function checkNum(obj){
            //处理第一个字符是小数点的情况.
            if (obj.value != '' && obj.value.substr(0, 1) == '0') {
                obj.value = "";
            }
            //处理第一个字符是0的情况.
            if (obj.value != '' && obj.value.substr(0, 1) == '0') {
                obj.value = "";
                return;
            }
            obj.value = obj.value.replace(/[^\d]/g, "");  //清除“数字”以外的字符
            if (obj.value.indexOf(".") < 0 && obj.value != "") {//如果没有小数点，首位不能为类似于 01、02的金额
                if (obj.value.substr(0, 1) == '0' && obj.value.length == 2) {
                    obj.value = obj.value.substr(1, obj.value.length);
                }
            }
        }

        function checkSize(obj){
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/rechargeSet/checkSize",
                data: {
                    id: function () {
                        return $("#id").val();
                    },
                    size: function () {
                        return obj.value;
                    }
                },
                success: function (data) {
                    if(data.Msg != undefined){
                        alert(data.Msg);
                    }
                }
            });
        }
    </script>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="updateForm">
        <input type="hidden" name="id" id="id" value="${rechargeSet.id}"/>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">设置类型：</label>
            <div class="col-sm-3">
                <c:if test="${rechargeSet.type eq 1}">
                    <input value="通用设置" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="type" id="type" value="1" class="form-control" />
                </c:if>
                <c:if test="${rechargeSet.type eq 2}">
                    <input value="特殊设置" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="type" id="type" value="2" class="form-control"/>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">充值设置编号：</label>
            <div class="col-sm-3">
                <input type="text" disabled="disabled" name="rsno" id="rsno1" value="${rechargeSet.rsno}" class="form-control" />
                <input type="hidden" name="rsno" id="rsno" value="${rechargeSet.rsno}" class="form-control" />
                <span id="rsnoError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">对象属性：</label>
            <div class="col-sm-3">
                <c:if test="${rechargeSet.objectproperties eq 1}">
                    <input value="所有用户" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="objectproperties" id="objectproperties" value="1" class="form-control" />
                </c:if>
                <c:if test="${rechargeSet.objectproperties eq 2}">
                    <input value="用户组" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="objectproperties" id="objectproperties" value="2" class="form-control"/>
                </c:if>
                <c:if test="${rechargeSet.objectproperties eq 3}">
                    <input value="用户名" disabled="disabled" class="form-control"/>
                    <input type="hidden" name="objectproperties" id="objectproperties" value="3" class="form-control"/>
                </c:if>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">对象名称：</label>
            <div class="col-sm-3">
                <c:choose>
                    <c:when test="${rechargeSet.objectproperties eq 1}">
                        <input type="text" name="objectname" id="objectname" value="${rechargeSet.objectname}" class="form-control" disabled="disabled" />
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="objectname" id="objectname" value="${rechargeSet.objectname}" class="form-control" disabled="disabled"/>
                    </c:otherwise>
                </c:choose>
                <input type="hidden" name="objectname" id="objectname" value="${rechargeSet.objectname}" class="form-control" />
                <span id="objectnameError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">充值方式：</label>
            <div class="col-sm-3">
                <select class="form-control" id="rechargetypeT" name="rechargetype" disabled="disabled">
                    <option value="1" <c:if test="${rechargeSet.rechargetype eq 1}">selected="selected"</c:if>>二维码</option>
                    <%--<option value="2" <c:if test="${rechargeSet.rechargetype eq 2}">selected="selected"</c:if>>快捷</option>
                    <option value="3" <c:if test="${rechargeSet.rechargetype eq 3}">selected="selected"</c:if>>网银</option>--%>
                </select>
            </div>
            <c:if test="${rechargeSet.rechargetype eq 1}">
                <input type="hidden" name="rechargetype" id="rechargetype" value="1" class="form-control" />
            </c:if>
            <c:if test="${rechargeSet.rechargetype eq 2}">
                <input type="hidden" name="rechargetype" id="rechargetype" value="2" class="form-control"/>
            </c:if>
            <c:if test="${rechargeSet.rechargetype eq 3}">
                <input type="hidden" name="rechargetype" id="rechargetype" value="3" class="form-control"/>
            </c:if>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否开启：</label>
            <div class="col-sm-3">
                <c:if test="${rechargeSet.type eq 1}">
                    <select class="form-control" id="onoff" name="onoff" disabled="disabled">
                        <option value="1" <c:if test="${rechargeSet.onoff eq 1}">selected="selected"</c:if>>开</option>
                        <option value="0" <c:if test="${rechargeSet.onoff eq 0}">selected="selected"</c:if>>关</option>
                    </select>
                </c:if>
                <c:if test="${rechargeSet.type eq 2}">
                    <select class="form-control" id="onoff" name="onoff">
                        <option value="1" <c:if test="${rechargeSet.onoff eq 1}">selected="selected"</c:if>>开</option>
                        <option value="0" <c:if test="${rechargeSet.onoff eq 0}">selected="selected"</c:if>>关</option>
                    </select>
                </c:if>
            </div>
        </div>

        <c:if test="${rechargeSet.objectproperties eq 3}">
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from">优先级：</label>
                <div class="col-sm-3">
                    <input type="text" name="priority" id="priority" value="${rechargeSet.priority}" class="form-control" onkeyup="checkNum(this)" onblur="checkSize(this)" />
                    <span id="priorityError" style="color:red"></span>
                </div>
            </div>
        </c:if>

        <div class="form-group">
            <label id="remarke" class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark">${userWithdrawalsFeeSet.remark}</textarea>
            </div>
        </div>
        <div class="form-group" style="margin-left: 11%">
            <span style="color: red">注意:1.修改对象名称的时候请填写真实存在的对象名称(用户名或大小名单名称)。</span><br/>
        </div>
    </form>
</div>

</body>
</html>
