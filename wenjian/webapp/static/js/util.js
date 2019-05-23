var windowDiv;

function privateHideProgressbar()
{ 
        var loader = document.getElementById("load"); 
        document.onmousemove=null;
        loader.style.display = "none";  
       
}
function privateShowProgressbar()
{      
        var loader = document.getElementById("load"); 
        document.onmousemove=privateProgressbarMove;
        loader.style.display = "block";  
        
}
function privateProgressbarMove(e)
{
    var curStyle;
    var loader = document.getElementById("load"); 
    curStyle=loader.style;
    curStyle.visibility="visible";
    var height;
    var width;
    height=curStyle.pixelHeight;
    width=curStyle.pixelWidth;
    width=parseInt(width);
    height=parseInt(height);
    var posx;
    posx=event.clientX;
    var newleft;
    if (posx>=(document.body.clientWidth - 5 - width))
    {
      newleft=document.body.clientWidth + document.body.scrollLeft - 5 - width;
    }
    else{
      newleft=document.body.scrollLeft + posx;
    }
    curStyle.pixelLeft=newleft;
    var posy;
    posy=event.clientY;
    var newtop;
    if (posy > (document.body.clientHeight - 5 - height))
    {
      newtop=document.body.clientHeight + document.body.scrollTop - 5 - height;
    }
    else{
      newtop=document.body.scrollTop + posy;
    }
    curStyle.pixelTop=newtop;
}

function privateCreateWindow(w,h,t){
   var idd = "#"+windowDiv[windowDiv.length-1].id;
   $(idd).dialog({width:w,height:h,title:t,hide:"true",show:"true",close:privateCloseWindowDiv,modal:true,overlay:{opacity:0.5,background:"black"} });
}

function privateCloseWindowDiv(){
     var vv = windowDiv.pop();
     vv.parentNode.removeChild(vv);
}
function privateCreateWindowDiv(){
    if(windowDiv==null){
       windowDiv= new Array();
    }
    var t = "t"+new Date().getTime();
    var winDiv = document.createElement('div');
    winDiv.id=t;
    winDiv.className="flora";
    var tit = $("#title").val();
    if(tit==undefined){
          tit="对话框";
    }
    winDiv.title=tit;
    
    windowDiv.push(winDiv);
    document.body.appendChild(winDiv);
    return t;
}
function privateInsertFormData(data){
        var idd = "#"+windowDiv[windowDiv.length-1].id;
        $(idd).dialog("close");
        privateCreateWindowDiv();
        idd = "#"+windowDiv[windowDiv.length-1].id;
        $(idd).html(data);
       
        var t = $("#title").val();
        if(t==undefined){
          t="对话框";
        }
        var w = 600;
        if($("#resizetable").attr("width")!=undefined){
           w = Number($("#resizetable").attr("width"))+35;
        }
        var h =550;
        if($("#resizetable").attr("height")!=undefined){
           h = Number($("#resizetable").attr("height"))+55;
        }
        privateCreateWindow(w,h,t);
}
function privateMergeUrl(url,arg,f,a,postarg){
  if(a==undefined){
     a=".action"; 
  }
  var pos = url.indexOf(a);
  if(pos==-1){
        url=url+a;
  }
  if(f!=undefined){
    if(arg!=undefined){
       var arr = arg.split("&");
       for(var i=0;i<arr.length;i++){
          var par = arr[i].split("=");
          var hid = document.createElement('input');
          hid.type="hidden";
          hid.name=par[0];
          hid.value=par[1];
          f.appendChild(hid);
       }
    }
    f.action=url;
  }else{
    if(arg!=undefined){
      if(postarg!=undefined){
        var arr = arg.split("&");
        for(var i=0;i<arr.length;i++){
           var par = arr[i].split("=");
           postarg[par[0]]=par[1];
        }     
      }else{
        url=url+"?"+arg;
      }
    }
  }
  return url;
}

