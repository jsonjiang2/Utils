<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>新闻公告新增页面</title>
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
        function insert() {
            if (checkForm()) {

                <%--//提交按钮设置为不可用--%>
                <%--$("#insertButton").attr("disabled",true);--%>
                <%--var action = "${pageContext.request.contextPath}/admin/sysNews/insert";--%>
                <%--var callback = insertCallback;--%>
                <%--$.post(action, $("#form").serialize(), callback);--%>
                return true;
            }
        }
        //新增回调函数
        var insertCallback = function (data) {

            //提交按钮设置为可用
            $("#insertButton").attr("disabled", false);
            $("#msgtypeError").text("");
            $("#msgtitleError").text("");
            $("#msgcontentError").text("");
            $("#istopError").text("");
            var errors = data.errors;
            if (errors == "errors") {

                //重新给formtoken赋值
                $("#formTokenId").val(data.formtoken);
                if (data.msgtype != undefined) {
                    $("#msgtypeError").text(data.msgtype);
                }
                if (data.msgtitle != undefined) {
                    $("#msgtitleError").text(data.msgtitle);
                }
                if (data.msgcontent != undefined) {
                    $("#msgcontentError").text(data.msgcontent);
                }
                if (data.istop != undefined) {
                    $("#istopError").text(data.istop);
                }
                return false;
            }
            alert(data.Msg);
            if ("success" == data.result) {
                window.location.href = "${pageContext.request.contextPath}/admin/sysNews/newsList"
            }
        }

        $(function () {
            $("#imageFile").uploadPreview({Img: "ImgPr", Width: 220, Height: 220});
        });

    </script>
