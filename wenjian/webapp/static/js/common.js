function clearNoNum(event, obj) {
	// 响应鼠标事件，允许左右方向键移动
	event = window.event || event;
	if (event.keyCode == 37 | event.keyCode == 39) {
		return;
	}
	// 先把非数字的都替换掉，除了数字和.
	obj.value = obj.value.replace(/[^\d.]/g, "");
	// 必须保证第一个为数字而不是.
	obj.value = obj.value.replace(/^\./g, "");
	// 保证只有出现一个.而没有多个.
	obj.value = obj.value.replace(/\.{2,}/g, ".");
	// 保证.只出现一次，而不能出现两次以上
	obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$",
			".");
}
function checkNum(obj) {
	// 为了去除最后一个.
	obj.value = obj.value.replace(/\.$/g, "");
}

/*
 * 限制备注字数
 */
function LimitTextArea(field) {
	maxlimit = 200;
	if (field.value.length > maxlimit) {
		field.value = field.value.substring(0, maxlimit);
	}
}

function queryAllPerson(pageNum, pageSize) {
	// 查询所有数据
	$("#pageNum").val(pageNum);
	$("#pageSize").val(pageSize);
	$("#form-select").submit();
}

var ajax = {
	'post' : function(url, data, obj) {
		$.ajax(url, {
			type : 'POST',
			data : data,
			timeout : 30 * 1000,
			success : obj,
			complete : function(xhr) {
			},
			error : function(e, type) {
			}
		})
	},
	'postJSON' : function(url, data, obj) {
		$.ajax(url, {
			type : 'POST',
			data : data,
			dataType : 'json',
			timeout : 30 * 1000,
			success : obj,
			complete : function(xhr) {
			},
			error : function(e, type) {
			}
		})
	},
	'get' : function(url, data, obj) {
		$.ajax(url, {
			type : 'get',
			data : data,
			dataType : 'json',
			timeout : 30 * 1000,
			success : obj,
			complete : function() {
			},
			error : function(e, type) {
			}
		})
	}
}

function getGear(obj) {
	var gear;
	switch (obj) {
	case 1:
		gear = "A";
		break;
	case 2:
		gear = "B";
		break;
	case 3:
		gear = "C";
		break;
	case 4:
		gear = "D";
		break;
	case 5:
		gear = "E";
		break;
	case 6:
		gear = "F";
		break;
	case 7:
		gear = "G";
		break;
	case 8:
		gear = "H";
		break;
	case 9:
		gear = "I";
		break;
	case 10:
		gear = "J";
		break;
	case 11:
		gear = "K";
		break;
	case 12:
		gear = "L";
		break;
	case 13:
		gear = "M";
		break;
	case 14:
		gear = "N";
		break;
	default:
		gear="超出范围";
		break;
	}
	return gear;
}
