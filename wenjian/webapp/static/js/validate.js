var ConfigValidateInfoType = "writeAlert"; //支持writeAlert和writePage,"writePage;writeAlert"

var rmTempStatusIsAlert = false;

var rmTempStatusIsFocus = false;

var beginValidate = true;

var set_All_Venus_Inputs_Default = true;

String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

function checkAllForms() {

	var checkResult = true;

	rmTempStatusIsAlert = false;
	rmTempStatusIsFocus = false;
	setAllVenusInputsDefault();

	for (var i = 0; i < document.forms.length; i++) {
		for (var j = 0; j < document.forms[i].elements.length; j++) {
			var thisInput = document.forms[i].elements[j];

			if (thisInput.type != "hidden"
					&& thisInput.type != "button"
					&& !(thisInput.id.indexOf("TF_") >= 0 && thisInput.id
							.indexOf("_TF") > 0) && thisInput.clientWidth != 0
					&& thisInput.style && thisInput.style.display != 'none') {
				/*
				if(validateStr != null && validateStr.length > 0 ){
				    if(thisInput.tagName == 'TEXTAREA' && srcstr != '') {
				        srcstr = replaceEnter(srcstr);
				        if( thisInput.maxLength != null && thisInput.maxLength > 0 ){
				            if (getStrLength(srcstr) > thisInput.maxLength){
				                writeValidateInfo(thisInput, "焦点处输入长度超长\n请确保输入长度在" +frm.maxLength+"以内");
				                return false;
				            }
				        }
				    }
				}
				 */
				if (thisInput.id
						&& thisInput.id.indexOf("supplier_id_ref_") != -1
						&& document.getElementById("unionDiv")
						&& document.getElementById("unionDiv").style.display == "none") {
					continue;
				}

				var rtValue = check(thisInput);
				if (checkResult && rtValue == false) {
					checkResult = false;
					break;
				}
			}
		}
	}
	return checkResult;
}

function check(thisInput) {

	var validateStr = thisInput.validate;
	if (validateStr == null) {
		return true;
	}
	var inputValue = thisInput.value;
	if (beginValidate) {
		var validateTemp = new Array();
		validateTemp = validateStr.split(';');
		for (var i = 0; i < validateTemp.length; i++) {
			if (validateTemp[i].length == 0) {
				continue;
			}
			s = replaceSingleQuote(inputValue);
			try {
				var scriptCode = "javascript:" + validateTemp[i]; //"javascript:" + validateTemp[i] + "('" + s + "', " + "thisInput)"
				if (validateTemp[i].indexOf("(") < 0
						|| validateTemp[i].indexOf(")") < 0) {
					scriptCode = "javascript:" + validateTemp[i]
							+ "(s,thisInput)"
				}
				if (!eval(scriptCode)) {
					return false;
				}
			} catch (e) {
				alert("校验函数" + validateTemp[i] + "有异常，请检查！" + "\n" + e.message);
				return false;
			}
		}
	}
	return true;
}

function setAllVenusInputsDefault() {
	var frmslen = document.forms.length;
	for (var i = 0; i < frmslen; i++) {
		var inslen = document.forms[i].elements.length;
		for (var j = 0; j < inslen; j++) {
			var frm = document.forms[i].elements[j]
			if (frm.type != "hidden"
					&& frm.type != "button"
					&& !(frm.id.indexOf("TF_") >= 0 && frm.id.indexOf("_TF") > 0)) {
				if (frm.validate != null) {
					setVenusInputDefault(frm);
					writeValidateInfoAfterObject("", frm);
				}
			}
		}
	}
	return true;
}

function setVenusInputDefault(_frm) {
	_frm.style.borderStyle = "";
	_frm.style.borderColor = "";
	if (_frm.value != null) {
		_frm.style.backgroundColor = "";
		_frm.style.color = "";
	}
}

function replaceEnter(_str) {
	/**替换换行回车字符**/
	var str = _str;

	str = str.replace('\n', '')
	str = str.replace('\r', '')

	//alert(str.indexOf('\n'))

	if (str.indexOf('\n') != -1 && str.indexOf('\r') != -1) {
		return replaceEnter(str);
	} else {
		return str;
	}
}

