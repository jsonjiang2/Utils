
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
    <script src="https://cdn.bootcss.com/angular.js/1.4.6/angular.min.js"></script>
    <link href="<%=basePath%>static/plugin/assets/css/dpl-min.css" rel="stylesheet"
          type="text/css" />
    <link href="<%=basePath%>static/plugin/assets/css/bui-min.css" rel="stylesheet"
          type="text/css" />
    <link href="<%=basePath%>static/plugin/assets/css/main-min.css" rel="stylesheet"
          type="text/css" />
</head>
<body>
<div class="container" style="width:80%;margin-left: 25%;font-size: 12px; font-family: 微软雅黑">
<div class="demo-content">

    <!-- 表单页 ================================================== -->
    <div class="row">
        <div class="span24" class="form-group">
            <hr>
            <form id="insert_form" class="form-horizontal" method="post">
                <h3>添加类型：</h3>
	    		<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="type">类型编码</label>
					<div class="col-sm-3">
						<input value="${nextTypeCode}" disabled="disabled" class="form-control"/>
					</div>
				</div>
				
	    		<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="type">类型名称</label>
					<div class="col-sm-3">
						<input  name="typeName"  class="form-control" data-rules="{required:true}"/>
					</div>
				</div>
				
	    		<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="type">类型</label>
					<div class="col-sm-3">
						<!-- <input  name="type"  class="form-control" data-rules="{required:true}"/> -->
						<select name="type" class="form-control">
							<option value="1">友情链接类型</option>
							<option value="2">QQ群类型</option>
						</select>
					</div>
				</div>
				
	    		<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="type">类型备注</label>
					<div class="col-sm-3">
						 <textarea name="typeRemark" class="input-large form-control" data-rules="{required:true}"></textarea>
					</div>
				</div>
                
                
                <!-- <div class="control-group">
                    <label class="control-label"><s>*</s>类型名称：</label>
                    <div class="controls">
                        <input type="text" name="typeName" class="control-text" data-rules="{required:true}">
                    </div>
                </div> -->
               <!--  <div class="control-group">
                    <label class="control-label"><s>*</s>类型备注：</label>
                    <div class="controls control-row4">
                        <textarea type="text"name="typeRemark" class="input-large" data-rules="{required:true}"></textarea>
                    </div>
                </div> -->

                <hr>
              <!--   <div class="form-actions span5 offset3">
                    <button type="button" class="button btn-default" onclick="returnListPage()">返回</button>
                    <button  type="button" class="button btn-default" onclick="saveType();" >提交</button>
                </div> -->
                
                <div class="form-actions span5 offset3">
                    <button type="button" class="btn btn-default" onclick="returnListPage()">返回</button>
                    <button type="button" class="btn btn-default" onclick="saveType()">提交</button>
                </div>
            </form>
        </div>
    </div>
    <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
    <script src="http://g.tbcdn.cn/fi/bui/seed-min.js?t=201212261326"></script>
    <script type="text/javascript">
        BUI.use('bui/form',function  (Form) {
            new Form.Form({
                srcNode : '#insert_form'
            }).render();
        });

        function returnListPage() {
            var action = "${pageContext.request.contextPath}/admin/frontType/typeList";
            window.location.href=action;
        }
        function saveType(){
        	var action = "${pageContext.request.contextPath}/admin/frontType/saveType";
        	$.post(action,$("#insert_form").serialize(),function(data){
        		if(data.code=="200"){
        			alert(data.msg);
        			window.location.href="${pageContext.request.contextPath}/admin/frontType/typeList";
        		}else{
        			alert(data.msg);
        		}
        	});
        	
        }
        
    </script>
    <!-- script end -->
</div>
</div>
</body>
</html>
