<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>--%>
<!DOCTYPE HTML>
<html>
<head><%--
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
    </style>--%>
</head>
<body  style="font-family:'微软雅黑'; ">
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<div class="container"  style="margin-top: 25px;margin-left:-10px;" >
    <form class="form-horizontal" role="form"  id="insertNewAdForm">
        <div class="form-group">
            <input type="text" id="aid" name="aid" value="" style="display: none" />
            <label  class="col-sm-2 control-label laber_from">设置属性：</label>
            <div class="col-sm-3">
                <select id="select-adsortType-text" name="adsort" class="form-control" onchange="adsortFunction()">
                    <option value="">--请选择--</option>
                   <%-- <option value="0">通用广告</option>--%>
                    <option value="1">特殊广告</option>
                </select>
            </div>
        </div>

       <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">广告位：</label>
            <div class="col-sm-3">
                <input type="text" name="uid" id="uid" style="display: none" value="">
                <input type="text" name="adUserNameParam" class="form-control" value=""  id="adUserNameParam" onchange="validateUserName(this)"/>
            </div>
        </div>

        <div class="form-group" id="addDiv" style="display: none">
            <label  class="col-sm-2 control-label laber_from">添加主题链接：</label>
            <div class="col-sm-3">
                <input type="text"  name="postAddress" class="form-control"  id="postAddress" />
                <input type="text"  name="postAddressId" style="display: none;" class="form-control"  id="postAddressId" />
            </div>
            <input type="button" style="margin-top: 5px" onclick="addPostAddress()" value="添加">
        </div>

        <input type="text" value="0" id="divId" style="display: none" />
        <%--主题帖子--%>
        <div  class="form-group" id="divParent" style="margin-top: -20px">

            <%--<div id="div1">

            </div>--%>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">按天销售：</label>
            <div class="col-sm-3">
                <select id="select-addaystatus-text" name="addaystatus" class="form-control">
                    <option value="0">关闭</option>
                    <option value="1">开启</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">价格：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="addayprice" value="0.00"/>
            </div>
            <p style="margin-top: 5px" >元/天</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">最底起购：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adday" value="0"/>
            </div>
            <p style="margin-top: 5px" >天</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">按周销售：</label>
            <div class="col-sm-3">
                <select id="select-adweekstatus-text" name="adweekstatus" class="form-control">
                    <option value="0">关闭</option>
                    <option value="1">开启</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">价格：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adweekprice" value="0.00"/>
            </div>
            <p style="margin-top: 5px" >元/周</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">最底起购：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adweek" value="0" />
            </div>
            <p style="margin-top: 5px" >周</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">按年销售：</label>
            <div class="col-sm-3">
                <select id="select-adyearstatus-text" name="adyearstatus" class="form-control">
                    <option value="0">关闭</option>
                    <option value="1">开启</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">价格：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adyearprice" value="0.00"/>
            </div>
            <p style="margin-top: 5px" >元/年</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">最底起购：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adyear" value="0"/>
            </div>
            <p style="margin-top: 5px" >年</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">巴士分润：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="busincome" value="0"/>
            </div>
            <p style="margin-top: 5px" >%</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">广告锁定：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adlock" value="0"/>
            </div>
            <p style="margin-top: 5px" >倍</p>
        </div>


        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark"></textarea>
            </div>
        </div>
    </form>