function replaceSingleQuote(_str) {
	/**替换换行回车字符**/
	var str = _str;
	str = str.replace('\\', '\\u005C');
	str = str.replace('\'', '\\u0027');
	str = str.replace('(', '\\u0028');
	str = str.replace(')', '\\u0029');
	str = str.replace('\"', '\\u0022');
	str = str.replace(';', '\\u0038');

	//str = Jtrim(str);

	return str;
}

function isContains(_validateStr, _validator) {
	for (var i = 0; i < _validateStr.length; i++) {
		if (_validateStr[i] == _validator)
			return true;
	}

	return false;
}

function writeValidateInfo(info, thisObj) {
	var inputName = getInputNameFromObject(thisObj);
	info = inputName + "的输入有误！\n" + info;
	if (ConfigValidateInfoType.indexOf("writePage") >= 0) {
		writeValidateInfoAfterObject(info, thisObj);
	}
	if (ConfigValidateInfoType.indexOf("writeAlert") >= 0) {
		writeValidateInfoAlert(info, thisObj);
	}
	if (!rmTempStatusIsFocus) {
		setVenusInputError(thisObj);
		rmTempStatusIsFocus = true;
	}
}

function setVenusInputError(_frm) {
	try {
		//_frm.click();  // click会导致文件上传错误
		_frm.focus();
		//由于SELCET不支持内容选择，且不用内容选择，所以特殊处理，防止报错
		//修改：李岳 2009-11-12
		if (_frm.tagName != "SELECT") {
			_frm.select();
		}
		_frm.style.borderStyle = "dashed";
		_frm.style.borderColor = "rgb(255,50,0)";
		if (_frm.value != null && _frm.value.length > 0) {
			_frm.style.backgroundColor = "highlight";
			_frm.style.color = "white";
		}
	} catch (e) {
		alert(e.message);
	}
}

function writeValidateInfoAlert(info, thisObj) {
	if (!rmTempStatusIsAlert) {
		alert(info);
		rmTempStatusIsAlert = true;
	}
}

function writeValidateInfoAfterObject(info, thisObj) { //写校验信息
	var validateInfoObj = null;
	thisObj = getValidatePosition(thisObj);
	if (thisObj.nextSibling != null
			&& thisObj.nextSibling.nextSibling != null
			&& thisObj.nextSibling.tagName != null
			&& thisObj.nextSibling.tagName.toUpperCase() == "FONT"
			&& thisObj.nextSibling.nextSibling.tagName.toUpperCase() == "SPAN"
			&& thisObj.nextSibling.nextSibling.className == "font_remain_prompt") {
		validateInfoObj = thisObj.nextSibling.nextSibling;
	} else {
		thisObj.insertAdjacentHTML("afterEnd",
				"<font></font><span class=font_remain_prompt></span>");
		validateInfoObj = thisObj.nextSibling.nextSibling;
	}
	if (validateInfoObj.innerHTML.length > 0 || info.length > 0) {
		validateInfoObj.innerHTML = info;
	}
}

function getValidatePosition(thisObj) {
	if (thisObj.nextSibling != null
			&& thisObj.nextSibling.className == "refButtonClass") {
		thisObj = getValidatePosition(thisObj.nextSibling);
	} else if (thisObj.nextSibling != null
			&& thisObj.nextSibling.type == "hidden") {
		thisObj = getValidatePosition(thisObj.nextSibling);
	}
	return thisObj;
}

function getInputNameFromObject(thisInput) {
	var inputName = thisInput.inputName;
	if (inputName == null || inputName.length == 0) {
		inputName = thisInput.name;
		if (inputName == null || inputName.length == 0) {
			inputName = "";
		}
	}
	return inputName;
}

function getStrLength(str) {
	var len = 0;
	for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 255)
			len += 2;
		else
			len++;
	}
	return len;
}

/**********************************************************************
 *ranmin validate
 ***********************************************************************/
