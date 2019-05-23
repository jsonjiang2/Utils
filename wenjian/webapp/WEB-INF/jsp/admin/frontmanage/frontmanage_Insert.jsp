<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
</head>
<style>
    select {
        text-align: center;
        text-align-last: center;
    }
</style>
<body  style="font-family:'微软雅黑'; ">
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<div class="container"  style="margin-top: 25px;margin-left:-10px;" >
    <form class="form-horizontal" role="form"  id="insertFrontMessage">
        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">添加类型</label>
            <div class="col-sm-2" style="width: 15%">
                <select id="itemtype" name="itemtype" class="form-control" onclick="selectItemType()">
                    <option value="1" selected="selected">一级项目</option>
                    <option value="2">二级项目</option>
                    <option value="3">三级项目</option>
                </select>
            </div>
        </div>

        <div id="selectOneDiv" style="display: none">
            <div class="form-group">
                <label  class="col-sm-2 control-label laber_from">选择一级项目</label>
                <div class="col-sm-2" style="width: 15%">
                    <select id="firstType" name="firstType" class="form-control" onchange="selectItemChang()">

                    </select>
                </div>
            </div>
        </div>

        <div id="selectTwoDiv" style="display: none">
            <div class="form-group">
                <label  class="col-sm-2 control-label laber_from">选择二级项目</label>
                <div class="col-sm-2" style="width: 15%">
                    <select id="twoType" name="twoType" class="form-control">
                        <option value="0" selected="selected">请选择</option>
                    </select>
                </div>
            </div>
        </div>

       <div class="form-group">
           <label  class="col-sm-2 control-label laber_from"><span id="itemTypeName">一级项目名</span></label>
            <div class="col-sm-2" style="width: 15%">
                <input type="text" name="itemname" class="form-control" value=""   id="itemname">
            </div>
           <div class="col-sm-1">
               <%--<input  id="itemNameList" value="${itemNameList}"/>--%>
               <input hidden="hidden" id="itemNameList" name="itemNameList" value=""/>
               <input hidden="hidden" id="itemUrlList" name="itemUrlList" value=""/>
               <input hidden="hidden" id="itemUrlCount" value="0"/>
               <input hidden="hidden" id="itemCount" value="0" />
               <input hidden="hidden" id="itemUrlDivCount" value="0" />
               <input hidden="hidden" id="pid" name="pid"/>
               <input type="button" class="btn btn-default" id="addId" onclick="addItemName()" value="添加">
           </div>
       </div>

        <div class="form-group">
            <div id="addDiv">
                <%--<c:forEach items="${data}" var="theme" begin="0" end="${itemSize}" varStatus="i">
                    <div id="div${i.count}" style="padding-bottom: 10px;padding-top: -10px">
                        <label  class="col-sm-2 control-label laber_from" style="width: 15%;"></label>
                        <label  class="col-sm-2 control-label laber_from" style="width:16%;text-align: center">${theme.itemname}</label>
                        <input type="button" class="btn btn-default" onclick="deleteFrontItem('div${i.count}','${theme.itemname}')" value="删除">
                    </div>
                </c:forEach>--%>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-2" style="width: 16%" >
                <textarea rows="3" class="form-control" id="itemremark" name="itemremark"></textarea>
            </div>
        </div>

    </form>
</div>

