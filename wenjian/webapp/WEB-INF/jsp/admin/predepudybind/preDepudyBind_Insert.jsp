<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script type="text/javascript">
var unameIsRight=false;  // 用户标记
var error = "";  //错误标志
var biaozhi = "0";  //用户把名字和绑定状态改为蓝色或者粉红色的标志

//鼠标离开事件 ,判断用户名是否已经绑定,是否存在
function checkUserName(t,id,isbind){
    //人员名单编号
    var usernameStr  = $(t).val(); 
    var username = $.trim(usernameStr);
    if (username == "") {
        return false;
    }
    var jsonData = $("#insertSmallForm").serialize();
    var params = decodeURIComponent(jsonData,true);
    $("#"+id).text("");
    var url = "${pageContext.request.contextPath}/admin/predepudybind/usernameVidata";
    var param = {
        "username": username,
        "usernames":params
    };
    $.post(url, param, function (data) {
    	if(data.code=="88"){
    		$("#"+id).text(data.data.username);
    		$("#"+isbind).text(data.data.isbindstr);
    		biaozhi=data.data.isbind;
        	if(id=="paichuRelnameId"){
            	unameIsRight=true;
            }
    	}
    	if(data.code=="00"){
    		alert(data.message);
    		unameIsRight=false;
    		error = data.message;
    	}
    },'json'); 
}	


//增加用户  name 表示输入框的值  id 表示所在是名单的div 还是排除用户的div 
function addUserPmno(username, id, pmname,isbind) {
    var username = $.trim(username);
    if ((id=="usernameId") && username == "") {
        alert("请填写用户名");
        return;
    }
    //为了防止管理员一输完用户名之后立马就点添加,这样就会造成鼠标离开checkUserName 这个方法校验不到   开始-----------------------
    var jsonData = $("#insertSmallForm").serialize();
    var params = decodeURIComponent(jsonData,true);
    var url = "${pageContext.request.contextPath}/admin/predepudybind/usernameVidata";
    var param = {
        "username": username,
        "usernames":params
    };
    
    $.post(url, param, function (data) {
    	if(data.code=="88"){
    		biaozhi=data.data.isbind;
            unameIsRight=true;
            isbind = data.data.isbindstr;
            pmname = data.data.username;
            hah(username, id, pmname,isbind);//成功的时候再调用
    	}
    	if(data.code=="00"){
    		unameIsRight=false;
    		error = data.message;
    		return false;
    	}
    },'json'); 

    if(!unameIsRight){
		 if(error!=""){
        	alert(error);
		 }
        return;
   }
    //结束-----------------------------------------------------------------------------------------------------------------
  
}
	