function notNull(s, thisInput) { //不能为空
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		writeValidateInfo("不能为空或空格！", thisInput);
		return false;
	}
	var s = Jtrim(s);
	if (s.length == 0) {
		writeValidateInfo("不能为空或空格！", thisInput);
		return false;
	}
	return true;
}

function isJine(s, thisInput) { //不能为空
	var a = /^[0-9]*(\.[0-9]{1,2})?$/;
	if (!a.test(s)) {
		writeValidateInfo("有非法字符或者小数点位数超过两位", thisInput);
		return false;
	} else {
		return true;
	}
}

function isMobile(s, thisInput) { //是手机号码：必须以数字开头，除数字外，可含有“-” 
	//去掉空格

	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}
	var obj = new Array()
	obj[0] = "13";
	obj[1] = "14";
	obj[2] = "15";
	obj[3] = "18";

	if (s != null) {
		if (s.length != 11) {
			writeValidateInfo('请输入合法的手机号码！', thisInput);
			return false;
		}
		var mob = 0;
		for (var int = 0; int < obj.length; int++) {
			if (s.substring(0, 2) == obj[int]) {
				mob = mob + 1;
			}
		}
		if (mob == 0) {
			writeValidateInfo('请输入合法的手机号码！', thisInput);
			return false;
		}
	}
	var patrn = /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
	if (!patrn.exec(s)) {
		writeValidateInfo('请输入合法的手机号码！', thisInput);
		return false;
	}

	return true;
}

function isPostalCode(s, thisInput) { //是邮政编码
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}

	var patrn = /^[a-zA-Z0-9 ]{3,12}$/;
	if (!patrn.exec(s)) {
		writeValidateInfo('请输入合法的邮政编码！', thisInput);
		return false;
	}

	return true;
}

function isTel(s, thisInput) { //是电话普通电话、传真号码：可以“+”开头，除数字外，可含有“-” 
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}

	var patrn = /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
	if (!patrn.exec(s)) {
		writeValidateInfo('请输入合法的电话号码！', thisInput);
		return false
	}

	return true;
}

function isTelForFax(s, thisInput) { //是电话普通电话、传真号码：可以“+”开头，除数字外，可含有“-” 
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}
	var patrn = /^(\d){3,4}[-](\d){7,8}$/;
	if (!patrn.exec(s)) {
		writeValidateInfo('请输入合法的座机号码，例如：010-88888888！', thisInput);
		return false
	}

	return true;
}

function isFax(s, thisInput) { //是电话普通电话、传真号码：可以“+”开头，除数字外，可含有“-” 
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}
	var patrn = /^(\d){3,4}[-](\d){7,8}$/;
	if (!patrn.exec(s)) {
		writeValidateInfo('请输入合法的传真号码，例如：010-88888888！', thisInput);
		return false
	}

	return true;
}

function isChinese(s, thisInput) { //是中文
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}

	var ret = ischinese(s);
	if (!ret) {
		writeValidateInfo("请输入中文", thisInput);
		return ret;
	}

	return ret;
}

function notChinese(s, thisInput) { //不含中文
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}

	var ret = ischinese(s);

	if (ret) {
		writeValidateInfo("不能输入中文", thisInput);
		return false;
	}

	return true;
}

function isNum(s, thisInput) { //是数字 
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}

	var digits = "0123456789";
	var i = 0;
	var sLength = s.length;

	while ((i < sLength)) {
		var c = s.charAt(i);
		if (digits.indexOf(c) == -1) {

			writeValidateInfo("请输入数字！", thisInput);
			return false;
		}
		i++;
	}
	return true;
}

function isNumBigtoZero(s, thisInput) { //是数字 
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}

	var digits = "0123456789";
	var i = 0;
	var sLength = s.length;

	while ((i < sLength)) {
		var c = s.charAt(i);
		if (digits.indexOf(c) == -1) {

			writeValidateInfo("请输入数字！", thisInput);
			return false;
		}
		i++;
	}
	try {
		if (thisInput.value <= 0) {
			writeValidateInfo("输入数值必须大于零！", thisInput);
			return false;
		}
	} catch (e) {

	}
	return true;
}
function isEmail(s, thisInput) { //是电子邮件
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}

	if (s.length > 100) {
		writeValidateInfo("email地址长度不能超过100位!", thisInput);
		return false;
	}

	var regu = /^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]{2}|net|NET|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT)$/;

	if (regu.exec(s)) {
		return true;
	} else {
		writeValidateInfo("请输入有效合法的E-mail地址 ！", thisInput);
		return false;
	}
}