//dialog
function openServletWindow(url,arg) {
     var postarg=new Object();
     url = privateMergeUrl(url,arg,undefined,".do",postarg);
     privateShowProgressbar();
     $.post(url,postarg, function (data) {
       privateHideProgressbar();
       
       var idd = "#"+windowDiv[windowDiv.length-1].id;
       $(idd).html(data);
       
        var t = $("#title").val();
        if(t==undefined){
          t="对话框";
        }
        var w = 600;
        if($("#resizetable").attr("width")!=undefined){
           w = Number($("#resizetable").attr("width"))+35;
        }
        var h =550;
        if($("#resizetable").attr("height")!=undefined){
           h = Number($("#resizetable").attr("height"))+55;
        }
        privateCreateWindow(w,h,t);
     });
}
function openSelectWindow(url,arg) {
     if(url.substring(url.length-".action".length)!=".action"){
        url=url+".action";
     }
     if(arg!=undefined){
      url=url+"?"+arg;  
    }
    var w=1;
    var h=1;
   
	var t = (screen.height - h) / 2;
	var l = (screen.width - w) / 2;
	var win = window.open(url, "_blank", "height=" + h + ",width=" + w + ",top=" + t + ",left=" + l + ",toolbar=no," + "menubar=no,scrollbars=yes,resizable=yes,location=no,status=yes");
	//showModalDialog(url,"","dialogWidth=430px;dialogHeight=115px;center:yes;status:no;help:no;scroll:no ")	;
	// var win = window.showModalDialog(url,"","dialogWidth="+w+"pt;dialogHeight="+h+"pt;center:yes;status:no;help:no;scroll:no");
	if (win.opener == null) win.opener = window;
	win.focus();
}
function openWindow(url,arg) {
     var postarg=new Object();
     url = privateMergeUrl(url,arg,undefined,".action",postarg);
     
     privateShowProgressbar();
     privateCreateWindowDiv();
     $.post(url,postarg, function (data) {
       privateHideProgressbar();
       var idd = "#"+windowDiv[windowDiv.length-1].id;
        $(idd).html(data);
        var t = $("#title").val();
        if(t==undefined){
          t="对话框";
        }
        var w = 600;
        if($("#resizetable").attr("width")!=undefined){
           w = Number($("#resizetable").attr("width"))+35;
        }
        var h =550;
        if($("#resizetable").attr("height")!=undefined){
           h = Number($("#resizetable").attr("height"))+55;
        }
        
        
        privateCreateWindow(w,h,t);
       
        windowDiv[windowDiv.length-1].url=url;
     });
}
function closeWindow() {
    if(windowDiv.length>0){
       var idd = "#"+windowDiv[windowDiv.length-1].id;
       $(idd).dialog("close");
    }
}

function reloadWindow(){
    if(windowDiv.length>0){
       var url = windowDiv[windowDiv.length-1].url;
       closeWindow();
       openWindow(url);
    }
}
function windowCount(){
    return windowDiv.length;
}

function goFormWindow(f,url,arg){
     url = privateMergeUrl(url,arg,f);
     $('#'+f.id).ajaxForm(function(data) {
  	      privateInsertFormData(data);
     });
     $('#'+f.id).submit();
}
function goWindow(url,arg){
     var postarg=new Object();
     url = privateMergeUrl(url,arg,undefined,".action",postarg);
     $.post(url,postarg, function (data) {
       privateInsertFormData(data);
     });
}
function goPage(url,arg) {
     window.location=privateMergeUrl(url,arg);
}
function goFormPage(url,arg) {
    var f = document.forms[0];
    if(f!=undefined){
       privateMergeUrl(url,arg,f);
       f.submit();
    }else{
       goPage(url,arg);
    }
}

//window
function operateWindow(url,arg,tip){
  if(tip==undefined){
    tip="";
  }
  if(window.confirm(tip)){
     openWindow(url,arg);
  }
}

function resizeWindow() {
    window.setTimeout(resizeWindowEvent,1); 
}
function resizeWindowEvent() {
    var width = Number(window.document.all['resizetable'].width)+30 ;
    var height = Number(window.document.all['resizetable'].height)+80;
	window.resizeTo(width, height);
	var t = (screen.height - height) / 2;
	var l = (screen.width - width) / 2;
	window.moveTo(t, l);
}

