<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>类型列表页</title>
    <%@include file="/WEB-INF/jsp/common/taglib.jsp" %>
    <%@include file="/WEB-INF/jsp/common/public.jsp" %>
    <style>
        .text-center td {
            text-align: center;
            vertical-align: middle !important;
            border: 1px solid #666;
        }
    </style>
</head>
<body style="font-size: 12px; font-family: 微软雅黑">
<div class="container" style="width:80%">
    <div class="row clearfix">
       <%--  <c:if test="${!empty msg}">
            <div id="myAlert" class="alert alert-success in">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                <strong>${msg}</strong>
            </div>
        </c:if> --%>
        <div class="btn-group">
            	<form method="post" action="${pageContext.request.contextPath}/admin/frontContent/list" id="form-select"  class="form-inline">
					<div style="margin-top: 18px;margin-bottom: 10px">
						<div class="form-group">
						选择类型: <select name="typeId" class="form-control" id="typeId">
				                    <option value="">全部</option>
				                    <c:forEach items="${frontTypes}" var="frontType">
				                        <c:choose>
				                            <c:when test="${frontContent.typeId eq frontType.id}">
				                                <option value="${frontType.id}" selected>${frontType.typeName}</option>
				                            </c:when>
				                            <c:otherwise>
				                                <option value="${frontType.id}">${frontType.typeName}</option>
				                            </c:otherwise>
				                        </c:choose>
				
				                    </c:forEach>
			                	</select>
						</div>
						&nbsp;&nbsp;
						<div class="form-group">
							<button class="btn btn-default" style="width: 100px;" type="submit">查询</button>
							<!-- <button type="reset" class="btn btn-default" style="width: 100px;">重置</button> -->
						</div>	
					</div>
				
			</form>
        </div>
        <div class="btn-group" style="float: right;margin-top: 25px;margin-right: 20px">
            <button class="btn btn-default" onclick="toAddPage()">新增</button>

        </div>

        <div class="col-md-12 column">

            <table class="table table-hover" id="personList_table" style="margin-top: 10px;font-size: 12px; font-family: 微软雅黑">
                <thead>
                <tr class="text-center" style="background: #ccc;">
                    <td>序号</td>
                    <td>顺序</td>
                    <td>类型</td>
                    <td>标题</td>
                    <td>副标题</td>
                    <!-- <td>主链接</td>
                    <td>次链接</td> -->
                    <td>内容</td>
                    <td>缩略图</td>
                   <!--  <td>定时发布</td>
                    <td>操作人</td>
                    <td>操作时间</td> -->
                    <td>是否前端显示</td>
                    <td>是否置顶</td>
                    <td>备注</td>
                    <td>操作</td>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pagehelper.list }" var="entity" varStatus="tendsta">
                    <tr class="text-center">
                        <td>${tendsta.count}</td>
                        <td>${entity.sort}</td>
                        <td>
                        	<a style="color: blue;cursor:pointer;" onclick="onclick_typename('${entity.typeId}')">${entity.typeName}</a>
                        </td>
                        <td>
                             <c:choose>
                                <c:when test="${fn:length(entity.title)>10}">
                                    ${fn:substring(entity.title, 0, 10)}...
                                </c:when>
                                <c:otherwise>
                                    ${entity.title}
                                </c:otherwise>
                            </c:choose>
                          
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.subTitle}">
                                    -
                                </c:when>
                                <c:otherwise>
                                    ${entity.subTitle}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.content}">
                                    -
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0);" onclick="lookupMsgcontent('${entity.id}')"
                                       style="color:blue">查看</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${empty entity.thumbnailPic}">
                                    -
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:seePic('${entity.id}')" style="color:blue">查看</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.isShow eq 1}">
                                    <font color="blue">展示</font>
                                </c:when>
                                <c:when test="${entity.isShow eq 0}">
                                    <font color="red">不展示</font>
                                </c:when>
                            </c:choose>

                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${entity.isTop eq 1}">
                                    <font color="blue">置顶</font>
                                </c:when>
                                <c:when test="${entity.isTop eq 0}">
                                    <font color="red">不置顶</font>
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:length(entity.remark)>5}">
                                    ${fn:substring(entity.remark, 0, 5)}...
                                </c:when>
                                <c:otherwise>
                                    ${entity.remark}
                                </c:otherwise>
                            </c:choose>


                        </td>
                        <td>

                            <button class="btn " onclick="toUpdatePage('${entity.id}')">修改</button>
                            <button class="btn " onclick="deleteContent('${entity.id}')">删除</button>
                            <button class="btn " onclick="detailContent('${entity.id}')">详情</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>



            <div id="page_div">
                <%@ include file="../../common/pagehelper.jsp" %>
            </div>
        </div>
    </div>
</div>
<!-- 引入公共的模态框 -->
	<%@ include file="./../../common/modal.jsp"%>

<script>
    //详情页面跳转
    function detailUI(id) {
        var action = "${pageContext.request.contextPath}/admin/frontContent/detail/" + id;
        window.location.href = action;
    }
    //修改页面跳转
    function toUpdatePage(id) {
        var action = "${pageContext.request.contextPath}/admin/frontContent/toUpdate/" + id;
        window.location.href = action;
    }
    //删除内容
    function deleteContent(id) {
        if(confirm("确认删除吗？")){
        var action = "${pageContext.request.contextPath}/admin/frontContent/delete/" + id;
       /*  window.location.href = action; */
        $.post(action,function(data){
        	if(data.code=="200"){
        		alert(data.msg);
        		window.location.href = "${pageContext.request.contextPath}/admin/frontContent/list";
        	}else{
        		alert(data.msg);
        	}
        });
        }
    }
    //总的详情
    function detailContent(id) {
    	   var action = "${pageContext.request.contextPath}/admin/frontContent/detail";
           var param = {
               "id": id
           }
           var callback = function (data) {
               $("#detail-modal-body").html(data);
               $("#detailsModal").modal({
                   backdrop: 'static',
                   keyboard: false
               });
           }
           $.post(action, param, callback);
        
    }
    
    //添加页面跳转
    function toAddPage() {
        var action = "${pageContext.request.contextPath}/admin/frontContent/toAdd";
        window.location.href = action;
    }

    //查看
    function lookupMsgcontent(id) {
        window.location.href = "${pageContext.request.contextPath}/admin/frontContent/lookupMsgcontent/" + id;
    }

    //查看图片
    function seePic(id) {
        var action = "${pageContext.request.contextPath}/admin/frontContent/picShow";
        var param = {
            "id": id
        }
        var callback = function (data) {
            $("#modal-body").html(data);
            $("#Modal").modal({
                backdrop: 'static',
                keyboard: false
            });
        }
        $.post(action, param, callback);
    }

    $(function () {
        setTimeout(function(){
            $("#myAlert").alert('close');
        },2000);
    });
  
	//点击类型的时候
	function onclick_typename(typeId){
		$("#typeId").val(typeId);
		$("#form-select").submit();
	}

    
</script>
<!-- 模态框 -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog"
     aria-labelledby="delModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="delModalLabel">
                    <span class="glyphicon glyphicon-info-sign"></span>缩略图：
                </h4>
            </div>
            <div id="modal-body" class="modal-body"></div>
            <input type="hidden" id="crud"/>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="operate()" id="crudType">
                    操作
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
