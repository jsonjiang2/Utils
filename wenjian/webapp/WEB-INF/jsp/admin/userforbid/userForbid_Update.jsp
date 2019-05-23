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
    <form class="form-horizontal" role="form" id="userForbid_updateForm">
        <input class="forInp" type="hidden" name="forbidtype" id="forbidtype" value="${userForbid.forbidtype}"/>
        <c:if test="${empty userForbid}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty userForbid}">
            <input type="hidden" name="id" value="${userForbid.id}"/>

            <%--<div class="form-group">--%>
                <%--<label class="col-sm-2 control-label laber_from" for="forbidtype">禁止类型</label>--%>
                <%--<div class="col-sm-3">--%>
                    <%--<select name="forbidtype" id="forbidtype" class="form-control">--%>
                        <%--<option value="2" <c:if test="${userForbid.forbidtype eq '2'}">selected="selected"</c:if>>用户名</option>--%>
                        <%--<option value="1" <c:if test="${userForbid.forbidtype eq '1'}">selected="selected"</c:if>>IP</option>--%>
                        <%--<option value="1" <c:if test="${userForbid.forbidtype eq '3'}">selected="selected"</c:if>>回复审核</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
            <%--</div>--%>
            <c:if test="${userForbid.forbidtype eq '1' || userForbid.forbidtype eq '2'}">
                <div class="form-group">
                    <label class="col-sm-2 control-label laber_from" for="typecontent">禁止类型</label>
                    <div class="col-sm-3">
                         <c:if test="${userForbid.forbidtype eq '1'}">
                            <input type="text" value="IP" disabled class="form-control" />
                         </c:if>
                         <c:if test="${userForbid.forbidtype eq '2'}">
                            <input type="text" value="用户名" disabled class="form-control" />
                         </c:if>
                    </div>
                </div>
                <div class="form-group typecontentDiv">
                    <label class="col-sm-2 control-label laber_from" for="typecontent">类型内容</label>
                    <div class="col-sm-3">
                        <input type="text"  name="typecontent" id="typecontent" value="${userForbid.typecontent}" class="form-control typecontentVal" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label laber_from" for="forbidcontent">禁止内容</label>
                    <div class="col-sm-3">
                        <select name="forbidcontent" id="forbidcontent" class="form-control">
                            <option value="1" <c:if test="${userForbid.forbidcontent eq '1'}">selected="selected"</c:if>>登录</option>
                            <option value="2" <c:if test="${userForbid.forbidcontent eq '2'}">selected="selected"</c:if>>发帖</option>
                            <option value="3" <c:if test="${userForbid.forbidcontent eq '3'}">selected="selected"</c:if>>回复</option>
                            <option value="4" <c:if test="${userForbid.forbidcontent eq '4'}">selected="selected"</c:if>>访问</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label laber_from" for="forbiddaynum">禁止天数</label>
                    <div class="col-sm-3">
                        <input type="text" name="forbiddaynum" id="forbiddaynum" value="${userForbid.forbiddaynum}" class="form-control" />
                    </div>
                </div>
            </c:if>



            <c:if test="${userForbid.forbidtype eq '3'}">
                <div class="form-group">
                    <label class="col-sm-2 control-label laber_from" for="typecontent">禁止类型</label>
                    <div class="col-sm-3">
                         <input type="text" value="回复审核" disabled class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label laber_from" for="typecontent">关键字</label>
                    <div class="col-sm-3">
                        <input type="text" name="typecontent" value="${userForbid.typecontent}" class="form-control" />
                    </div>
                </div>
            </c:if>


            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="remark">备注</label>
                <div class="col-sm-3">
                    <input type="text" name="remark" id="remark" value="${userForbid.remark}" class="form-control" />
                </div>
            </div>

        </c:if>
    </form>
</div>

<script>


</script>


</body>
</html>
