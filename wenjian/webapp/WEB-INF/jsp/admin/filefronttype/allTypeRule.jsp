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
<div class="container" style="width:80%;">
    <div class="row clearfix">
    <%--     <c:if test="${!empty msg}">
            <div id="myAlert" class="alert alert-success in">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                <strong>${msg}</strong>
            </div>
        </c:if> --%>
           <form action="${pageContext.request.contextPath}/admin/fileFrontType/toAllTypeRulePage" method="post" role="form"
                  id="form-select">
               <input type="hidden" id="pageNum" name="pageNum"/>
               <input type="hidden" id="pageSize" name="pageSize"/>

            </form>		
        
        <div class="btn-group" style="float: right; margin-right: 20px">
            <button class="btn btn-default" onclick="addfiled()">新增</button>
        </div>
        <div class="col-md-12 column">
            <table class="table table-hover" id="personList_table" style="margin-top: 10px;font-size: 12px; font-family: 微软雅黑">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>类型编号</td>
                    <td>类型</td>
                    <td>标题</td><!--FrontContent  -->
                    <td>副标题</td><!--FrontContent  -->
                    <td>主链接</td><!--FrontContent  -->
                    <td>次链接</td><!--FrontContent  -->
                    <td>内容</td><!--FrontContent  -->
                    <td>缩略图</td><!--FrontContent  -->
                    <td>缩略图标题</td><!--FrontContent  -->
                    <td>缩略图链接</td><!--FrontContent  -->
                    <td>备注</td>
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
                        	<c:if test="${empty entity.title}">
                        		--
                        	</c:if>
                        	<c:if test="${!empty entity.title}">
                        		${entity.title}
                        	</c:if>
                        </td> 
                        <td>
                        	<c:if test="${empty entity.subTitle}">
                        		--
                        	</c:if>
                        	<c:if test="${!empty entity.subTitle}">
                        		${entity.subTitle}
                        	</c:if>
                        	
                        </td>
                        <td>
                        	<c:if test="${empty entity.href}">
                        		--
                        	</c:if>
                        	<c:if test="${!empty entity.href}">
                        		${entity.href}
                        	</c:if>
                        </td>
                        <td>
                        	<c:if test="${empty entity.subHref}">
                        		--
                        	</c:if>
                        	<c:if test="${!empty entity.subHref}">
                        		${entity.subHref}
                        	</c:if>
                        </td>
                        <td>
                        	<c:if test="${empty entity.content}">
                        		--
                        	</c:if>
                        	<c:if test="${!empty entity.content}">
                        		${entity.content}
                        	</c:if>
                        </td>
                        <td>
                        	<c:if test="${empty entity.thumbnailPic}">
                        		--
                        	</c:if>
                        	<c:if test="${!empty entity.thumbnailPic}">
                        		${entity.thumbnailPic}
                        	</c:if>
                        </td>
                        <td>
                        	<c:if test="${empty entity.thumbnailTitle}">
                        		--
                        	</c:if>
                        	<c:if test="${!empty entity.thumbnailTitle}">
                        		${entity.thumbnailTitle}
                        	</c:if>
                        </td>
                        <td>
                        	<c:if test="${empty entity.thumbnailAddress}">
                        		--
                        	</c:if>
                        	<c:if test="${!empty entity.thumbnailAddress}">
                        		${entity.thumbnailAddress}
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
                            <button class="btn " onclick="toUpdatePage('${entity.id}')">修改</button>
                            <button class="btn " onclick="toDelete('${entity.id}')">删除</button>
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
    //详情页面跳转
    function detailUI(id) {
        var action = "${pageContext.request.contextPath}/admin/fileFrontType/detail/" + id;
        window.location.href=action;
    }
  
    
    //字段编辑
    function toUpdatePage(id) {
        var action = "${pageContext.request.contextPath}/admin/fileFrontType/toTypeRulePage/" + id;
        window.location.href=action;
    }
    //修改页面跳转
    function toDelete(id) {
        if(confirm("确认删除吗？")){
        var action = "${pageContext.request.contextPath}/admin/fileFrontType/deletefile/" + id;
       /*  window.location.href=action; */
        $.post(action,function(data){
        	if(data.code=="200"){
        		alert(data.msg);
        		window.location.href = "${pageContext.request.contextPath}/admin/fileFrontType/toAllTypeRulePage";
        	}else{
        		alert(data.msg);
        	}
        });
        }
    }
    //添加页面跳转
    function addfiled() {
    	 var action = "${pageContext.request.contextPath}/admin/fileFrontType/addfiled";
         window.location.href=action;
    }
   

  /*   $(function () {
        setTimeout(function(){
            $("#myAlert").alert('close');
        },2000);
    }); */
</script>
</body>
</html>
