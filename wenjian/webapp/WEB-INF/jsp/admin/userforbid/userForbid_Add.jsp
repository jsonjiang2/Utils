<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户禁止添加页面</title>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
        <form id="inputForm" class="form-horizontal" >
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="forbidtype">禁止类型</label>
                <div class="col-sm-3">
                    <select name="forbidtype" id="forbidtype" onchange="ld();" class="form-control">
                        <option value="2">用户名</option>
                        <option value="1">IP</option>
                        <option value="3">回复审核</option>
                    </select>
                </div>
            </div>

            <div class="changeDiv">
                <div class="typeContentDiv">
                    <div class="form-group typeContentOne">
                        <label class="col-sm-2 control-label laber_from" for="typecontent">类型内容</label>
                        <div class="col-sm-3">
                            <input type="text" name="typecontent" id="typecontent" class="form-control" />
                        </div>
                    </div>
                </div>
                <%--<div class="keywordsDiv">--%>
                    <%--<div class="form-group typeContentOne">--%>
                        <%--<label class="col-sm-2 control-label laber_from" for="typecontent">过滤关键字</label>--%>
                        <%--<div class="col-sm-3">--%>
                            <%--<input type="text" name="typecontent" id="keyword" class="form-control" />--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3" style="margin-left: 5px;">--%>
                            <%--<button type="button" style="color: blue;" class="btn btn-default"--%>
                            <%--onclick="addTypeContent(this);">添加</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                <%--</div>--%>
            </div>
            <div class="showDiv">
                <div class="form-group">
                    <label class="col-sm-2 control-label laber_from" for="forbidcontent">禁止内容</label>
                    <div class="col-sm-3">
                        <select name="forbidcontent" id="forbidcontent" class="form-control">
                            <option value="1">登录</option>
                            <option value="2">发帖</option>
                            <option value="3">回复</option>
                            <option value="4">访问</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label laber_from" for="forbiddaynum">禁止天数</label>
                    <div class="col-sm-3">
                        <input type="text" name="forbiddaynum" id="forbiddaynum" class="form-control" />
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">备注</label>
                <div class="col-sm-3">
                    <textarea rows="3" class="form-control" name="remark" id="remark"></textarea>
                </div>
            </div>

            <button id="insertButton" class="btn btn-default" type="button"
                    style="margin-top: 20px;margin-left:200px;">保存
            </button>
            <button class="btn btn-default" type="button"
                    onclick="window.location.href='${pageContext.request.contextPath}/admin/userForbid/cxList';"
                    style="margin-top: 20px;margin-left:100px;">返回
            </button>
        </form>
    <div class="col-md-3"></div>
</div>
</body>

<script type="text/javascript">

    function ld() {
        var sel = document.getElementById('forbidtype');
        if (sel.value == '1' || sel.value == '2'){
            $(".changeDiv").html("<div class='typeContentDiv'>"+
                "                    <div class='form-group typeContentOne'>"+
                "                        <label class='col-sm-2 control-label laber_from' for='typecontent'>类型内容</label>"+
                "                        <div class='col-sm-3'>"+
                "                            <input type='text' name='typecontent' id='typecontent' class='form-control' />"+
                "                            <span id='errortypeContent' style='color:red;font-weight:bold;'></span>"+
                "                        </div>"+
                "                    </div>"+
                "                </div>");
            $(".showDiv").removeAttr("hidden");
        }
        if (sel.value == '3'){
            $(".changeDiv").html("<div class='keywordsDiv'>"+
                "                    <div class='form-group typeContentOne'>"+
                "                        <label class='col-sm-2 control-label laber_from' for='keyword'>过滤关键字</label>"+
                "                        <div class='col-sm-3'>"+
                "                            <input type='text' name='keyword' id='keyword' class='form-control' />"+
                "                        </div>"+
                "                        <div class='col-md-3' style='margin-left: 5px;'>"+
                "                            <button type='button' style='color: blue;' class='btn btn-default'"+
                "                            onclick='addTypeContent();'>添加</button>"+
                "                        </div>"+
                "                    </div>"+
                "                </div>");
            $(".showDiv").attr("hidden","hidden");
        }
    }

    function addTypeContent() {
        var vhtml = "<div class='form-group'>"+
            "            <label class='col-sm-2 control-label laber_from'></label>"+
            "            <div class='col-sm-3'>"+
            "                <input type='text' name='keyword' class='form-control' />"+
            "            </div>"+
            "            <div class='col-md-3' style='margin-left: 5px;'>"+
            "                <button type='button' style='color: blue;' class='btn btn-default'"+
            "                        onclick='delTypeContent(this);'>删除</button>"+
            "            </div>"+
            "        </div>";
        $(".keywordsDiv").append(vhtml);
    }
    function delTypeContent(obj) {
        $(obj).parent().parent().remove();
    }


    $("#insertButton").click(function(){
        var forbidTypeVal = $("#forbidtype").val();
        if (forbidTypeVal == "1" || forbidTypeVal == "2"){
            var typecontent = $("#typecontent").val();
            if (typecontent == '' || typecontent == null) {
                alert("请输入类型内容");
                return false;
            }
            var shifouxianshi = true;
            if (forbidTypeVal == "2"){
                $.ajax({
                    type : "POST",
                    async: false,    //或true,是否异步
                    url : basePath + "/admin/userForbid/checkUserName",
                    data : {
                        userName:typecontent
                    },
                    dataType:'json',
                    success : function(result) {
                        if (result.code == "88") {
                            alert(result.message);
                            shifouxianshi = false;
                            return;
                        }else {
                        }
                    }
                });
            }
            if (shifouxianshi){
                var action="/admin/userForbid/save";
                $.post(action,$("#inputForm").serialize(),function(data){
                    alert(data.meta.message);
                    window.location.href="${pageContext.request.contextPath}/admin/userForbid/cxList";
                });
            }

        }else {
            var typecontent = document.getElementsByName("keyword");
            for(var j=0;j<typecontent.length;j++){
                var typecontentValue = typecontent[j].value;
                if (isEmpty(typecontentValue)) {
                    alert("请填写过滤关键字");
                    return false;
                }
            }
            var keyLength = $(".keywordsDiv").find(".form-group").length;
            var keyArray = new Array();
            for (var i = 0; i < keyLength; i++) {
                var $sprallObj = $(".keywordsDiv").find(".form-group");
                var keywordObj = {};
                var keyword = $($sprallObj).eq(i).find("input[name='keyword']").val();
                keywordObj.typecontent = keyword;
                keyArray.push(keywordObj);
            }
            var dataObj = {};
            dataObj.keyArray = JSON.stringify(keyArray);
            dataObj.forbidtype = forbidTypeVal;
            dataObj.remark = $("#remark").val();
            var action="/admin/userForbid/save";
            $.post(action,dataObj,function(data){
                alert(data.meta.message);
                window.location.href="${pageContext.request.contextPath}/admin/userForbid/cxList";
            });
        }

    });



</script>


</html>