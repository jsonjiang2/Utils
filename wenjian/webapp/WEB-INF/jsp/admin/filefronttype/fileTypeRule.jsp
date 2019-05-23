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


</head>
<body>
<div class="container" style="width:80%;" ng-app="myApp" ng-controller="myCtrl">

    <div style="margin-top:20px;"></div>
    <!-- 表单页 ================================================== -->
    <div class="row">
        <div class="span24">
            <hr>
            <form id="insert_form" class="form-horizontal" method="post" action="#">
                <div class="form-group">
                    <label class="col-sm-2 control-label">选择类型</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="chooseType">
                            <c:forEach items="${frontTypes}" var="type">
                                <c:choose>
                                    <c:when test="${frontType.id eq type.id}">
                                        <option value="${type.id}" selected>${type.typeName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${type.id}">${type.typeName}</option>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>

                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">字段名</label>
                    <label class="col-sm-2 control-label">开关</label>
                    <label class="col-sm-2 control-label">别名</label>

                </div>

                <input type="hidden" name="id" value="${frontType.id}">

                <div class="form-group">
                    <label class="col-sm-2 control-label">主标题:</label>

                    <div class="controls col-sm-2">
                        <select ng-model="titleSwitch" ng-change="titleToggle()" class="form-control">
                            <%--<option ng-repeat="x in switchs" value="{{x.val}}">{{x.switch}}</option>--%>
                            <option value="1">开启</option>
                            <option value="0">关闭</option>
                        </select>

                    </div>
                    <div class="col-sm-2">
                               <span ng-hide="titleNickNameHide">
                            <input type="text" ng-model="titleNickName" class="form-control">
                            </span>
                        <input type="hidden" name="title" value="{{titleSwitch}},{{titleNickName}}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">副标题：</label>

                    <div class="controls col-sm-2">
                        <select ng-model="subTitleSwitch" ng-change="subTitleToggle()" class="form-control">
                            <option value="1">开启</option>
                            <option value="0">关闭</option>
                        </select>

                    </div>
                    <div class="col-sm-2">
                            <span ng-hide="subTitleNickNameHide">
                            <input type="text" ng-model="subTitleNickName" class="form-control">
                            </span>
                        <input type="hidden" name="subTitle" value="{{subTitleSwitch}},{{subTitleNickName}}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">主链接：</label>

                    <div class="controls col-sm-2">
                        <select ng-model="hrefSwitch" ng-change="hrefToggle()" class="form-control">
                            <option value="1">开启</option>
                            <option value="0">关闭</option>
                        </select>

                    </div>
                    <div class="col-sm-2">
                            <span ng-hide="hrefNickNameHide">
                            <input type="text" ng-model="hrefNickName" class="form-control">
                            </span>
                        <input type="hidden" name="href"
                               value="{{hrefSwitch}},{{hrefNickName}}">
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-sm-2 control-label">次链接：</label>

                    <div class="controls col-sm-2">
                        <select ng-model="subHrefSwitch" ng-change="subHrefToggle()" class="form-control">
                            <option value="1">开启</option>
                            <option value="0">关闭</option>
                        </select>

                    </div>
                    <div class="col-sm-2">
 						<span ng-hide="subHrefNickNameHide">
                            <input type="text" ng-model="subHrefNickName" class="form-control">
                            </span>
                        <input type="hidden" name="subHref"
                               value="{{subHrefSwitch}},{{subHrefNickName}}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">内容：</label>

                    <div class="controls col-sm-2">
                        <select ng-model="contentSwitch" ng-change="contentToggle()" class="form-control">
                            <option value="1">开启</option>
                            <option value="0">关闭</option>
                        </select>

                    </div>
                    <div class="col-sm-2">
						<span ng-hide="contentNickNameHide">
                            <input type="text" ng-model="contentNickName" class="form-control">
                            </span>
                        <input type="hidden" name="content"
                               value="{{contentSwitch}},{{contentNickName}}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">缩略图图片：</label>

                    <div class="controls col-sm-2">
                        <select ng-model="picSwitch" ng-change="picToggle()" class="form-control">
                            <option value="1">开启</option>
                            <option value="0">关闭</option>
                        </select>

                    </div>
                    <div class="col-sm-2">
                     <span ng-hide="picNickNameHide">
                            <input type="text" ng-model="picNickName" class="form-control">
                            </span>
                        <input type="hidden" name="thumbnailPic"
                               value="{{picSwitch}},{{picNickName}}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">缩略图标题：</label>

                    <div class="controls col-sm-2">
                        <select ng-model="picTitleSwitch" ng-change="picTitleToggle()" class="form-control">
                            <option value="1">开启</option>
                            <option value="0">关闭</option>
                        </select>

                    </div>
                    <div class="col-sm-2">
 						<span ng-hide="picTitleNickNameHide">
                            <input type="text" ng-model="picTitleNickName" class="form-control">
                            </span>
                        <input type="hidden" name="thumbnailTitle"
                               value="{{picTitleSwitch}},{{picTitleNickName}}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">缩略图连接：</label>

                    <div class="controls col-sm-2">
                        <select ng-model="addressSwitch" ng-change="addressToggle()" class="form-control">
                            <option value="1">开启</option>
                            <option value="0">关闭</option>
                        </select>

                    </div>
                    <div class="col-sm-2">
 						<span ng-hide="addressNickNameHide">
                            <input type="text" ng-model="addressNickName" class="form-control">
                            </span>
                        <input type="hidden" name="thumbnailAddress"
                               value="{{addressSwitch}},{{addressNickName}}">
                    </div>
                </div>


                <hr>
                <div class="form-actions span5 offset3" style="margin-left: 25%">
                    <button type="button" class="btn btn-default" onclick="returnListPage()">返回</button>
                    <button type="button" class="btn btn-default" onclick="saveRule()">提交</button>
                </div>
            </form>

        </div>
        <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
        <script src="http://g.tbcdn.cn/fi/bui/seed-min.js?t=201212261326"></script>
        <script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
        <script type="text/javascript">


            var app = angular.module('myApp', []);
            app.controller('myCtrl', function ($scope) {

                var titleSwitch = "${frontType.titleSwitch}";
                var subTitleSwitch = "${frontType.subTitleSwitch}";
                var hrefSwitch = "${frontType.hrefSwitch}";
                var subHrefSwitch = "${frontType.subHrefSwitch}";
                var contentSwitch = "${frontType.contentSwitch}";
                var picSwitch = "${frontType.thumbnailPicSwitch}";
                var picTitleSwitch = "${frontType.thumbnailTitleSwitch}";
                var addressSwitch = "${frontType.thumbnailAddressSwitch}";

                $scope.titleNickNameHide = true;
                $scope.subTitleNickNameHide = true;
                $scope.hrefNickNameHide = true;
                $scope.subHrefNickNameHide = true;
                $scope.contentNickNameHide = true;
                $scope.picNickNameHide = true;
                $scope.picTitleNickNameHide = true;
                $scope.addressNickNameHide = true;

                if (titleSwitch == "1") {
                    $scope.titleNickNameHide = false;
                }
                if (subTitleSwitch == "1") {
                    $scope.subTitleNickNameHide = false;
                }
                if (hrefSwitch == "1") {
                    $scope.hrefNickNameHide = false;
                }
                if (subHrefSwitch == "1") {
                    $scope.subHrefNickNameHide = false;
                }
                if (contentSwitch == "1") {
                    $scope.contentNickNameHide = false;
                }
                if (picSwitch == "1") {
                    $scope.picNickNameHide = false;
                }
                if (picTitleSwitch == "1") {
                    $scope.picTitleNickNameHide = false;
                }
                if (addressSwitch == "1") {
                    $scope.addressNickNameHide = false;
                }

                $scope.titleToggle = function () {
                    $scope.titleNickNameHide = !$scope.titleNickNameHide;
                }
                $scope.subTitleToggle = function () {
                    $scope.subTitleNickNameHide = !$scope.subTitleNickNameHide;
                }
                $scope.hrefToggle = function () {
                    $scope.hrefNickNameHide = !$scope.hrefNickNameHide;
                }
                $scope.subHrefToggle = function () {
                    $scope.subHrefNickNameHide = !$scope.subHrefNickNameHide;
                }
                $scope.contentToggle = function () {
                    $scope.contentNickNameHide = !$scope.contentNickNameHide;
                }
                $scope.picToggle = function () {
                    $scope.picNickNameHide = !$scope.picNickNameHide;
                }
                $scope.picTitleToggle = function () {
                    $scope.picTitleNickNameHide = !$scope.picTitleNickNameHide;
                }
                $scope.addressToggle = function () {
                    $scope.addressNickNameHide = !$scope.addressNickNameHide;
                }


                $scope.titleSwitch = titleSwitch == "" ? "0" : titleSwitch;
                $scope.subTitleSwitch = subTitleSwitch == "" ? "0" : subTitleSwitch;
                $scope.hrefSwitch = hrefSwitch == "" ? "0" : hrefSwitch;
                $scope.subHrefSwitch = subHrefSwitch == "" ? "0" : subHrefSwitch;
                $scope.contentSwitch = contentSwitch == "" ? "0" : contentSwitch;
                $scope.picSwitch = picSwitch == "" ? "0" : picSwitch;
                $scope.picTitleSwitch = picTitleSwitch == "" ? "0" : picTitleSwitch;
                $scope.addressSwitch = addressSwitch == "" ? "0" : addressSwitch;


                $scope.titleNickName = "${frontType.title}";
                ;
                $scope.subTitleNickName = "${frontType.subTitle}";
                $scope.hrefNickName = "${frontType.href}";
                $scope.subHrefNickName = "${frontType.subHref}";
                $scope.contentNickName = "${frontType.content}";
                $scope.picNickName = "${frontType.thumbnailPic}";
                $scope.picTitleNickName = "${frontType.thumbnailTitle}";
                $scope.addressNickName = "${frontType.thumbnailAddress}";


                $("#remark").val("${frontType.remark}");

            });


            //修改成功后跳转主页
            function saveRule() {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: "<%=basePath%>admin/frontType/saveTypeRule",
                    data: $('#insert_form').serialize(),
                    success: function (result) {
                        alert(result);
                        window.location.href = "${pageContext.request.contextPath}/admin/fileFrontType/toAllTypeRulePage";
                    }
                });
            }

            //选择不同类型的时候加载不同的内容
            $("#chooseType").change(function () {
                var typeId = $("#chooseType").val();
                var action = "${pageContext.request.contextPath}/admin/fileFrontType/toTypeRulePage/" + typeId;
                window.location.href = action;
            })
            //返回
            function returnListPage() {
                var action = "${pageContext.request.contextPath}/admin/fileFrontType/toAllTypeRulePage";
                window.location.href = action;
            }
        </script>
        <!-- script end -->
    </div>
</div>
</body>
</html>
