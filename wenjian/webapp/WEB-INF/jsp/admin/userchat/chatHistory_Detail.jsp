<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<script type="text/javascript" charset="utf-8" src="${basePath}/static/subjectrelease/js/wangEditor.js"></script>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body  style="font-family:'微软雅黑'; ">
    <div class="container"  style="margin-top: 25px;">
        <form class="form-horizontal" role="form"  id="updateFrontForm">
<%--

            <div class="form-group">
                <label class="col-sm-1 control-label laber_from">发送者</label>
                <div class="col-sm-2" style="width: 38%; padding-top: 7px">
                    <wdb:getUser uid="${data.senduid}" var="SendUserChatHistory2">
                        ${SendUserChatHistory2.username}
                    </wdb:getUser>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-1 control-label laber_from">接收者</label>
                <div class="col-sm-2" style="width: 38%; padding-top: 7px">
                    <wdb:getUser uid="${data.receiveuid}" var="SendUserChatHistory2">
                        ${SendUserChatHistory2.username}
                    </wdb:getUser>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-1 control-label laber_from">添加时间</label>
                <div class="col-sm-1" style="width: 16%; padding-top: 7px">
                    ${empty data.receivedate ? '':dateUtils.formatYY_MM_DD(data.receivedate)}
                </div>
            </div>
--%>

            <div class="form-group">
                <label class="col-sm-1 control-label laber_from">内容：</label>
                <div class="col-sm-2" style="width: 20%" >
                    <textarea rows="4" class="form-control">${data.chatmessage}</textarea>
                </div>
            </div>

        </form>
    </div>
</body>
</html>