</head>
<body>
<div class="container">
    <div style="margin-top:20px;"></div>
    <form id="form"  method="post"
          class="form-horizontal" enctype="multipart/form-data" accept-charset="UTF-8"
          onsubmit="document.charset='UTF-8';">
        <input type="hidden" name="id" value="${frontContent.id}">
        <div class="form-group">
            <label class="col-sm-2 control-label">类型</label>
            <div class="col-sm-3">
                <select class="form-control" name="typeId" id="typeId">

                    <c:forEach items="${frontTypes}" var="type">
                        <c:choose>
                            <c:when test="${frontType.id eq type.id}">
                                <option value="${type.id}" selected>${type.typeName}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${type.id}">${type.typeName}</option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </select>
                <span id="typeIdError" style="color:red"></span>
            </div>
        </div>
        <c:if test="${frontType.titleSwitch eq 1}">
            <div class="form-group">
                <label class="col-sm-2 control-label">
                    <c:choose>
                        <c:when test="${empty frontType.title}">
                            标题
                        </c:when>
                        <c:otherwise>
                            ${frontType.title}
                        </c:otherwise>
                    </c:choose>
                </label>
                <div class="col-sm-3">
                    <input type="text" name="title" id="title" class="form-control" value="${frontContent.title}"/>
                    <span id="titleError" style="color:red"></span>
                </div>
            </div>
        </c:if>
        <c:if test="${frontType.subTitleSwitch eq 1}">
            <div class="form-group">
                <label class="col-sm-2 control-label">
                    <c:choose>
                        <c:when test="${empty frontType.subTitle}">
                            副标题
                        </c:when>
                        <c:otherwise>
                            ${frontType.subTitle}
                        </c:otherwise>

                    </c:choose>
                </label>
                <div class="col-sm-3">
                    <input type="text" name="subTitle" id="subTitle" class="form-control" value="${frontContent.subTitle}"/>
                    <span id="subTitleError" style="color:red"></span>
                </div>
            </div>
        </c:if>
        <c:if test="${frontType.hrefSwitch eq 1}">
            <div class="form-group">
                <label class="col-sm-2 control-label">
                    <c:choose>
                        <c:when test="${empty frontType.href}">
                            主链接
                        </c:when>
                        <c:otherwise>
                            ${frontType.href}
                        </c:otherwise>

                    </c:choose>
                </label>
                <div class="col-sm-3">
                    <input type="text" name="href" id="href" class="form-control" value="${frontContent.href}"/>
                    <span id="hrefError" style="color:red"></span>
                </div>
            </div>
        </c:if>
        <c:if test="${frontType.subHrefSwitch eq 1}">
            <div class="form-group">
                <label class="col-sm-2 control-label">
                    <c:choose>
                        <c:when test="${empty frontType.subHref}">
                            副链接
                        </c:when>
                        <c:otherwise>
                            ${frontType.subHref}
                        </c:otherwise>

                    </c:choose>
                </label>
                <div class="col-sm-3">
                    <input type="text" name="subHref" id="subHref" class="form-control" value="${frontContent.subHref}"/>
                    <span id="subHrefError" style="color:red"></span>
                </div>
            </div>
        </c:if>


        <div class="form-group">
            <label class="col-sm-2 control-label">排序编号</label>
            <div class="col-sm-3">
                <input type="text" name="sort" id="sort" class="form-control" value="${frontContent.sort}"/>
                <span id="sortError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">定时发布</label>
            <div class="col-sm-3">
                <input type="text" class="Wdate" id="publicTime" name="publicTime" style="width: 180px;height: 30px;"
                       onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${frontContent.publicTimeStr}"/>
                <span id="publicTimeError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group" style="margin-top:15px;">
            <label class="col-sm-2 control-label">是否置顶</label>
            <div class="col-sm-3">
                <select name="isTop" id="isTop" class="form-control" >
                    <option value="">请选择</option>
                    <option value="1"  <c:if test="${frontContent.isTop==1}">selected</c:if>>置顶</option>
                    <option value="0" <c:if test="${frontContent.isTop==0}">selected</c:if>>不置顶</option>
                </select>
                <span id="isTopError" style="color:red"></span>
            </div>
        </div>

        <div class="form-group" style="margin-top:15px;">
            <label class="col-sm-2 control-label">是否前端展示</label>
            <div class="col-sm-3">
                <select name="isShow" id="isShow" class="form-control" value="${frontContent.isShow}">
                    <option value="">请选择</option>
                    <option value="1" <c:if test="${frontContent.isShow==1}">selected</c:if>>前端展示</option>
                    <option value="0" <c:if test="${frontContent.isShow==0}">selected</c:if>>前端不展示</option>
                </select>
                <span id="isShowError" style="color:red"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-3">
                <textarea rows="3" class="form-control" name="remark" id="remark" >${frontContent.remark}</textarea>
                <span id="remarkError" style="color:red"></span>
            </div>
        </div>

        <c:if test="${frontType.thumbnailPicSwitch eq 1}">
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-3">
                    <div style=" width:120px; height:120px;"><img id="ImgPr" width="120" height="120" src="${pageContext.request.contextPath}/frontContent/image/${frontContent.thumbnailPic}"/></div>
                </div>
            </div>
            <div class="form-group" style="margin-top:15px; " id="picShow">
                <label class="col-sm-2 control-label">缩略图</label>
                <input type="file" id="imageFile" name="imageFile" value="${frontContent.thumbnailPic}"/>

            </div>
            <c:if test="${frontType.thumbnailTitleSwitch eq 1}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <c:choose>
                            <c:when test="${empty frontType.thumbnailTitle}">
                                缩略图标题
                            </c:when>
                            <c:otherwise>
                                ${frontType.thumbnailTitle}
                            </c:otherwise>

                        </c:choose>
                    </label>
                    <div class="col-sm-3">
                        <input type="text" name="thumbnailTitle" id="thumbnailTitle" class="form-control" value="${frontContent.thumbnailTitle}"/>
                        <span id="thumbnailTitleError" style="color:red"></span>
                    </div>
                </div>
            </c:if>
            <c:if test="${frontType.thumbnailAddressSwitch eq 1}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        <c:choose>
                            <c:when test="${empty frontType.thumbnailAddress}">
                                缩略图链接
                            </c:when>
                            <c:otherwise>
                                ${frontType.thumbnailAddress}
                            </c:otherwise>

                        </c:choose>
                    </label>
                    <div class="col-sm-3">
                        <input type="text" name="thumbnailAddress" id="thumbnailAddress" class="form-control" value="${frontContent.thumbnailAddress}"/>
                        <span id="thumbnailAddressError" style="color:red"></span>
                    </div>
                </div>
            </c:if>
        </c:if>

        <c:if test="${frontType.contentSwitch eq 1}">
            <textarea name="content" id="editor" style="width: 1000px;height:500px;">${frontContent.content}</textarea>
            <span id="contentError" style="color:red"></span>


            <script type="text/javascript">
                //实例化编辑器
                var ue = UE.getEditor('editor', {
                    //这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
                    toolbars: [[
                        'fullscreen', 'source', '|', 'undo', 'redo', '|',
                        'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote',
                        'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                        'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                        'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                        'directionalityltr', 'directionalityrtl', 'indent', '|',
                        'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                        'link', 'unlink', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                        'simpleupload', 'insertimage', 'background', '|',
                        'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
                        'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells',
                        'splittorows', 'splittocols', 'charts', '|', 'help'
                    ]],
                    //关闭字数统计
                    wordCount: false,
                    //关闭elementPath
                    elementPathEnabled: false,
                    //默认的编辑区域高度
                    initialFrameHeight: 300
                    //更多其他参数，请参考ueditor.config.js中的配置项
                });
            </script>

        </c:if>
        <button class="btn btn-default" type="button" onclick="return checkForm()" id="insertButton"
                style="margin-top: 20px;margin-left:200px;">保存
        </button>
        <button class="btn btn-default" type="button"
                onclick="window.location.href='${pageContext.request.contextPath}/admin/frontContent/list';"
                style="margin-top: 20px;margin-left:100px;">返回
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
            typeId: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    }

                }
            },
            sort: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
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
            title: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    },
                    stringLength: {
                        max: 100,
                        message: "长度不能大于100"
                    }
                }
            },

            //是否置顶
            isTop: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    },
                    between: {
                        max: 1,
                        min: 0
                    }
                }
            },
            //是否前端显示
            isShow: {
                validators: {
                    notEmpty: {
                        message: "不能为空"
                    }
                }
            }/* ,
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
            } */
        }
    };
  /*   $(function () {
        $("#form").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#form").data("bootstrapValidator");
    });
    //客户端验证
    function checkForm() {

        //手动触发验证
        bv.validate();
        //给表单字段定义验证规则
        if (bv.isValid()) {
            return true;
        }
    } */
    
    $("#insertButton").click(function(){
   	 $("#form").bootstrapValidator(validate);
        //获取定义好规则的代理对象
        var bv = $("#form").data("bootstrapValidator");
       //手动触发验证
       bv.validate();
       //给表单字段定义验证规则
       if (bv.isValid()) {
       	var action="${pageContext.request.contextPath}/admin/frontContent/updateWithPic";
       	$.post(action,$("#form").serialize(),function(data){
       		if(data.code=="200"){
       			alert(data.msg);
       			window.location.href="${pageContext.request.contextPath}/admin/frontContent/list";
       		}else{
       			alert(data.msg);
       		}
       	});
       	
       }
   });

    $("#typeId").change(function () {
        var typeId=$("#typeId").val();
        var action = "${pageContext.request.contextPath}/admin/frontContent/toAddDetail/"+typeId;
        window.location.href=action;
    })


</script>
</body>
</html>