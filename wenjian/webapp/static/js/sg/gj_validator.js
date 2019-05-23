(function($){
  	/*验证插件 主方法入口*/
	 $.fn.gjValidator = function(options){
  		 this.each(function(){
			 var ops = $.extend({},$.fn.gjValidator.defaults,$.fn.gjValidator.methods,options,
				 $.fn.gjValidator.jvalidator);
			     ops.init($(this),ops);
 		 });
 	 };
	/*验证插件 默认方法*/
 	$.fn.gjValidator.methods ={
		init:function($from,ops){
			/*对象发生偏移了*/
			var $this = this;
 			 $from.find(ops.opclass).on("click",function(){
				 var flag2 = $this._validator($from,ops);
 				 if(flag2){
						//回调函数
						if(ops.ajax){
							ops.callback($from);
						}else{
							$from.submit();
						};
				}else{
					return false;
				};
  			 });
   		},
		/*验证方法 先验证空 再验证正则表达式*/
		_validator:function($from,ops){
			var $this = this;
			var flag = true;
			$from.find("[gjrequired],[gjvalidator],[to]").each(function(){
				var val = $(this).val();
 				var gjrequired = $(this).attr("gjrequired");
				if(isEmpty(val) && eval("gjrequired")){
					$(this).css("border","2px solid red");
					$(this).focus();
					$this._showMessage($(this),$(this).attr("title"),"error");
					flag = false;
					return false;
				}else{
					$(this).css("border","1px solid #ccc");
					$this._showMessage($(this),$(this).attr("title"),"corrent");
 				};
				var to = $(this).attr("to");
  				if(isNotEmpty(val) && eval("to")){
					var value = $("#password").val();
					var tovalue = $("#"+to+"").val();
					if(value != tovalue){
 						$(this).focus();
					    $this._showMessage($("#"+to+""),"密码不一致","error");
						$this._showMessage($("#password"),"密码不一致","error");
 						flag = false;
						return false;
					}else{
					   return true;
					};
 				};
				var gjvalidator = $(this).attr("gjvalidator");
   				if(isNotEmpty(val) && isNotEmpty(gjvalidator) && !ops[gjvalidator]($(this))){
					/*验证原则 先验证不为空 再验证正则表达式*/
 					$(this).focus();
					flag = false;
					return false;
				}else{
 					return true;
				};
    		});
				return flag;
		},
		/*提示语显示*/
		_showMessage:function($target,msg,flag){
  			var $span = $target.next();
			if(isEmpty($span.html())){
				$span = $("<span></span>");
 			}
 			if(flag =="error"){
  				$span.removeClass("green").addClass("red").text(msg);
			}else{
 				$span.removeClass("red").addClass("green").text("正确");
 			}
			$target.after($span);
 		}
	};
	/*插件正则验证方法调用*/
	$.fn.gjValidator.jvalidator = {
		email:function($target){
			return jxtvEmail($target);
		},
		telephone:function($target){
			return jxtvTelephone($target);
		},
		mobile:function($target){
			return jxtvMobile($target);
		},
		password:function($target){
			return jxtvPassword($target);
		},
		pin:function($target){
			return jxtvPin($target);
		},
		minfix:function($target){
			return jxtvMinFif($target);
		}
	};

	/*插件默认参数*/
	$.fn.gjValidator.defaults = {
 			opclass:".gj_submit",
			ajax:true,
			callback:function($from){}
	};

	/*空判断*/
	function isEmpty(val) {
		val = $.trim(val);
		if (val == null)
			return true;
		if (val == undefined || val == 'undefined')
			return true;
		if (val == "")
			return true;
		if (val.length == 0)
			return true;
		if (!/[^(^\s*)|(\s*$)]/.test(val))
			return true;
		return false;
	};
	/*非空判断*/
	function isNotEmpty(val) {
		return !isEmpty(val);
	};

	/*****************正则表达式验证器**********************/
	
	/*固定电话号码*/
	function jxtvTelephone($target) {
		return  jxtvValidate($target, /^\d{3}-\d{8}|\d{4}-\d{7}$/, {
			msg :"电话号码不正确!"
		});
	};
	
	/*邮箱*/
	function jxtvEmail($target) {
		return  jxtvValidate($target, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, {
			msg :"邮箱格式不正确"
		});
	};
	
	/*手机*/
	function jxtvMobile($target) {
		return  jxtvValidate($target, /^(13|15|18)\d{9}$/, {
			msg :"手机号码不正确!"
		});
	};
	/*密码验证*/
	function jxtvPassword($target){
		return jxtvValidate($target,/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+`\-={}:";'<>?,.\/]).{6,16}$/,{
			msg:"密码格式不正确 ! 必须由 6-16位字母、数字、特殊符号线组成"
		});
	};
	
	/*支付密码验证*/
	function jxtvPin($target){
		return jxtvValidate($target,/^(?=.*[a-zA-Z])(?=.*\d).{6,16}$/,{
			msg:"支付密码格式不正确 ! 必须由 6-16位字母、数字组成"
		});
	};
	/*验证数字不超过50长度*/
	function jxtvMinFif($target){
		return jxtvValidate($target,/^([\u4e00-\u9fa5]|[0-9_a-zA-Z]){1,50}$/,{
			msg:" 输入的字数长度超出限制了..."
		});
	};
 	 
	/*正则验证 总控制中心*/
	function jxtvValidate($target,regexg,msg){
		if(regexg.test($target.val())){
			$.fn.gjValidator.methods._showMessage($target,"","current");
			return true;
		}else{
			$.fn.gjValidator.methods._showMessage($target,msg.msg,"error");
			return false;
		}
 	};
  })(jQuery)