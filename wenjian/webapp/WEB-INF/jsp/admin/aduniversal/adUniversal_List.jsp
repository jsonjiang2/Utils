<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="${basePath}/static/js/admin/adImage/adImage.js"></script>
    <script type="text/javascript" src="${basePath}/static/js/jscolor.js"></script>
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>

	<style>
		.text-center td {
			text-align: center;
			vertical-align: middle !important;
			border: 1px solid #666;
		}
        /*.myCheck{
            background-color: white;
            border-radius: 5px;
            border:1px solid #d3d3d3;
            width:16px;
            height:16px;
            display: inline-block;
            text-align: center;
            vertical-align: middle;
            line-height: 16px;
        }

        .myCheck:checked{
            background-color: #eee;
        }*/

		.searchDiv{
			position:relative;
			left:40%;
			top: 10%;
		}
        #fontId{
            font-size: 12px;
            font-style: normal;
            font-variant-ligatures: normal;
            font-variant-caps: normal;
            font-variant-numeric: normal;
            font-variant-east-asian: normal;
            font-weight: normal;
            font-stretch: normal;
            line-height: 24px;
            font-family: "Microsoft Yahei", "冬青黑体简体中文 w3", 宋体;
        }
	</style>
	<title>通用广告图设置</title>
	<script type="text/javascript">
        $(function(){
            $("#current_page").val("${aduniversal.current_page}");
            $("#terminal").val("${aduniversal.terminal }");
            $("#effectiveness").val("${aduniversal.effectiveness }");
            $("#attributes_param").val("${aduniversal.attributes }");
            $("#display_switch_param").val("${aduniversal.display_switch }");
        })
	</script>
</head>
<body>
Color: <input class="jscolor" value="ab2567">
<div class="container" style="width: 85%;" id="fontId">
	<div class="row clearfix">
		<div style="margin-bottom: 10px;"></div>
		<form method="GET" class="form-inline" id="adUniversal_list_form"
			  action="getCurrentAdList">
			<input type="hidden" id="pageNum" name="pageNum">
			<input type="hidden" id="pageSize" name="pageSize">



			<br/>
            <div class="form-group">
                所属板块：
                <select id="current_page" name="current_page" class="form-control">
                    <option value="">--请选择--</option>
                    <option value=1>首页</option>
                    <option value=2>资源主列表</option>
                    <option value=3>平台数据列表</option>
                    <option value=4>巴士茶馆</option>
                    <option value=5>网贷咨询</option>
                    <option value=8>钱多多</option>
                    <option value=9>个人中心</option>
                    <option value=6>巴士茶馆详情页</option>
                    <option value=7>网贷资讯详情页</option>
                    <option value=10>钱多多侧边栏</option>
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
            &nbsp;&nbsp;
            <div class="form-group">
                展示端口：
                <select id="terminal" name="terminal" class="form-control">
                    <option value=>--请选择--</option>
                    <option value=1>PC端</option>
                    <option value=2>手机端</option>
                </select>
            </div>

            &nbsp;&nbsp;
            <div class="form-group">
                广告属性:
                <select id="attributes_param" name="attributes" class="form-control">
                    <option value=>--请选择--</option>
                    <option value=1>文字广告</option>
                    <option value=2>图片广告</option>
                </select>
            </div>

            &nbsp;&nbsp;
            <div class="form-group">
                有效性：
                <select id="effectiveness" name="effectiveness" class="form-control">
                    <option value=>--请选择--</option>
                    <option value=0>展示中</option>
                    <option value=1>已过期</option>
                </select>
            </div>

            &nbsp;&nbsp;
            <div class="form-group">
                展示开关：
                <select id="display_switch_param" name="display_switch" class="form-control">
                    <option value=>--请选择--</option>
                    <option value=0>开</option>
                    <option value=1>关</option>
                </select>
            </div>


			<div class="form-group">
				<div class="searchDiv">
					<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="btn btn-default" onclick="ad.clearForm()" style="width: 100px;">重置</button>
				</div>
			</div>
            <%--<input type="text" id="current_page"  name="current_page" />--%>
		</form>
		<%@include file="/WEB-INF/jsp/admin/aduniversal/adUniversalListTemp.jsp" %>
	</div>
</div>
<script>
    function conditionalQuery(param,value){
       var dataParams = {};
        dataParams[param]=value;
        $.ajax({
            url : basePath+"/admin/aduniversal/getCurrentAdList?time="+new Date().getTime(),
            type : "get",
            data : dataParams,
            async : false,
            dataType : "HTML",
            success : function(data){
                $("body").html(data);
            }
        });
    }
</script>
<!-- 引入模态框 -->
<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>
</html>