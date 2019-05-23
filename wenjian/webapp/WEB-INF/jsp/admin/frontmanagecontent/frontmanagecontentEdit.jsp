<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<div class="col-xs-12">
		<form id="_editForm" class="form-horizontal" role="form"
			validate="true">
			<input type="hidden" name="id" value="${fontmanage.id}"> 
			
			<div class="form-group">
				<label for="_itemtype" class="col-sm-3 control-label no-padding-right"><span class="form-star">*</span>项目类型 1:一级项目； 2:二级项目； 3:三级项目</label>

				<div class="col-sm-9">
					<div class="clearfix help-validate">
						<input id="_itemtype" name="itemtype" type="text" value="${fontmanage.itemtype}" class="form-data col-xs-10 col-sm-5" placeholder="项目类型 1:一级项目； 2:二级项目； 3:三级项目"
							required="true" vtype="integer" maxlength="11"/>
					</div>
				</div>
				
			</div>
			<div class="form-group">
				<label for="_itemname" class="col-sm-3 control-label no-padding-right"><span class="form-star">*</span>项目名称</label>

				<div class="col-sm-9">
					<div class="clearfix help-validate">
						<input id="_itemname" name="itemname" type="text" value="${fontmanage.itemname}" class="form-data col-xs-10 col-sm-5" placeholder="项目名称"
							required="true"  maxlength="200"/>
					</div>
				</div>
				
			</div>
			<div class="form-group">
				<label for="_parentid" class="col-sm-3 control-label no-padding-right"><span class="form-star">*</span>父节点id  （如果值为0，说明是首层项目--一级项目）</label>

				<div class="col-sm-9">
					<div class="clearfix help-validate">
						<input id="_parentid" name="parentid" type="text" value="${fontmanage.parentid}" class="form-data col-xs-10 col-sm-5" placeholder="父节点id  （如果值为0，说明是首层项目--一级项目）"
							required="true" />
					</div>
				</div>
				
			</div>
			<div class="form-group">
				<label for="_itemnumber" class="col-sm-3 control-label no-padding-right"><span class="form-star">*</span>项目序号</label>

				<div class="col-sm-9">
					<div class="clearfix help-validate">
						<input id="_itemnumber" name="itemnumber" type="text" value="${fontmanage.itemnumber}" class="form-data col-xs-10 col-sm-5" placeholder="项目序号"
							required="true" vtype="integer" maxlength="11"/>
					</div>
				</div>
				
			</div>
			<div class="form-group">
				<label for="_itemremark" class="col-sm-3 control-label no-padding-right">备注</label>

				<div class="col-sm-9">
					<div class="clearfix help-validate">
						<input id="_itemremark" name="itemremark" type="text" value="${fontmanage.itemremark}" class="form-data col-xs-10 col-sm-5" placeholder="备注"
							  maxlength="255"/>
					</div>
				</div>
				
			</div>
			<div class="form-group">
				<label for="_addtime" class="col-sm-3 control-label no-padding-right"><span class="form-star">*</span>添加时间</label>

				<div class="col-sm-9">
					<div class="clearfix help-validate">
						<input id="_addtime" name="addtime" type="text" value="${fontmanage.addtime}" class="form-data col-xs-10 col-sm-5" placeholder="添加时间"
							required="true" />
					</div>
				</div>
				
			</div>
			<div class="form-group">
				<label for="_updatetime" class="col-sm-3 control-label no-padding-right">更新时间</label>

				<div class="col-sm-9">
					<div class="clearfix help-validate">
						<input id="_updatetime" name="updatetime" type="text" value="${fontmanage.updatetime}" class="form-data col-xs-10 col-sm-5" placeholder="更新时间"
							 />
					</div>
				</div>
				
			</div>
			
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button id="_submit" type="button" class="btn btn-info" data-loading-text="正在提交..." permission="/admin/fontmanage/save">
						<i class="ace-icon fa fa-check bigger-110"></i>
						提交
					</button>

					&nbsp; &nbsp; &nbsp;
					<button id="_cancle" class="btn" type="reset">
						<i class="ace-icon fa  fa-times bigger-110"></i>
						取消
					</button>
				</div>
			</div>
		</form>

	</div>
</div>

<script type="text/javascript">
	$('.page-content-area').ace_ajax('loadScripts', scripts, function() {
		jQuery(function($) {
			//焦点
			$("#_name").focus();
			
			// 提交
			$("#_submit").click(function(){
				if($('#_editForm').validate()){
					var btn = $(this);
					btn.button('loading');
					$.post("${_path}/admin/fontmanage/save", $.formJson('_editForm'),function(d) {
						if(d){
							btn.button('reset');
							if(d.code == 1){
								$.aceRedirect("${_path}/admin/fontmanage");
							}
							else {
								$.gritter.add({text: d.message});
							}
						}
			        },'json');
				}
			});
			
			// 取消
			$("#_cancle").click(function(){
				$.aceRedirect("${_path}/admin/fontmanage");
			});
			
			// 回车绑定
			$(".form-data").bind('keypress',function(event){
                if(event.keyCode == "13"){
                	event.preventDefault();
                	$("#_submit").click();
                }
            });
            
            // 权限处理
			$.permission();
			// 金额格式化
			$.decimalFormat();
		});
	});
</script>



