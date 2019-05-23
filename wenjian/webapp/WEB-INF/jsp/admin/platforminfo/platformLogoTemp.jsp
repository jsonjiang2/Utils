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
        <td>logo1</td>
        <td>logo2</td>
        <td>运营状态</td>
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
                <a target="_blank" href="${fdfsurl}${item.logo1}">
                    <img src="${fdfsurl}${item.logo2}" alt="" height="60px" width="60px" />
                </a>
            </td>
            <td>
                <a target="_blank" href="${fdfsurl}${item.logo2}">
                    <img src="${fdfsurl}${item.logo2}" alt="" height="60px" width="60px" />
                </a>
            </td>

            <td>
                <a onclick="querystatus('${item.operatingstatus}')" style="cursor:pointer;color: blue">
                    <c:if test="${empty item.operatingstatus}">---</c:if>
                    <c:if test="${item.operatingstatus==1}">正常</c:if>
                    <c:if test="${item.operatingstatus==2}">跑路</c:if>
                    <c:if test="${item.operatingstatus==3}">清盘</c:if>
                    <c:if test="${item.operatingstatus==4}">高风险</c:if>
                    <c:if test="${item.operatingstatus==5}">有争议</c:if>
                    <c:if test="${item.operatingstatus==6}">延期兑付</c:if>
                    <c:if test="${item.operatingstatus==7}">停业</c:if>
                    <c:if test="${item.operatingstatus==8}">经侦介入</c:if>
                    <c:if test="${item.operatingstatus==9}">提现困难</c:if>
                </a>
            </td>
            <td>
                 <button class="btn btn-default" onclick="upd('${item.id}')">替换</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<button class="btn btn-default" onclick="delBatch()">批量替换</button>

<script type="text/javascript">

    function checkDelAll(){
        var all = document.getElementById('allDel');
        var one = document.getElementsByName('checkDelName');
        for(var i=0;i<one.length;i++){
            one[i].checked = all.checked;
        }
    }
    function delBatch(){
        var number = "";
        $("input:checkbox[name=checkDelName]:checked").each(function(k){
            if(k == 0){
                number = $(this).val();
            }else{
                number += ","+$(this).val();
            }
        });
        if(isEmpty(number)){
            alert("请至少选择一行数据！");
            return ;
        }
        var qr = confirm("您确定要替换这些数据吗？");
        if(!qr){
            return ;
        }
        var url = basePath+"/admin/platformInfo/updMany";
        var callback = function(data){
            alert(data.meta.message);
            // window.location.href = basePath+"/admin/platformInfo/logoList";
        }
        $.post(url,{"ids":number},callback);
    }

    function upd(id){
        if(confirm("确认替换吗？")){
            var action ="/admin/platformInfo/upd/"+id;//这个control对应的连接在哪儿？
            var pageNum = $(".active").find("a").text().toString();  // 获取选中的页码值(当前页页码)
            // alert("pageNum="+pageNum);
            var dataObj = {};
            dataObj["pageNum"] = pageNum;
            // $.post(action,dataObj, function(data){  //
            //     alert(data.meta.message);
            //     window.location.href = basePath+"/admin/platformInfo/logoList";
            // });
            var callback = function (data) {
                // alert(data.data);   // 分页页码
                alert(data.meta.message);
                // var action = basePath+"/admin/platformInfo/logoList";
                // var dataObj = {};
                // dataObj["pageNum"] = data.data;
                // $.post(action,dataObj, function(data){  //
                //
                // });
            }
            $.post(action, dataObj, callback);
        }
    }

</script>
<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
</div>