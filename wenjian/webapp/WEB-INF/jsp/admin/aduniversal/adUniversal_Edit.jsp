<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="${basePath}/static/js/jscolor.js"></script>
<script type="text/javascript">
    $(function(){
        $("#select-current_page-text").val("${data.current_page}");
        $("#_terminal").val("${data.terminal}");
        $("#_adsize").val("${data.adsize}");
        $("#_attributes").val("${data.attributes}");
        $("#_effectiveness").val("${data.effectiveness}");
        $("#_displayswitch").val("${data.display_switch}");
        var valueNum = ${data.attributes};
        if(valueNum==1){
            document.getElementById("uploadImg").style.display="None";
            document.getElementById("imgTitles").style.display="None";
            document.getElementById("_adwords").style.display="block";
        }
        if(valueNum==2){
            document.getElementById("uploadImg").style.display="block";
            document.getElementById("imgTitles").style.display="block";
            document.getElementById("_adwords").style.display="None";
        }
    })
</script>
<script>
    //验证
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            terminal: {
                validators: {
                    notEmpty: {
                        message: "请选择展示方式"
                    }
                }
            },
            attributes: {
                validators: {
                    notEmpty: {
                        message: "请选择广告类型"
                    }
                }
            },
            effectiveness: {
                validators: {
                    notEmpty: {
                        message: "请选择广告信息是否展示"
                    }
                }
            }
        }
    };
</script>

<div class="row">
	<div class="col-xs-9">
		<form id="_editForm" class="form-horizontal" role="form"
			validate="true">
			<input type="hidden" name="id" value="${data.id}">

            <div class="form-group">
                <label for="select-current_page-text" class="col-sm-6 control-label no-padding-right">所在页面板块：</label>
                <div class="col-sm-6">
                    <select id="select-current_page-text" name="current_page" class="form-control" disabled="disabled">
                        <option value="">--请选择--</option>
                        <option value="1">首页</option>
                        <option value="2">资源主列表</option>
                        <option value="3">平台数据列表</option>
                        <option value="4">巴士茶馆</option>
                        <option value="5">网贷资讯</option>
                        <option value=8>钱多多</option>
                        <option value=9>个人中心</option>
                        <option value=6>巴士茶馆详情页侧边广告</option>
                        <option value=7>网贷资讯详情页侧边广告</option>
                        <option value=10>钱多多侧边广告</option>
                        <option value=11>羊头黑名单</option>
                        <option value=12>巴士日报</option>
                        <option value=13>羊头黑名单详情页</option>
                        <option value=14>平台评价</option>
                        <option value=15>今日暴雷</option>
                        <option value=16>h5帖子回复</option>
                        <option value=17>h5资讯回复</option>
                        <option value=19>首页滚动广告</option>
                        <option value=20>茶馆列表滚动广告</option>
                        <option value=21>h5平台数据详情页</option>
                        <option value=22>H5小蜜蜂首页</option>
                        <option value=23>H5巴士日报</option>
                        <option value=24>h5巴士日报详情页</option>
                    </select>
                </div>
            </div>

			<div class="form-group">
				<label for="_serial" class="col-sm-6 control-label no-padding-right">广告序号：</label>
				<div class="col-sm-6">
						<input id="_serial" name="serial" type="text" value="${data.serial}" class="form-control" placeholder="广告所在位置（序号）"
							required="true" vtype="integer" maxlength="10" readonly="readonly"/>
				</div>
			</div>

            <div class="form-group">
                <label for="_serial" class="col-sm-6 control-label no-padding-right">广告位置：</label>
                <div class="col-sm-6">
                    <input id="adplacement" name="adplacement" type="text" value="${data.adplacement}" class="form-control" placeholder="广告所在位置"
                           required="true" />
                </div>
            </div>

            <div class="form-group">
                <label for="_terminal" class="col-sm-6 control-label no-padding-right">终端：</label>
                <div class="col-sm-6">
                    <select id="_terminal" name="terminal" class="form-control" >
                        <option value="">--请选择--</option>
                        <option value="1">PC</option>
                        <option value="2">手机</option>
                    </select>
                </div>
            </div>

			<div class="form-group">
				<label for="_adsize" class="col-sm-6 control-label no-padding-right">图片尺寸：</label>

				<div class="col-sm-6">
                    <select id="_adsize" name="adsize" class="form-control" disabled="disabled" >
                        <option value="">--请选择--</option>
                        <option value="200*500">200*500</option>
                        <option value="300*400">300*400</option>
                        <option value="400*500">400*500</option>
                    </select>
				</div>

			</div>
			<div class="form-group">
				<label for="_attributes" class="col-sm-6 control-label no-padding-right"> 属性：</label>

				<div class="col-sm-6">
                        <select id="_attributes" name="attributes" class="form-control" onchange="attributesChange(this)" disabled="disabled">
                            <option name="attributesValue" value="">--请选择--</option>
                            <option name="attributesValue" value="1">文字广告</option>
                            <option name="attributesValue" value="2">图片广告</option>
                        </select>
                </div>
            </div>

			<div class="form-group" id="_adwords">
				<label for="_adword" class="col-sm-6 control-label no-padding-right">广告词：</label>
				<div class="col-sm-6">
                    <textarea rows="3" id="_adword" class="form-control" name="adword">${data.adword}</textarea>
                </div>
            </div>

			<div class="form-group">
				<label for="_fontcolor" class="col-sm-6 control-label no-padding-right">字体颜色：</label>

				<div class="col-sm-6">
						<input id="_fontcolor" name="font_color"  value="${data.font_color}" style="background-color: ${data.font_color}" class="form-control"
							  maxlength="20"/>
                </div>
            </div>


            <div class="form-group" id="imgTitles">
                <label for="adtheme" class="col-sm-6 control-label no-padding-right">广告图主题：</label>

                <div class="col-sm-6">
                    <textarea rows="3" id="adtheme" class="form-control" name="adtheme">${data.adtheme}</textarea>
                </div>
            </div>

            <div class="form-group" id="uploadImg">
                <label for="_adlink" class="col-sm-6 control-label no-padding-right">上传图片：</label>

                <div class="col-sm-6">
                    <input name="image_address"
                           class="form-control img_croopered" value="${data.image_address}" type="text" readonly="readonly">
                    <input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload(this)">
                </div>
            </div>

			<div class="form-group">
				<label for="_adlink" class="col-sm-6 control-label no-padding-right">广告链接：</label>
				<div class="col-sm-6">
						<input id="_adlink" name="ad_link" type="text" value="${data.ad_link}" class="form-control" placeholder="广告图链接"
							  maxlength="100"/>
				</div>
			</div>

			<div class="form-group">
				<label for="_effectiveness" class="col-sm-6 control-label no-padding-right"> 广告信息有效性：</label>
				<div class="col-sm-6">
                    <select id="_effectiveness" name="effectiveness" class="form-control" >
                        <option value="">--请选择--</option>
                        <option value="0">展示中</option>
                        <option value="1">已过期</option>
                    </select>
                </div>
			</div>

			<div class="form-group">
				<label for="_expiredate" class="col-sm-6 control-label no-padding-right"> 到期时间：</label><%--value="${dateUtils.formatDate(data.expire_date)}"--%>
				<div class="col-sm-6">
                    <input id="_expiredate" name="expire_date_sdf" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${dateUtils.formatDate(data.expire_date)}" class="form-control" placeholder="到期时间"
                        required="true" />
                </div>
            </div>

			<div class="form-group">
				<label for="_displayswitch" class="col-sm-6 control-label no-padding-right"> 展示开关：</label>
				<div class="col-sm-6">
                        <select id="_displayswitch" name="display_switch" class="form-control" >
                            <option value="">--请选择--</option>
                            <option value="0">开</option>
                            <option value="1">关</option>
                        </select>
                </div>
            </div>

			<div class="form-group">
				<label for="_remark" class="col-sm-6 control-label no-padding-right">备注：</label>
				<div class="col-sm-6">
                    <textarea rows="3" id="_remark" class="form-control" name="remark">${data.remark}</textarea>
				</div>
			</div>
		</form>

	</div>
