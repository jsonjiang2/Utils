<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>
<html>
<head>
    <title>异常列表</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/jquery/1.11.3/jquery-1.11.3.js"></script>
    <link href="${pageContext.request.contextPath}/static/plugin/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugin/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>
        //复位弹框
        function showResetModal(orderNo) {
            $("#updateModal").modal({
                backdrop: 'static',
                keyboard: false
            });
            $("#orderNo").val(orderNo);

        }

        //复位保存
        function saveResetRecord() {
            $("#szBtn").attr("disabled",true);

            var orderNo=$("#orderNo").val();
            var remark=$("#remark").val().trim();
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/userInExRecord/resetWrongRecord',
                data:{orderNo:orderNo,remark:remark},
                success: function(data){
                    if(data.code == "01"){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }
                    if(data.code == "00"){
                        alert(data.message);
                        $("#szBtn").attr("disabled",false);
                        return false;
                    }
                    if(data.code == "88"){
                        location.reload();
                    }
                }
            })
        }
        
        function showUserWithdResetModal(uworderno){
        	 $("#UserWithdResetModal").modal({
                 backdrop: 'static',
                 keyboard: false
             });
             $("#showUserWithdResetModal_uworderno").val(uworderno);
        }
        
        function UserWithdResetModal(){
        	var uworderno = $("#showUserWithdResetModal_uworderno").val();
        	var remark = $("#showUserWithdResetModal_remark").val();
        	var url = '${pageContext.request.contextPath}/admin/userWithdrawalsResetrecord/resetrecord'
        	var callBack = function(data){

        		if(data.state=="1"){
 	         		location.reload();
        		}else{
        			alert(data.Msg);
        		}
         	}
         	$.post(url,{"uworderno":uworderno,"remark":remark},callBack);
        }
    </script>
</head>
<body>

<p>判断1：和差1判断(${sf.format(checktime)})<br>问题流水号：
    <c:forEach items="${wrongMap.judge1}" var="record">
        <c:if test="${record.judge1 eq 0}">
            <font size="2" color="gray">
                <a href="${pageContext.request.contextPath}/admin/userInExRecord/list?baseid=${record.baseid}">
                    <wdb:getUser uid="${record.baseid}" var="user">
                        ${user.username}-${empty user.realname ? '无':user.realname}
                    </wdb:getUser>
                </a>
            </font>
            <a style="color: red" href="${pageContext.request.contextPath}/admin/userInExRecord/list?orderno=${record.orderno}">${record.orderno}</a>
            <button onclick="showResetModal('${record.orderno}')">复位</button>
            &nbsp;
        </c:if>
    </c:forEach>
    <c:if test="${empty wrongMap.judge1}">
        <font color="blue">无</font>
    </c:if>
</p>
<p>判断2：和差2判断(${sf.format(checktime)})<br>问题流水号：
    <c:forEach items="${wrongMap.judge2}" var="record">
        <c:if test="${record.judge2 eq 0}">
            <font size="2" color="gray">
                <a href="${pageContext.request.contextPath}/admin/userInExRecord/list?baseid=${record.baseid}">
                    <wdb:getUser uid="${record.baseid}" var="user">
                        ${user.username}-${empty user.realname ? '无':user.realname}
                    </wdb:getUser>
                </a>
            </font>
            <a style="color: red" href="${pageContext.request.contextPath}/admin/userInExRecord/list?orderno=${record.orderno}">${record.orderno}</a>
            <button onclick="showResetModal('${record.orderno}')">复位</button>
            &nbsp;
        </c:if>
    </c:forEach>
    <c:if test="${empty wrongMap.judge2}">
        <font color="blue">无</font>
    </c:if>
