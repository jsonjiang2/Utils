<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>账户余额列表页面</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style>
        .text-center td {
            vertical-align: text-top !important;
            border: 1px solid #666;
        }
    </style>
    <script>
        //页面查询条件数据回显
        $(function(){
        	$(".remark-p").each(function() {
        		var num = $(this).html();
        		if (num.length > 5) {
        			$(this).html(num.substr(0, 5) + "...");
        		}
        	});
        	$("#userName_search").val("${username}");
        });

        //全局的pageNum与pageSize
        var pageNum = '${pagehelper.pageNum}';
        var pageSize = '${pagehelper.pageSize}';
        
        //详情页面跳转
        function deatilUI(id){
       	    $.post("/admin/userAccount/detail/"+id,function(data){
       		    $("#detail-modal-body").html(data);
       	    });
        }

        function queryUsername(username){
            $("#userName_search").val(username);
            $("#conditionForm").submit();
        }

        function queryAllPerson2(pageNum, pageSize) {
            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

    </script>
</head>

<body>
<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div style="margin-bottom:10px;"></div>
            <form action="${pageContext.request.contextPath}/admin/userAccount/selectByUserName" method="post" role="form"
                  id="conditionForm" class="form-inline">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                
                <div class="form-group">
				用户名：<input class="form-control" type="text" id="userName_search"
					name="username" style="text-align: center; line-height: 18px;"
					placeholder="填写用户名">
				</div> 
                &nbsp;&nbsp;
				<div class="form-group">
					<button class="btn btn-default" style="width: 100px;" onclick="queryAllPerson2(1,20)">查询</button>
					<button type="reset" class="btn btn-default" style="width: 100px;">重置</button>
				</div>	
				 &nbsp;&nbsp;
            </form>
            <table class="table  table-hover" id="personList_table" style="margin-top: 10px">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>用户名-姓名</td>
                    <td>用户总余额</td>
                    <td>可用余额</td>
                    <td>冻结余额</td>
                    <td>备注</td>
                    <td>详细信息</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>
                            <wdb:getUser uid="${entity.baseid}" var="user">
                                <a href="javascript:queryUsername('${user.username}')" style="color: blue;">
                                        ${user.username}--${user.realname}
                                </a>
                            </wdb:getUser>
                        </td>
                        <td>${entity.balance}</td>
                        <td>${entity.avlBalance }</td>
                        <td>${entity.freezeBalance}</td>
                        <td class="remark-p">${entity.remark }</td>
                        
                        <td>
                     		<button class="btn" data-backdrop="static" data-toggle="modal"
							data-dismiss="modal" data-target="#detailsModal"
							onclick="deatilUI('${entity.id}')">详细信息</button>
						</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <%@ include file="../../common/modal.jsp" %>
            <div id="page_div">
                <%@ include file="../../common/pagehelper2.jsp" %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
