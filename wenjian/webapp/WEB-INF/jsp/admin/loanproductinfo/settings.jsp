<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<!DOCTYPE html>
<html>
<head>
<title>贷款产品设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/jsp/common/public.jsp"%>
<script type="text/javascript">
$(function(){
	 var opid = $("#u_id").val();
	 if(opid > 0){
 		 var u_pid = $("#u_pid").val();
		 var u_ptype = $("#u_ptype").val();
		 var u_pattribute = $("#u_pattribute").val();
		 var u_feature = $("#u_feature").val();
		 var u_loanminamout = $("#u_loanminamout").val();
		 var u_loanmaxamout = $("#u_loanmaxamout").val();
		 var u_loantime = $("#u_loantime").val();
		 var u_loaninterest = $("#u_loaninterest").val();
		 var u_interesttype = $("#u_interesttype").val();
		 var u_loantimelimit = $("#u_loantimelimit").val();
		 var u_appconditions = $("#u_appconditions").val();
		 var u_repaymode = $("#u_repaymode").val();
		 var u_latecharge = $("#u_latecharge").val();
		 var u_prepayment = $("#u_prepayment").val();
		 var u_isrealnameauth = $("#u_isrealnameauth").val();
		 var u_isphoneauth = $("#u_isphoneauth").val();
		 var u_ispersonaldataauth = $("#u_ispersonaldataauth").val();
		 var u_issesameauth = $("#u_issesameauth").val();
		 var u_isweilidaiauth = $("#u_isweilidaiauth").val();
		 var u_prlink = $("#u_prlink").val();
		 var u_applycount = $("#u_applycount").val();
		 var u_lendingamout = $("#u_lendingamout").val();
		 var u_loanamout = $("#u_loanamout").val();
		 var u_status = $("#u_status").val();
		 var u_succcount = $("#u_succcount").val();
		 var u_isshowattr = $("#u_isshowattr").val();
		 var u_isdefault = $("#u_isdefault").val();
 		 
		 var u_sort = $("#u_sort").val();
		 var u_remark = $("#u_remark").val();
		 $("#paramsBox").find("input[name='opid']").val(opid);
		 $("#paramsBox").find("select[name='pid']").val(u_pid);
		 $("#paramsBox").find("select[name='ptype']").val(u_ptype);
		 $("#paramsBox").find("select[name='pattribute']").val(u_pattribute);
		 $("#paramsBox").find("textarea[name='feature']").val(u_feature);
		 $("#paramsBox").find("input[name='loanminamout']").val(u_loanminamout);
		 $("#paramsBox").find("input[name='loanmaxamout']").val(u_loanmaxamout);
 		 $("#paramsBox").find("select[name='interesttype']").val(u_interesttype);
		 $("#paramsBox").find("textarea[name='loantime']").val(u_loantime);
		 $("#paramsBox").find("textarea[name='loantimelimit']").val(u_loantimelimit);
		 $("#paramsBox").find("textarea[name='loaninterest']").val(u_loaninterest);
		 $("#paramsBox").find("textarea[name='appconditions']").val(u_appconditions);
		 $("#paramsBox").find("textarea[name='repaymode']").val(u_repaymode);
		 $("#paramsBox").find("textarea[name='latecharge']").val(u_latecharge);
		 $("#paramsBox").find("textarea[name='prepayment']").val(u_prepayment);
		 $("#paramsBox").find("select[name='sort']").val(u_sort);
		 $("#paramsBox").find("textarea[name='remark']").text(u_remark);
		 $("#paramsBox").find("input[name='prlink']").val(u_prlink);
		 $("#paramsBox").find("input[name='applycount']").val(u_applycount);
		 $("#paramsBox").find("input[name='succcount']").val(u_succcount);
		 
		 $("#paramsBox").find("input[name='lendingamout']").val(u_lendingamout);
		 $("#paramsBox").find("input[name='loanamout']").val(u_loanamout);
		 $("#paramsBox").find("select[name='status']").val(u_status);
		 $("#paramsBox").find("select[name='isshowattr']").val(u_isshowattr);
		 $("#paramsBox").find("select[name='isdefault']").val(u_isdefault);
		 
		 if(u_isrealnameauth == 0){
 			 $("#authCheckBox").find("input[name='isrealnameauth']").attr("checked",false);
		 }else{
			 $("#authCheckBox").find("input[name='isrealnameauth']").attr("checked",true);
		 }
		 
		 if(u_isphoneauth == 0){
 			 $("#authCheckBox").find("input[name='isphoneauth']").attr("checked",false);
		 }else{
			 $("#authCheckBox").find("input[name='isphoneauth']").attr("checked",true);
		 }
		 
		 if(u_ispersonaldataauth == 0){
 			 $("#authCheckBox").find("input[name='ispersonaldataauth']").attr("checked",false);
		 }else{
			 $("#authCheckBox").find("input[name='ispersonaldataauth']").attr("checked",true);
		 }
		 
		 if(u_issesameauth == 0){
 			 $("#authCheckBox").find("input[name='issesameauth']").attr("checked",false);
		 }else{
			 $("#authCheckBox").find("input[name='issesameauth']").attr("checked",true);
		 }
		 
		 if(u_isweilidaiauth == 0){
 			 $("#authCheckBox").find("input[name='isweilidaiauth']").attr("checked",false);
		 }else{
			 $("#authCheckBox").find("input[name='isweilidaiauth']").attr("checked",true);
		 }
		 
	 }
 })