function isIP() { //是IP

	var patrn = /^[0-9.]{1,20}$/;
	if (!patrn.exec(s)) {
		writeValidateInfo('请输入IP值！', thisInput);
		return false
	}
	return true;
}

/**********************************************************************
 *Venus Web JavaScript Code:HTC 校验notNull
 ***********************************************************************/
function notNullWithoutTrim(s, thisInput) { //是""
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		writeValidateInfo('请输入，该项不能为空！', thisInput);
		return false;
	}
	return true;
}

function isInteger(str, thisInput) { //是整数
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	str = str.trim();

	if (str.length == 0) {
		return true;
	}

	var reg = "0123456789";
	for (var i = 0; i < str.length; i++) {
		var m = str.charAt(i);
		if (reg.indexOf(m) == -1) {
			writeValidateInfo('请输入整数！', thisInput);
			return false;
		}
	}
	return true;
}
function isNormalStrOnWeb(s, thisInput) { //是普通字符(非html标记)
	if (s.substring(0, 1) == "<" || s.substring(0, 1) == "\>"
			|| s.substring(0, 1) == " ") {
		writeValidateInfo("焦点处不能以<或\>或空格开头", thisInput);
		return false;
	}

	if (!HoldCode(s)) {
		writeValidateInfo("焦点处不能输入全角\"·\"/\"—\"/\"——\"字符", thisInput);
		return false;
	}
	if (s.trim().length > 0) {
		if (s.indexOf("\"") > -1) {
			writeValidateInfo("焦点处不能输入双引号!!", thisInput);
			return false;
		}
		if (s.indexOf("\'") > -1) {
			writeValidateInfo("焦点处不能输入单引号", thisInput);
			return false;
		}
		if (s.indexOf("\\") > -1) {
			writeValidateInfo("焦点处不能输入 '\\' ", thisInput);
			return false;
		}
	}
	return true;
}

//基本函数列表
function Jtrim(str) { //去空隔函数
	var i = 0;
	var len = str.length;
	if (str == "")
		return (str);
	var j = len - 1;
	var flagbegin = true;
	var flagend = true;
	while (flagbegin == true && i < len) {
		if (str.charAt(i) == " ") {
			i = i + 1;
			flagbegin = true;
		} else {
			flagbegin = false;
		}
	}

	while (flagend == true && j >= 0) {
		if (str.charAt(j) == " ") {
			j = j - 1;
			flagend = true;
		} else {
			flagend = false;
		}
	}

	if (i > j)
		return ("");

	var trimstr = str.substring(i, j + 1);
	return trimstr;
}

function isNumber(s) { //数字判断函数
	s = s.trim();
	if (s.length == 0) {
		return true;
	}

	var digits = "0123456789";
	var i = 0;
	var sLength = s.length;

	while ((i < sLength)) {
		var c = s.charAt(i);
		if (digits.indexOf(c) == -1) {
			return false;
		}
		i++;
	}
	return true;
}

function ischinese(s) { //判断是否中文函数
	var ret = true;
	for (var i = 0; i < s.length; i++)
		ret = ret && (s.charCodeAt(i) >= 10000);
	return ret;
}

/**********************************************************************
 *Venus Web JavaScript Code:HTC 表单通用检验(完善中)
 ***********************************************************************/
function HoldCode(str) {
	for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) == 8212 || str.charCodeAt(i) == 183) {
			return false;
		}
	}
	return true;
}

