<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

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

<script type="text/javascript">

</script>


<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form"  id="platformEvaluate_updateForm">
        <c:if test="${empty platformEvaluate}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty platformEvaluate}">
            <input type="hidden" name="id" value="${platformEvaluate.id}"/>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="digest">是否精华</label>
                <div class="col-sm-3">
                    <select name="digest" id="digest" class="form-control">
                        <option value="0" <c:if test="${platformEvaluate.digest eq '0'}">selected="selected"</c:if>>否</option>
                        <option value="1" <c:if test="${platformEvaluate.digest eq '1'}">selected="selected"</c:if>>是</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="display">页面显示</label>
                <div class="col-sm-3">
                    <select name="display" id="display" class="form-control">
                        <option value="0" <c:if test="${platformEvaluate.display eq '0'}">selected="selected"</c:if>>不显示</option>
                        <option value="1" <c:if test="${platformEvaluate.display eq '1'}">selected="selected"</c:if>>显示</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="display">普通定位</label>
                <div class="col-sm-3">
                    <select name="sort" id="sort" class="form-control">
                        <option value="100" <c:if test="${platformEvaluate.sort eq '100'}">selected="selected"</c:if>>不设置定位</option>
                        <option value="1" <c:if test="${platformEvaluate.sort eq '1'}">selected="selected"</c:if>>1</option>
                        <option value="2" <c:if test="${platformEvaluate.sort eq '2'}">selected="selected"</c:if>>2</option>
                        <option value="3" <c:if test="${platformEvaluate.sort eq '3'}">selected="selected"</c:if>>3</option>
                        <option value="4" <c:if test="${platformEvaluate.sort eq '4'}">selected="selected"</c:if>>4</option>
                        <option value="5" <c:if test="${platformEvaluate.sort eq '5'}">selected="selected"</c:if>>5</option>
                        <option value="6" <c:if test="${platformEvaluate.sort eq '6'}">selected="selected"</c:if>>6</option>
                        <option value="7" <c:if test="${platformEvaluate.sort eq '7'}">selected="selected"</c:if>>7</option>
                        <option value="8" <c:if test="${platformEvaluate.sort eq '8'}">selected="selected"</c:if>>8</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="evaluationtime1">评价时间</label>
                <div class="col-sm-3">
                    <input type="text" class="Wdate" id="evaluationtime1" name="evaluationtime1"
                           value="${dateUtils.formatDate(platformEvaluate.evaluationtime)}" style="width: 180px;height: 30px;"
                           onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
                    <span id="publicTimeError" style="color:red"></span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="remark">管理员备注：</label>
                <div class="col-sm-3">
                    <input type="text" name="remark" id="remark" value="${platformEvaluate.remark}" class="form-control" />
                </div>
            </div>

        </c:if>
    </form>
</div>

</body>
</html>
