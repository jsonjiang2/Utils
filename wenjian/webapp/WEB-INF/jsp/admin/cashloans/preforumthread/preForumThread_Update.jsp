<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<wdb:getPreForumForum fid="${preForumThread.fid }" var="preForumForum" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主题修改</title>
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<link href="${basePath }/static/plugin/colorpicker/css/colorpicker.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${basePath}/static/plugin/colorpicker/js/colorpicker.js"></script>
<script type="text/javascript">
	$(function(){
		var bgcolor = $("#bgcolor").data("bgcolor");
 		//颜色选择
		$('#bgcolor').ColorPicker({
			color:bgcolor,
  			onSubmit : function(hsb, hex, rgb, el) {
				$(el).val("#" + hex);
				$(el).ColorPickerHide();
			},
			onBeforeShow : function() {
				$(this).ColorPickerSetColor(this.value);
			},
			onChange : function(hsb, hex, rgb) {
				$('#bgcolor').css('backgroundColor', '#' + hex);
			}
		}).bind('keyup', function() {
			$(this).ColorPickerSetColor(this.value);
		});
  		
		var digest = $("#digest").data("digest");
 		var dsort = $("#dsort").data("dsort");
		var csort = $("#csort").data("csort");
		var istopline = $("#istopline").data("istopline");
		var istwoline = $("#istwoline").data("istwoline");
		var isbanner = $("#isbanner").data("isbanner");
		var ishfbanner = $("#ishfbanner").data("ishfbanner");
		
 		$("#digest").val(digest);
 		$("#dsort").val(dsort);
 		$("#csort").val(csort);
 		$("#bgcolor").val(bgcolor);
 		
 		$("#istopline").val(istopline);
 		$("#istwoline").val(istwoline);
 		$("#isbanner").val(isbanner);
 		$("#ishfbanner").val(ishfbanner);
   		chaDigest();
 	})
 	
 	function chaDigest(obj){
		var vl = $("#digest").val();
		if(vl == 1){//精华
			$("#dsort_box").show();
  		}else{
 			$("#dsort_box").hide();
  		}
	}
</script>
<style type="text/css">
	.colorpicker {
		z-index: 1050;
	}
</style>
 </head>
<body>
	 <div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form" id="threadUpdateForm">
        <input type="hidden" id="tid" name="tid" value="${preForumThread.tid}"/>
        
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="subject">标题：</label>
            <div class="col-sm-3">
                  <textarea rows="3" style="max-width:350px;" class="form-control" name="subject">${preForumThread.subject}</textarea>
             </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">板块：</label>
            <div class="col-sm-3">
                <select name="fid" id="fid" class="form-control">
					<option value="101" <c:if test="${preForumThread.fid eq '101'}">selected="selected"</c:if>>曝光台</option>
					<option value="102" <c:if test="${preForumThread.fid eq '102'}">selected="selected"</c:if>>需求撮合</option>
				</select>   
                  
             </div>
        </div>
        
           <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="presubject">标题前缀：</label>
            <div class="col-sm-3">
                     <input type="text" name="presubject" id="presubject" class="form-control" value="${preForumThread.presubject }"/>
             </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否精华：</label>
            <div class="col-sm-3">
                <select class="form-control" id="digest" name="digest"  data-digest="${preForumThread.digest }" onchange="chaDigest(this)">
                    <option value="">--请选择--</option>
                    <option value="1">是</option>
                    <option value="0">否</option>
                  </select>
             </div>
        </div>
        
       	<div class="form-group">
			<label for="setting_tid" class="col-sm-2 control-label">颜色</label>
			<div class="col-sm-3">
				<input class="form-control" class="form-control" name="bgcolor" id="bgcolor" data-bgcolor="${preForumThread.bgcolor }" style="background-color: ${preForumThread.bgcolor };">
			</div>
		</div>
        
        <div class="form-group" id="dsort_box" style="display:none;">
            <label class="col-sm-2 control-label laber_from">精华定位：</label>
            <div class="col-sm-3">
                <select class="form-control" id="dsort" name="dsort" data-dsort="${preForumThread.dsort }">
                	<option value="100">--不设置定位--</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
             </div>
        </div>
        
        <div class="form-group" id="csort_box">
            <label class="col-sm-2 control-label laber_from">普通定位：</label>
            <div class="col-sm-3">
                <select class="form-control" id="csort" name="csort" data-csort="${preForumThread.csort }">
                	<option value="100">--不设置定位--</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
             </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否头条：</label>
            <div class="col-sm-3">
                <select class="form-control" id="istopline" name="istopline"  data-istopline="${preForumThread.istopline }" >
                    <option value="0">否</option>
                     <option value="1">是</option>
                  </select>
             </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否次头条：</label>
            <div class="col-sm-3">
                <select class="form-control" id="istwoline" name="istwoline"  data-istwoline="${preForumThread.istwoline }">
                    <option value="0">否</option>
                     <option value="1">是</option>
                  </select>
             </div>
        </div>
        
       <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否轮播图：</label>
            <div class="col-sm-3">
                <select class="form-control" id="isbanner" name="isbanner"  data-isbanner="${preForumThread.isbanner }">
                    <option value="0">否</option>
                     <option value="1">是</option>
                  </select>
             </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">是否h5轮播图：</label>
            <div class="col-sm-3">
                <select class="form-control" id="ishfbanner" name="ishfbanner"  data-ishfbanner="${preForumThread.ishfbanner }">
                    <option value="0">否</option>
                     <option value="1">是</option>
                  </select>
             </div>
        </div>
   
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from">管理员留言：</label>
            <div class="col-sm-3">
                <textarea rows="3" style="max-width:350px;" class="form-control" name="amessage">${preForumThread.amessage}</textarea>
            </div>
        </div>
 
    </form>
</div>
</body>
</html>