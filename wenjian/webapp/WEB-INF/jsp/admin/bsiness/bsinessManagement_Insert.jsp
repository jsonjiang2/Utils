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
//添加数据校验
$(function(){
	$("#insertModal").on("shown.bs.modal",function(){
		$("#businessManagement_insertFrom").bootstrapValidator({
			icon: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields:{
	        	merchants:{
					validators:{
						notEmpty:{
							message:"请输入商户号"
						},
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

						}
					}
		        },
		        username:{
					validators:{
						notEmpty:{
							message:"请输入用户名"
						}
					}
		        },
		        merchantattribute:{
					validators:{
						notEmpty:{
							message:"请选择商户属性"
						}
					}
		        },
		        salesmanusername:{
					validators:{
						notEmpty:{
							message:"请选择业务员"
						}
					}
		        },
		        salesmanshare:{
					validators:{
						 notEmpty:{
							message:"请出入业务员分润"
						}, 
						regexp:{
	                    	 regexp: /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/, //比较精准
	                         message: '请输入整数或者小数'
	                    },
	                    callback:{
	                    	message:"业务员分润和巴士分润相加不能大于等于100%",
	                    	callback:function(value,validator){
	                    		if(value==""){
	                    			return true;
	                    		}else{
		                    		var busshare = $('input[name="busshare"]').val();
		                    		var sum ;
		                    		if(busshare==""){
		                    			sum = parseFloat(value);
		                    		}else{
		                    		   sum = parseFloat(value)+parseFloat(busshare);
		                    		}
		                    		if(sum>=100){
		                    			return false;
		                    		}else{
		                    			return true;
		                    		}
	                    		}
	                    	}
	                    }
					}
				},
				busshare:{
					validators:{
						 notEmpty:{
							message:"请出入巴士分润"
						}, 
						regexp:{
	                    	 regexp: /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/, //比较精准
	                         message: '请输入整数或者小数'
	                    },
	                    callback:{
	                    	message:"业务员分润和巴士分润相加不能大于等于100%",
	                    	callback:function(value,validator){
	                    		if(value==""){
	                    			return true;
	                    		}else{
		                    		var salesmanshare = $('input[name="salesmanshare"]').val();
		                    		var sum ;
		                    		if(salesmanshare==""){
		                    			sum = parseFloat(value);
		                    		}else{
		                    		   sum = parseFloat(value)+parseFloat(salesmanshare);
		                    		}
		                    		if(sum>=100){
		                    			return false;
		                    		}else{
		                    			return true;
		                    		}
	                    		}
	                    	}
	                    }
					}
				},
				
				merchanturl:{
					validators:{
						notEmpty:{
							message:"请输入商户网址"
						}
					}
				}
			}
		});
	});
});
//业务员分润
function salesmanshareFun(){
	
}

//用户名检测
function usernameOnblur(){
	var username = $("#username").val();
	var action = "${pageContext.request.contextPath }/admin/bsinessmanagement/usernameVidata.action";
	var params = {
			"username":username
	}
	$.post(action,params,function(data){
		if(data.code=="88"){
			$("#ptrealname").css('color','black');
			$("#ptrealname").text(data.data);
		}
		
		if(data.code=="808"){
			$("#ptrealname").css('color','red');
			$("#ptrealname").text(data.data);
		}
		
		if(data.code=="00"){
			$("#ptrealname").css('color','red');
			$("#ptrealname").text(data.message);
		}
	});		
	
}
</script>
</head>
<body  style="font-family:'微软雅黑'; ">

<div class="container"  style="margin-top: 25px;">
			<form class="form-horizontal" role="form"  id="businessManagement_insertFrom">
				
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="merchants">商户号</label>
					<div class="col-sm-3">
						<input type="text" name="merchants" id="merchants"  class="form-control" value="${number}"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="username">用户名</label>
					<div class="col-sm-2">
						<input type="text" name="username" id="username" class="form-control"  onblur="usernameOnblur();"/>
					</div>
					<div class="col-sm-1" style="margin-top: 9px;margin-left: -15px">
						<span id="ptrealname"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="merchantattribute">属性</label>
					<div class="col-sm-3">
						<select name="merchantattribute" id="merchantattribute" class="form-control">
							<option value="">全部</option>
							<option value="1">线上</option>
							<option value="2">线下</option>
						</select> 
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="salesmanusername">业务员</label>
					<div class="col-sm-3">
						<select name="salesmanusername" id="salesmanusername" class="form-control">
							<option value="">全部</option>
					<!-- 		<option value="jiang">jiang</option>
							<option value="jiang1">jiang1</option>
							<option value="jiang22">jiang22</option>
							<option value="jiang00">jiang00</option>
							<option value="jiang99">jiang99</option>
							<option value="jiang88">jiang88</option>
							<option value="jiang3">jiang3</option>
							<option value="jiangyx">jiangyx</option>
							<option value="jiangxy">jiangxy</option>
							<option value="liangyk">liangyk</option>
							<option value="jiangxueyo">jiangxueyo</option> -->
							<c:if test="${empty preLists}">
								<option value="jiang">jiang</option>
							</c:if>
							<c:if test="${!empty preLists}">
								<c:forEach items="${preLists}" var="pre">
									<option value="${pre.username}">${pre.username}</option>
								</c:forEach>
							</c:if>
						</select> 
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="salesmanshare">业务员分润</label>
					<div class="col-sm-3">
						<input type="text" name="salesmanshare" id="salesmanshare"  class="form-control" onblur="salesmanshareFun();"/>
					</div>
					<div class="col-sm-1" style="margin-left: -20px;margin-top: 4px;font-size: 18px">
						%
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="busshare">巴士分润</label>
					<div class="col-sm-3">
						<input type="text" name="busshare" id="busshare"  class="form-control"  onblur="busshareFun();"/>
					</div>
					<div class="col-sm-1" style="margin-left: -20px;margin-top: 4px;font-size: 18px">
						%
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label laber_from" for="merchanturl">商户网址</label>
					<div class="col-sm-3">
						<input type="text" name="merchanturl" id="merchanturl" class="form-control" />
					</div>
				</div>
			
				<div class="form-group">
					<label for="remark" class="col-sm-2 control-label laber_from">商户地址</label>
					<div class="col-sm-3">
						  <textarea rows="3" class="form-control" name="merchantaddress"></textarea>
					</div>
				</div>
			</form>
		</div>
								
</body>
</html>