<script>
    function selectItemChang(){
        var itemType = $("#itemtype").val();
        if(itemType!=null&&itemType!=""&&itemType!=undefined){
            if(itemType==3){
                var itemType2 = $("#firstType").val();
                var itemSelectNum = "twoType";
                getItemListByPid(itemType2,itemSelectNum);
            }
        }
    }

    function getItemListByPid(id,itemSelectNum){
        var actions ="${basePath}/admin/frontmanage/getItemListByPid";
        $.ajax({
            type: "post",
            url: actions,
            data: {"parentid":id},
            dataType: "json",
            async:true,
            success: function(data){
                var code = data.meta.code;
                if(code=="88"){
                    var items = data.data;
                    var obj=document.getElementById(itemSelectNum);
                    obj.options.length=0;
                    obj.add(new Option("--请选择--",""));
                    jQuery.each(items, function(i,item){
                        var id = item.id;
                        var name = item.itemname;
                        obj.add(new Option(name,id));
                    });
                }else{
                    var obj=document.getElementById(itemSelectNum);
                    obj.options.length=0;
                    obj.add(new Option("--请选择--",""));
                }
            },
            error: function (data) {
                alert("系统异常，请稍候再试或联系客服");
            }
        });
    }

    function deleteFrontItem(data,data1) {
        $("#itemCount").val(parseInt($("#itemCount").val())-1);
        $("#itemUrlCount").val(parseInt($("#itemUrlCount").val())-1);

        var nameList = $("#itemNameList").val();
        var nameList2="";
        if(nameList!=null&&nameList!=""&&nameList!=undefined){
            if(nameList.indexOf(",")>-1){
                var nameArray = nameList.split(",");
                var nL = 0;
                for(var i=0;i<nameArray.length;i++){
                    var name = nameArray[i];
                    if(i==0){
                        if (name != data1) {
                            nameList2 = name;
                        }
                    }else{
                        if (name != data1) {
                            if(nameList2!=null&&nameList2!=""&&nameList2!=undefined){
                                nameList2 = nameList2+","+name;
                            }else{
                                nameList2 = name;
                            }
                        }
                    }
                }
                $("#itemNameList").val(nameList2);
            }else{
                $("#itemNameList").val("");
            }
        }
        var nam = document.getElementById("div"+data);//name是div的Id
        var ts = document.getElementById("tsdiv"+data);//name是div的Id
        document.getElementById("addDiv").removeChild(nam);
        document.getElementById("addDiv").removeChild(ts);
    }

    function selectItemByType(itemtype){
        var actions ="${basePath}/admin/frontmanage/getOneItemList";
        var selectd = "";
        if(itemtype!=null&&itemtype!=""&&itemtype!=undefined){
            if(itemtype==1){
                selectd = "firstType";
            }else{
                alert("参数异常，请刷新重试")
                return false;
            }
        }
        $.ajax({
            type: "post",
            url: actions,
            data: {"itemtype":itemtype},
            dataType: "json",
            async:true,
            success: function(data){
                var code = data.meta.code;
                if(code=="88"){
                    var items = data.data;
                    var obj=document.getElementById(selectd);
                    obj.options.length=0;
                    obj.add(new Option("--请选择--",""));
                    jQuery.each(items, function(i,item){
                        var id = item.id;
                        var name = item.itemname;
                        obj.add(new Option(name,id));
                    });
                }else{
                    var obj=document.getElementById(selectd);
                    obj.options.length=0;
                }
            },
            error: function (data) {
                alert("系统异常，请稍候再试或联系客服");
            }
        });
    }

    function selectItemType(){
        var itemType = $("#itemtype").val();
        if(itemType==1){
            $("#itemTypeName").text("一级项目名");
            document.getElementById("selectTwoDiv").style.display="none";
            document.getElementById("selectOneDiv").style.display="none";
        }
        if(itemType==2){
            var obj2=document.getElementById("twoType");
            obj2.options.length=0;
            obj2.add(new Option("--请选择--",""));
            selectItemByType(1);
            document.getElementById("selectOneDiv").style.display="block";
            document.getElementById("selectTwoDiv").style.display="none";
            $("#itemTypeName").text("二级项目名");
        }
        if(itemType==3){
            var obj2=document.getElementById("twoType");
            obj2.options.length=0;
            obj2.add(new Option("--请选择--",""));
            var obj1=document.getElementById("firstType");
            obj1.options.length=0;
            obj1.add(new Option("--请选择--",""));

            selectItemByType(1);
            document.getElementById("selectOneDiv").style.display="block";
            document.getElementById("selectTwoDiv").style.display="block";
            $("#itemTypeName").text("三级项目名");
        }
    }

    /**
     * 校验项目名是否存在
     */
    function validateItemName(){
        var itemName = $("#itemname").val();
        if(itemName!=null && itemName!=''&&itemName!=undefined){
            itemName = itemName.replace(/(^\s*)|(\s*$)/g, "");
            var actions ="${basePath}/admin/frontmanage/validateItemName?itemname=";
            $.ajax({
                type: "post",
                url: actions,
                data: {"itemname":itemName},
                dataType: "json",
                async:true,
                success: function(data){
                    var code = data.code;
                    var message = data.message;
                    if(code=="88"){
                        alert("项目名已存在")
                        $("#itemname").val("");
                        return "false";
                    }else{
                        return "true";
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

    function addItemName(){
        var itemName = $("#itemname").val();
        if(itemName!=null && itemName!=''&&itemName!=undefined){
            itemName = Trim(itemName);
            //判断新增项目名是否已添加过了
            var nameList = $("#itemNameList").val();
            if(nameList!=null&&nameList!=""&&nameList!=undefined){
                if(nameList.indexOf(",")>-1){
                    var list = nameList.split(",");
                    for (var i = 0; i < list.length; i++){
                        if(list[i]==itemName){
                            alert("项目名已存在");
                            return false;
                        }
                    }
                }else{
                    if(nameList==itemName){
                        alert("项目名已存在");
                        return false;
                    }
                }
            }

            var actions ="${basePath}/admin/frontmanage/validateItemName";
            $.ajax({
                type: "post",
                url: actions,
                data: {"itemname":itemName},
                dataType: "json",
                async:true,
                success: function(data){
                    var code = data.meta.code;
                    if(code=="88"){
                        alert("项目名已存在");
                        return false;
                    }else{
                        var counts = $("#itemCount").val();
                        if(counts!=null&&counts!=""&&counts!=undefined){
                            counts = parseInt(counts)+1;
                        }else{
                            counts=1;
                        }
                        var itname = $("#itemname").val();
                        itemName = Trim(itname);
                        //添加子节点---项目名称
                        var itemUrlCount = parseInt($("#itemUrlCount").val())+1;
                        $("#itemUrlCount").val(itemUrlCount);

                        //调用样式的div添加了几个
                        $("#itemUrlDivCount").val(itemUrlCount);

                        var html =
                            "                    <div id=\"div"+counts+"\" style=\"padding-bottom: 10px;padding-top: -10px\">\n" +
                            "                        <label  class=\"col-sm-2 control-label laber_from\" style=\"width: 17%;\"></label>\n" +
                            "                        <label  class=\"col-sm-2 control-label laber_from\" style=\"width:16%;text-align: center;margin-top: -3px;\">"+itemName+"</label>\n" +
                            "                        <input type=\"button\" class=\"btn btn-default\" onclick=\"deleteFrontItem("+"'"+counts+"','"+itemName+"'"+")\" value=\"删除\">" +
                            "                    </div>";
                        var ts = "<div class=\"form-group\" id=\"tsdiv"+itemUrlCount+"\">\n" +
                            "            <div class=\"col-sm-2\" style=\"width: 14.5%;margin-left:17.5%\">\n" +
                            "                <input type=\"text\"  class=\"form-control\" value=\"\"   id=\"itemUrl"+itemUrlCount+"\">\n" +
                            "            </div>\n" +
                            "           <div class=\"col-sm-1\" style=\"padding-top:5px\">\n" +
                            "               调用样式\n" +
                            "           </div>\n" +
                            "       </div>"


                        $("#itemCount").val(counts);
                        $("#addDiv").append(html);
                        $("#addDiv").append(ts);

                        var nameList = $("#itemNameList").val();
                        if(nameList!=null&&nameList!=""&&nameList!=undefined){
                            $("#itemNameList").val($("#itemNameList").val()+","+itemName);
                        }else{
                            $("#itemNameList").val(itemName);
                        }
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

    function Trim(str) {
        var result;
        result = str.replace(/(^\s+)|(\s+$)/g, "");
        result = result.replace(/\s/g, "");
        return result;
    }
</script>
<script>
    //客户端验证并提交
    function insert(){
        //添加的项目名
        var itemNameList = $("#itemNameList").val();
        if(itemNameList==null||itemNameList==""||itemNameList==undefined){
            alert("项目名最少要添加一个");
            return false;
        }
        var urlDivCount = $("#itemUrlDivCount").val();

        var nameListSize = 1;
        if(itemNameList.indexOf(",")>-1){
            nameListSize = itemNameList.split(",").length;
        }
        var urlCount = 0;


        for(var i=1;i<urlDivCount+1;i++){
            var img = $("#itemUrl"+i).val();
            if(img!=null&&img!=""&&img!=undefined){
                urlCount = parseInt(urlCount)+1;
                var itemUrlList1 = $("#itemUrlList").val();
                if(itemUrlList1!=null&&itemUrlList1!=""&&itemUrlList1!=undefined){
                    $("#itemUrlList").val($("#itemUrlList").val()+","+img);
                }else{
                    $("#itemUrlList").val(img);
                }
            }
        }

        if(parseInt(nameListSize)>parseInt(urlCount)){
            alert("项目访问地址必须填写")
            $("#itemUrlList").val("");
            return false;
        }

        //选择的添加类型
        var tn = $("#itemtype").val();
        if(tn!=null&&tn!=""&&tn!=undefined){
            if(tn==1){//一级项目
                $("#pid").val(0);
            }else if(tn==2){//二级项目
                var tnm = $("#firstType").val();
                if(tnm==null||tnm==""||tnm==undefined){
                    alert("请选择正确的一级项目")
                    return false;
                }else{
                    $("#pid").val(tnm);
                }
            }else if(tn==3){//三级项目
                var tnm = $("#firstType").val();
                var tnm2 = $("#twoType").val();
                if(tnm==null||tnm==""||tnm==undefined){
                    alert("请选择正确的一级项目")
                    return false;
                }
                if(tnm2==null||tnm2==""||tnm2==undefined){
                    alert("请选择正确的二级项目")
                    return false;
                }else{
                    $("#pid").val(tnm2);
                }
            }
        }

        var json = $("#insertFrontMessage").serialize();
        var action ="${pageContext.request.contextPath}/admin/frontmanage/addNewFrontManage";
        $.post(action, json, function (data) {
            if (data.meta.code == 88) {
                alert(data.meta.message)
                window.location.reload();
            } else {
                alert(data.meta.message)
            }
        })
    };




</script>
</body>
</html>