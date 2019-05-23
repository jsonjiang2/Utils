<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <title>第三方绑定</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
        #personList_table{
            font-style: normal;
            font-variant-ligatures: normal;
            font-variant-caps: normal;
            font-variant-numeric: normal;
            font-weight: normal;
            font-stretch: normal;
            font-size: 12px;
            line-height: 24px;
            font-family: "Microsoft Yahei", "冬青黑体简体中文 w3", 宋体;
            overflow-y: auto;
        }
        #tableId tr td{
            border:none;
        }
    </style>
    <script type="text/javascript">

        /*
         全局的pageNum与pageSize
         */
        var pageNum='${pagehelper.pageNum}';
        var pageSize='${pagehelper.pageSize}';

        $(function () {
            $(".remark-p").each(function (i) {
                var num = $(this).text();
                if (num.length > 5) {
                    $(this).text(num.substr(0, 5) + "...");
                }
            });
            //重置
            $("#reset").click(function () {
                resetmeragent();
            });
        });

        //清空查询条件(重置)
        function resetmeragent() {
            $("#username").val("");
            $("#isbind").val("");
            $("#type").val("");
            $("#uin").val("");
        }

        //点击List列表页面中字段进行查询
        function selectByField(username) {
            if (username != "") {
                $("#username").val(username);
            }
            //防止用户在非第一页触发这个方法：如pageNum=3,paymode的值为1,数据库中符合paymode为1的数据只有2页，这时就会查不出数据了
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }
        function selectByUin(uin) {
            if (uin != "") {
                $("#uin").val(uin);
            }
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }
        
        function selectByType(type) {
            if (type != "") {
                $("#type").val(type);
            }
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }
        function selectByBind(isbind) {
            if (isbind != "") {
                $("#isbind").val(isbind);
            }
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#username").val($.trim($("#username").val()));
            $("#isbind").val($.trim($("#isbind").val()));
            $("#type").val($.trim($("#type").val()));
            $("#uin").val($.trim($("#uin").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }

        //详情页面跳转
        function deatilUI(id){
            var action = "${pageContext.request.contextPath}/admin/third/selectById/" + id;
            $.post(action, function(data){
        		$("#detail-modal-body").html(data);
        	});
        }

    </script>
</head>
<body style="font-size:12px;font-family: 微软雅黑">

<div class="container" style="width: 80%;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/third/lists" method="post" role="form" id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${pcm.username}" placeholder="填写用户名">&nbsp;&nbsp;
                    </div>
                   <%--   <div class="form-group">
                        <label>授权码:</label>
                        <input type="text" class="form-control" name="uin" id="uin" value="${pcm.uin}" placeholder="填写授权码">&nbsp;&nbsp;
                    </div>
                   --%>
                    <div class="form-group">
                        <label>绑定状态:</label>
                        <select class="form-control" name="isbind" id="isbind">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${pcm.isbind==1}">selected</c:if>>已绑定</option>
                            <option value="2" <c:if test="${pcm.isbind==2}">selected</c:if>>已解绑</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    
                     <div class="form-group">
                        <label>类型:</label>
                        <select class="form-control" name="type" id="type">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${pcm.type==1}">selected</c:if>>QQ</option>
                            <option value="2" <c:if test="${pcm.type==2}">selected</c:if>>微信</option>
                            <option value="3" <c:if test="${pcm.type==3}">selected</c:if>>微博</option>
                        </select>&nbsp;&nbsp;
                    </div>
	                
	                 <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询</button>
	                 <input type="button" value="重置" class="btn btn-default" id="reset"/>
	                
                </div>
                 <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;"></div>
            </form>
            
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr style="background-color: #CCCCCC;" class="text-center">
                    <td>序号</td>
                    <td>用户名</td>
                   <!--  <td>授权码</td> -->
                    <td>类型</td>
                    <td>用户类型</td>
                    <td>昵称</td>
                    <td>绑定状态</td>
                    <td>绑定时间</td>
                    <td>操作时间</td>
                    <td>详情</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list}" var="entity" varStatus="status">
                    <tr class="text-center">
                        <td>${status.count}</td>
                        
                        <td>
                            <a href="javascript:selectByField('${entity.username}')" style="color: blue;">
                                    ${entity.username}
                            </a>
                        </td>
                        
                     <%--    <td>
                        	 <a href="javascript:selectByUin('${entity.uin}')" style="color: blue;">
                                    ${entity.uin}
                             </a>
                        </td>
                         --%>
                        <td>
                        	 <a href="javascript:selectByType('${entity.type}')">
                                   <c:if test="${entity.type eq 1}">
                                   		<span style="color: blue;">QQ</span>
                                   </c:if>
                                   <c:if test="${entity.type eq 2}">
                                   		<span style="color: green;">微信</span>
                                   </c:if>
                                   <c:if test="${entity.type eq 3}">
                                   		<span style="color: red;">微博</span>
                                   </c:if>
                             </a>
                        </td>
                        
                        
                        <td>
                        	<c:if test="${!empty entity.isolduse}">
	                        	<c:if test="${entity.isolduse eq 1}">
	                                 	老用户
	                            </c:if>
	                            <c:if test="${entity.isolduse eq 0}">
	                                 	新用户
	                            </c:if>
                            </c:if>
                            
                            <c:if test="${empty entity.isolduse}">
                            	老用户
                            </c:if>
                        </td>
                        
                        <td>
                        	<c:if test="${!empty entity.nickname}">
	                        	${entity.nickname}
                            </c:if>
                            
                            <c:if test="${empty entity.nickname}">
                            	--
                            </c:if>
                        </td>
                        
                        <td>
                        	<%--  <a href="javascript:selectByBind('${entity.isbind}')"> --%>
                        	 	<c:if test="${not empty entity.isbind}">
                        	 		<c:if test="${entity.isbind eq 1}">
                                   		<span style="color: blue;">已绑定</span>
                                   </c:if>
                                   <c:if test="${entity.isbind eq 2}">
                                   		<span style="color: red;">已解绑</span>
                                   </c:if>
                        	 	</c:if>
                        	 	
                        	 	<c:if test="${empty entity.isbind}">
                        	 		<span style="color: blue;">已绑定</span>
                        	 	</c:if>
                             <!-- </a> -->
                        </td>
                        
                        <td>
                            <c:if test="${not empty entity.dateline}">
                                ${sf.format(entity.dateline)}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty entity.operationdate}">
                                ${sf.format(entity.operationdate)}
                            </c:if>
                        </td>
                        <td>
                        	<button class="btn" data-backdrop="static"
										data-toggle="modal" data-dismiss="modal"
										data-target="#detailsModal"
										onclick="deatilUI('${entity.id}')">查看</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="page_div">
                <%@ include file="./../../common/pagehelper2.jsp"%>
            </div>

        </div>
    </div>
</div>
<!-- 引入公共的模态框 -->
	<%@ include file="./../../common/modal.jsp"%>
</body>
</html>
