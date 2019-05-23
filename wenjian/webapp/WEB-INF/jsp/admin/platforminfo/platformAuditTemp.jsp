<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover" id="personList_table">
    <thead>
    <tr class="text-center" style="background: #ccc;">
        <td>
            <input type="checkbox" id="all" class="myCheck" onclick="">
        </td>
        <td>序号</td>
        <td>平台编号</td>
        <td>平台名称</td>
        <td>平台网址</td>
        <td>平台详情</td>
        <td>申报人</td>
        <td>申报时间</td>
        <td>申报人手机号</td>
        <td>审核状态</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pagehelper.list}" var="item" varStatus="status">
        <tr class="text-center">
            <td>
                <input type="checkbox" name="checkname" class="myCheck" value="${item.id}">
            </td>
            <td>${status.index+1}</td>
            <td>${item.pno}</td>
            <td>
                ${item.pname}
            </td>
            <td>
                ${item.website}
            </td>
            <td>
                <button class="btn btn-default" onclick="platform_detail(${item.id})">查看</button>
            </td>
            <td>
                ${item.realname}
            </td>
            <td>${empty item.addtime ? '':dateUtils.formatDate(item.addtime)}</td>
            <td>
                ${item.mobile}
            </td>
            <td>
                <a onclick="queryauditstatus('${item.auditstatus}')" style="cursor:pointer;color: blue">
                    <c:if test="${empty item.auditstatus}">---</c:if>
                    <c:if test="${item.auditstatus==0}">待审核</c:if>
                    <c:if test="${item.auditstatus==1}">审核通过</c:if>
                    <c:if test="${item.auditstatus==2}">审核失败</c:if>
                </a>
            </td>
            <td>
                <c:if test="${item.auditstatus == 0 || item.auditstatus == 2 }">
                    <button class="btn btn-default" onclick="auditUI(${item.id})">审核</button>
                </c:if>
                <button class="btn btn-default" onclick="platformAudit_detail(${item.id})">审核详情</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script type="text/javascript">

    // 平台详情
    function platform_detail(id){
        var action="/admin/platformInfo/detail1/"+id;
        $.post(basePath+action,function(data){
            $("#detailsModal").modal({
                backdrop: 'static',
                keyboard: false
            });
            $("#detail-modal-body").html(data);
        });
    }

    // 平台审核详情
    function platformAudit_detail(pid){
        var action="/admin/platformInfo/getAuditById/"+pid;
        $.post(basePath+action,function(data){
            $("#detailsModal").modal({
                backdrop: 'static',
                keyboard: false
            });
            $("#detail-modal-body").html(data);
        });
    }

    // 审核
    function auditUI(pid) {
        $("#id").attr("value",pid);  // 给平台id赋值 id对应的input要写 id="id" value=""
        $("#platformAuditModal").modal({   // 打开审核窗口
        });
    }
    <%--// 保存审核信息--%>
    <%--function auditSave(){--%>
        <%--var jsonData = $("#platform_auditForm").serialize();--%>
        <%--var params = decodeURIComponent(jsonData,true);--%>
        <%--var action = "/admin/platformInfo/audit";--%>
        <%--$.post(action,params, function(data){--%>
            <%--alert(data.meta.message);--%>
            <%--window.location.href="${pageContext.request.contextPath}/admin/platformInfo/auditList";--%>
        <%--});--%>
    <%--}--%>

</script>

<!-- 审核 模态框 -->
<div class="modal fade" id="platformAuditModal" tabindex="-1" role="dialog"
     aria-labelledby="editModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="editModalLabel">
                    <span class="glyphicon glyphicon-info-sign"></span>提示：正在进行审核操作
                </h4>
            </div>
            <div id="update-modal-body" class="modal-body"></div>
            <div class="container" style="margin-top: 15px;">

                <form class="form-horizontal" role="form" id="platform_auditForm">
                    <input type="hidden" name="id" id="id" value=""/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label laber_from" for="auditstatus">审核是否通过</label>
                        <div class="col-sm-3">
                            <select name="auditstatus" id="auditstatus" class="form-control">
                                <option value="1" >通过</option>
                                <option value="2" >不通过</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label laber_from" for="remark">审核备注</label>
                        <div class="col-sm-3">
                            <input type="text" name="remark" id="remark" class="form-control" />
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btn-update" class="btn btn-primary upbtn"
                        onclick="auditSave()">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var validate = {
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            auditman: {
                validators: {
                    notEmpty: {
                        message: "请输入审核人姓名"
                    }
                }
            }
        }
    };

    $("#btn-update").click(function(){
        $("#platform_auditForm").bootstrapValidator(validate);
        var bv = $("#platform_auditForm").data("bootstrapValidator");
        bv.validate();
        if (bv.isValid()) {
            var action = "/admin/platformInfo/audit";
            $.post(action,$("#platform_auditForm").serialize(),function(data){
                alert(data.meta.message);
                window.location.href="${pageContext.request.contextPath}/admin/platformInfo/auditList";
            });
        }
    });

</script>

<div id="page_div" style="margin-top: 20px;">
    <%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div>
