var SheepHeadExposure = {
	// 审核
	auditPass : function(obj) {
		var opid = $(obj).data("opid");
		var audit = $(obj).data("audit");
		var url = basePath + "/admin/sheepHead/auditPass";
		var callback = function(data) {
			alert(data.message);
			if (data.code == "88") {
				window.location.href = basePath + "/admin/sheepHead/auditList";
			}
		}
		$.post(url, {
			"id" : opid,
			"audit" : audit
		}, callback);
	},

	// 详情
	detail : function(id) {
		var action = "/admin/sheepHead/detail/" + id;
		$.get(action, {}, function(data) {
			$("#detail-modal-body").html(data);
			$("#detailsModal").modal({
				show : true
			});
		});
	},
	
	
	
	// 全选
	checkAll : function() {
		var all = document.getElementById('all');// 获取到点击全选的那个复选框的id
		var one = document.getElementsByName('checkname');// 获取到复选框的名称
		// 因为获得的是数组，所以要循环 为每一个checked赋值
		for (var i = 0; i < one.length; i++) {
			one[i].checked = all.checked;
		}
	},

	// 删除
	del : function(obj) {
		var ff = confirm("您确定要删除吗？");
		if (!ff) {
			return;
		}
		var opid = $(obj).data("opid");
		var url = basePath + "/admin/sheepHead/del";
		var callback = function(data) {
			alert(data.meta.message);
			if (data.meta.code == "88") {
				window.location.href = basePath
						+ "/admin/sheepHead/sheepDelList";
			}
		}
		$.post(url, {
			"id" : opid
		}, callback);
	},

	// 操作页面展示
	updShow : function(obj) {
		var opid = $(obj).data("opid");
		var url = basePath + "/admin/sheepHead/updShow";
		var callback = function(data) {
			$("#update-modal-body").html(data);
			$("#updateModal").modal({
				show : true
			});
			/* $("#btn-update").attr("onclick", "SheepHeadExposure.upd(this)"); */
		}
		$.get(url, {
			"id" : opid
		}, callback);
	},

	// 操作提交
	upd : function(obj) {
		var opid = $(obj).data("opid");
		var title = $(obj).data("title");
		var affiche=$(obj).data("affiche");
		var sheepmessage=$(obj).data("sheepmessage");
		
		var url = basePath + "/admin/sheepHead/upd";

		$.post(url, {
			"id" : opid,
			"title" : title,
			"affiche":affiche,
			"sheepmessage":sheepmessage
		}, function(data) {
			alert(data.meta.message);
			$("#update-modal-body").html(data);
			$("#updateModal").modal({
				show : true
			});
		});
	},

	// 批量删除
	delBatch : function(obj) {
		var number = "";
		$("input:checkbox[name=checkDelName]:checked").each(function(k) {
			if (k == 0) {
				number = $(this).val();
			} else {
				number += "," + $(this).val();
			}
		});
		if (isEmpty(number)) {
			alert("请至少选择一个主题操作");
			return;
		}

		var ff = confirm("您确定要批量删除吗？");
		if (!ff) {
			return;
		}
		var url = basePath + "/admin/sheepHead/delBatch";
		var callback = function(data) {
			alert(data.meta.message);
			if (data.meta.code == "88") {
				window.location.href = basePath
						+ "/admin/sheepHead/sheepDelList";
			}
		}
		$.post(url, {
			"sids" : number
		}, callback);
	},

	// Del全选
	checkDelAll : function() {
		var all = document.getElementById('allDel');// 获取到点击全选的那个复选框的id
		var one = document.getElementsByName('checkDelName');// 获取到复选框的名称
		// 因为获得的是数组，所以要循环 为每一个checked赋值
		for (var i = 0; i < one.length; i++) {
			one[i].checked = all.checked;
		}
	},

	// 批量审核
	auditBatchPass : function(obj) {
		var number = "";
		$("input:checkbox[name=checkname]:checked").each(function(k) {
			if (k == 0) {
				number = $(this).val();
			} else {
				number += "," + $(this).val();
			}
		});
		if (isEmpty(number)) {
			alert("请至少选择一个黑羊头操作");
			return;
		}
		var audit = $(obj).data("audit");
		var url = basePath + "/admin/sheepHead/auditPass";
		var callback = function(data) {
			alert(data.message);
			if (data.code == "88") {
				window.location.href = basePath + "/admin/sheepHead/auditList";
			}
		}
		$.post(url, {
			"id" : number,
			"audit" : audit
		}, callback);
	}
}

$(function() {
	$("#select-title-text").val($("#select-title-text").data("title"));
	$("#select-statu-text").val($("#select-statu-text").data("statu"));
	$("#select-baseid-text").val($("#select-baseid-text").data("baseid"));
	$("#select-id-text").val($("#select-id-text").data("id"));
});

// 黑羊头修改保存
function update() {
	$.post("upd", $("#update-form").serialize(), function(data) {
		alert(data.meta.message);
		window.location.href = basePath + "/admin/sheepHead/sheepDelList";
	});
}

//黑羊头曝光编辑
function edit(obj){
	var id=$(obj).data("opid");
	window.location.href="sheepHeadShow?id="+id;
}