function validateForm(current_form) {
	for (var i = 0; i < current_form.length; i++) {
		if (current_form[i].type == "text" || current_form[i].type == "radio") {
			if (current_form[i].value.substring(0, 1) == "<"
					|| current_form[i].value.substring(0, 1) == "\>"
					|| current_form[i].value.substring(0, 1) == " ") {
				alert("焦点处不能以<或\>或空格开头");
				current_form[i].focus();
				current_form[i].select();
				return false;
			}

			if (getStrLength(current_form[i].value) > current_form[i].maxLength) {
				alert("焦点处输入长度超长\n请确保输入长度在" + current_form[i].maxLength + "以内");
				current_form[i].focus();
				current_form[i].select();
				return false;
			}
			if (!HoldCode(current_form[i].value)) {
				alert("焦点处不能输入全角\"·\"/\"—\"/\"——\"字符");
				current_form[i].focus();
				current_form[i].select();
				return false;
			}
			if (!is_empty(current_form[i].value)) {
				if (current_form[i].name == "scriptDefine") {
					return true;
				}
				if (current_form[i].value.indexOf("\"") > -1) {
					alert("焦点处不能输入双引号");
					current_form[i].focus();
					current_form[i].select();
					return false;
				}
			}
		}
	}
	return true;
}

function checkNumber(s, inputName) {
	try {
		//去掉空格
		try {
			thisInput.value = thisInput.value.trim();
		} catch (e) {

		}
		s = s.trim();

		if (s.length == 0) {
			return true;
		}

		var thisObj = event.srcElement;
		var maxLength = thisObj.integerDigits;
		var scale = thisObj.decimalDigits;
		return checkNumberImpl(s, maxLength, scale);
	} catch (e) {
	}
}

function checkNumberImpl(s, maxLength, scale) { //校验运行里程,小数,整数部分最多为10-2
	if (s == "") {
		return true;
	}
	if (scale == undefined) {
		scale = 0;
	}
	if (maxLength == undefined) {
		maxLength = 38;
	}
	if (!isFloatNumber(s)) {
		return false;
	}
	if (s.indexOf(".") > 0) {
		if (s.indexOf(".") <= maxLength
				&& (Math.round(s * (pow(10, scale))) < (pow(10,
						(maxLength + scale))))) {
			return true;
		} else {
			alert("整数部分最大为" + (maxLength - scale) + "位！");
			return false;
		}
	} else {
		if (s.length <= maxLength) {
			return true;
		} else {
			alert("整数部分最大为" + maxLength + "位！！");
			return false;
		}
	}
}

function isFloatNumber(s, inputName) { //判断是否
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}

	var digits = "0123456789.";
	var i = 0;
	var sLength = s.trim().length;

	while ((i < sLength)) {
		var c = s.charAt(i);
		if (digits.indexOf(c) == -1) {
			writeValidateInfo("请输入有效数字！", inputName);
			return false;
		}
		i++;
	}
	if (s.indexOf(".") != s.lastIndexOf(".")) {
		alert("小数点不对,请输入有效数字！");
		return false;
	} else {
		return true;
	}
}

