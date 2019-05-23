<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.ganjiangps.wangdaibus.common.util.DateUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover" id="personList_table">
    <thead>
    <tr class="text-center" style="background: #ccc;">
        <td>
            <input type="checkbox" id="allDel" class="myCheck" onclick="checkDelAll()">
        </td>
        <td>序号</td>
        <td>平台编号</td>
        <td>平台名称</td>
        <td>认领账号</td>
        <td>认领人</td>
        <td>手机</td>
        <td>微信</td>
        <td>识别图</td>
        <td>认领时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pagehelper.list}" var="item" varStatus="status">
        <tr class="text-center">
            <td>
                <input type="checkbox" name="checkDelName" class="myCheck" value="${item.id}">
            </td>
            <td>${status.index+1}</td>
            <td>${item.pno}</td>
            <td>
                <a onclick="querypname('${item.pname}')" style="cursor:pointer;color: blue">${item.pname}</a>
            </td>
            <td>
                ${item.claimaccount}
            </td>
            <td>
                ${item.claimname}
            </td>
            <td>
                ${item.claimmobile}
            </td>
            <td>
                ${item.claimwechat}
            </td>
            <td>
                <a target="_blank" href="${fdfsurl}${item.claimphoto}">
                    <img src="${fdfsurl}${item.claimphoto}" height="60px" width="60px" />
                </a>
            </td>
            <td>
                ${empty item.claimdate ? '':dateUtils.formatDate(item.claimdate)}
            </td>
            <td>                                                           <!--字符串必须要引起来-->
                <button class="btn btn-default" onclick="auditUI(${item.id},'${item.pno}')">审核</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script type="text/javascript">

    // 审核
    function auditUI(id,pno) {
        $("#id").attr("value",id);
        $("#pno").attr("value",pno);
        $("#platformClaimAuditModal").modal({   // 打开审核窗口
        });
    }

    $(function() {
        $(".p-content").each(function() {
            var content = $(this).html().trim();
            if (content.length > 8) {
                $(this).html(content.substr(0, 8) + "...");
            }
        })
        $(".p-content").tzTip();
    });

</script>

<!-- 审核 模态框 -->
<div class="modal fade" id="platformClaimAuditModal" tabindex="-1" role="dialog"
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
                    <input type="hidden" name="pno" id="pno" value=""/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label laber_from" for="status">审核是否通过</label>
                        <div class="col-sm-3">
                            <select name="status" id="status" class="form-control">
                                <option value="3" >通过</option>
                                <option value="4" >不通过</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label laber_from" for="claimremark">审核备注</label>
                        <div class="col-sm-3">
                            <input type="text" name="claimremark" id="claimremark" class="form-control" />
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

    $("#btn-update").click(function(){
        var action = "/admin/platformClaim/audit";
        $.post(action,$("#platform_auditForm").serialize(),function(data){   // 传表单数据
            alert(data.meta.message);
            window.location.href="${pageContext.request.contextPath}/admin/platformClaim/auditList";
        });
    });

</script>


<div id="page_div" style="margin-top: 20px;">
    <%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div>