</div>

<script type="text/javascript">
    function update(){
        $("#_editForm").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#_editForm").data("bootstrapValidator");
        //手动触发验证
        var vali = bv.validate();
        //给表单字段定义验证规则
        if (bv.isValid()) {
            $("#select-current_page-text").removeAttr("disabled");
            var json = $("#_editForm").serialize();
            var action ="${pageContext.request.contextPath}/admin/aduniversal/updateCurrentAd";
            $.ajaxSettings.async = false;
            var code="";
            $.post(action, json, function(data){
                code = data.meta.code;
                if(data.meta.code=="00"){
                    alert(data.meta.message);
                    window.location.reload(true);
                }else{
                    alert(data.meta.message);
                }
            });
        }
	};
    //文件上传
    function fileUpload(obj){
        var fileObj = $(obj)[0].files[0]; // js 获取文件对象
        console.log(fileObj);
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            alert("请选择图片");
            return;
        }
        var formFile = new FormData();
        formFile.append("upfile", fileObj); //加入文件对象
        var data = formFile;
        $.ajax({
            url: basePath+"/uploadCarouselImage",
            data: data,
            type: "Post",
            dataType: "json",
            cache: false,//上传文件无需缓存
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            success: function (data) {
                console.log(data+"==="+JSON.stringify(data));
                if(data.state == "SUCCESS"){
                    $(".img_croopered").val(data.url_group);
                }else{
                    alert(data.message);
                }
            },
        });
    }
    function attributesChange() {
        var valueNum = $("#_attributes").val();
        if(valueNum==1){
            document.getElementById("uploadImg").style.display="None";
            document.getElementById("imgTitles").style.display="None";
            document.getElementById("_adwords").style.display="block";
        }
        if(valueNum==2){
            document.getElementById("_adwords").style.display="None";
            document.getElementById("uploadImg").style.display="block";
            document.getElementById("imgTitles").style.display="block";
        }
    }
</script>