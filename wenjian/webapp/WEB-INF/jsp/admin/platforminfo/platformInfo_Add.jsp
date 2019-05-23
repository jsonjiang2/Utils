<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>平台信息添加页面</title>
    <%@include file="/WEB-INF/jsp/common/public.jsp"%>
    <style>
        .text-center td {
            text-align: center;
            vertical-align: middle !important;
            border: 1px solid #666;
        }

        .myCheck{
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
        }

    </style>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
    <form id="inputForm" class="form-horizontal" >

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pno">平台编号</label>
            <div class="col-sm-3">
                <input type="text" name="pno" id="pno" value="${pno}" class="form-control" readonly="readonly"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
            <div class="col-sm-3">
                <input type="text" name="pname" id="pname" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="logo1">logo详情页(大)：</label>
            <div class="col-sm-3">
                <input name="logo1" id="logo1"
                       class="form-control" type="text" readonly="readonly">
                <input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload1(this)">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="logo2">logo列表页(小)：</label>
            <div class="col-sm-3">
                <input name="logo2" id="logo2"
                       class="form-control" type="text" readonly="readonly">
                <input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload2(this)">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pname">平台网址</label>
            <div class="col-sm-3">
                <input type="text" name="website" id="website" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="online1">上线时间</label>
            <div class="col-sm-3">
                <input type="text" class="Wdate" id="online1" name="online1" style="width: 180px;height: 30px;"
                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="thunderstormtime1">爆雷时间</label>
            <div class="col-sm-3">
                <input type="text" class="Wdate" id="thunderstormtime1" name="thunderstormtime1" style="width: 180px;height: 30px;"
                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pname">运营公司</label>
            <div class="col-sm-3">
                <input type="text" name="recordname" id="recordname" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="pbrief">公司简介</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="pbrief" id="pbrief"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="profitmin">预期收益</label>
            <div class="col-sm-3">
                <input type="text" name="profitmin" id="profitmin" placeholder="小数" class="form-control"  />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="operatingstatus">运营状态</label>
            <div class="col-sm-3">
                <select name="operatingstatus" id="operatingstatus" class="form-control">
                    <option value="1" <c:if test="${platformInfo.operatingstatus eq '1'}">selected="selected"</c:if>>正常</option>
                    <option value="2" <c:if test="${platformInfo.operatingstatus eq '2'}">selected="selected"</c:if>>跑路</option>
                    <option value="3" <c:if test="${platformInfo.operatingstatus eq '3'}">selected="selected"</c:if>>清盘</option>
                    <option value="4" <c:if test="${platformInfo.operatingstatus eq '4'}">selected="selected"</c:if>>高风险</option>
                    <option value="5" <c:if test="${platformInfo.operatingstatus eq '5'}">selected="selected"</c:if>>有争议</option>
                    <option value="6" <c:if test="${platformInfo.operatingstatus eq '6'}">selected="selected"</c:if>>延期兑付</option>
                    <option value="7" <c:if test="${platformInfo.operatingstatus eq '7'}">selected="selected"</c:if>>停业</option>
                    <option value="8" <c:if test="${platformInfo.operatingstatus eq '8'}">selected="selected"</c:if>>经侦介入</option>
                    <option value="9" <c:if test="${platformInfo.operatingstatus eq '9'}">selected="selected"</c:if>>提现困难</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="province">省</label>
            <div class="col-sm-3">
                <input type="text" name="province" id="province" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="city">市</label>
            <div class="col-sm-3">
                <input type="text" name="city" id="city" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="district">区</label>
            <div class="col-sm-3">
                <input type="text" name="district" id="district" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="address">总部地址</label>
            <div class="col-sm-3">
                <input type="text" name="address" id="address" value="${platformInfo.address}" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="customerphone">客服电话</label>
            <div class="col-sm-3">
                <input type="text" name="customerphone" id="customerphone" value="${platformInfo.customerphone}" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label laber_from" for="qq">客服QQ</label>
            <div class="col-sm-3">
                <input type="text" name="qq" id="qq" value="${platformInfo.qq}" class="form-control" />
            </div>
        </div>


        <button id="insertButton" onclick="return checkForm()" class="btn btn-default" type="button"
                style="margin-top: 20px;margin-left:200px;">保存
        </button>
        <button class="btn btn-default" type="button"
                onclick="window.location.href='${pageContext.request.contextPath}/admin/platformInfo/lists';"
                style="margin-top: 20px;margin-left:100px;">返回
        </button>
    </form>
    <div class="col-md-3"></div>
</div>
</body>

<script type="text/javascript">

    //验证
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            // pno: {
            //     validators: {
            //         notEmpty: {
            //             message: "不能为空"
            //         }
            //     }
            // },
            // pname: {
            //     validators: {
            //         notEmpty: {
            //             message: "不能为空"
            //         },
            //         stringLength: {
            //             max: 30,
            //             message: "长度不能大于30"
            //         }
            //     }
            // },
            ranking: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    },
                    stringLength: {
                        max: 100,
                        message: "长度不能大于50"
                    }
                }
            },
            handlers: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    }
                }
            }
            // gradetime1: {
            //     validators: {
            //         notEmpty: {
            //             message: "不能为空"    输入了时间还是出现提示
            //         }
            //     }
            // }
        }
    };

    $("#insertButton").click(function(){
        // $("#inputForm").bootstrapValidator(validate);
        // //获取定义好规则的代理对象
        // var bv = $("#inputForm").data("bootstrapValidator");
        // //手动触发验证
        // bv.validate();
        // //给表单字段定义验证规则
        // if (bv.isValid()) {
            var action="/admin/platformInfo/save";
            $.post(action,$("#inputForm").serialize(),function(data){
                alert(data.meta.message);
                window.location.href="${pageContext.request.contextPath}/admin/platformInfo/lists";
            });

        // }
    });



    //文件上传
    // logo1
    function fileUpload1(obj){
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
                    $("#logo1").val(data.url_group);
                }else{
                    alert(data.message);
                }
            },
        });
    }
    // logo2
    function fileUpload2(obj){
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
                    $("#logo2").val(data.url_group);
                }else{
                    alert(data.message);
                }
            },
        });
    }




</script>


</html>