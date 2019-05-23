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
//给资源主添加资源和产品数据校验
$(function(){
	$("#insertModal").on("shown.bs.modal",function(){
		$("#resourcesGroupResourceProduct_insertForm").bootstrapValidator({
			icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields:{
		        username:{
					validators:{
						notEmpty:{
							message:"请输入用户名"
						}/* ,
                        stringLength: {  
                            min: 5,  
                            max: 30,  
                            message: '用户名长度大于6位并且小于30位'  
                        }, */
					}
		        }
			}
		});
	});
	
	/* $("#updateModal").on("shown.bs.modal",function(){
		$("#resourcesGroupResourceProduct_insertForm").bootstrapValidator({
			icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields:{
		        username:{
					validators:{
						notEmpty:{
							message:"请输入用户名"
						},//此处逗号需要加上,否则传输到后台的第二条后面的参数前面会有逗号
					}
		        },
				ugroup:{
					validators:{
						notEmpty:{
							message:"请出入组别号"
						},
					}
				},
				ugroupname:{
					validators:{
						notEmpty:{
							message:"请出入组别名称"
						},
					}
				}
			}
		});
	}); */
});
</script>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
			<form class="form-horizontal" role="form"  id="resourcesGroupResourceProduct_insertForm">
			<%-- <c:if test="${empty preCommonMember}">
			    <label>暂无数据</label>
			</c:if> --%>
			<%-- <c:if test="${!empty preCommonMember}"> --%>
				<input type="hidden" id="id" name="id" value="${id}">
				<input type="hidden" id="resourceno" name="resourceno" value="${resourcesGroupResourceProduct.resourceno}">
				<input type="hidden" id="productno" name="productno" value="${resourcesGroupResourceProduct.productno}">
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="username">用户名</label>
					<div class="col-sm-3">
						<input type="text" name="username" id="username" value="" class="form-control" />
					</div>
				</div>
				<%-- <div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="ugroup">组别号</label>
					<div class="col-sm-3">
						<input type="text" name="ugroup" id="ugroup" value="${resourcesGroupResourceProduct.ugroup}" class="form-control" />
					</div>
				</div> --%>
				
				<%-- <div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="ugroupname">组别名称</label>
					<div class="col-sm-3">
						<input type="text" name="ugroupname" id="ugroupname" value="${resourcesGroupResourceProduct.ugroupname}" class="form-control" />
					</div>
				</div> --%>
				
				<%-- <div class="form-group">
					<label for="remark" class="col-sm-2 control-label laber_from">备注</label>
					<div class="col-sm-3">
						  <textarea rows="3" class="form-control" name="remark">${resourcesGroupResourceProduct.remark}</textarea>
					</div>
				</div> --%>
				
				
				
				<%-- </c:if> --%>
			</form>
		</div>
								
</body>
</html>
