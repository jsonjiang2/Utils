
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
    <script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
    <link href="<%=basePath%>static/plugin/assets/css/dpl-min.css" rel="stylesheet"
          type="text/css" />
    <link href="<%=basePath%>static/plugin/assets/css/bui-min.css" rel="stylesheet"
          type="text/css" />
    <link href="<%=basePath%>static/plugin/assets/css/main-min.css" rel="stylesheet"
          type="text/css" />
</head>
<body>
<div class="container" style="width:80%;margin-left: 25%">
<div class="demo-content">

    <!-- 表单页 ================================================== -->
    <div class="row">
        <div class="span24">
            <hr>
            <form id="update_form" class="form-horizontal" method="post" action="#">
                <h3>${frontType.typeName}：</h3>
                <div class="control-group">
                    <input type="hidden" name="id" value="${frontType.id}">
                    <label class="control-label"><s>*</s>类型编码：</label>
                    <div class="controls">
                        LX${frontType.id}
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"><s>*</s>类型名称：</label>
                    <div class="controls">
                       ${frontType.typeName}
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"><s>*</s>类型备注：</label>
                    <div class="controls control-row4">
                        <textarea type="text"name="typeRemark" readonly class="input-large" value="${frontType.typeRemark}"></textarea>
                    </div>
                </div>

                <hr>
                <div class="form-actions span5 offset3">
                    <button id="btnSearch" type="button" class="button button-primary" onclick="returnListPage()">返回</button>
                </div>
            </form>
        </div>
    </div>
    <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
    <script src="http://g.tbcdn.cn/fi/bui/seed-min.js?t=201212261326"></script>
    <script type="text/javascript">
        BUI.use('bui/form',function  (Form) {
            new Form.Form({
                srcNode : '#update_form'
            }).render();
        });

        function returnListPage() {
            var action = "${pageContext.request.contextPath}/admin/frontType/typeList";
            window.location.href=action;
        }
    </script>
    <!-- script end -->
</div>
</div>
</body>
</html>
