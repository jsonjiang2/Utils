<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/wdb.tld" prefix="wdb" %>

<table class="table table-hover" id="personList_table">
				<thead>
					<tr class="text-center" style="background: #ccc;">
 						<td>序号</td>
						<td>平台编号</td>
						<td>平台名称</td>
						<td>平台logo</td>
						<td>平台网址</td>
						<td>运营状态</td>
						<%--<td>页面显示</td>--%>
						<td>添加时间</td>
						<td>排位序号</td>
    					<td>操作</td>
  					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pagehelper.list}" var="item" varStatus="status">
						<tr class="text-center">
							<td>${status.index+1}</td>
 							<td>${item.pno}</td>
							<td><span style="color: blue">${item.pname}</span></td>
	 						<td>
	 							<img src="${item.logo}" width="100" height="60" />
	 						</td>
							<td>${item.website}</td>
							<td>
								<c:if test="${item.operatingstatus==1}"><span style="color: blue">正常</span></c:if>
								<c:if test="${item.operatingstatus==2}"><span style="color: blue">停业</span></c:if>
								<c:if test="${item.operatingstatus==3}"><span style="color: blue">有投诉</span></c:if>
								<c:if test="${item.operatingstatus==4}"><span style="color: blue">黑名单</span></c:if>
							</td>
							<td>
								<wdb:formatDate value="${item.addtime}" var="addtime">
								${empty addtime ? '无' : addtime}
							</wdb:formatDate></td>
							<td>
							${empty item.sort? '无':item.sort}
							</td>
   	   						<td>
 	   							<button class="btn btn-default" onclick="loanPlatformInfo.pre_detail('${item.id}')">详情</button>
 	   							<button class="btn btn-default" onclick="loanPlatformInfo.show_setting(this)" data-opid="${item.id}">修改</button>
  	   							<button class="btn btn-default" onclick="loanPlatformInfo.pre_del(this)" data-opid="${item.id}" >删除</button>
   	   						</td>
  						</tr>
 					</c:forEach>
				</tbody>
			</table>
 			<div id="page_div" style="margin-top: 20px;">
				<%@ include file="/WEB-INF/jsp/common/pagehelper.jsp"%>
			</div>