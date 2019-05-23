<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>贷款平台设置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="/WEB-INF/jsp/common/public.jsp"%>
	<script type="text/javascript">
        $(function(){
            var updateSetting_id = $("#updateSetting_id").val();
            var updateSetting_pname = $("#updateSetting_pname").val();
            var updateSetting_logo = $("#updateSetting_logo").val();
            var updateSetting_sort = $("#updateSetting_sort").val();
            var updateSetting_website = $("#updateSetting_website").val();
            var updateSetting_online = $("#updateSetting_online").val();
            var updateSetting_thunderstormtime = $("#updateSetting_thunderstormtime").val();
            var updateSetting_recordname = $("#updateSetting_recordname").val();
            var updateSetting_pbrief = $("#updateSetting_pbrief").val();
            var updateSetting_province = $("#updateSetting_province").val();
            var updateSetting_city = $("#updateSetting_city").val();
            var updateSetting_district = $("#updateSetting_district").val();
            var updateSetting_remark = $("#updateSetting_remark").val();
            var updateSetting_address = $("#updateSetting_address").val();
            var updateSetting_qq = $("#updateSetting_qq").val();
            var updateSetting_customerphone = $("#updateSetting_customerphone").val();

            if(updateSetting_id > 0){
                $("#paramsBox").find("input[name='id']").val(updateSetting_id);
                $("#paramsBox").find("input[name='logo']").val(updateSetting_logo);
                $("#paramsBox").find("input[name='pname']").val(updateSetting_pname);
                $("#paramsBox").find("select[name='sort']").val(updateSetting_sort);
                $("#paramsBox").find("textarea[name='remark']").val(updateSetting_remark);
                $("#paramsBox").find("input[name='website']").val(updateSetting_website);
                $("#paramsBox").find("input[name='online1']").val(updateSetting_online);
                $("#paramsBox").find("input[name='thunderstormtime1']").val(updateSetting_thunderstormtime);
                $("#paramsBox").find("input[name='recordname']").val(updateSetting_recordname);
                $("#paramsBox").find("textarea[name='pbrief']").val(updateSetting_pbrief);
                $("#paramsBox").find("input[name='province']").val(updateSetting_province);
                $("#paramsBox").find("input[name='city']").val(updateSetting_city);
                $("#paramsBox").find("input[name='district']").val(updateSetting_district);
                $("#paramsBox").find("input[name='address']").val(updateSetting_address);
                $("#paramsBox").find("input[name='qq']").val(updateSetting_qq);
                $("#paramsBox").find("input[name='customerphone']").val(updateSetting_customerphone);
            }
        })
	</script>
