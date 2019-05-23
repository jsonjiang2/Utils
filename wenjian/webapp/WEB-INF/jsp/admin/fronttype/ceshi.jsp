
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>前端类型设置</title>
    <script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
</head>
<body>
<div ng-app="">
    <select ng-model="code" >
        <option value="">请选择</option>
        <option value="1" selected="selected">开启</option>
        <option value="0">关闭</option>
    </select>
    </p>
    <p>名字 : <input type="text" ng-model="name"></p>
    <input type="text" value="{{code}},{{name}}">
</div>
</body>
</html>
