var loanProductInfo = {
		pre_detail:function(opid){
 			$.post(basePath+"/admin/loanProductInfo/detail/"+opid,function(data){
	    		 $("#detailsModal").modal({
	                 backdrop: 'static',
	                 keyboard: false
	             });
	    		$("#detail-modal-body").html(data);
	    	});
		},
		pre_del:function(opid){
			if(!confirm("您确定删除吗?"))return;
 			$.post(basePath+"/admin/loanProductInfo/delete",{"id":opid},function(data){
 				alert(data.meta.message);
				if(data.meta.code == "88"){
					window.location.href=basePath+"/admin/loanProductInfo/list"
				}
			})
		},
		pre_insert:function(obj){
			var bodyParams = {};
			var isrealnameauth = $("#authCheckBox").find("input[name='isrealnameauth']")[0].checked;
			var isphoneauth = $("#authCheckBox").find("input[name='isphoneauth']")[0].checked;
			var ispersonaldataauth = $("#authCheckBox").find("input[name='ispersonaldataauth']")[0].checked;
			var issesameauth = $("#authCheckBox").find("input[name='issesameauth']")[0].checked;
			var isweilidaiauth = $("#authCheckBox").find("input[name='isweilidaiauth']")[0].checked;
			bodyParams.isrealnameauth = 0;
			bodyParams.isphoneauth = 0;
			bodyParams.ispersonaldataauth = 0;
			bodyParams.issesameauth = 0;
			bodyParams.isweilidaiauth = 0;
			if(isrealnameauth){
				bodyParams.isrealnameauth = 1;
			}
			if(isphoneauth){
				bodyParams.isphoneauth = 1;
			}
			if(ispersonaldataauth){
				bodyParams.ispersonaldataauth = 1;
			}
			if(issesameauth){
				bodyParams.issesameauth = 1;
			}
			if(isweilidaiauth){
				bodyParams.isweilidaiauth = 1;
			}
			bodyParams.pid = $("#paramsBox").find("select[name='pid']").val();
  			bodyParams.ptype = $("#paramsBox").find("select[name='ptype']").val();
 			bodyParams.pattribute = $("#paramsBox").find("select[name='pattribute']").val();
 			bodyParams.feature = $("#paramsBox").find("textarea[name='feature']").val();
 			bodyParams.loanminamout = $("#paramsBox").find("input[name='loanminamout']").val();
 			bodyParams.loanmaxamout = $("#paramsBox").find("input[name='loanmaxamout']").val();
 			bodyParams.loantime = $("#paramsBox").find("textarea[name='loantime']").val();
 			bodyParams.loaninterest = $("#paramsBox").find("textarea[name='loaninterest']").val();
			bodyParams.interesttype = $("#paramsBox").find("select[name='interesttype']").val();
			bodyParams.loantimelimit = $("#paramsBox").find("textarea[name='loantimelimit']").val();
			bodyParams.appconditions = $("#paramsBox").find("textarea[name='appconditions']").val();
			bodyParams.repaymode = $("#paramsBox").find("textarea[name='repaymode']").val();
			bodyParams.latecharge = $("#paramsBox").find("textarea[name='latecharge']").val();
			bodyParams.prepayment = $("#paramsBox").find("textarea[name='prepayment']").val();
			bodyParams.sort = $("#paramsBox").find("select[name='sort']").val();
			bodyParams.remark = $("#paramsBox").find("textarea[name='remark']").val();
			bodyParams.opid = $("#paramsBox").find("input[name='opid']").val();
			bodyParams.prlink = $("#paramsBox").find("input[name='prlink']").val();
			bodyParams.applycount = $("#paramsBox").find("input[name='applycount']").val();
			bodyParams.lendingamout = $("#paramsBox").find("input[name='lendingamout']").val();
			bodyParams.loanamout = $("#paramsBox").find("input[name='loanamout']").val();
			bodyParams.status = $("#paramsBox").find("select[name='status']").val();
			bodyParams.succcount = $("#paramsBox").find("input[name='succcount']").val();
			bodyParams.isshowattr = $("#paramsBox").find("select[name='isshowattr']").val();
			bodyParams.isdefault = $("#paramsBox").find("select[name='isdefault']").val();
			var itemlength = $("#loanUserLinkBox").find(".loanUserItem").length;
			var uids = "";
			for(var i = 0;i<itemlength;i++){
				var uid = $("#loanUserLinkBox").find(".loanUserItem").eq(i).find("input[name='uid']").val();
				if(i == 0){
					uids = uid;
 			    }else{
 			    	uids = uids +","+uid;
			    }
			}
 			console.log("uids:"+uids);
			bodyParams.uids = uids;
 			console.log(JSON.stringify(bodyParams));
 			var url = basePath + "/admin/loanProductInfo/settingLoanProductInfo";
			var callback = function(data) {
 				alert(data.message);
				if (data.code == "88") {
					window.location.href = basePath + "/admin/loanProductInfo/list";
				}
			}
			$.post(url, bodyParams, callback);
 		},
  		show_setting:function(obj){
 			var opid = $(obj).data("opid");
            var url = basePath+"/admin/loanProductInfo/settingShow";
			var callback = function(data){
				 $("#updateModal").modal({
					 show:true
				 });
				 $("#btn-update").attr("onclick","loanProductInfo.pre_insert(this)");
				 $("#update-modal-body").html(data);
			}
			$.get(url,{"opid":opid},callback);
 		},
 		//关联操作
 		link_operation:function(obj){
 			var username = $("#paramsBox").find("input[name='username']").val();
 			console.log(username);
             var url = basePath+"/admin/loanProductInfo/addUserLink";
			var callback = function(data){
				  if(data.code == "88"){
					  var html = "<!-- item 开始 -->"+
			 	 		"		<div class='form-group loanUserItem'>"+
						"			<label class='col-sm-2 control-label'></label>"+
						"			<div class='col-sm-4'>"+
						"		 		<label class='form-control'>"+data.data.username+"</label>"+
						" 				<input type='text' name='uid' value='"+data.data.uid+"' style='display:none;'>"+
			 			"			</div>"+
						"			<div class='col-sm-2'>"+
						"				<button class='btn btn-default' type='button' onclick='loanProductInfo.link_remove(this)'>删除</button>"+
						"			</div>"+
				   		"		</div>"+
				   		"	    <!-- item 结束 -->";
					  $("#loanUserLinkBox").append(html);
					  $("#paramsBox").find("input[name='username']").val('');
				  }else{
					  alert(data.message);
				  }
			}
			$.post(url,{"username":username},callback);
 		},
 		//关联删除
 		link_remove:function(obj){
 			console.log(121);
 			$(obj).parent().parent().remove();
 		}
}

function queryAllPerson(pageNum,pageSize){
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}
 