</div>
<script>

    //验证
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            adsort: {
                validators: {
                    notEmpty: {
                        message: "必须选择属性"
                    }
                }
            },
            adUserNameParam: {
                validators: {
                    notEmpty: {
                        message: "广告位不能为空"
                    }
                }
            }
        }
    };
    //客户端验证并提交
    function insert(){
        $("#insertNewAdForm").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#insertNewAdForm").data("bootstrapValidator");
        //手动触发验证
        var vali = bv.validate();
        //给表单字段定义验证规则
        if (bv.isValid()) {
            var name = document.getElementById("adUserNameParam").value;
            if(name==""){
               alert("需要指定有效的广告位!")
            }else{
                var json = $("#insertNewAdForm").serialize();
                var action ="${pageContext.request.contextPath}/admin/adSlotSettings/CreateOrUpdateAdSetting";
                $.post(action, json, function (data) {
                    if (data.meta.code == 88) {
                        alert(data.meta.message)
                        window.location.reload();
                    } else {
                        alert(data.meta.message)
                    }
                })
            }
        }else{
            alert("表单参数不正确!")
        }
    };
    //删除广告位关联主题
    function deleteAdPost(postId){
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }else{
            $("#divParent").children("#"+postId).remove();
        }
    }
    //特殊广告位关联主题
    function addPostAddress() {
        var post = document.getElementById("postAddress").value;
        post.replace(/(^\s*)|(\s*$)/g, "");
        if(post =="" || post ==null){
            alert("请输入正确的主题链接!");
        }else{
            //检测主题是否存在
            var action ="${pageContext.request.contextPath}/admin/adSlotSettings/validateTheme";
            $.ajaxSettings.async = false;
            $.post(action, {"theme":post}, function (data) {
                if (data.meta.code == 88) {
                    var postAddressId = document.getElementById("postAddressId").value;
                    if(postAddressId==""){
                        $("#postAddressId").val(postAddressId+data.meta.message);
                    }else{
                        $("#postAddressId").val(postAddressId+","+data.meta.message);
                    }
                    var idNum = document.getElementById("divId").value;
                    var divId = parseInt(idNum)+parseInt(1);
                    var divIdParam="'divs"+divId+"'";
                    var divs = document.getElementById("divParent");
                    var p = document.createElement("div");//创建p节点
                    p.id="divs"+divId;
                    p.innerHTML = '</br><div id="div'+ divId + '" style="float: left;width: 100%;margin-bottom: 10px">\n' +
                        '                <label  class="col-sm-2 control-label laber_from" >' +
                        divId +
                        '</label>\n' +
                        '                <div class="col-sm-3">\n' +
                        '                    <input type="text"  name="adPostAddress" class="form-control" value='+post+'  id="adPostAddress" disabled="disabled"/>\n' +
                        '                </div>\n' +
                        '                <input type="button" style="margin-top: 5px" onclick="deleteAdPost('+divIdParam+')" value="删除">\n' +
                        '            </div>';//p节点显示的文字
                    divs.appendChild(p);//往div中添加p节点
                    document.getElementById("divId").value=divId;
                    $("#postAddress").val("");
                } else {
                    alert(data.meta.message)
                    $("#postAddress").val("");
                }
            })
        }
    }
    //选择属性，清空广告位
    function adsortFunction() {
        $("#adUserNameParam").val("");
        var sel = document.getElementById("select-adsortType-text").value;
        if (sel == 1) {
            document.getElementById("addDiv").style.display = 'block';
        } else {
            document.getElementById("addDiv").style.display = 'none';
        }
    }
    //校验用户名是否存在
    function validateUserName(username){
        var username = document.getElementById("adUserNameParam").value;
        var aid = document.getElementById("aid").value;
        var sort = document.getElementById("select-adsortType-text").value;
        var action ="${pageContext.request.contextPath}/admin/adSlotSettings/validateUserName";
        if(sort==""||sort==null){
            alert("请选择属性!")
            $("#adUserNameParam").val("");
        }else {
            $.post(action, {"username": username, "sort": sort, "aid": aid}, function (data) {
                if (data.meta.code == 88) {
                    $("#uid").val(data.meta.message);
                } else {
                    alert(data.meta.message)
                    $("#adUserNameParam").val("");
                }
            })
        }
    }
    //修改后保存
    /*function update(){
        var json = $("#insertNewAdForm").serialize();
        var action ="${pageContext.request.contextPath}/admin/adSlotSettings/UpdateAdSlotSettingTheme";
        $.post(action, json, function(data){
            if(data.meta.code=="88"){
                alert(data.meta.message);
                window.location.reload(true);
            }else{
                alert(data.meta.message);
            }
        });
    }*/
</script>
</body>
</html>