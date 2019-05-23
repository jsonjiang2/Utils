<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>前端类型添加</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
    %>
	 <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <link href="<%=basePath%>static/plugin/assets/css/dpl-min.css" rel="stylesheet"
          type="text/css"/>
    <link href="<%=basePath%>static/plugin/assets/css/bui-min.css" rel="stylesheet"
          type="text/css"/>
    <link href="<%=basePath%>static/plugin/assets/css/main-min.css" rel="stylesheet"
          type="text/css"/>

</head>
<body>
<div class="container" style="width:80%;margin-left: 25%" ng-app="myApp" ng-controller="myCtrl">
    <div class="demo-content">

        <!-- 表单页 ================================================== -->
        <div class="row">
            <div class="span24" class="form-group">
                <hr>
                <form id="insert_form" class="form-horizontal" method="post" action="#">
                        <div class="form-group">
				            <label class="col-sm-2 control-label">类型</label>
				            <div class="col-sm-3">
		                        <select id="chooseType" class="form-control" >
		                            <option value="" >请选择</option>
		                            <c:forEach items="${frontTypes}" var="type">
		
		                                        <option value="${type.id}" >${type.typeName}</option>
		
		                            </c:forEach>
		
		                        </select>
                        	</div>
       					</div>

                    <hr>
                    <div class="form-actions span5 offset3">
                        <button type="button" class="button button-primary" onclick="returnListPage()">返回</button>
                    </div>
                </form>
            </div>
        </div>
        
        
        <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
        <script src="http://g.tbcdn.cn/fi/bui/seed-min.js?t=201212261326"></script>
        <script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
        <script type="text/javascript">
            BUI.use('bui/form', function (Form) {
                new Form.Form({
                    srcNode: '#insert_form'
                }).render();
            });


            $("#chooseType").change(function () {
                var typeId=$("#chooseType").val();
                var action = "${pageContext.request.contextPath}/admin/fileFrontType/fileTypeRulePage/"+typeId;
                window.location.href=action;
            })
            function returnListPage() {
                var action = "${pageContext.request.contextPath}/admin/fileFrontType/toAllTypeRulePage";
                window.location.href=action;
            }
        </script>
        <!-- script end -->
    </div>
</div>
</body>
</html>
