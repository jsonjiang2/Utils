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

    <title>商务合作类型介绍列表</title>
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

        $(function () {
            $(".remark-p").each(function (i) {
                var num = $(this).text();
                if (num.length > 20) {
                    $(this).text(num.substr(0, 20) + "...");
                }
            });
            //重置
            $("#reset").click(function () {
                resetmeragent();
            });
        });
        
        //清空查询条件(重置)
        function resetmeragent() {
            $("#type").val("");
        }
        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#type").val($.trim($("#type").val()));
            $("#form-select").submit();
        }

        //分页
        function queryAllPerson(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }
//--------------------------------------------------------------------------------------------------------
      //新增页面跳转
        function insertUI(){
        	var action = "${pageContext.request.contextPath}/admin/businesscooperationtype/insertUI";
        	var callback = function(data){
                  $("#insertModal").modal({
                      backdrop: 'static',
                      keyboard: false
                  });
                  $("#insert-modal-body").html(data);
        	}
        	$.post(action,callback);
        }
        /**保存*/
        function insert(){
        	var jsonData = $("#type_insertFrom").serialize();
            var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
            var action = "${pageContext.request.contextPath}/admin/businesscooperationtype/save";
            $.post(action,params,function(data){
            	if(data.code=="88"){
            		flush();
            	}
            	if(data.code=="00"){
            		alert(data.message);
            	}
            },'json');
        }
      
        function flush(){
        	window.location.href="${pageContext.request.contextPath}/admin/businesscooperationtype/lists"
        }
      	//修改页面跳转
        function updateUI(id){
        	var action = "${pageContext.request.contextPath}/admin/businesscooperationtype/updateUI";
        	var params = {
        		"id":id
        	}
        	var callback = function(data){
                  $("#updateModal").modal({
                      backdrop: 'static',
                      keyboard: false
                  });
                  $("#update-modal-body").html(data);
        	}
        	
        	$.post(action,params,callback);
        }
 		
      	//修改
      	function update(){
      		var jsonData = $("#type_updateForm").serialize();
            var params = decodeURIComponent(jsonData,true);//处理时间10:00,提交的时候乱码 103A00
            var action = "${pageContext.request.contextPath}/admin/businesscooperationtype/updates"
            $.post(action,params,function(data){
            	if(data.code=="88"){
            		flush();
            	}
            	if(data.code=="00"){
            		alert(data.message);
            	}
            },'json');
      	}
      	
    </script>
</head>
<body style="font-size:12px;font-family: 微软雅黑">

<div class="container" style="width: 80%;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/businesscooperationtype/lists" method="post" role="form" id="form-select">
                <div class="col-md-9 form-inline" style="margin-top:15px;">
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
            <div class="btn btn-default" onclick="insertUI();" style="margin-left: 85%" class="btn">新增商务类型介绍</div>
          
            
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr style="background-color: #CCCCCC;" class="text-center">
                    <td>序号</td>
                    <td>商务类型</td>
                    <td>类型介绍</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${lists}" var="entity" varStatus="status">
                     <tr class="text-center">
                        <td>${status.count}</td>
                        <td>
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
                         </td>
                        <td class="remark-p">${entity.brief}</td>
                        <td><button class="btn" onclick="updateUI('${entity.id}')">修改</button></td>
                        
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
	<!-- 引入公共的模态框 -->
	<%@ include file="./../../common/modal.jsp"%>
</body>
</html>
