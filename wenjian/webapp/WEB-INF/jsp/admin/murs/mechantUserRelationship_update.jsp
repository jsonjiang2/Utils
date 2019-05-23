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
<script type="text/javascript">
//修改数据校验
$(function(){
	$("#updateModal").on("shown.bs.modal",function(){
		$("#mechantUserRelationship_updateForm").bootstrapValidator({
			icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields:{
	        	merno:{
					validators:{
						notEmpty:{
							message:"请输入商户号"
						}/* ,
						remote:{
							message: '该商户号已存在',
		                    url: '${pageContext.request.contextPath }/admin/bsinessmanagement/vlidataMerchants.action',
		                    //发送动态数据                    
		                    data: function(validator, $field, value) {
		                        return {
		                        	merchants: validator.getFieldElements('merchants').val()
		                        };
		                    },                      
		                    type: 'POST',

						} */
					}
		        },
		        username:{
					validators:{
						notEmpty:{
							message:"请输入用户名"
						}
					}
		        }
				
			
			}
		});
	});
});
</script>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
			<form class="form-horizontal" role="form"  id="mechantUserRelationship_updateForm">
			<c:if test="${empty mechantUserRelationship}">
			    <label>暂无数据</label>
			</c:if>
			<c:if test="${!empty mechantUserRelationship}">
				<input type="hidden" name="id" value="${mechantUserRelationship.id}"/>
					
					<div class="form-group">
						<label class="col-sm-2 control-label laber_from" for="merchants">商户号</label>
						<div class="col-sm-3">
							<input type="text" name="merno" id="merno" value="${mechantUserRelationship.merno}" class="form-control" disabled="disabled"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label laber_from" for="username">用户名</label>
						<div class="col-sm-3">
							<input type="text" name="username" id="username" value="${mechantUserRelationship.username}" class="form-control" />
						</div>
					</div>
				</c:if>
			</form>
		</div>
								
</body>
</html>
