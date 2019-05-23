<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>内容新增页面</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/uploadPreview.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/plugin/ueditor/ueditor.config.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/plugin/ueditor/ueditor.all.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/plugin/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script>


    </script>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
    <form id="form" action="#" method="post"
          class="form-horizontal" enctype="multipart/form-data" accept-charset="UTF-8"
          onsubmit="document.charset='UTF-8';">
        <div class="form-group">
            <label class="col-sm-2 control-label">类型</label>
            <div class="col-sm-3">
                <select class="form-control" name="frontType" id="frontType">
                    <option value="">请选择</option>
                    <c:forEach items="${frontTypes}" var="frontType">
                        <option value="${frontType.id}">${frontType.typeName}</option>
                    </c:forEach>
                </select>
                <span id="msgtypeError" style="color:red"></span>
            </div>
        </div>






        <button class="btn btn-default" type="button"
                onclick="window.location.href='${pageContext.request.contextPath}/admin/frontContent/list';"
                style="margin-top: 20px;margin-left:200px;">返回
        </button>
    </form>
</div>

<script type="text/javascript">

    //验证
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            //类型
            msgtype: {
                validators: {
                    notEmpty: {
                        message: "类型不能为空"
                    }

                }
            },
            num: {
                validators: {
                    notEmpty: {
                        message: "类型不能为空"
                    },
                    digits: {
                        message: "只能是整数"
                    },
                    stringLength: {
                        max: 30,
                        message: "长度不能大于30"
                    }
                }
            },

            //标题
            msgtitle: {
                validators: {
                    notEmpty: {
                        message: "标题不能为空"
                    },
                    stringLength: {
                        max: 100,
                        message: "标题长度不能大于100"
                    }
                }
            },

            //是否置顶
            istop: {
                validators: {
                    notEmpty: {
                        message: "是否置顶不能为空"
                    },
                    between: {
                        max: 1,
                        min: 0
                    }
                }
            },
            //是否前端显示
            display: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    }
                }
            },
            remark: {
                validators: {
                    notEmpty: {
                        message: "备注不能为空"
                    },
                    stringLength: {
                        max: 100,
                        message: "备注长度不能大于100"
                    }
                }
            }
        }
    };
    $(function () {
        $("#form").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#form").data("bootstrapValidator");
    });
    $("#frontType").change(function () {
        var typeId=$("#frontType").val();
        var action = "${pageContext.request.contextPath}/admin/frontContent/toAddDetail/"+typeId;
        window.location.href=action;
    })
    //客户端验证
    function checkForm() {

        //手动触发验证
        bv.validate();
        //给表单字段定义验证规则
        if (bv.isValid()) {
            return true;
        }
    }


</script>
</body>
</html>