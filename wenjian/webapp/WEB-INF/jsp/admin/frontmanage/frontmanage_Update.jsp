<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script type="text/javascript">
    $(function(){
        //$("#select-adsortType-text").val("${data.itemtype}");
        //项目类型   1：一级项目  2：二级项目   3：三级项目
        var itemtype = "${data.itemtype}";
        var obj=document.getElementById('one');
        var obj2=document.getElementById('two');
        var obj3=document.getElementById('three');

        if(itemtype==1){
            $("#itemTypeName").text("一级项目名");
            obj.options.length=0;
            obj.add(new Option("${data.itemNameOne}","${data.id}"));
            $("#itemUrl").val("${data.oneitemUrl}");
            document.getElementById("twoDiv").style.display="none";
            document.getElementById("threeDiv").style.display="none";
        }
        if(itemtype==2){
            $("#itemTypeName").text("二级项目名");
            obj.options.length=0;
            obj2.options.length=0;
            obj.add(new Option("${data.itemNameTwo}","${data.twoId}"));
            obj2.add(new Option("${data.itemNameOne}","${data.id}"));
            $("#itemUrl").val("${data.oneitemUrl}");
            document.getElementById("threeDiv").style.display="none";
        }
        if(itemtype==3){
            $("#itemTypeName").text("三级级项目名");
            obj.options.length=0;
            obj2.options.length=0;
            obj3.options.length=0;
            obj.add(new Option("${data.itemNameThree}","${data.threeId}"));
            obj2.add(new Option("${data.itemNameTwo}","${data.twoId}"));
            obj3.add(new Option("${data.itemNameOne}","${data.id}"));
            $("#itemUrl").val("${data.oneitemUrl}");
        }
    })
</script>
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
        select{
            text-align-last: center;
        }
    </style>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="updateFrontForm">
        <input id="id" name="id" value="${data.id}" hidden="hidden" />
        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">一级项目</label>
            <div class="col-sm-2" style="width: 15%">
                <select id="one" class="form-control" disabled="disabled"></select>
            </div>
        </div>

        <div class="form-group" id="twoDiv">
            <label  class="col-sm-2 control-label laber_from">二级项目</label>
            <div class="col-sm-2" style="width: 15%">
                <select id="two" class="form-control" disabled="disabled"></select>
            </div>
        </div>

        <div class="form-group" id="threeDiv">
            <label  class="col-sm-2 control-label laber_from">三级项目</label>
            <div class="col-sm-2" style="width: 15%">
                <select id="three" class="form-control" disabled="disabled"></select>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from"><span id="itemTypeName"></span></label>
            <div class="col-sm-2" style="width: 15%">
                <input type="text" name="itemname" class="form-control" value="${data.itemNameOne}"   id="itemname">
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">页面地址</label>
            <div class="col-sm-2" style="width: 15%">
                <input type="text" name="itemUrl" class="form-control" value=""   id="itemUrl">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-2" style="width: 16%" >
                <textarea rows="3" class="form-control" id="itemremark" name="itemremark" >${data.itemRemark}</textarea>
            </div>
        </div>
    </form>
</div>
<script>

    //修改后保存
    function update(){
        //校验项目名是否已存在
        var itemName = $("#itemname").val();
        if(itemName!=null && itemName!=''&&itemName!=undefined){
            itemName = itemName.replace(/(^\s*)|(\s*$)/g, "");
            var actions ="${basePath}/admin/frontmanage/validateItemName";
            $.ajax({
                type: "post",
                url: actions,
                data: {"itemname":itemName,"id":$("#id").val()},
                dataType: "json",
                async:true,
                success: function(data){
                    var code = data.meta.code;
                    var message = data.meta.message;
                    if(code=="88"){
                        alert("项目名已存在")
                        return false;
                    }else{
                        var action ="${pageContext.request.contextPath}/admin/frontmanage/UpdateFrontManage";
                        var jso = $("#updateFrontForm").serialize();
                        $.ajax({
                            type: "post",
                            url: action,
                            data: jso,
                            dataType: "json",
                            async:true,
                            success: function(data){
                                var msg = data.meta.message;
                                if(data.meta.code==88){
                                    alert(msg);
                                    window.location.reload();
                                }else{
                                    alert(msg)
                                }
                            },
                            error: function (data) {
                                alert("系统异常，请稍候再试或联系客服");
                            }
                        });
                    }
                },
                error: function (data) {
                    alert("系统异常，请稍候再试或联系客服");
                }
            });
        }else{
            alert("请输入项目名称")
            return false;
        }
    }
</script>
</body>
</html>