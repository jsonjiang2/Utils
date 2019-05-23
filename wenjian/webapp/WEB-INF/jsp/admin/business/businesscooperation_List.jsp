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

        //清空查询条件(重置)
        function resetmeragent() {
            $("#firmname").val("");
            $("#type").val("");
        }
        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#firmname").val($.trim($("#firmname").val()));
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
        //跳转商务合作 添加页面
        function insertUI(){
        	window.location.href="${pageContext.request.contextPath}/admin/businesscooperation/insertUI";
        }
        //跳转商务合作 修改页面
        function updateUI(id){
        	window.location.href="${pageContext.request.contextPath}/admin/businesscooperation/updtaUI?id="+id;
        }
      	//查看公司logo
        function logoCheck(logostr){
        	var action = "${pageContext.request.contextPath}/admin/businesscooperation/logoCheck";
        	var params = {
        		"logostr":logostr
        	}
        	var callback = function(data){
        		  $("#crudType").hide();
                  $("#detailsModal").modal({
                      backdrop: 'static',
                      keyboard: false
                  });
                  $("#detail-modal-body").html(data);
        	}
        	
        	$.post(action,params,callback);
        }
      	//查询业务员详细信息
        function selectSalesman(id,type){
            var action = "${pageContext.request.contextPath}/admin/businesscooperation/cheakSalesman"; 
            var params={
            		"id":id,
            		"type":type
            }
            var callback = function (data) {
                $("#detailsModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#detail-modal-body").html(data);
            };
             $.post(action, params,callback); 
        }
      	
      	function deleteUI(id,firmname){
      		 var flag = confirm("确定要删除"+firmname);
      		var action = "${pageContext.request.contextPath}/admin/businesscooperation/deletes";
      		var params={
      				"id":id
      		}
      		if(flag){
	      		$.post(action,params,function(data){
	      			if(data.code=="88"){
	      				alert("删除成功");
	      				window.location.href="${pageContext.request.contextPath}/admin/businesscooperation/lists"
	      			}
	      		});
      		}
      	}
      	
    </script>
</head>
<body style="font-size:12px;font-family: 微软雅黑">

<div class="container" style="width: 80%;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/businesscooperation/lists" method="post" role="form" id="form-select">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>公司名称:</label>
                        <input style="width: 250px" type="text" class="form-control" name="firmname" id="firmname" value="${businessCooperation.firmname}" placeholder="填写公司名称">&nbsp;&nbsp;
                    </div>
                    
                    <div class="form-group">
	                     <label>类型:</label>
	                     <select class="form-control" name="type" id="type">
	                         <option value="">全部</option>
	                         <option value="1" <c:if test="${businessCooperation.type==1}">selected</c:if>>广告合作</option>
	                         <option value="2" <c:if test="${businessCooperation.type==2}">selected</c:if>>平台收录</option>
	                         <option value="3" <c:if test="${businessCooperation.type==3}">selected</c:if>>巴士名人堂</option>
	                         <option value="4" <c:if test="${businessCooperation.type==4}">selected</c:if>>钱多多回血</option>
	                         <option value="5" <c:if test="${businessCooperation.type==5}">selected</c:if>>友情链接</option>
	                         <option value="6" <c:if test="${businessCooperation.type==6}">selected</c:if>>其他合作</option>
	                     </select>&nbsp;&nbsp;
                    </div> 
	                
	                 <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询</button>
	                 <input type="button" value="重置" class="btn btn-default" id="reset"/>
	                
                </div>
                 <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;"></div>
            </form>
            
            
				<div class="btn btn-default" onclick="insertUI();" style="margin-left: 85%" class="btn">新增商务合作</div>
            
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr style="background-color: #CCCCCC;" class="text-center">
                    <td>序号</td>
                    <td>类型</td>
                    <td>公司LOGO</td>
                    <td>公司名称</td>
                    <td>业务员</td>
                    <td>操作时间</td>
                    <td>操作人</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list}" var="entity" varStatus="status">
                     <tr class="text-center">
                        <td>${status.count}</td>
                         <td>
                            <a href="javascript:selectByField('${entity.type}')" style="color: blue;">
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
							 <a href="javascript:logoCheck('${entity.logostr}')" style="color: blue">查看</a>				
						</td>
                        
                        <td>
		                      ${entity.firmname}
                        </td>
                        
                        <td>
                        	 <a href="javascript:selectSalesman('${entity.id}','${entity.type}')" style="color: blue">
                                 ${entity.number}个
                             </a>
                        </td>
                        
                        
                        <td>
                            <c:if test="${not empty entity.optiondate}">
                                ${sf.format(entity.optiondate)}
                            </c:if>
                        </td>
                        
                         <td>
                             ${entity.adminusername}
                        </td>
                        <td>
                        	<button class="btn" onclick="updateUI('${entity.id}')">修改</button>
							<button class="btn" onclick="deleteUI('${entity.id}','${entity.firmname}')">删除</button>			
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