</p>
<p>判断3：比对判断(${sf.format(checktime)})<br>问题流水号：
    <c:forEach items="${wrongMap.judge3}" var="record">
        <c:if test="${record.judge3 eq 0}">
            <font size="2" color="gray">
                <a href="${pageContext.request.contextPath}/admin/userInExRecord/list?baseid=${record.baseid}">
                    <wdb:getUser uid="${record.baseid}" var="user">
                        ${user.username}-${empty user.realname ? '无':user.realname}
                    </wdb:getUser>
                </a>
            </font>
            <a style="color: red" href="${pageContext.request.contextPath}/admin/userInExRecord/list?orderno=${record.orderno}">${record.orderno}</a>
            <button onclick="showResetModal('${record.orderno}')">复位</button>
                &nbsp;
        </c:if>
    </c:forEach>
    <c:if test="${empty wrongMap.judge3}">
        <font color="blue">无</font>
    </c:if>
</p>
<p>判断4：样式判断(${sf.format(checktime)})<br>问题流水号：
    <c:forEach items="${wrongMap.judge4}" var="record">
        <c:if test="${record.judge4 eq 0}">
            <font size="2" color="gray">
                <a href="${pageContext.request.contextPath}/admin/userInExRecord/list?baseid=${record.baseid}">
                    <wdb:getUser uid="${record.baseid}" var="user">
                        ${user.username}-${empty user.realname ? '无':user.realname}
                    </wdb:getUser>
                </a>
            </font>
            <a style="color: red" href="${pageContext.request.contextPath}/admin/userInExRecord/list?orderno=${record.orderno}">${record.orderno}</a>
            <button onclick="showResetModal('${record.orderno}')">复位</button>
            &nbsp;
        </c:if>
    </c:forEach>
    <c:if test="${empty wrongMap.judge4}">
        <font color="blue">无</font>
    </c:if>
</p>

<c:if test="${not empty UserWithdChecktime}">
    <p>提现异常判断(${sf.format(UserWithdChecktime)})<br>问题流水号：
        <c:forEach items="${lists}" var="record">
            <font size="2" color="gray"><a href="${pageContext.request.contextPath}/admin/userWithdrawalsHistory/lists?baseid=${record.baseid}">${record.username }-${record.realname}</a></font>
            <a style="color: red" href="${pageContext.request.contextPath}/admin/userWithdrawalsHistory/lists?uworderno=${record.uworderno}">${record.uworderno}</a>
            <button onclick="showUserWithdResetModal('${record.uworderno}')">标记为已读</button>
            &nbsp;
        </c:forEach>
        <c:if test="${empty lists}">
            <font color="blue">无</font>
        </c:if>
    </p>
</c:if>
<p>IOS(${count})<br> 
</p>
<p>Android(${ANDROIDCOUNT})<br> 
</p>
<p>PC(${PCCOUNT})<br> 
</p>

<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
     aria-labelledby="editModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="editModalLabel">
                    <span class="glyphicon glyphicon-info-sign"></span>提示：正在进行编辑操作
                </h4>
            </div>
            <div id="update-modal-body" class="modal-body">
                        <input type="hidden" id="orderNo">
                复位备注：
                <textarea class="form-control" type="text" name="remark" id="remark" rows="5">
                </textarea>
            </div>
            <div class="modal-footer">
                <button type="button" id="szBtn" class="btn btn-primary upbtn"
                        onclick="saveResetRecord()">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 编辑 提现复位模态框 start -->
<div class="modal fade" id="UserWithdResetModal" tabindex="-1" role="dialog"
		aria-labelledby="editModalLabelTX">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="editModalLabelTX">
						<span class="glyphicon glyphicon-info-sign"></span>提示：正在进行编辑操作
					</h4>
				</div>
				<div id="update-modal-body_tx" class="modal-body">
				     <input type="hidden" id="showUserWithdResetModal_uworderno">
				     <div class="form-group">
 	                	 <label>已读备注：</label>
	                	 <textarea class="form-control" style="width:380px;max-width:380px;"name="remark" id="showUserWithdResetModal_remark"></textarea>
				     </div>
 				</div>
				<div class="modal-footer">
					<button type="button" id="btn-update" class="btn btn-primary upbtn"
						onclick="UserWithdResetModal()">保存</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
<!-- 编辑 提现复位模态框 end -->

</body>
</html>
