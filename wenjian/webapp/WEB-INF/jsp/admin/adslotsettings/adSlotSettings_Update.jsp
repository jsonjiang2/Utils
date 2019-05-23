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
        $("#select-adsortType-text").val("${data.adsort}");
        $("#select-addaystatus-texts").val("${data.addaystatus}");
        $("#select-adweekstatus-texts").val("${data.adweekstatus}");
        $("#select-adyearstatus-texts").val("${data.adyearstatus}");
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
    </style>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="adupdateForm">
        <input type="hidden" name="id" id="id" value="${data.id}"/>
        <input type="hidden" name="uid" id="uid" value="${data.uid}"/>
        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">设置属性：</label>
            <div class="col-sm-3">
                <input style="display: none;" name="adsort" value="${data.adsort}"/>
                <select id="select-adsortType-text" class="form-control" disabled="disabled">
                    <option value="">--请选择--</option>
                    <option value="1">特殊广告</option>
                    <option value="2">通用广告</option>
                <%--<option value="0">通用广告</option>--%>
                    <%--<option value="2">默认</option>--%>
                </select>
            </div>
        </div>

        <div class="form-group">
            <input type="text" id="aid" name="aid" value="${data.uid}" style="display: none" />
            <label  class="col-sm-2 control-label laber_from">广告位：</label>
            <div class="col-sm-3" style="padding-top: 7px">
                <wdb:getUser uid="${data.uid}" var="user">
                    ${user.username}
                </wdb:getUser>
                <%--<input type="text" name="adUserNameParam" readonly="readonly" class="form-control" value="${data.adUserNameParam}" id="adUserNameParam" onchange="validateUserName(this)"/> &lt;%&ndash;onchange="validateUserName(this)"&ndash;%&gt;--%>
            </div>
        </div>

        <div class="form-group" id="addDiv" style="display: none">
            <input style="display: none" id="themeSize" value="${themeList}" />
            <label  class="col-sm-2 control-label laber_from">添加主题链接：</label>
            <div class="col-sm-3">
                <input type="text"  name="postAddress" class="form-control"  id="postAddress" />
                <input type="text"  name="postAddressId" style="display: none;" class="form-control"  id="postAddressId" />
            </div>
            <input type="button" style="margin-top: 5px" onclick="addPostAddress()" value="添加">
        </div>

        <input type="text" value="${themeList}" id="divId" style="display: none" />
        <input type="text" value="${pidList}" id="pidList" name="pidList" style="display: none;"/>
        <%--主题帖子--%>
        <div  class="form-group" id="divParent" style="padding-left: -20px">
            <c:forEach items="${dataList}" var="theme" begin="0" end="${themeList}" varStatus="i">
                <div id="div${i.count}" style="float: left;width: 100%;margin-bottom: 10px">
                    <label  class="col-sm-2 control-label laber_from" >${i.count}</label>
                    <div class="col-sm-3">
                        <input type="text"  name="adPostAddress" class="form-control" value="${theme.tid}"  disabled="disabled"/>
                    </div>
                    <input type="button" style="margin-top: 5px" onclick="deleteAdPost('${i.count}','${theme.tid}','${i.count}')" value="删除">
                </div></br>
            </c:forEach>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">按天销售：</label>
            <div class="col-sm-3">
                <select id="select-addaystatus-texts" name="addaystatus" class="form-control">
                    <option value="">--请选择--</option>
                    <option value="0">关闭</option>
                    <option value="1">开启</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">价格：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="addayprice" value="${data.addayprice}"/>
            </div>
            <p style="margin-top: 5px" >元/天</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">最底起购：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adday" value="${data.adday}"/>
            </div>
            <p style="margin-top: 5px" >天</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">按周销售：</label>
            <div class="col-sm-3">
                <select id="select-adweekstatus-texts" name="adweekstatus" class="form-control">
                    <option value="">--请选择--</option>
                    <option value="0">关闭</option>
                    <option value="1">开启</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">价格：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adweekprice" value="${data.adweekprice}"/>
            </div>
            <p style="margin-top: 5px" >元/周</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">最底起购：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adweek" value="${data.adweek}"/>
            </div>
            <p style="margin-top: 5px" >周</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">按年销售：</label>
            <div class="col-sm-3">
                <select id="select-adyearstatus-texts" name="adyearstatus" class="form-control">
                    <option value="">--请选择--</option>
                    <option value="0">关闭</option>
                    <option value="1">开启</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">价格：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adyearprice" value="${data.adyearprice}"/>
            </div>
            <p style="margin-top: 5px" >元/年</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">最底起购：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adyear" value="${data.adyear}"/>
            </div>
            <p style="margin-top: 5px" >年</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">巴士分润：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="busincome" value="${data.busincome*100}"/>
            </div>
            <p style="margin-top: 5px" >%</p>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label laber_from">广告锁定：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="adlock" value="${data.adlock}"/>
            </div>
            <p style="margin-top: 5px" >倍</p>
        </div>


        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">备注：</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark">${data.remark}</textarea>
            </div>
        </div>
    </form>
