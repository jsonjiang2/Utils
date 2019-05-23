var ad = {
		imageShow:function(imageUrl){
            document.getElementById("light").style.display="block";
            $("#showImgId").attr("src",imageUrl);
		},
        onImageShow:function(){
            document.getElementById("light").style.display="none";
            document.getElementById("onlight").style.display="none";
        },

        queryAllPersonView:function(pageNum,pageSize){
            $("#pageNum").val(pageNum);
            $("#pageSize").val(pageSize);
            $("#form-selectView").submit();
        },
        passDivShow:function(imageStatus,returnInameUrl,checkCode) {
            var allSelect = document.getElementById("allSelect");
            var check = document.getElementsByName("checkImage");
            var statusCheck = document.getElementsByName("statusCheck");
            var ids = "";
            for(var i=0;i<check.length;i++){
                if(check[i].checked) {
                    ids = ids + check[i].value;
                }
            }
            if(ids==""){
                alert("请勾选需要操作的信息!")
            }else{
                var id = "null";
                if(allSelect.checked){
                    for(var i=0;i<check.length;i++){
                        if(check[i].type.value="checkbox"){
                            if(checkCode=="xiajia"&&statusCheck[i].value==2){
                                id = id+","+check[i].value;
                            }else if(checkCode=="shenhe"&&statusCheck[i].value==1){
                                id = id+","+check[i].value;
                            }else if(checkCode=="tiqianzhongzhi"&&statusCheck[i].value!=4){
                                id = id+","+check[i].value;
                            }
                        }
                    }
                }else{
                    for(var i=0;i<check.length;i++){
                        if(check[i].checked){
                            id = id+","+check[i].value;
                        }
                    }
                }
                if(id=="null"){
                    alert("请勾选需要操作的信息!")
                }else if(id!="null"){
                    id = id.substring(5,id.length);
                    $("#passAdId").val(id);
                    $("#passText").val("");
                    $("#imageStatus").val(imageStatus);
                    $("#returnImageUrl").val(returnInameUrl);
                    document.getElementById("remarkId").style.display="block";
                }
            }
        },

        onePassDivShow:function(imageId,status,returnImageUrl) {
            var id = imageId;
            if(id=="null"){
                alert("请勾选需要审核的信息!")
            }else if(id!="null"){
                $("#passAdId").val(id);
                $("#passText").val("");
                $("#imageStatus").val(status);
                $("#returnImageUrl").val(returnImageUrl);
                document.getElementById("remarkId").style.display="block";
            }
        },
    showManager:function(id,usermark){
        $.get(basePath+"/admin/adImage/adImageHistory",{"id":id,"getAdDate":"imageList","usermark":usermark}, function(data){
            $("#detail-modal-body").html(data);
        });
    },
    checkboxFunction:function(id){
        var allSelect = document.getElementById("allSelect");
        if(allSelect.checked){
            var ids = document.getElementById("passAdId").value;

        }
    },
        pass:function() {
            var allSelect = document.getElementById("allSelect");
            var check = document.getElementsByName("checkImage");
            var id = "";
            if(allSelect.checked){
                for(var i=0;i<check.length;i++){
                    if(check[i].checked){
                        if(i==0){
                            id=check[i].value;
                        }else{
                            if(id==","||id==""){
                                id=check[i].value;
                            }else{
                                id = id+","+check[i].value;
                            }
                        }
                    }
                }
            }else{
                id = document.getElementById("passAdId").value;
            }
		    var imageStatus = document.getElementById("imageStatus").value;
            document.getElementById("remarkId").style.display="block";
            var remark = document.getElementById("passText").value;
            var returnImageUrl = document.getElementById("returnImageUrl").value;
            var pageNum = document.getElementById("pageNums").value;
            var pageSize = document.getElementById("pageSizes").value;
            $.post(basePath+"/admin/adImage/updateReviewStatus",{"id":id,"remark":remark,"review_status":imageStatus,"returnImageUrl":returnImageUrl},function(data){
                if(data.meta.code=="88"){
                    alert("操作成功！")
                    document.getElementById("remarkId").style.display="none";
                    window.location.href=basePath+"/admin/adImage/"+returnImageUrl+"?pageNum="+pageNum+'&pageSize='+pageSize;
                }
            })
        },

    toDropOff:function() {
        var allSelect = document.getElementById("allSelect");
        var check = document.getElementsByName("checkImage");
        var id = "";
        if(allSelect.checked){
            for(var i=0;i<check.length;i++){
                if(check[i].checked){
                    if(i==0){
                        id=check[i].value;
                    }else{
                        if(id==","||id==""){
                            id=check[i].value;
                        }else{
                            id = id+","+check[i].value;
                        }
                    }
                }
            }
        }else{
            id = document.getElementById("passAdId").value;
        }
        var imageStatus = document.getElementById("imageStatus").value;
        document.getElementById("remarkId").style.display="block";
        var remark = document.getElementById("passText").value;
        var returnImageUrl = document.getElementById("returnImageUrl").value;
        var pageNum = document.getElementById("pageNums").value;
        var pageSize = document.getElementById("pageSizes").value;
        $.post(basePath+"/admin/Advertising/updateValid",{"id":id,"remark":remark,"isValid":imageStatus,"returnImageUrl":returnImageUrl},function(data){
            if(data.meta.code=="88"){
                alert("操作成功！")
                document.getElementById("remarkId").style.display="none";
                window.location.href=basePath+"/admin/Advertising/"+returnImageUrl+"?pageNum="+pageNum+'&pageSize='+pageSize;
            }
        })
    },


        allSelect:function(manage){
            var allSelect = document.getElementById("allSelect");
            var check = document.getElementsByName("checkImage");
            var statusCheck = document.getElementsByName("statusCheck");
            if(allSelect.checked){
                for(var i=0;i<check.length;i++){
                    if(check[i].type=="checkbox"){
                        if(manage=="xiajia"){
                            if(statusCheck[i].value==2){
                                check[i].checked=true;
                            }else{
                                check[i].checked=false;
                            }
                        }else if(manage=="tiqianzhongzhi"){
                            if(statusCheck[i].value!=4){
                                check[i].checked=true;
                            }else{
                                check[i].checked=false;
                            }
                        }
                        else{
                            if(statusCheck[i].value==1){
                                check[i].checked=true;
                            }else{
                                check[i].checked=false;
                            }
                        }
                    }
                }
            }else{
                for(var i=0;i<check.length;i++){
                    if(check[i].type=="checkbox"){
                        check[i].checked=false;
                    }
                }
            }
        },

		pre_detail:function(opid){
 			$.post(basePath+"/admin/preForumForum/detail/"+opid,function(data){
	    		 $("#detailsModal").modal({
	                 backdrop: 'static',
	                 keyboard: false
	             });
	    		$("#detail-modal-body").html(data);
	    	});
		},
		pre_del:function(opid){
			if(!confirm("您确定删除吗?"))return;
 			$.post(basePath+"/admin/preForumForum/delete",{"id":opid},function(data){
 				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href=basePath+"/admin/preForumForum/list"
				}
			})
		},
		pre_insert:function(obj){
			$("#insert-form").bootstrapValidator(validate);
			var bv = $("#insert-form").data("bootstrapValidator");
 			bv.validate();
			if (bv.isValid()) {
				// 手动触发验证
				var bodyParams = $("#insert-form").serialize();
				var url = basePath + "/admin/preForumForum/insert";
				var callback = function(data) {
					alert(data.meta.message);
					if (data.meta.code == "88") {
						window.location.href = basePath + "/admin/preForumForum/list";
					}
				}
				$.post(url, bodyParams, callback);
			}
		},
		pre_update:function(obj){
			var bodyParams = $("#update-form").serialize();
			var url = basePath + "/admin/preForumForum/update";
			var callback = function(data) {
				alert(data.meta.message);
				if (data.meta.code == "88") {
					window.location.href = basePath + "/admin/preForumForum/list";
				}
			}
			$.post(url, bodyParams, callback);
 		}
}


//验证
var validate = {
		icon : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			name : {
				validators : {
					notEmpty : {
						message : "* 请输入论坛版块名称"
					} 
				}
			},
			displayorder : {
				validators : {
					notEmpty : {
						message : "* 请输入显示顺序"
					} 
				}
			},
			status : {
				validators : {
					callback:{
						message:"* 请选择是否显示",
						callback:function(value,validator){
  							if(isEmpty(value)){
 								 return false;
							}else{
 								 return true;
							}
						}
					}
				}
			}
 		} 
}

function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

function queryAllhistory(pageNum,pageSize){
    $("#pageNum").val(pageNum);
    $("#pageSize").val(pageSize);
    $("#form-select-history").submit();
}

