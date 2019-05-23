<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<!DOCTYPE HTML>
<html>
<head>
    <title>全局配置修改</title>
</head>
<body>
<div class="container">
    <form id="form" action="" method="post" class="form-horizontal">
        <%--<div class="form-group">
            <label class="col-sm-2 control-label">网站名称</label>
            <div class="col-sm-3">
                <input type="text" id="websitename" name="websitename" class="form-control" value="${global.websitename}" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">网站抬头</label>
            <div class="col-sm-3">
                <input type="text" id="title" name="title" class="form-control" value="${global.title}" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">网站关键词</label>
            <div class="col-sm-3">
                <input type="text" id="keyworld" name="keyworld" class="form-control" value="${global.keyworld}" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">网站描述</label>
            <div class="col-sm-3">
                <input type="text" id="description" name="description" class="form-control" value="${global.description}" />
            </div>
        </div>--%>

        <div class="form-group">
            <label class="col-sm-2 control-label">提现异常判断时间间隔</label>
            <div class="col-sm-3">
                <input type="text" id="withdrawaltime" name="withdrawaltime" class="form-control" value="${global.withdrawaltime}" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">广告图展示优先级</label>
            <div class="col-sm-3">
                <select id="postadway" name="postadway" class="form-control" value="${global.postadway}">
                    <c:if test="${global.postadway==1 or global.postadway==null}">
                        <option value=1 checked="checked">用户广告图</option>
                        <option value=2>管理员广告图</option>
                    </c:if>
                    <c:if test="${global.postadway==2}">
                        <option value=1>用户广告图</option>
                        <option value=2 checked="checked">管理员广告图</option>
                    </c:if>
                </select>
            </div>
        </div>
        <%--<div class="form-group">
            <label class="col-sm-2 control-label">茶馆发帖审核开关</label>
            <div class="col-sm-3">
                <select id="teastatus" name="teastatus" class="form-control" value="${global.teastatus}">
                    <c:if test="${global.teastatus==0 or global.teastatus==null}">
                        <option value=0 checked="checked">关</option>
                        <option value=1>开</option>
                    </c:if>
                    <c:if test="${global.teastatus==1}">
                        <option value=0>关</option>
                        <option value=1 checked="checked">开</option>
                    </c:if>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">茶馆回复审核开关</label>
            <div class="col-sm-3">
                <select id="tearpstatus" name="tearpstatus" class="form-control" value="${global.tearpstatus}">
                    <c:if test="${global.tearpstatus==0 or global.tearpstatus==null}">
                        <option value=0 checked="checked">关</option>
                        <option value=1>开</option>
                    </c:if>
                    <c:if test="${global.tearpstatus==1}">
                        <option value=0>关</option>
                        <option value=1 checked="checked">开</option>
                    </c:if>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">资讯回复审核开关</label>
            <div class="col-sm-3">
                <select id="messtatus" name="messtatus" class="form-control" value="${global.messtatus}">
                    <c:if test="${global.messtatus==0 or global.messtatus==null}">
                        <option value=0 checked="checked">关</option>
                        <option value=1>开</option>
                    </c:if>
                    <c:if test="${global.messtatus==1}">
                        <option value=0>关</option>
                        <option value=1 checked="checked">开</option>
                    </c:if>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">资讯发帖审核开关</label>
            <div class="col-sm-3">
                <select id="mesrpstatus" name="mesrpstatus" class="form-control" value="${global.mesrpstatus}">
                    <c:if test="${global.mesrpstatus==0 or global.mesrpstatus==null}">
                        <option value=0 checked="checked">关</option>
                        <option value=1>开</option>
                    </c:if>
                    <c:if test="${global.mesrpstatus==1}">
                        <option value=0>关</option>
                        <option value=1 checked="checked">开</option>
                    </c:if>
                </select>
            </div>
        </div>--%>

        <div class="form-group">
            <label class="col-sm-2 control-label">增加最少数</label>
            <div class="col-sm-3">
                <input type="text" id="addminview" name="addminview" class="form-control" value="${global.addminview}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">增加最多数</label>
            <div class="col-sm-3">
                <input type="text" id="addmaxview" name="addmaxview" class="form-control" value="${global.addmaxview}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">单贴操作数</label>
            <div class="col-sm-3">
                <input type="text" id="threadadd" name="threadadd" class="form-control" value="${global.threadadd}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">帖子查看最少数</label>
            <div class="col-sm-3">
                <input type="text" id="minview" name="minview" class="form-control" value="${global.minview}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">帖子查看最大数</label>
            <div class="col-sm-3">
                <input type="text" id="maxview" name="maxview" class="form-control" value="${global.maxview}" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">帖子开始时间</label>
            <div class="col-sm-3">
                <input type="text" class="Wdate" id="poststarttimes" name="poststarttimes"
                       value="${dateUtils.formatDate(global.poststarttime)}" style="width: 180px;height: 30px;"
                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">帖子结束时间</label>
            <div class="col-sm-3">
                <input type="text" class="Wdate" id="postendtimes" name="postendtimes"
                       value="${dateUtils.formatDate(global.postendtime)}" style="width: 180px;height: 30px;"
                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">执行次数</label>
            <div class="col-sm-3">
                <input type="text" id="exenumber" name="exenumber" class="form-control" value="${global.exenumber}" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">排序方式</label>
            <div class="col-sm-3">
                <select id="sorttype" name="sorttype" class="form-control" value="${global.sorttype}">
                    <c:if test="${global.sorttype==1}">
                        <option value=1 checked="checked">按最新排序</option>
                        <option value=2>按最新回复排序</option>
                    </c:if>
                    <c:if test="${global.sorttype==2}">
                        <option value=1>按最新排序</option>
                        <option value=2 checked="checked">按最新回复排序</option>
                    </c:if>
                </select>
            </div>
        </div>

        <input hidden="hidden" name="id" value="${global.id}"/>
    </form>
