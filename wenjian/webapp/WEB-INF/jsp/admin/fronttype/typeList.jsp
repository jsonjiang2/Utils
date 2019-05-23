<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>类型列表页</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style>
        .text-center td {
            text-align: center;
            vertical-align: middle !important;
            border: 1px solid #666;
        }
    </style>
</head>
<body style="font-size: 12px; font-family: 微软雅黑">
<div class="container" style="width:80%">
    <div class="row clearfix">
       <%--  <c:if test="${!empty msg}">
            <div id="myAlert" class="alert alert-success in">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                <strong>${msg}</strong>
            </div>
        </c:if> --%>
         <form action="${pageContext.request.contextPath}/admin/frontType/typeList" method="post" role="form"
              id="form-select">
           <input type="hidden" id="pageNum" name="pageNum"/>
           <input type="hidden" id="pageSize" name="pageSize"/>

        </form>	
        <div class="btn-group" style="float: right; margin-right: 20px">
            <button class="btn btn-default" onclick="toAddPage()">新增类型</button>
        </div>
        <div class="col-md-12 column">
            <table class="table table-hover" id="personList_table" style="margin-top: 10px;font-size: 12px; font-family: 微软雅黑">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>类型编号</td>
                    <td>类型名称</td>
                    <td>类型</td>
                    <td>类型备注</td>
                    <td>操作人</td>
                    <td>操作时间</td>
                    <td>操作</td>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>LX${entity.id}</td>
                        <td>
                        	 <c:choose>
                                <c:when test="${fn:length(entity.typeName)>10}">
                                    ${fn:substring(entity.typeName, 0, 10)}...
                                </c:when>
                                <c:otherwise>
                                    ${entity.typeName}
                                </c:otherwise>
                        	</c:choose>
                        </td>
                        
                        <td>
                        	<c:if test="${entity.type eq 1}">
                        		友情链接类型
                        	</c:if>	
                        	<c:if test="${entity.type eq 2}">
                        		QQ群类型
                        	</c:if>	
                        </td>
                        
                        <td>
                        	<c:choose>
                                <c:when test="${fn:length(entity.typeRemark)>10}">
                                    ${fn:substring(entity.typeRemark, 0, 10)}...
                                </c:when>
                                <c:otherwise>
                                    ${entity.typeRemark}
                                </c:otherwise>
                        	</c:choose>
                        
                        </td>
                        <td>${entity.updateMan}</td>
                        <td>${sf.format(entity.updateTime)}</td>
                        <td>
                           <%--  <button class="btn" data-backdrop="static" data-toggle="modal"
                                    data-dismiss="modal" data-target="#detailsModal"
                                    onclick="detailUI('${entity.id}')">详细信息
                            </button> --%>
                            <button class="btn " onclick="toUpdatePage('${entity.id}')">修改</button>
                            <button class="btn " onclick="toDelete('${entity.id}')">删除</button>
                            <button class="btn " onclick="toTypeRulePage('${entity.id}')">字段编辑</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <%@ include file="../../common/modal.jsp" %>
            <div id="page_div">
                <%@ include file="../../common/pagehelper.jsp" %>
            </div>
        </div>
    </div>
</div>
<script>
    //修改页面跳转
    function toUpdatePage(id) {
        var action = "${pageContext.request.contextPath}/admin/frontType/toUpdatePage/" + id;
        window.location.href=action;  
       
        /* var action = "${pageContext.request.contextPath}/admin/frontType/toUpdatePage"+id;
        var callback = function (data) {
        	alert(data);
            $("#update-modal-body").html(data);
            $("#updateModal").modal({
                backdrop: 'static',
                keyboard: false
            });
        }
        $.post(action, callback);  */
    }
    //删除页面跳转
    function toDelete(id) {
        if(confirm("确认删除吗？")){
        var action = "${pageContext.request.contextPath}/admin/frontType/delete/" + id;
        $.post(action,function(data){
        	if(data.code=="200"){
        		alert(data.msg);
        		window.location.href = "${pageContext.request.contextPath}/admin/frontType/typeList";
        	}else{
        		alert(data.msg);
        	}
        });
        }
    }
    //添加页面跳转
    function toAddPage() {
        var action = "${pageContext.request.contextPath}/admin/frontType/toAddPage" ;
        window.location.href=action;
    }
    //修改页面跳转
    function toTypeRulePage(id) {
        var action = "${pageContext.request.contextPath}/admin/frontType/toTypeRulePage/" + id;
        window.location.href=action;
    }

    $(function () {
        setTimeout(function(){
            $("#myAlert").alert('close');
        },2000);
    });
</script>
</body>
</html>
