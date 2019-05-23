<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <title>负面重复列表</title>
    <script type="text/javascript">
    </script>

</head>
<body>
<div class="container" style="width: 85%;">
    <div class="row clearfix" id="div1">
        <div style="margin-bottom: 10px;"></div>
        <form method="post" class="form-inline" id="form-select"
              action="repeatList">
            <input type="hidden" id="pageNum" name="pageNum">
            <input type="hidden" id="pageSize" name="pageSize">

        </form>
        <div style="margin-top: 20px;"></div>
        <div id="queryall_list" style="margin-top: 30px;">

            <table class="table table-hover" id="personList_table">
                <thead>
                <tr class="text-center" style="background: #ccc;">   <!--复选框-->
                    <td>
                        <input type="checkbox" id="allDel" class="myCheck" onclick="checkDelAll()">
                    </td>
                    <td>序号</td>
                    <td>平台编号</td>
                    <td>平台名称</td>
                    <td>标题</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${badInfoList}" var="item" varStatus="status">
                    <tr class="text-center">
                        <td>
                            <input type="checkbox" name="checkDelName" class="myCheck" value="${item.id}">
                        </td>
                        <td>${status.index+1}</td>
                        <td>${item.pno}</td>
                        <td>
                            ${item.pname}
                        </td>
                        <td>
                            <a target="_blank" href="${item.badlink}" style="cursor:pointer;color: blue">${item.title}</a>
                        </td>
                        <td>
                            <button class="btn btn-default" onclick="platform_detail(${item.id})">详情</button>
                            <button class="btn btn-default" onclick="del('${item.id}')">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <button class="btn btn-default" onclick="delBatch()">批量删除</button>

            <script type="text/javascript">

                function del(id){
                    if(confirm("确认删除吗？")){
                        var action ="/admin/platformBadInfo/repeatDel/"+id;
                        $.post(action, function(data){
                            alert(data.meta.message);
                            window.location.href="${pageContext.request.contextPath}/admin/platformBadInfo/repeatList";
                        });
                    }
                }

                //Del全选
                function checkDelAll(){
                    var all = document.getElementById('allDel'); //获取到点击全选的那个复选框的id
                    var one = document.getElementsByName('checkDelName'); //获取到复选框的名称
                    //因为获得的是数组，所以要循环 为每一个checked赋值
                    for(var i=0;i<one.length;i++){
                        one[i].checked = all.checked;
                    }
                }
                //批量删除
                function delBatch(){
                    var number = "";
                    $("input:checkbox[name=checkDelName]:checked").each(function(k){
                        if(k == 0){
                            number = $(this).val();
                        }else{
                            number += ","+$(this).val();  // 获取id字符串 "1,2,3..."
                        }
                    });
                    if(isEmpty(number)){
                        alert("请至少选择一行数据！");
                        return ;
                    }
                    var qr = confirm("您确定要这些数据吗？"); // 删除前确认
                    if(!qr){
                        return ;
                    }
                    var url = basePath+"/admin/platformBadInfo/delRepeatMany";
                    var callback = function(data){
                        alert(data.meta.message);
                        window.location.href = basePath+"/admin/platformBadInfo/repeatList";
                    }
                    $.post(url,{"ids":number},callback);  // 执行完url(删除),执行callback
                }

                $(function() {
                    $(".p-content").each(function() {
                        var content = $(this).html().trim();
                        if (content.length > 12) {
                            $(this).html(content.substr(0, 12) + "...");
                        }
                    })
                    $(".p-content").tzTip();
                });

            </script>

            <div id="page_div" style="margin-top: 20px;">
                <%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
            </div>

        </div>
    </div>
</div>
<!-- 引入模态框 -->
<%@ include file="/WEB-INF/jsp/common/modal.jsp"%>
</body>


</html>