</div>

<script type="text/javascript">

    $(function () {
        $("#postadway").find("option[value=${global.postadway}]").attr("selected",true);
        $("#teastatus").find("option[value=${global.teastatus}]").attr("selected",true);
        $("#tearpstatus").find("option[value=${global.tearpstatus}]").attr("selected",true);
        $("#messtatus").find("option[value=${global.messtatus}]").attr("selected",true);
        $("#mesrpstatus").find("option[value=${global.mesrpstatus}]").attr("selected",true);
        $("#sorttype").find("option[value=${global.sorttype}]").attr("selected",true);
    })
    //验证
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            //网站名称
            websitename: {
                validators: {
                    notEmpty: {
                        message: "网站名称不能为空"
                    }
                }
            },

            //网站抬头
            title: {
                validators: {
                    notEmpty: {
                        message: "网站抬头不能为空"
                    }
                }
            },
            //网站关键词
            keyworld: {
                validators: {
                    notEmpty: {
                        message: "网站关键词不能为空"
                    }
                }
            },
            //网站描述
            description: {
                validators: {
                    notEmpty: {
                        message: "网站描述不能为空"
                    }
                }
            },
            //提现异常判断时间间隔
            withdrawaltime: {
                validators: {
                    notEmpty: {
                        message: "提现异常判断时间间隔不能为空"
                    }
                }
            },
            //广告图展示优先级
            postadway: {
                validators: {
                    notEmpty: {
                        message: "广告图展示优先级不能为空"
                    }
                }
            },
            //茶馆发帖审核开关
            teastatus: {
                validators: {
                    notEmpty: {
                        message: "茶馆发帖审核开关不能为空"
                    }
                }
            },
            //茶馆回复审核开关
            tearpstatus: {
                validators: {
                    notEmpty: {
                        message: "茶馆回复审核开关不能为空"
                    }
                }
            },
            //资讯发帖审核开关
            messtatus: {
                validators: {
                    notEmpty: {
                        message: "资讯发帖审核开关不能为空"
                    }
                }
            },
            //资讯回复审核开关
            mesrpstatus: {
                validators: {
                    notEmpty: {
                        message: "资讯回复审核开关不能为空"
                    }
                }
            }
            /*//备注
            remark: {
                validators: {
                    stringLength:{
                        max:1000,
                        message:"备注长度不能大于1000"
                    }
                }
            }*/
        }
    };

    //客户端验证
    function update() {

        var addminview = document.getElementById("addminview").value;
        var addmaxview = document.getElementById("addmaxview").value;
        var threadadd = document.getElementById("threadadd").value;
        var minview = document.getElementById("minview").value;
        var maxview = document.getElementById("maxview").value;
        var exenumber = document.getElementById("exenumber").value;

        var poststarttime = document.getElementById("poststarttimes").value;
        var postendtime = document.getElementById("postendtimes").value;

        if(postendtime<poststarttime){
            alert("帖子结束时间不能小于帖子开始时间")
            return false;
        }

        /*if(new Date(postendtime)>new Date()){
            alert("帖子结束时间不能大于当前时间")
            return false;
        }*/

        if(parseInt(threadadd)<parseInt(exenumber)){
            alert("单贴操作数不能小于执行次数");
            return false;
        }

        if(parseInt(addmaxview)<parseInt(addminview)){
            alert("增加最多数不能小于增加最小数");
            return false;
        }
        if(parseInt(maxview)<parseInt(minview)){
            alert("帖子查看最多数不能小于帖子查看最少数");
            return false;
        }


        //给表单字段定义验证规则
        $("#form").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#form").data("bootstrapValidator");
        //手动触发验证
        bv.validate();
        if(!bv.isValid()){
            return false;
        }
        var action ="${basePath}/admin/global/updateGlobal";
        var json = $("#form").serialize();
        $.ajax({
            type: "post",
            url: action,
            data: json,
            dataType: "json",
            async:false,
            success: function(data){
                if(data.meta.code=="88"){
                    alert("修改成功");
                    window.location.reload(true);
                }else if(data.meta.code!="88"){
                    alert("修改失败");
                    window.location.reload(true);
                }
            },
            error: function (data) {
                alert("系统异常")
            }
        });
    }

</script>

</body>
</html>