</div>
<script>
    $(function () {
        var sort = document.getElementById("select-adsortType-text").value;
        if(sort==1){
            document.getElementById("addDiv").style.display="block";
        }
    });

    Array.prototype.baoremove = function(dx)
    {
        if(isNaN(dx)||dx>this.length){return false;}
        this.splice(dx,1);
    }
    //删除广告位关联主题
    function deleteAdPost(postId,tid,lableId){
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }else{
            var pidList = document.getElementById("pidList").value;
            var split = pidList.split(",");
            var index = split.indexOf(tid+"");
            split.baoremove(index);
            var pidString = split.join(",");
            $("#pidList").val(pidString);
            $("#divParent").children("#div"+postId).remove();
        }
    }
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
                    var postAddressId = document.getElementById("pidList").value;
                    if(postAddressId==""){
                        $("#pidList").val(postAddressId+data.meta.message);
                    }else{
                        $("#pidList").val(postAddressId+","+data.meta.message);
                    }
                    var idNum = document.getElementById("divId").value;
                    var divId = parseInt(idNum)+parseInt(1);
                    var divs = document.getElementById("divParent");
                    var p = document.createElement("div");//创建p节点
                    p.id="div"+divId;
                    p.innerHTML = '</br><label  class="col-sm-2 control-label laber_from" >' +
                        divId +
                        '</label>\n' +
                        '                <div class="col-sm-3">\n' +
                        '                    <input type="text"  name="adPostAddress" class="form-control" value='+post+'  id="adPostAddress" disabled="disabled"/>\n' +
                        '                </div>\n' +
                        '                <input type="button" style="margin-top: 5px" onclick="deleteAdPost('+divId+','+post+','+divId+')" value="删除">';//p节点显示的文字
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

    //修改后保存
    function update(){
        //再次校验用户是否存在
        /*var username= document.getElementById("adUserNameParam").value;
        if(username==""){
            alert("指定的广告位无效，请输入未设置通用广告设置的用户！")
        }else{}*/
            var json = $("#adupdateForm").serialize();
            var action ="${pageContext.request.contextPath}/admin/adSlotSettings/UpdateAdSlotSettingTheme";
            $.ajaxSettings.async = false;
            var code="";
            $.post(action, json, function(data){
                code = data.meta.code;
                if(data.meta.code=="88"){
                    alert(data.meta.message);
                    window.location.reload(true);
                }else{
                    alert(data.meta.message);
                }
            });
    }
    //校验用户名是否存在
    function validateUserName(username){
        var aid = document.getElementById("id").value;
        var sort = document.getElementById("select-adsortType-text").value;
        var action ="${pageContext.request.contextPath}/admin/adSlotSettings/validateUserName";
        $.post(action,{"username":username.value,"sort":sort,"aid":aid},function (data) {
            if(data.meta.code==88){
                $("#uid").val(data.meta.message);
                alert("用户可指定!")
            }else{
                alert(data.meta.message)
                $("#adUserNameParam").val("");
            }
        })
    }
</script>
</body>
</html>