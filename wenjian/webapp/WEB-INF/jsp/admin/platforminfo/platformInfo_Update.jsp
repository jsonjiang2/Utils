<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <style type="text/css">
        *{margin: 0px;padding: 0px;}
        .laber_from {color: #222;font-weight: normal;}
        .route_bg{ background-color: #E7E7E7; border-radius: 4px; padding: 5px; margin-right: 5px;margin-left: 5px;margin-top: 5px; }
        .route_bg i{ color: #ccc;font-weight: 400;font-size: 12px;padding-right: 5px;line-height: 25px; }
        .route_bg a{ font-size: 12px; color: #666; text-decoration: none;line-height: 1.6;font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif !important; }
        .route_bg a:hover{ color: #888; text-decoration: none;}
        hr{
            margin: 5px;
        }
    </style>


</head>
<body  style="font-family:'微软雅黑'; ">

<script type="text/javascript">
    /*
    //修改数据校验
    $(function(){
        $("#updateModal").on("shown.bs.modal",function(){
            $("#platformInfo_updateForm").bootstrapValidator({
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields:{
                    specialdesc:{
                        validators:{
                            notEmpty:{
                                message:"请输入特殊说明"
                            }
                        }
                    }

                }
            });
        });
    });
    */
</script>
                <!--修改页面貌似在保存时，隐藏了执行Temp页面的update()方法的操作， 其实 modal.jsp保存写了执行update()

                即点击保存，自动执行Temp页面的update()方法-->

<div class="container"  style="margin-top: 25px;">
    <form class="form-horizontal" role="form" id="platformInfo_updateForm">
        <c:if test="${empty platformInfo}">
            <label>暂无数据</label>
        </c:if>
        <c:if test="${!empty platformInfo}">
            <input type="hidden" name="id" value="${platformInfo.id}"/>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pname">平台名称</label>
                <div class="col-sm-3">
                    <input type="text" name="pname" id="pname" value="${platformInfo.pname}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="logo1">logo详情页(大)：</label>
                <div class="col-sm-3">
                    <input name="logo1" id="logo1"
                           class="form-control" value="${platformInfo.logo1}" type="text" readonly="readonly">
                    <input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload1(this)">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="logo2">logo列表页(小)：</label>
                <div class="col-sm-3">
                    <input name="logo2" id="logo2"
                           class="form-control" value="${platformInfo.logo2}" type="text" readonly="readonly">
                    <input type="file" name="FileUpload" style="display: block;border: initial;" onchange="fileUpload2(this)">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pname">平台网址</label>
                <div class="col-sm-3">
                    <input type="text" name="website" id="website" value="${platformInfo.website}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="pname">运营公司</label>
                <div class="col-sm-3">
                    <input type="text" name="recordname" id="recordname" value="${platformInfo.recordname}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="province">省</label>
                <div class="col-sm-3">
                    <input type="text" name="province" id="province" value="${platformInfo.province}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="city">市</label>
                <div class="col-sm-3">
                    <input type="text" name="city" id="city" value="${platformInfo.city}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="address">区</label>
                <div class="col-sm-3">
                    <input type="text" name="district" id="district" value="${platformInfo.district}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="address">详细地址</label>
                <div class="col-sm-3">
                    <input type="text" name="address" id="address" value="${platformInfo.address}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="profitmin">参考收益</label>
                <div class="col-sm-3">
                    <input type="text" name="profitmin" id="profitmin" value="${platformInfo.profitmin}" placeholder="小数，如：0.16" class="form-control" />
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

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="maintanceman">维护人</label>
                <div class="col-sm-3">
                    <input type="text" name="maintanceman" id="maintanceman" value="${platformInfo.maintanceman}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="maintanceposition">维护人职位</label>
                <div class="col-sm-3">
                    <input type="text" name="maintanceposition" id="maintanceposition" value="${platformInfo.maintanceposition}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="depositorytype">存管方式</label>
                <div class="col-sm-3">
                    <select name="depositorytype" id="depositorytype" class="form-control">
                        <option value="1" <c:if test="${platformInfo.depositorytype eq '1'}">selected="selected"</c:if>>资金池</option>
                        <option value="2" <c:if test="${platformInfo.depositorytype eq '2'}">selected="selected"</c:if>>支付公司存管</option>
                        <option value="3" <c:if test="${platformInfo.depositorytype eq '3'}">selected="selected"</c:if>>银行存管</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="depositoryagency">存管机构</label>
                <div class="col-sm-3">
                    <input type="text" name="depositoryagency" id="depositoryagency" value="${platformInfo.depositoryagency}" class="form-control" />
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
                <label class="col-sm-2 control-label laber_from" for="investtimelimit">投资期限</label>
                <div class="col-sm-3">
                    <input type="text" name="investtimelimit" id="investtimelimit" value="${platformInfo.investtimelimit}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="investidea">投资建议</label>
                <div class="col-sm-3">
                    <select name="investidea" id="investidea" class="form-control">
                        <option value="0">请选择</option>
                        <option value="1" <c:if test="${platformInfo.investidea eq '1'}">selected="selected"</c:if>>不宜投资</option>
                        <option value="2" <c:if test="${platformInfo.investidea eq '2'}">selected="selected"</c:if>>建议投资</option>
                        <option value="3" <c:if test="${platformInfo.investidea eq '3'}">selected="selected"</c:if>>警方介入</option>
                        <option value="4" <c:if test="${platformInfo.investidea eq '4'}">selected="selected"</c:if>>已跑路</option>
                        <option value="5" <c:if test="${platformInfo.investidea eq '5'}">selected="selected"</c:if>>有争议</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="sort">排序定位</label>
                <div class="col-sm-3">
                    <input type="text" name="sort" id="sort" value="${platformInfo.sort}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="riskmark">风险提示</label>
                <div class="col-sm-3">
                    <textarea rows="3" name="riskmark" id="riskmark" class="form-control">${platformInfo.riskmark}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="productno">产品编号</label>
                <div class="col-sm-3">
                    <input type="text" name="productno" id="productno" value="${platformInfo.productno}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="declarationcode">返利申报码</label>
                <div class="col-sm-3">
                    <select name="declarationcode" id="declarationcode" class="form-control">
                        <option value="">请选择</option>
                        <option value="0" <c:if test="${platformInfo.declarationcode eq '0'}">selected="selected"</c:if>>不填写</option>
                        <option value="1" <c:if test="${platformInfo.declarationcode eq '1'}">selected="selected"</c:if>>填写</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="declarationremarks">申报备注</label>
                <div class="col-sm-3">
                    <select name="declarationremarks" id="declarationremarks" class="form-control">
                        <option value="">请选择</option>
                        <option value="0" <c:if test="${platformInfo.declarationremarks eq '0'}">selected="selected"</c:if>>不填写</option>
                        <option value="1" <c:if test="${platformInfo.declarationremarks eq '1'}">selected="selected"</c:if>>填写</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="investmentperiod">投资期数</label>
                <div class="col-sm-3">
                    <select name="investmentperiod" id="investmentperiod" class="form-control">
                        <option value="">请选择</option>
                        <option value="0" <c:if test="${platformInfo.investmentperiod eq '0'}">selected="selected"</c:if>>不填写</option>
                        <option value="1" <c:if test="${platformInfo.investmentperiod eq '1'}">selected="selected"</c:if>>填写</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="declarationphoto">申报图片</label>
                <div class="col-sm-3">
                    <select name="declarationphoto" id="declarationphoto" class="form-control">
                        <option value="">请选择</option>
                        <option value="0" <c:if test="${platformInfo.declarationphoto eq '0'}">selected="selected"</c:if>>不提交</option>
                        <option value="1" <c:if test="${platformInfo.declarationphoto eq '1'}">selected="selected"</c:if>>提交</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="thunderstormtime1">爆雷时间</label>
                <div class="col-sm-3">
                    <c:if test="${platformInfo.thunderstormtime != null}">
                        <input type="text" class="Wdate" id="thunderstormtime1" name="thunderstormtime1"
                               value="${dateUtils.formatDate(platformInfo.thunderstormtime)}" style="width: 180px;height: 30px;"
                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                    </c:if>
                    <c:if test="${platformInfo.thunderstormtime == null}">
                        <input type="text" class="Wdate" id="thunderstormtime1" name="thunderstormtime1"
                               style="width: 180px;height: 30px;"
                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                    </c:if>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="androidlink">APP地址(安卓)</label>
                <div class="col-sm-3">
                    <input type="text" name="androidlink" id="androidlink" value="${platformInfo.androidlink}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="ioslink">APP地址(苹果)</label>
                <div class="col-sm-3">
                    <input type="text" name="ioslink" id="ioslink" value="${platformInfo.ioslink}" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="platformattribute">平台属性</label>
                <div class="col-sm-3">
                    <select name="platformattribute" id="platformattribute" class="form-control">
                        <option value="">请选择</option>
                        <option value="1" <c:if test="${platformInfo.platformattribute eq '1'}">selected="selected"</c:if>>P2P</option>
                        <option value="2" <c:if test="${platformInfo.platformattribute eq '2'}">selected="selected"</c:if>>证券</option>
                        <option value="3" <c:if test="${platformInfo.platformattribute eq '3'}">selected="selected"</c:if>>银行</option>
                        <option value="4" <c:if test="${platformInfo.platformattribute eq '4'}">selected="selected"</c:if>>基金</option>
                        <option value="5" <c:if test="${platformInfo.platformattribute eq '5'}">selected="selected"</c:if>>电商</option>
                        <option value="6" <c:if test="${platformInfo.platformattribute eq '6'}">selected="selected"</c:if>>支付</option>
                        <option value="7" <c:if test="${platformInfo.platformattribute eq '7'}">selected="selected"</c:if>>其他</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="investimpress1">投资印象1</label>
                <div class="col-sm-3">
                    <input type="text" name="investimpress1" id="investimpress1" value="${platformInfo.investimpress1}" maxlength="6" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="investimpress2">投资印象2</label>
                <div class="col-sm-3">
                    <input type="text" name="investimpress2" id="investimpress2" value="${platformInfo.investimpress2}" maxlength="6" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="investimpress3">投资印象3</label>
                <div class="col-sm-3">
                    <input type="text" name="investimpress3" id="investimpress3" value="${platformInfo.investimpress3}" maxlength="6" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="investimpress4">投资印象4</label>
                <div class="col-sm-3">
                    <input type="text" name="investimpress4" id="investimpress4" value="${platformInfo.investimpress4}" maxlength="6" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="investimpress5">投资印象5</label>
                <div class="col-sm-3">
                    <input type="text" name="investimpress5" id="investimpress5" value="${platformInfo.investimpress5}" maxlength="6" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="investimpress6">投资印象6</label>
                <div class="col-sm-3">
                    <input type="text" name="investimpress6" id="investimpress6" value="${platformInfo.investimpress6}" maxlength="6" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="display">页面显示</label>
                <div class="col-sm-3">
                    <select name="display" id="display" class="form-control">
                        <option value="0" <c:if test="${platformInfo.display eq '0'}">selected="selected"</c:if>>不显示</option>
                        <option value="1" <c:if test="${platformInfo.display eq '1'}">selected="selected"</c:if>>显示</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="specialdesc">特殊说明</label>
                <div class="col-sm-3">
                    <input type="text" name="specialdesc" id="specialdesc" value="${platformInfo.specialdesc}" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label laber_from" for="remark">备注</label>
                <div class="col-sm-3">
                    <input type="text" name="remark" id="remark" value="${platformInfo.remark}" class="form-control" />
                </div>
            </div>


        </c:if>
    </form>
</div>

<script type="text/javascript">

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

</body>
</html>