function maxWindow() {
    window.setTimeout(maxWindowEvent,1); 
}
function maxWindowEvent() {
    var width = window.screen.availWidth;
    var height = window.screen.availHeight;
	window.resizeTo(width, height);
	window.moveTo(0, 0);
}
//pagination
function proiPage(f,c){
	f.currentPage.value=c-1;
	f.submit();
}
function nextPage(f,c)
{    f.currentPage.value=c+1;
	f.submit();
}
function checkCurPage(f){
	var v = f.curPage.value;
    if(v==""){
		alert("请输入转向页号");
		return false;
	}
	v=parseInt(v);
	if(isNaN(v)){
		alert("页号必须是数字");
		return false;
	}
	if(v>parseInt(f.pageNumber.value)){
		alert("页号必须小于"+f.pageNumber.value);
		return false;
	}
	if(v<=0){
		alert("页号必须大于0");
		return false;
	}
	f.currentPage.value=v;
	return true; 
}
function seachPage(f)
{   if(checkCurPage(f)){
	   f.submit();
    }
}
//other
function choiceCategory() {
	var url="../category/selectCategories.action";
	$.post(url,function(data) {	
		$("#categoryTree").html(data);
	});
}

function ltrim(str)
{ 
	var position; 
	position = str.length; 
	for(var i=0;i<str.length;i++)
	{ 
		if(str.charAt(i)!=" ")
		{ 
			position=i; 
			break;
		} 
	} 
	return (str.substring(position,str.length)); 
}

function rtrim(str){ 
	var position; 
	position = str.length; 
		for(var i=str.length-1;i>=0;i--)
		{ 
			if(str.charAt(i)!=" ")
			{ 
				position=i; 
				break; 
			} 
		} 
	return (str.substring(0,position+1)); 
}

function trim(str)
{ 
	return (ltrim(rtrim(str))); 
}