</head>
<body>
<form class="form-horizontal">
	<div id="main_box">
		<input type="text" id="updateSetting_id" value="${loanPlatformInfo.id }" style="display:none;">
		<input type="text" id="updateSetting_pname" value="${loanPlatformInfo.pname }" style="display:none;">
		<input type="text" id="updateSetting_logo" value="${loanPlatformInfo.logo }" style="display:none;">
		<input type="text" id="updateSetting_sort" value="${loanPlatformInfo.sort }" style="display:none;">
		<input type="text" id="updateSetting_website" value="${loanPlatformInfo.website }" style="display:none;">
		<input type="text" id="updateSetting_remark" value="${loanPlatformInfo.remark }" style="display:none;">
		<input type="text" id="updateSetting_online" value="${online}" style="display:none;">
		<input type="text" id="updateSetting_thunderstormtime" value="${thunderstormtime}" style="display:none;">
		<input type="text" id="updateSetting_recordname" value="${loanPlatformInfo.recordname }" style="display:none;">
		<input type="text" id="updateSetting_pbrief" value="${loanPlatformInfo.pbrief }" style="display:none;">
		<input type="text" id="updateSetting_province" value="${loanPlatformInfo.province }" style="display:none;">
		<input type="text" id="updateSetting_city" value="${loanPlatformInfo.city }" style="display:none;">
		<input type="text" id="updateSetting_district" value="${loanPlatformInfo.district }" style="display:none;">
		<input type="text" id="updateSetting_address" value="${loanPlatformInfo.address }" style="display:none;">
		<input type="text" id="updateSetting_qq" value="${loanPlatformInfo.qq }" style="display:none;">
		<input type="text" id="updateSetting_customerphone" value="${loanPlatformInfo.customerphone }" style="display:none;">

		<div class="setting_box setting_type_box_1" id="paramsBox">
			<input type="text" class="form-control" name="id" style="display:none;">
			<div class="form-group">
				<label class="col-sm-2 control-label">平台名称</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="pname" placeholder="平台名称" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">平台logo</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="logo" placeholder="平台logo" >
					<input type="file" name="upfile" style="display: block;border: initial;" onchange="uploadLogo(this)">
				</div>
				<div class="col-sm-6" id="logoImgBox" style="display:none;">
					<img width="120" height="120" src="">
				</div>
			</div>

			<div class="form-group">
				<label  class="col-sm-2 control-label">排名</label>
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
				<label class="col-sm-2 control-label">网址</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="website" placeholder="website" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="online1">上线时间</label>
				<div class="col-sm-6">
					<input type="text" class="Wdate" id="online1" name="online1" style="width: 180px;height: 30px;"
						   onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="thunderstormtime1">爆雷时间</label>
				<div class="col-sm-6">
					<input type="text" class="Wdate" id="thunderstormtime1" name="thunderstormtime1" style="width: 180px;height: 30px;"
						   onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="recordname">运营公司</label>
				<div class="col-sm-6">
					<input type="text" name="recordname" id="recordname" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="pbrief">公司简介</label>
				<div class="col-sm-6">
					<textarea rows="3" class="form-control" name="pbrief" id="pbrief"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="operatingstatus">运营状态</label>
				<div class="col-sm-6">
					<select name="operatingstatus" id="operatingstatus" class="form-control">
						<option value="">--未选择运营状态--</option>
						<option value="1" <c:if test="${loanPlatformInfo.operatingstatus eq '1'}">selected="selected"</c:if>>正常</option>
						<option value="2" <c:if test="${loanPlatformInfo.operatingstatus eq '2'}">selected="selected"</c:if>>停业</option>
						<option value="3" <c:if test="${loanPlatformInfo.operatingstatus eq '3'}">selected="selected"</c:if>>有投诉</option>
						<option value="4" <c:if test="${loanPlatformInfo.operatingstatus eq '4'}">selected="selected"</c:if>>黑名单</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="loanidea">贷款建议</label>
				<div class="col-sm-6">
					<select name="loanidea" id="loanidea" class="form-control">
						<option value="">--未选择贷款建议--</option>
						<option value="1" <c:if test="${loanPlatformInfo.loanidea eq '1'}">selected="selected"</c:if>>不宜贷款</option>
						<option value="2" <c:if test="${loanPlatformInfo.loanidea eq '2'}">selected="selected"</c:if>>建议贷款</option>
						<option value="3" <c:if test="${loanPlatformInfo.loanidea eq '3'}">selected="selected"</c:if>>官方介入</option>
						<option value="4" <c:if test="${loanPlatformInfo.loanidea eq '4'}">selected="selected"</c:if>>已跑路</option>
						<option value="4" <c:if test="${loanPlatformInfo.loanidea eq '5'}">selected="selected"</c:if>>有争议</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="riskmark">风险提示</label>
				<div class="col-sm-6">
					<input type="text" name="riskmark" id="riskmark" value="${loanPlatformInfo.riskmark}" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="bail">诚信押金</label>
				<div class="col-sm-6">
					<input type="text" name="bail" id="bail" value="${loanPlatformInfo.bail}" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="province">省</label>
				<div class="col-sm-6">
					<input type="text" name="province" id="province" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="city">市</label>
				<div class="col-sm-6">
					<input type="text" name="city" id="city" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="district">区</label>
				<div class="col-sm-6">
					<input type="text" name="district" id="district" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="address">总部地址</label>
				<div class="col-sm-6">
					<input type="text" name="address" id="address"  class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="customerphone">客服电话</label>
				<div class="col-sm-6">
					<input type="text" name="customerphone" id="customerphone"  class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="qq">客服QQ</label>
				<div class="col-sm-6">
					<input type="text" name="qq" id="qq"  class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="androidlink">安卓APP下载地址</label>
				<div class="col-sm-6">
					<input type="text" name="androidlink" id="androidlink" value="${loanPlatformInfo.androidlink}"  class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="ioslink">苹果APP下载地址</label>
				<div class="col-sm-6">
					<input type="text" name="ioslink" id="ioslink" value="${loanPlatformInfo.ioslink}" class="form-control"  />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="loanimpress1">贷款印象1</label>
				<div class="col-sm-6">
					<input type="text" name="loanimpress1" id="loanimpress1" value="${loanPlatformInfo.loanimpress1}" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="loanimpress2">贷款印象2</label>
				<div class="col-sm-6">
					<input type="text" name="loanimpress2" id="loanimpress2" value="${loanPlatformInfo.loanimpress2}" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="loanimpress3">贷款印象3</label>
				<div class="col-sm-6">
					<input type="text" name="loanimpress3" id="loanimpress3" value="${loanPlatformInfo.loanimpress3}" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="loanimpress4">贷款印象4</label>
				<div class="col-sm-6">
					<input type="text" name="loanimpress4" id="loanimpress4" value="${loanPlatformInfo.loanimpress4}"  class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="loanimpress5">贷款印象5</label>
				<div class="col-sm-6">
					<input type="text" name="loanimpress5" id="loanimpress5"  class="form-control" value="${loanPlatformInfo.loanimpress5}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="loanimpress6">贷款印象6</label>
				<div class="col-sm-6">
					<input type="text" name="loanimpress6" id="loanimpress6"  class="form-control" value="${loanPlatformInfo.loanimpress6}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label laber_from" for="display">页面显示</label>
				<div class="col-sm-6">
					<select name="display" id="display" class="form-control">
						<option value="1" <c:if test="${loanPlatformInfo.loanidea eq '1'}">selected="selected"</c:if>>显示</option>
						<option value="0" <c:if test="${loanPlatformInfo.loanidea eq '0'}">selected="selected"</c:if>>不显示</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label">备注</label>
				<div class="col-sm-6">
					<textarea class="form-control" name="remark" style="max-width: 270px;min-height: 120px;min-width: 270px;"></textarea>
				</div>
			</div>
		</div>


	</div>
</form>
</body>
</html>