</script>
</head>
<body>
	<form class="form-horizontal">
 		<input type="text" id="u_id" value="${loanProductInfo.id }" style="display:none;">
 		<input type="text" id="u_pid" value="${loanProductInfo.pid }" style="display:none;">
 		<input type="text" id="u_ptype" value="${loanProductInfo.ptype }" style="display:none;">
 		<input type="text" id="u_pattribute" value="${loanProductInfo.pattribute }" style="display:none;">
 		<input type="text" id="u_feature" value="${loanProductInfo.feature }" style="display:none;">
 		<input type="text" id="u_loanminamout" value="${loanProductInfo.loanminamout }" style="display:none;">
 		<input type="text" id="u_loanmaxamout" value="${loanProductInfo.loanmaxamout }" style="display:none;">
 		<input type="text" id="u_loantime" value="${loanProductInfo.loantime }" style="display:none;">
 		<input type="text" id="u_loaninterest" value="${loanProductInfo.loaninterest }" style="display:none;">
 		<input type="text" id="u_interesttype" value="${loanProductInfo.interesttype }" style="display:none;">
  		<input type="text" id="u_loantimelimit" value="${loanProductInfo.loantimelimit }" style="display:none;">
 		<input type="text" id="u_appconditions" value="${loanProductInfo.appconditions }" style="display:none;">
 		<input type="text" id="u_repaymode" value="${loanProductInfo.repaymode }" style="display:none;">
 		<input type="text" id="u_latecharge" value="${loanProductInfo.latecharge }" style="display:none;">
 		<input type="text" id="u_prepayment" value="${loanProductInfo.prepayment }" style="display:none;">
 		<input type="text" id="u_isrealnameauth" value="${loanProductInfo.isrealnameauth }" style="display:none;">
 		<input type="text" id="u_isphoneauth" value="${loanProductInfo.isphoneauth }" style="display:none;">
 		<input type="text" id="u_ispersonaldataauth" value="${loanProductInfo.ispersonaldataauth }" style="display:none;">
 		<input type="text" id="u_issesameauth" value="${loanProductInfo.issesameauth }" style="display:none;">
 		<input type="text" id="u_isweilidaiauth" value="${loanProductInfo.isweilidaiauth }" style="display:none;">
 		<input type="text" id="u_sort" value="${loanProductInfo.sort }" style="display:none;">
 		<input type="text" id="u_remark" value="${loanProductInfo.remark }" style="display:none;">
 		<input type="text" id="u_prlink" value="${loanProductInfo.prlink }" style="display:none;">
 		<input type="text" id="u_loanamout" value="${loanProductInfo.loanamout }" style="display:none;">
 		<input type="text" id="u_applycount" value="${loanProductInfo.applycount }" style="display:none;">
 		<input type="text" id="u_lendingamout" value="${loanProductInfo.lendingamout }" style="display:none;">
  		<input type="text" id="u_status" value="${loanProductInfo.status }" style="display:none;">
  		<input type="text" id="u_succcount" value="${loanProductInfo.succcount }" style="display:none;">
  		<input type="text" id="u_isshowattr" value="${loanProductInfo.isshowattr }" style="display:none;">
  		<input type="text" id="u_isdefault" value="${loanProductInfo.isdefault }" style="display:none;">
  		
		<div id="main_box">
  			<div class="setting_box setting_type_box_1" id="paramsBox">
 				<input type="text" class="form-control" name="opid" style="display:none;">
 				<div class="form-group">
					<label class="col-sm-2 control-label">贷款平台</label>
					<div class="col-sm-6">
						<select class="form-control" name="pid">
							<c:forEach var="lists" items="${lists }">
 								<option value="${lists.id}">${lists.pname}</option>
							</c:forEach>
						</select>
  					</div>
 				</div> 
 			  
 				<div class="form-group">
					<label class="col-sm-2 control-label">产品类型</label>
					<div class="col-sm-6">
						<select class="form-control" name="ptype">
  							<option value="1">现金贷</option>
  							<option value="2">银行贷</option>
  						</select>
  					</div>
 				</div>
 				
 				<div class="form-group">
					<label class="col-sm-2 control-label">产品属性</label>
					<div class="col-sm-6">
						<select class="form-control" name="pattribute">
  							<option value="1">信用贷</option>
  							<option value="2">芝麻分</option>
  							<option value="3">微粒贷</option>
  							<option value="4">车贷</option>
  							<option value="5">房贷</option>
   						</select>
  					</div>
 				</div>
 				
 				<div class="form-group">
					<label class="col-sm-2 control-label">是否显示产品属性</label>
					<div class="col-sm-6">
						<select class="form-control" name="isshowattr">
  							<option value="1">是</option>
  						 	<option value="0">否</option>
    						</select>
  					</div>
 				</div>
 				
 				<div class="form-group">
					<label class="col-sm-2 control-label">是否默认</label>
					<div class="col-sm-6">
						<select class="form-control" name="isdefault">
  							<option value="1">是</option>
  						 	<option value="0">否</option>
    					</select>
  					</div>
 				</div>
 				
 				<div class="form-group">
					<label class="col-sm-2 control-label">关联用户</label>
					<div class="col-sm-4">
						 <input class="form-control" type="text" name="username" placeholder="输入资源主用户名"/>
    				</div>
  					<div class="col-sm-2">
						  <button class="btn btn-default" type="button" onclick="loanProductInfo.link_operation(this)">关联</button>
  					</div>
 				 </div>
 				 
 				 <div id="loanUserLinkBox">
 				 	<c:forEach items="${links }" var="link">
 						<!--  item 开始 -->
	 	 				<div class="form-group loanUserItem" data-uid="">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-4">
						 			<wdb:getUser uid="${link.uid}" var="uu">
								 		<label class="form-control">
								 				${uu.username}
								 		</label>
								 		<input type="text" name="uid" value="${uu.uid}" style="display:none;">
 						 			</wdb:getUser>
	 						</div>
							<div class="col-sm-2">
								<button class="btn btn-default" type="button" onclick="loanProductInfo.link_remove(this)">删除</button>
							</div>
		   				</div>
						<!-- item 结束 -->
 				 	</c:forEach>
	   			     
 				 </div>
 				
 				<div class="form-group" id="authCheckBox">
	 				<label class="col-sm-2 control-label">认证选择</label>
  					<div class="col-sm-8">
						 <label>实名认证&nbsp;<input type="checkbox" name="isrealnameauth" checked/></label>&nbsp;&nbsp;
						 <label>手机认证&nbsp;<input type="checkbox" name="isphoneauth" /></label>&nbsp;&nbsp;
						 <label>个人资料认证&nbsp;<input type="checkbox" name="ispersonaldataauth" /></label>&nbsp;&nbsp;
						 <label>芝麻分认证&nbsp;<input type="checkbox" name="issesameauth" /></label>&nbsp;&nbsp;
						 <label>微粒贷认证&nbsp;<input type="checkbox" name="isweilidaiauth" /></label>
					</div>
 				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">贷款额度</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="loanminamout" placeholder="贷款最低额度">
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="loanmaxamout" placeholder="贷款最高额度">
					</div>
  				</div>
  				
  				<div class="form-group">
					<label class="col-sm-2 control-label">申请人数</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="applycount" placeholder="申请人数">
					</div>
   				</div>
   				
   				<div class="form-group">
					<label class="col-sm-2 control-label">成功放款人数</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="succcount" placeholder="申请人数">
					</div>
   				</div>
   				
   				<div class="form-group">
					<label class="col-sm-2 control-label">放款金额</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="lendingamout" placeholder="放款金额">
					</div>
   				</div>
   				
   				<div class="form-group">
					<label class="col-sm-2 control-label">详情页最高金额</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="loanamout" placeholder="详情页最高金额">
					</div>
   				</div>
   								
				<div class="form-group">
					<label class="col-sm-2 control-label">平台特色</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="feature"
							style="max-width: 270px; min-height: 80px;min-width: 270px;" ></textarea>
					</div>
 				</div>
				
			    <div class="form-group">
					<label class="col-sm-2 control-label">利息类型</label>
					<div class="col-sm-6 ">
						<select class="form-control" name="interesttype">
							<option value="1">日息</option>
							<option value="2">月息</option>
						</select>
					</div>
 				</div>
				
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">平台利息</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="loaninterest"
							style="max-width: 270px; min-height: 80px;min-width: 270px;" ></textarea>
					</div>
 				</div>
 				
 				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">放款时间</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="loantime"
							style="max-width: 270px; min-height: 80px;min-width: 270px;" ></textarea>
					</div>
 				</div>
 				
 				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">贷款期限</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="loantimelimit"
							style="max-width: 270px; min-height: 80px;min-width: 270px;" ></textarea>
					</div>
 				</div>
 				
 				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">申请条件</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="appconditions"
							style="max-width: 270px; min-height: 80px;min-width: 270px;" ></textarea>
					</div>
 				</div>
 				
 				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">还款方式</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="repaymode"
							style="max-width: 270px; min-height: 80px;min-width: 270px;" ></textarea>
					</div>
 				</div>
 				
 				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">逾期罚息</label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="latecharge"
							style="max-width: 270px; min-height: 80px;min-width: 270px;" ></textarea>
					</div>
 				</div>
 				
 				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">提前还款 </label>
					<div class="col-sm-6 subject">
						<textarea class="form-control" name="prepayment"
							style="max-width: 270px; min-height: 80px;min-width: 270px;" ></textarea>
					</div>
 				</div>
 				
 				<div class="form-group">
					<label class="col-sm-2 control-label">平台注册链接</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="prlink" placeholder="平台注册链接">
					</div>
   				</div>
  				
				<div class="form-group">
					<label for="setting_type" class="col-sm-2 control-label">排名</label>
					<div class="col-sm-6">
						<select class="form-control" name="sort">
							<option value="100">--未选择排名--</option>
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
					<label for="setting_type" class="col-sm-2 control-label">产品开关</label>
					<div class="col-sm-6">
						<select class="form-control" name="status">
							<option value="">--产品开关--</option>
							<option value="1">开</option>
							<option value="0">关</option>
   						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="setting_tid" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-6">
						<textarea class="form-control" name="remark" style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
					</div>
				</div>
				
 			</div>
  
 		</div>
	</form>
 </body>
</html>