<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>角色认证申请</title>
    <script type="text/javascript" src="${basePath}/static/plugin/jquery/1.11.3/jquery-1.11.3.js"></script>
    <link href="${basePath}/static/plugin/assets/css/dpl-min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${basePath}/static/plugin/assets/css/bui-min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${basePath}/static/plugin/assets/css/main-min.css" rel="stylesheet"
          type="text/css"/>
</head>
<body>
<div class="container" style="width:80%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <!--demo begin -->
            <div class="demo-content">
                <!-- 表单页 ================================================== -->
                <div class="row" style="margin:auto">
                    <div class="span24">
                        <h2>角色认证</h2>
                        <hr>
                        <form id="J_Form" class="form-horizontal" method="post" action="${basePath}/admin/systemrole/roleAudit">

                            <div class="control-group">
                                <label class="control-label"><s>*</s>申请角色：</label>
                                <div class="controls">
                                    <select data-rules="{required:true}" id="roleId" name="roleId">
                                        <option value="">-请选择-</option>
                                    </select>
                                </div>
                            </div>



                            <hr>
                            <div class="form-actions span5 offset3">
                                <button id="btnSearch" type="submit" class="button button-primary">提交</button>
                            </div>
                        </form>
                    </div>
                </div>
                <script src="http://g.tbcdn.cn/fi/bui/seed-min.js?t=201212261326"></script>
                <script type="text/javascript">
                    $(function(){
                      $.ajax({
                          url:"${basePath}/admin/systemrole/roleNames",
                          success:function(roleList){
                              var array=new Array();
                              array=roleList;
                            for(var i=0;i<array.length;i++){
                                $("#roleId").append("<option value='"+array[i].roleId+"'>"+array[i].roleName+"</option>");
                            }
                          }
                      });
                    });
                    BUI.use('bui/form', function (Form) {
                        new Form.Form({
                            srcNode: '#J_Form'
                        }).render();
                    });
                </script>
                <!-- script end -->
            </div>
            <!--demo end -->
        </div>
    </div>
</div>
</body>
</html>
