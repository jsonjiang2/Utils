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

    <title>主副号绑定记录</title>
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
            $("#bindstatus").val("");
            $("#logo").val("");
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
     
        function selectByType(type) {
            if (type != "") {
                $("#bindstatus").val(type);
            }
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }
        
        function selectByLogo(logo) {
            if (logo != "") {
                $("#logo").val(logo);
            }
            pageNum = 1;
            selectByCondition(pageNum, pageSize);
        }

        function selectByCondition(pageNum, pageSize) {
            //去掉查询条件两边的空格
            $("#username").val($.trim($("#username").val()));
            $("#bindstatus").val($.trim($("#bindstatus").val()));
            $("#logo").val($.trim($("#logo").val()));

            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#conditionForm").submit();
        }

        //分页
        function queryAllPerson2(pageNum, pageSize) {
            selectByCondition(pageNum, pageSize);
        }
		
        //绑定页面跳转
        function bind(id){
            var action = "${pageContext.request.contextPath}/admin/predepudybind/editor"; 
            var params={
            		"id":id
            }
            var callback = function (data) {
                $("#crudType").hide();
                $("#Modal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
                $("#modal-body").html(data);
            };
             $.post(action, params,callback); 
        }

        //解绑
        function unbind(id,username){
            var action = "${pageContext.request.contextPath}/admin/predepudybind/unbind"; 
            var params={
            		"id":id
            }
            var callback = function (data) {
               if(data.code=="88"){
            	   alert(data.message);
            	   window.location.href="${pageContext.request.contextPath}/admin/predepudybind/lists"; //刷新到首页
               }
               if(data.code=="00"){
            	   alert(data.message);
               }
            };
            var flag = confirm("确定要对用户:" +  username + " 解除绑定?");
            if (flag) {
            	 $.post(action, params, callback); 
             }
        }
        
        function add_bind(){
        	var action = "${pageContext.request.contextPath}/admin/predepudybind/bind";
        	var params = {
        			"id":$("#bind_id").val(),
        			"username":$("#bind_username").val()
        	}
        	$.post(action,params,function(data){
        		if(data.code=="88"){
        			$("#username_error").text("");
        			alert(data.message);
        			window.location.href="${pageContext.request.contextPath}/admin/predepudybind/lists"; //刷新到首页
        		}
        		 if(data.code=="00"){
        			  $("#username_error").text("* "+data.message);
                 }
        	},'json');
        }
        
      //按钮主副号绑定页面跳转
        function add(){
        	$.post("/admin/predepudybind/insertBind", function(data){
        		$("#insert-modal-body2").html(data);
        	});
        }
      
      //点击保存的时候保存名单
        function insert2(){
        	var  action="${pageContext.request.contextPath}/admin/predepudybind/insertAll.action";
        	$.post(action,$("#insertSmallForm").serialize(),function(data){
        		if(data.code=="00"){
        			alert(data.message);
        			return false;
        		}
        		if(data.code=="88"){
        			alert("绑定成功");
        			window.location.href="${pageContext.request.contextPath}/admin/predepudybind/lists";
        		} 
        		
        	});  
        }

    </script>
</head>
<body style="font-size:12px;font-family: 微软雅黑">

<div class="container" style="width: 80%;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form action="${pageContext.request.contextPath}/admin/predepudybind/lists" method="post" role="form" id="conditionForm">
                <input type="hidden" id="pageNum" name="pageNum"/>
                <input type="hidden" id="pageSize" name="pageSize"/>
                <div class="col-md-9 form-inline" style="margin-top:15px;">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" name="username" id="username" value="${preDepudyBind.username}" placeholder="填写用户名">&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>绑定状态:</label>
                        <select class="form-control" name="bindstatus" id="bindstatus">
                            <option value="">全部</option>
                            <option value="1" <c:if test="${preDepudyBind.bindstatus==1}">selected</c:if>>已绑定</option>
                            <option value="2" <c:if test="${preDepudyBind.bindstatus==2}">selected</c:if>>已解绑</option>
                        </select>&nbsp;&nbsp;
                    </div>
                    <input type="hidden" name="logo" id="logo" value="${preDepudyBind.logo}" />
	                
	                 <button id="query_btn" class="btn btn-default" onclick="selectByCondition(1,20)">查询</button>
	                 <input type="button" value="重置" class="btn btn-default" id="reset"/>
	                
                </div>
                 <div class="col-md-9 form-inline" style="margin-top:6px;margin-bottom: 6px;"></div>
            </form>
            
            
				<div class="btn btn-default" onclick="add();" style="margin-left: 85%" 
					class="btn" data-backdrop="static" data-toggle="modal" data-dismiss="modal"
										data-target="#insertModal2">主副号绑定
				</div>
            
            <table class="table  table-hover" id="personList_table">
                <thead>
                <tr style="background-color: #CCCCCC;" class="text-center">
                    <td>序号</td>
                    <td>用户名</td>
                    <td>绑定标识</td>
                    <td>绑定状态</td>
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
                            <a href="javascript:selectByField('${entity.username}')" style="color: blue;">
                                    ${entity.username}
                            </a>
                        </td>
                        
                        <td>
                         	<a href="javascript:selectByLogo('${entity.logo}')" style="color: blue;">
		                       	<c:if test="${!empty entity.logo}">
		                        	${entity.logo}
		                         </c:if>
		                           
		                         <c:if test="${empty entity.logo}">
		                           	--
		                         </c:if>
	                        </a> 
                        </td>
                        
                        <td>
                        	 <a href="javascript:selectByType('${entity.bindstatus}')">
                                   <c:if test="${entity.bindstatus eq 1}">
                                   		<span style="color: blue;">已绑定</span>
                                   </c:if>
                                   <c:if test="${entity.bindstatus eq 2}">
                                   		<span style="color: red;">未绑定</span>
                                   </c:if>
                             </a>
                        </td>
                        
                        
                        <td>
                            <c:if test="${not empty entity.operationdate}">
                                ${sf.format(entity.operationdate)}
                            </c:if>
                        </td>
                        
                         <td>
                            <c:if test="${entity.operationtype eq 1}">
                                <c:if test="${not empty entity.operationusername}">
                                	<span style="color: red;">${entity.operationusername}</span>
                                </c:if>
                                <c:if test="${empty entity.operationusername}">
                                	<span style="color: red;">管理员</span>
                                </c:if>
                            </c:if>
                            
                           <c:if test="${entity.operationtype eq 2}">
                                <c:if test="${not empty entity.operationusername}">
                                	${entity.operationusername}
                                </c:if>
                                <c:if test="${empty entity.operationusername}">
                                	普通用户
                                </c:if>
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${entity.bindstatus eq 1}">
                        	<!-- 	<button>去解绑</button>  -->
								<button class="btn btn-default" onclick="unbind('${entity.id}','${entity.username}')"><span style="color: red">去解绑</span></button>
                        	</c:if>
                        	<c:if test="${entity.bindstatus eq 2}">
                        		<!-- <button>去绑定</button>  -->
								<button class="btn btn-default" onclick="bind('${entity.id}')"><span style="color: blue">去绑定</span></button>
                        	</c:if>
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
	   <!-- 模态框 -->
            <div class="modal fade" id="Modal" tabindex="-1" role="dialog"
                 aria-labelledby="delModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" onclick="clearMode('modal-body')"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="delModalLabel">
                                <span class="glyphicon glyphicon-info-sign"></span>提示：您正在进行主副号绑定操作
                            </h4>
                        </div>
                        <div id="modal-body" class="modal-body"></div>
                        <input type="hidden" id="crud"/>
                        <div class="modal-footer">
								<button type="button" id="btn-insert" class="btn btn-primary"
									onclick="add_bind()">确定</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							</div>
                    </div>
                </div>
            </div>
            
    <div class="modal fade" id="insertModal2" tabindex="-1" role="dialog"
		aria-labelledby="addModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addModalLabel">
						<span class="glyphicon glyphicon-info-sign"></span>提示：正在进行主副号绑定操作
					</h4>

				</div>
				<div id="insert-modal-body2" class="modal-body" style="min-height: 350px"></div>
				<div class="modal-footer">
					<button type="button" id="btn-insert" class="btn btn-primary"
						onclick="insert2()">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