function isSearch(s, thisInput) { //不能输入非法字符
	if (s.length == 0)
		return true;
	var patrn = /^[^`~!@#$%^&*()+=|\\\][\]\{\}:;'\,.<>/?]{1}[^`~!@$%^&()+=|\\\][\]\{\}:;'\,.<>?]{0,5000}$/;
	var patrn2 = /[^\{\|\.\\,<>"'_}/]/;
	if (!patrn.exec(s) || !patrn2.exec(s)) {
		writeValidateInfo('输入项中含非法字符，请重新输入！', thisInput);
		return false;
	}
	return true;
}

//===============================================================================================
/**
 * 验证数字(正整数或者包含小数的数字).
 */
function isNumeric(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	value = value.trim();

	if (value.length == 0) {
		return true;
	}

	var reg = /^\d+(\.\d+)?$/;

	if (!reg.test(value)) {
		writeValidateInfo("请输入正整数或者小数！", thisInput);
		return false;
	}

	return true;
}

/**
 * 验证数字(正整数).
 */
function checkInt(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	value = value.trim();

	if (value.length == 0) {
		return true;
	}

	var reg = /^[0-9]\d*$/;

	if (!reg.test(value)) {
		writeValidateInfo("请输入正整数！", thisInput);
		return false;
	}

	return true;
}
/**
 * 验证数字(整数位最大为10位,可以带小数)
 */
function validateNumericAndLength(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	value = value.trim();

	if (value.length == 0) {
		return true;
	}

	var reg = /^\d{1,10}(\.\d+)?$/;

	if (!reg.test(value)) {
		writeValidateInfo("请输入正整数或者小数(整数位只能有10位)！", thisInput);
		return false;
	}

	return true;
}

/**
 * 验证数字(18,2)
 */
function isNum18p2(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {
	}
	value = value.trim();
	if (value.length == 0) {
		return true;
	}
	var reg = /^(-)?\d{1,16}(\.\d{1,2})?$/;
	if (!reg.test(value)) {
		writeValidateInfo("请输入数字(整数位最多16位，小数位最多2位)！", thisInput);
		return false;
	}
	return true;
}

/**
 * 验证数字(18,4)
 */
function isNum18p4(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {
	}
	value = value.trim();
	if (value.length == 0) {
		return true;
	}
	var reg = /^(-)?\d{1,14}(\.\d{1,4})?$/;
	if (!reg.test(value)) {
		writeValidateInfo("请输入数字(整数位最多14位，小数位最多4位)！", thisInput);
		return false;
	}
	return true;
}

/**
 * 验证数字(5,2)
 */
function isNum5p2(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {
	}
	value = value.trim();
	if (value.length == 0) {
		return true;
	}
	var reg = /^(-)?\d{1,3}(\.\d{1,2})?$/;
	if (!reg.test(value)) {
		writeValidateInfo("请输入数字(整数位最多3位，小数位最多2位)！", thisInput);
		return false;
	}
	return true;
}

/**
 * 验证Email.
 */
function checkEmail(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	value = value.trim();

	if (value.length == 0) {
		return true;
	}

	var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

	if (!reg.test(value)) {
		writeValidateInfo("请输入正确的Email地址！", thisInput);
		return false;
	}

	return true;
}

/**
 * 验证身份证(15位或者18位身份证).
 */
function checkIdCard(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	value = value.trim();

	if (value.length == 0) {
		return true;
	}

	var reg = /^\d{15}(\d{2}[A-Za-z0-9])?$/;

	if (!reg.test(value)) {
		writeValidateInfo("请输入正确的身份证号码！", thisInput);
		return false;
	}

	return true;
}

/**
 * 验证邮政编码.
 */
function checkPostCode(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	value = value.trim();

	if (value.length == 0) {
		return true;
	}

	var reg = /^[0-9]\d{5}$/;

	if (!reg.test(value)) {
		writeValidateInfo("请输入正确的邮政编码！", thisInput);
		return false;
	}

	return true;
}

/**
 * 验证是否为中文字符.
 */
function checkChinese(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	value = value.trim();

	if (value.length == 0) {
		return true;
	}

	var reg = /^[\u0391-\uFFE5]+$/;

	if (!reg.test(value)) {
		writeValidateInfo("请输入中文字符！", thisInput);
		return false;
	}

	return true;
}

/**
 * 验证是否为非法字符.
 */
function checkInvalidString(value, thisInput) {
	var reg = /^[^`~!@#$%^&*()+=|\\\][\]\{\}:;'\,.<>/?]*$/;

	if (!reg.exec(value)) {
		writeValidateInfo("输入的字符中包含特殊字符，请重新输入！", thisInput);
		return false;
	}

	return true;
}

function checkMoney(s, inputName) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	s = s.trim();

	if (s.length == 0) {
		return true;
	}

	if (s == "") {
		writeValidateInfo("金额不能为空！", inputName);
		return false;
	}
	if (isFloatNumber(s, inputName) == false) {
		writeValidateInfo("非法金额值！", inputName);
		return false;
	}
	var maxLength = 10;
	var scale = 2;
	return checkNumberImpl(s, maxLength, scale, inputName);
}

/**
 * 校验分数是否在0-100
 */
function isAdultAge(str, thisInput) { //是整数
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	str = str.trim();

	if (str.length == 0) {
		return true;
	}

	if (parseInt(str) < 0 || parseInt(str) > 100) {
		writeValidateInfo('请输入合法分数（0--100之间）！', thisInput);
		return false;
	}
	return true;
}

/**
 * 6 级强度设置（数字、大写字母、小写字母、特殊字符、长度>=6、长度>=10）
 * 如果密码为空，返回 0
 */
function pwdStrength(pwd) {
	var sum = [ 0, 0, 0 ];
	for (var i = 0; i < pwd.length; i++) {
		var c = pwd.charCodeAt(i);
		if (c >= 48 && c <= 57) //数字
			sum[0] = 1;
		else if (c >= 65 && c <= 90) //大写字母
			sum[1] = 1;
		else if (c >= 97 && c <= 122) //小写字母
			sum[1] = 1;
		else
			//特殊字符
			sum[2] = 1;
	}
	var level = sum[0] + sum[1] + sum[2];
	if (pwd.length >= 8)
		level++;
	return level;
}
function isBiggerZero(value, thisInput) { //已经是数字，然后必须大于0
	if (thisInput.value <= 0) {
		writeValidateInfo('请输入一个大于零的数字！', thisInput);
		return false;
	}
	return true;
}

function isNonnegative(value, thisInput) {
	if (thisInput.value < 0) {
		writeValidateInfo('请输入一个非负的数字！', thisInput);
		return false;
	}
	return true;
}

/**
 * 验证数字(20,6)
 */
function isNum20p6(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {
	}
	value = value.trim();
	if (value.length == 0) {
		return true;
	}

	var reg = /^(-)?\d{1,14}(\.\d{1,6})?$/;
	if (!reg.test(value)) {
		writeValidateInfo("请输入数字(整数位最多14位，小数位最多6位)！", thisInput);
		return false;
	}
	return isBiggerZero(value, thisInput);
}

/**
 * 验证数字(18,6)
 */
function isNum18p6(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {
	}
	value = value.trim();
	if (value.length == 0) {
		return true;
	}

	var reg = /^(-)?\d{1,12}(\.\d{1,6})?$/;
	if (!reg.test(value)) {
		writeValidateInfo("请输入数字(整数位最多12位，小数位最多6位)！", thisInput);
		return false;
	}
	return isBiggerZero(value, thisInput);
}

function isNonnegative20p6(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {
	}
	value = value.trim();
	if (value.length == 0) {
		return true;
	}

	var reg = /^(-)?\d{1,14}(\.\d{1,6})?$/;
	if (!reg.test(value)) {
		writeValidateInfo("请输入数字(整数位最多14位，小数位最多6位)！", thisInput);
		return false;
	}
	return isNonnegative(value, thisInput);
}

/**
 * 验证数字(20,4)
 */
function isNum20p4(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {
	}
	value = value.trim();
	if (value.length == 0) {
		return true;
	}

	var reg = /^(-)?\d{1,16}(\.\d{1,4})?$/;
	if (!reg.test(value)) {
		writeValidateInfo("请输入数字(整数位最多16位，小数位最多4位)！", thisInput);
		return false;
	}
	return isBiggerZero(value, thisInput);
}

/**
 * 供应商输入的单批次保证金金额只能是正整数并且只能精确到百位
 */
function isDPCBZJ(value, thisInput) {
	//去掉空格
	try {
		thisInput.value = thisInput.value.trim();
	} catch (e) {

	}
	value = value.trim();

	if (value.length == 0) {
		return true;
	}

	var reg = /^[1-9]\d*00$/;

	if (!reg.test(value)) {
		writeValidateInfo("请输入正确的保证金金额！", thisInput);
		return false;
	}

	return true;
}

//报表招标年度起始年度不能大于终止年度的判断
function validateYear(startYear, endYear, flag) {
	if (startYear > endYear) {
		if (flag == 1) {
			alert("起始月份不能大于终止月份");
			return false;
		} else {
			alert("招标起始年度不能大于终止年度");
			return false;
		}
	}
	return true;
}
