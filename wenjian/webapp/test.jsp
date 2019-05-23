<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>产品发布测试jsp</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>
    <link href="${basePath }/static/plugin/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">
     <script type="text/javascript" src="${basePath}/static/plugin/colorpicker/js/colorpicker.js"></script>
       <style type="text/css">
        .box{
            width:100%;
        }
        .box_box{
        	width:60%;
        	margin:100px auto;
        }
         
    </style>
    <script type="text/javascript">
	    $(function(){
	        
	    	$('#test').ColorPicker({
	    		onSubmit: function(hsb, hex, rgb, el) {
 	    			$(el).val("#"+hex);
	    			$(el).ColorPickerHide();
	    		},
	    		onBeforeShow: function () {
	    			$(this).ColorPickerSetColor(this.value);
	    		},
	    		onChange: function (hsb, hex, rgb) {
	    			$('#test2').css('backgroundColor', '#' + hex);
	    		}
	    	})
	    	.bind('keyup', function(){
	    		$(this).ColorPickerSetColor(this.value);
	    	});
	     })
    function su(){
	    	alert($("#test").val());
	    }
    </script>
</head>
<body>
	 <div>
	 	  <div>
 				<div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				    	<input id="test"/><div style="width:20px;height:20px;" id="test2"></div>
				    	<button type="button" onclick="su(this)">测试</button>
				      	<button type="button" class="btn btn-default" onclick="save(this)">保存</button>
				    </div>
				  </div>
    		</div>
    </div>	
 <script type="text/javascript">
 function tete(){
  	var p = new Promise(function(resolve,reject){
 		setTimeout(function(){
 			console.log('执行完成');
  			resolve('随便什么数据');
 		},200);
 	});
  	return p;
 }
 
 function runAsync(){
	    var p = new Promise(function(resolve, reject){
	        //做一些异步操作
	        setTimeout(function(){
	            console.log('执行完成');
	            var num = Math.ceil(Math.random()*10); //生成1-10的随机数
	            if(num<=5){
	                resolve(num);
	            }
	            else{
	                reject('数字太大了');
	            }
	        }, 2000);
	    });
	    return p;            
	}
 
 runAsync()
 	.then(function(data){
 		console.log(data);
 	})
 	.catch(function(reject){
 		console.log(reject);
 	})
 
 	function save(){
 		var length = $(".box").length;
 		var arrayObj = new Array(); 
 		for(var i = 0;i<length;i++){
 			var obj = {};
 			var productno = $(".box").eq(i).find("input[name='productno']").val();
 			var bidno = $(".box").eq(i).find("input[name='bidno']").val();
 			obj.productno = productno;
 			obj.bidno = bidno;
 			arrayObj.push(obj);
 		}
 		alert(JSON.stringify(arrayObj));
 		console.log(JSON.stringify(arrayObj));
 		//[{"productno":"CP113456","bidno":"113456"},{"productno":"CP123456","bidno":"123456"},{"productno":"CP133456","bidno":"133456"}]
 		var url = basePath+ "/test/productRelease/test";
 		var callback = function(data){
 			alert(data);
 		}
 		$.post(url,{"obj":JSON.stringify(arrayObj)},callback);
 	}
 </script>
 </body>
</html>