function hah(username, id, pmname,isbind){
	
	 console.log("这个是unameIsRight的值0:"+unameIsRight);
	    var $id = "#" + id;
	    var flag = false;
	    if (id == "usernameId") {//用户名添加
	        $($id + ' input[name="usernames"]').each(function (i) {
	            var tname = $(this).val().toLocaleLowerCase();
	            if (username.toLocaleLowerCase() == tname) {
	                alert(username + "已存在，请勿重复增加");
	                flag = true;
	                return false;
	            }
	        });
	    }
	    if (flag) {
	        return;
	    }
	  var html;
	    console.log("这个是unameIsRight的值1:"+unameIsRight);
	    switch (id) {
	            //用户组时排除用户
	        case "usernameId":
	        	console.log("这个是unameIsRight的值2:"+unameIsRight);
	            $("#paichu").val("");
	            $("#paichuRelname").text("");
	            html = appendHtml();
	            break;
	    }
	   
	    //用户组时排除用户
	    function appendHtml() {
	    	var $div = $("#usernameId");
	        var children = $div.children().length;
	        
	   	    var XH = parseFloat(children)+1;
	   	    $("#xh").html(XH);
	   	    if(biaozhi=="1"){
		       var html = '<div class="form-group manuslfreeze" id="manuslfreeze'+XH+'">'+
				    		'<label class="col-sm-2 control-label" id="xh" style="color: #F98B7A">副号-'+XH+'</label>'+
				            '<div class="col-sm-2" style="width:140px;">'+
				                '<input type="text" name="usernames" value="' + username + '" readonly id="activenameId" class="form-control" class="form-control" style="width:130px;"/>'+
				            '</div>'+
				            '<label class="col-sm-1 control-label" style="width:70px;border: 1px #F98B7A solid;background-color: #F98B7A;margin-left: 14px;color: #FFFFFF" onclick="removeItSelf(this)">删&nbsp;&nbsp;&nbsp;除</label>'+
				            '<label class="col-sm-1 control-label" style="display: block; width:300px; text-align:left;color: #4881F5" id="isbind'+XH+'">' + isbind +'</label>'+
				            '<label class="col-sm-1 control-label" style="display: block; width:300px; text-align:left;margin-left: -250px;color: #4881F5" id="paichuRelnameId'+XH+'">' + pmname +'</label>'+
				       	'</div>';       
		        
		        return html;
	   	    }
	   	    
	   	    if(biaozhi=="0"){
		   	     var html = '<div class="form-group manuslfreeze" id="manuslfreeze'+XH+'">'+
					 		'<label class="col-sm-2 control-label" id="xh" style="color: #F98B7A">副号-'+XH+'</label>'+
					         '<div class="col-sm-2" style="width:140px;">'+
					             '<input type="text" name="usernames" value="' + username + '" readonly id="activenameId" class="form-control" class="form-control" style="width:130px;"/>'+
					         '</div>'+
					         '<label class="col-sm-1 control-label" style="width:70px;border: 1px #F98B7A solid;background-color: #F98B7A;margin-left: 14px;color: #FFFFFF" onclick="removeItSelf(this)">删&nbsp;&nbsp;&nbsp;除</label>'+
					         '<label class="col-sm-1 control-label" style="display: block; width:300px; text-align:left;color: #F98B7A" id="isbind'+XH+'">' + isbind +'</label>'+
					         '<label class="col-sm-1 control-label" style="display: block; width:300px; text-align:left;margin-left: -250px;color: #F98B7A" id="paichuRelnameId'+XH+'">' + pmname +'</label>'+
					    	'</div>';       
					
					return html;
	   	    }
	    }
	    $("#" + id).append(html);
}	

//删除用户
function removeItSelf(t) {
	var isbind = $(t).parent().find("#isbind").val();
    $(t).parent().remove();
    var $div = $("#usernameId");
    var children = $div.children().length;
    if(children == 0){
        $("#xh").html(1);
        return false;
    }
    for (var i = 0; i <children; i++) {
    	$div.find(".manuslfreeze").eq(i).find("#xh").text("副号-"+(i+1));
	} 
}
	
</script>
</head>
<body>
        <span id="xh" style="display:none;">1</span>
		<div class="container" style="margin-top: 25px;margin-left: -100px">
		<form class="form-horizontal" role="form" id="insertSmallForm"  method="POST">
			<div id="CompensateOn_div">
				<%--添加用户--%>
		        <div id="specificUserId3">
		            <div class="form-group">
		                <label class="col-sm-2 control-label">输入用户名</label>
		                <div class="col-sm-2" style="width:140px;">
		                    <input type="text" id="paichu" class="form-control" style="width:130px;" onblur="checkUserName(this,'paichuRelnameId','isbind');" placeholder="添加用户名"/>
		                </div>
		                <label class="col-sm-1 control-label" style="width:70px;border: 1px #4881F5 solid;background-color: #4881F5;margin-left: 14px;color: #FFFFFF" 
		                onclick="addUserPmno($('#paichu').val(),'usernameId',$('#paichuRelnameId').text(),$('#isbind').text())">添&nbsp;&nbsp;&nbsp;加</label>
		                <label class="col-sm-1 control-label" style="display: block;color:#F98B7A; width:300px; text-align:left" id="isbind"></label>
		                <label class="col-sm-1 control-label" style="display: block;color:#F98B7A; width:300px;margin-left: -250px; text-align:left" id="paichuRelnameId"></label>
		            </div>
		
		            <div id="usernameId">
		            
		         
		            </div>
		        </div>
			</div>
		</form>
</div>
</body>
</html>