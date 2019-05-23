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

    <title>商务合作列表</title>
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
        

        function selectByType(type) {
            if (type != "") {
                $("#type").val(type);
            }
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        //清空查询条件(重置)
        function resetmeragent() {
            $("#realname").val("");
            $("#mobile").val("");
            $("#qqcode").val("");
            $("#weicat").val("");
            $("#type").val("");
        }
        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#realname").val($.trim($("#realname").val()));
            $("#mobile").val($.trim($("#mobile").val()));
            $("#qqcode").val($.trim($("#qqcode").val()));
            $("#weicat").val($.trim($("#weicat").val()));
            $("#type").val($.trim($("#type").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#form-select").submit();
        }

        //分页
        function queryAllPerson(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }
//--------------------------------------------------------------------------------------------------------
      	//查看业务员头像
        function touxCheck(id){
        	var action = "${pageContext.request.contextPath}/admin/businessCooperationSalesman/touxCheck";
        	var params = {
        		"id":id
        	}
        	var callback = function(data){
                  $("#detailsModal").modal({
                      backdrop: 'static',
                      keyboard: false
                  });
                  $("#detail-modal-body").html(data);
        	}
        	
        	$.post(action,params,callback);
        }
      	//查看业务员微信二维码
        function weixCheck(id){
        	var action = "${pageContext.request.contextPath}/admin/businessCooperationSalesman/weixCheck";
        	var params = {
        		"id":id
        	}
        	var callback = function(data){
                  $("#detailsModal").modal({
                      backdrop: 'static',
                      keyboard: false
                  });
                  $("#detail-modal-body").html(data);
        	}
        	
        	$.post(action,params,callback);
        }
      	
      	
    </script>
</head>
<body style="font-size:12px;font-family: 微软雅黑">

<div class="container" style="width: 80%;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/businessCooperationSalesman/lists" method="post" role="form" id="form-select">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>姓名:</label>
                        <input type="text" class="form-control" name="realname" id="realname" value="${salesman.realname}" placeholder="填写姓名">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>电话:</label>
                        <input type="text" class="form-control" name="mobile" id="mobile" value="${salesman.mobile}" placeholder="填写电话">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>QQ号:</label>
                        <input type="text" class="form-control" name="qqcode" id="qqcode" value="${salesman.qqcode}" placeholder="填写QQ号码">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>微信:</label>
                        <input type="text" class="form-control" name="weicat" id="weicat" value="${salesman.weicat}" placeholder="填写微信号">&nbsp;&nbsp;
                    </div>
                    <div class="form-group" style="margin-top: 10px">
                        <label>类型:</label>
                        <select class="form-control" name="type" id="type">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${salesman.type==1}">selected</c:if>>广告合作</option>
                            <option value="2" <c:if test="${salesman.type==2}">selected</c:if>>平台收录</option>
                            <option value="3" <c:if test="${salesman.type==3}">selected</c:if>>巴士名人堂</option>
                            <option value="4" <c:if test="${salesman.type==4}">selected</c:if>>钱多多回血</option>
                            <option value="5" <c:if test="${salesman.type==5}">selected</c:if>>友情链接</option>
                            <option value="6" <c:if test="${salesman.type==6}">selected</c:if>>其他合作</option>
                        </select>&nbsp;&nbsp;
                    </div> 
	                
	                 <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)" style="margin-top: 10px">查询</button>
	                 <input type="button" value="重置" class="btn btn-default" id="reset"  style="margin-top: 10px"/>
	                
                </div>
                 <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;"></div>
            </form>
            
          
            
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr style="background-color: #CCCCCC;" class="text-center">
                    <td>序号</td>
                    <td>类型</td>
                    <td>头像</td>
                    <td>姓名</td>
                    <td>电话</td>
                    <td>QQ号码</td>
                    <td>微信号码</td>
                    <td>微信二维码</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list}" var="entity" varStatus="status">
                     <tr class="text-center">
                        <td>${status.count}</td>
                        <td>
	                         <a href="javascript:selectByType('${entity.type}')" style="color: blue;">
	                                 <c:if test="${entity.type eq 1}">
	                                 	广告合作
	                                </c:if>
	                                 <c:if test="${entity.type eq 2}">
	                                 	平台收录
	                                </c:if>
	                                 <c:if test="${entity.type eq 3}">
	                                 	巴士名人堂
	                                </c:if>
	                                 <c:if test="${entity.type eq 4}">
	                                 	钱多多回血
	                                </c:if>
	                                 <c:if test="${entity.type eq 5}">
	                                 	友情链接
	                                </c:if>
	                                 <c:if test="${entity.type eq 6}">
	                                 	其他合作
	                                </c:if>
	                            </a> 
                         </td>
                        <td>      
							 <a href="javascript:touxCheck('${entity.id}')" style="color: blue">查看</a>				
						</td>
                        
                        <td>${entity.realname}</td>
                        <td>${entity.mobile}</td>
                        <td>${entity.qqcode}</td>
                        <td>${entity.weicat}</td>
                        
                        <td>      
							 <a href="javascript:weixCheck('${entity.id}')" style="color: blue">查看</a>				
						</td>
                        
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="page_div">
                <%@ include file="./../../common/pagehelper.jsp"%>
            </div>

        </div>
    </div>
</div>
	<!-- 引入公共的模态框 -->
	<%@ include file="./../../common/modal.jsp"%>
</body>
</html>
