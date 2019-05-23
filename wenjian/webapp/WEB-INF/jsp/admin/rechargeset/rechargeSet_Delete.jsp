<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div align="center">
    <form class="form-horizontal" role="form" id="deleteForm">
        <input type="hidden" id="delByid" value="${rechargeSet.id}">
        <span style="font-weight: bold;">
        是否删除---对象名称为：
        <span style="color: red;">
            <label>
                ${rechargeSet.objectname}---${rechargeSet.realname}
            </label>
        </span>
        &nbsp;&nbsp;的充值设置?
    </span>
    </form>
</div>
</body>
</html>