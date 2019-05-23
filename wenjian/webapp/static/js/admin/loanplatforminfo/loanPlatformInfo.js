var loanPlatformInfo = {
		pre_detail:function(opid){
 			$.post(basePath+"/admin/loanPlatformInfo/details/"+opid, function(data){
	    		 $("#detailsModal").modal({
	                 backdrop: 'static',
	                 keyboard: false
	             });
	    		$("#detail-modal-body").html(data);
	    	});
		},
		pre_del:function(obj){
			var id = $(obj).data("opid");
			if(!confirm("您确定删除吗?"))return;
 			$.post(basePath+"/admin/loanPlatformInfo/delete",{"id":id},function(data){
 				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href=basePath+"/admin/loanPlatformInfo/list"
				}
			})
		},
		pre_insert:function(obj){
			var bodyParams = {};
 			bodyParams.logo = $("#paramsBox").find("input[name='logo']").val();
 			bodyParams.pname = $("#paramsBox").find("input[name='pname']").val();
 			bodyParams.sort = $("#paramsBox").find("select[name='sort']").val();
			bodyParams.remark = $("#paramsBox").find("textarea[name='remark']").val();
			bodyParams.id = $("#paramsBox").find("input[name='id']").val();
			bodyParams.website = $("#paramsBox").find("input[name='website']").val();
			bodyParams.online1 = $("#paramsBox").find("input[name='online1']").val();
			bodyParams.thunderstormtime1 = $("#paramsBox").find("input[name='thunderstormtime1']").val();
			bodyParams.recordname = $("#paramsBox").find("input[name='recordname']").val();
			bodyParams.pbrief = $("#paramsBox").find("textarea[name='pbrief']").val();
			bodyParams.operatingstatus = $("#paramsBox").find("select[name='operatingstatus']").val();
			bodyParams.loanidea = $("#paramsBox").find("select[name='loanidea']").val();
            bodyParams.riskmark = $("#paramsBox").find("input[name='riskmark']").val();
            bodyParams.bail = $("#paramsBox").find("input[name='bail']").val();
            bodyParams.province = $("#paramsBox").find("input[name='province']").val();
            bodyParams.city = $("#paramsBox").find("input[name='city']").val();
            bodyParams.district = $("#paramsBox").find("input[name='district']").val();
            bodyParams.address = $("#paramsBox").find("input[name='address']").val();
            bodyParams.customerphone = $("#paramsBox").find("input[name='customerphone']").val();
            bodyParams.qq = $("#paramsBox").find("input[name='qq']").val();
			bodyParams.androidlink = $("#paramsBox").find("input[name='androidlink']").val();
			bodyParams.ioslink = $("#paramsBox").find("input[name='ioslink']").val();
			bodyParams.loanimpress1 = $("#paramsBox").find("input[name='loanimpress1']").val();
			bodyParams.loanimpress2 = $("#paramsBox").find("input[name='loanimpress2']").val();
			bodyParams.loanimpress3 = $("#paramsBox").find("input[name='loanimpress3']").val();
			bodyParams.loanimpress4 = $("#paramsBox").find("input[name='loanimpress4']").val();
			bodyParams.loanimpress5 = $("#paramsBox").find("input[name='loanimpress5']").val();
			bodyParams.loanimpress6 = $("#paramsBox").find("input[name='loanimpress6']").val();
 			console.log(JSON.stringify(bodyParams));
 			var url = basePath + "/admin/loanPlatformInfo/settingLoanPlatformInfo";
			var callback = function(data) {
 				alert(data.message);
				if (data.code == "88") {
					window.location.href = basePath + "/admin/loanPlatformInfo/list";
				}
			}
			$.post(url, bodyParams, callback);
 		},
  		show_setting:function(obj){
 			var opid = $(obj).data("opid");
            var url = basePath+"/admin/loanPlatformInfo/settingShow";
			var callback = function(data){
				 $("#updateModal").modal({
					 show:true
				 });
				 $("#btn-update").attr("onclick","loanPlatformInfo.pre_insert(this)");
				 $("#update-modal-body").html(data);
			}
			$.get(url,{"opid":opid},callback);
 		}
}

function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

//基本信息-平台logo上传
function uploadLogo(fileThis){
    var fileObj = $(fileThis)[0].files[0];
    var type = $(fileThis).data("type")
    if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
        return;
    }

    var formFile = new FormData();
    formFile.append("upfile", fileObj); //加入文件对象
    var action = basePath+"/admin/loanPlatformInfo/uploadLogo";
    $.ajax({
        url: action,
        data: formFile,
        type: "Post",
        cache: false,//上传文件无需缓存
        processData: false,//// 告诉jQuery不要去处理发送的数据
        contentType: false, //告诉jQuery不要去设置Content-Type请求头
        success: function (data) {
        	if(data.code == "88"){
        		$("#paramsBox").find("input[name='logo']").val(data.data);
        		$("#logoImgBox").show().find("img").attr("src",data.data);
        	}else{
        		alert(data.message);
        	}
        }
    })
}