function validateXSS(str)
{
	if(str==null)
	{
		return "";
	}
	str=str.replace(/\*/g,"");
	str=str.replace(/\|/g,"");
	str=str.replace(/&/g,"");
	str=str.replace(/;/g,"");
	str=str.replace(/\$/g,"");
	str=str.replace(/%/g,"");
	str=str.replace(/@/g,"");
	str=str.replace(/\'/g,"");
	str=str.replace(/\"/g,"");
	str=str.replace(/\\\'/g,"");
	str=str.replace(/\\\"/g,"");
	str=str.replace(/</g,"");
	str=str.replace(/>/g,"");
	str=str.replace(/\(/g,"");
	str=str.replace(/\)/g,"");
	str=str.replace(/\+/g,"");
	str=str.replace(/(C|c)(R|r)/g,"");
	str=str.replace(/(L|l)(F|f)/g,"");
	str=str.replace(/,/g,"");
	//str=str.replace(/\./g,"");
	
	str=str.replace(/(U|u)(N|n)(I|i)(O|o)(N|n)/g,"");
	str=str.replace(/(S|s)(E|e)(L|l)(E|e)(C|c)(T|t)/g,"");
	str=str.replace(/(U|u)(P|p)(D|d)(A|a)(T|t)(E|e)/g,"");
	str=str.replace(/(D|d)(E|e)(L|l)(E|e)(T|t)(E|e)/g,"");
	str=str.replace(/(I|i)(N|n)(S|s)(E|e)(R|r)(T|t)/g,"");
	str=str.replace(/(A|a)(N|n)(D|d)/g,"");
	str=str.replace(/(U|u)(S|s)(E|e)(R|r)/g,"");
	str=str.replace(/(L|l)(O|o)(A|a)(D|d)_(F|f)(I|i)(L|l)(E|e)/g,"");
	str=str.replace(/(O|o)(U|u)(T|t)(F|f)(I|i)(L|l)(E|e)/g,"");
	
	return str;
}

function validateEmailXSS(str)
{
	if(str==null)
	{
		return "";
	}
	str=str.replace(/\*/g,"");
	str=str.replace(/\|/g,"");
	str=str.replace(/&/g,"");
	str=str.replace(/;/g,"");
	str=str.replace(/\$/g,"");
	str=str.replace(/%/g,"");
	str=str.replace(/\'/g,"");
	str=str.replace(/\"/g,"");
	str=str.replace(/\\\'/g,"");
	str=str.replace(/\\\"/g,"");
	str=str.replace(/</g,"");
	str=str.replace(/>/g,"");
	str=str.replace(/\(/g,"");
	str=str.replace(/\)/g,"");
	str=str.replace(/\+/g,"");
	str=str.replace(/(C|c)(R|r)/g,"");
	str=str.replace(/(L|l)(F|f)/g,"");
	str=str.replace(/,/g,"");
	
	str=str.replace(/(U|u)(N|n)(I|i)(O|o)(N|n)/g,"");
	str=str.replace(/(S|s)(E|e)(L|l)(E|e)(C|c)(T|t)/g,"");
	str=str.replace(/(U|u)(P|p)(D|d)(A|a)(T|t)(E|e)/g,"");
	str=str.replace(/(D|d)(E|e)(L|l)(E|e)(T|t)(E|e)/g,"");
	str=str.replace(/(I|i)(N|n)(S|s)(E|e)(R|r)(T|t)/g,"");
	str=str.replace(/(A|a)(N|n)(D|d)/g,"");
	str=str.replace(/(U|u)(S|s)(E|e)(R|r)/g,"");
	str=str.replace(/(L|l)(O|o)(A|a)(D|d)_(F|f)(I|i)(L|l)(E|e)/g,"");
	str=str.replace(/(O|o)(U|u)(T|t)(F|f)(I|i)(L|l)(E|e)/g,"");
	return str;
}

function validateURLXSS(str)
{
	if(str==null)
	{
		return "";
	}
	str=str.replace(/\*/g,"");
	str=str.replace(/\|/g,"");
	str=str.replace(/;/g,"");
	str=str.replace(/\$/g,"");
	str=str.replace(/%/g,"");
	str=str.replace(/\'/g,"");
	str=str.replace(/\"/g,"");
	str=str.replace(/\\\'/g,"");
	str=str.replace(/\\\"/g,"");
	str=str.replace(/</g,"");
	str=str.replace(/>/g,"");
	str=str.replace(/\(/g,"");
	str=str.replace(/\)/g,"");
	str=str.replace(/\+/g,"");
	str=str.replace(/(C|c)(R|r)/g,"");
	str=str.replace(/(L|l)(F|f)/g,"");
	str=str.replace(/,/g,"");
	
	str=str.replace(/(U|u)(N|n)(I|i)(O|o)(N|n)/g,"");
	str=str.replace(/(S|s)(E|e)(L|l)(E|e)(C|c)(T|t)/g,"");
	str=str.replace(/(U|u)(P|p)(D|d)(A|a)(T|t)(E|e)/g,"");
	str=str.replace(/(D|d)(E|e)(L|l)(E|e)(T|t)(E|e)/g,"");
	str=str.replace(/(I|i)(N|n)(S|s)(E|e)(R|r)(T|t)/g,"");
	str=str.replace(/(A|a)(N|n)(D|d)/g,"");
	str=str.replace(/(U|u)(S|s)(E|e)(R|r)/g,"");
	str=str.replace(/(L|l)(O|o)(A|a)(D|d)_(F|f)(I|i)(L|l)(E|e)/g,"");
	str=str.replace(/(O|o)(U|u)(T|t)(F|f)(I|i)(L|l)(E|e)/g,"");
	return str;
}

function getvrcookie()
{
	var strCookie=document.cookie;
	//将多cookie切割为多个名/值对
	var arrCookie=strCookie.split("; ");
	var vr;
	//遍历cookie数组，处理每个cookie对
	for(var i=0;i<arrCookie.length;i++)
	{
         var arr=arrCookie[i].split("=");
         //找到名称为userId的cookie，并返回它的值
         if("vr"==arr[0])
         {
             vr=arr[1];
             break;
         }
	}
	return vr;
};

(function($){
    $.fn.mailAutoComplete = function(options){
        var defaults = {
            boxClass: "mailListBox", // 外部box样式
            listClass: "mailListDefault", // 默认的列表样式
            focusClass: "mailListFocus", // 列表选样式中
            markCalss: "mailListHlignt", // 高亮样式
            zIndex: 1,
            autoClass: true, // 是否使用插件自带class样式
            mailArr: ["qq.com","gmail.com","126.com","163.com","hotmail.com","yahoo.com","yahoo.com.cn","live.com","sohu.com","sina.com"], // 邮件数组
            textHint: false, // 文字提示的自动显示与隐藏
            hintText: ""
            //focusColor: "#333",
            //blurColor: "#999"
        };
        var settings = $.extend({}, defaults, options || {});
         
        // 页面装载CSS样式
        if(settings.autoClass && $("#mailListAppendCss").size() === 0){
            $('<style id="mailListAppendCss" type="text/css">.mailListBox{border:1px solid #369; background:#fff; font:12px/20px Arial;}.mailListDefault{padding:0 5px;cursor:pointer;white-space:nowrap;}.mailListFocus{padding:0 5px;cursor:pointer;white-space:nowrap;background:#369;color:white;}.mailListHlignt{color:red;}.mailListFocus .mailListHlignt{color:#fff;}</style>').appendTo($("head"));
        }
        var cb = settings.boxClass, cl = settings.listClass, cf = settings.focusClass, cm = settings.markCalss; // 插件的class变量
        var z = settings.zIndex, newArr = mailArr = settings.mailArr, hint = settings.textHint, text = settings.hintText, fc = settings.focusColor, bc = settings.blurColor;
        // 创建邮件内部列表内容
        $.createHtml = function(str, arr, cur){
            var mailHtml = "";
            if($.isArray(arr)){
                $.each(arr, function(i, n){
                    if(i === cur){
                        mailHtml += '<div class="mailHover '+cf+'" id="mailList_'+i+'"><span class="'+cm+'">'+str+'</span>@'+arr[i]+'</div>';  
                    }else{
                        mailHtml += '<div class="mailHover '+cl+'" id="mailList_'+i+'"><span class="'+cm+'">'+str+'</span>@'+arr[i]+'</div>';  
                    }
                });
            }
            return mailHtml;
        };
        // 一些全局变量
        var index = -1, s;
        $(this).each(function(){
            var that = $(this), i = $(".justForJs").size();
            if(i > 0){ // 只绑定一个文本框
                return;
            }
            var w = that.outerWidth()-2, h = that.outerHeight(); // 获取当前对象（即文本框）的宽高
            // 样式的初始化
            that.wrap('<span style="display:inline-block;position:relative;"></span>')
                .before('<div id="mailListBox_'+i+'" class="justForJs '+cb+'" style="min-width:'+w+'px;_width:'+w+'px;position:absolute;left:-6000px;top:'+h+'px;z-index:'+z+';"></div>');
            var x = $("#mailListBox_" + i), liveValue; // 列表框对象
            that.focus(function(){
                // 父标签的层级
                $(this).css("color", fc).parent().css("z-index", z);   
                // 提示文字的显示与隐藏
                if(hint && text){
                    var focus_v = $.trim($(this).val());
                    if(focus_v === text){
                        $(this).val("");
                    }
                }
                // 键盘事件
                $(this).keyup(function(e){
                    s = v = $.trim($(this).val()); 
                    if(/@/.test(v)){
                        s = v.replace(/@.*/, "");
                    }
                    if(v.length > 0){
                        // 如果按键是上下键
                        if(e.keyCode === 38){
                            // 向上
                            if(index <= 0){
                                index = newArr.length; 
                            }
                            index--;
                        }else if(e.keyCode === 40){
                            // 向下
                            if(index >= newArr.length - 1){
                                index = -1;
                            }
                            index++;
                        }else if(e.keyCode === 13){
                            // 回车
                            if(index > -1 && index < newArr.length){
                                // 如果当前有激活列表
                                $(this).val($("#mailList_"+index).text()); 
                            }
                        }else{
                            if(/@/.test(v)){
                                index = -1;
                                // 获得@后面的值
                                // s = v.replace(/@.*/, "");
                                // 创建新匹配数组
                                var site = v.replace(/.*@/, "");
                                newArr = $.map(mailArr, function(n){
                                    var reg = new RegExp(site);
                                    if(reg.test(n)){
                                        return n;  
                                    }
                                });
                            }else{
                                newArr = mailArr;
                            }
                        }
                        x.html($.createHtml(s, newArr, index)).css("left", 0);
                        if(e.keyCode === 13){
                            // 回车
                            if(index > -1 && index < newArr.length){
                                // 如果当前有激活列表
                                x.css("left", "-6000px");  
                            }
                        }
                    }else{
                        x.css("left", "-6000px");  
                    }
                }).blur(function(){
                    if(hint && text){
                        var blur_v = $.trim($(this).val());
                        if(blur_v === ""){
                            $(this).val(text);
                        }
                    }
                    $(this).css("color", bc).unbind("keyup").parent().css("z-index",0);
                    x.css("left", "-6000px");  
                     
                });
                // 鼠标经过列表项事件
                // 鼠标经过
                $(".mailHover").live("mouseover", function(){
                    index = Number($(this).attr("id").split("_")[1]);  
                    liveValue = $("#mailList_"+index).text();
                    x.children("." + cf).removeClass(cf).addClass(cl);
                    $(this).addClass(cf).removeClass(cl);
                });
            });
 
            x.bind("mousedown", function(){
                that.val(liveValue);       
            });
        });
    };
     
})(jQuery);


