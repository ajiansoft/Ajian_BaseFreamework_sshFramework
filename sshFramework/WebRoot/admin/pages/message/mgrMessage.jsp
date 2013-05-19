<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<tag:base />
		<title>留言信息管理</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<script type="text/javascript" src="admin/script/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="admin/script/common.js"></script>
	</head>
	<body>
		<div class="layout">
			<!-- top -->
			<%@include file="../comm/top.jsp" %>
			<!-- middle -->
			<div class="nav_layout">
				<!-- menu -->
				
				<jsp:include page="../comm/menu.jsp"></jsp:include>
				<!-- right -->
				<form name="form" action="admin/message_scanMessage.htm" method="post">
					<div class="nav_right">
						<div class="nav_right_top">
							<p class="nav_right_top_text">
								欢迎使用嗅觉用户中心
							</p>
						</div>
						<div class="nav_center">
							<table width="792" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="30">
										留言信息列表
									</td>
								</tr>
							</table>
						</div>
						<c:if test="${empty requestScope.messageList}">
							<div class="book_layout">
								<div class="book" style="text-align:center;line-height:28px">
									<b>暂时没有留言信息。</b>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty requestScope.messageList}" >
							<div class="book">
								<c:forEach items="${requestScope.messageList}" var="msg" varStatus="count" >
									<div class="book_head">
										<div style="width:350px;display:inline-block;">主题：<a href="javascript:showMessage(${count.index+1})" title="点击查看"><b>${msg.title}</b></a></div>
										<div style="width:100px;display:inline-block;">留言人：${msg.msgUserName==null || msg.msgUserName==''?'匿名':msg.msgUserName}</div>
										<div style="width:200px;display:inline-block;">Email: ${msg.emali==null || msg.emali ==''?'无':msg.emali}</div>
										<a href="javascript:showMessage(${count.index+1})">查看留言</a>
										<a href="javascript:valDel('message_removeMessage.htm?message.msgId=${msg.msgId }')">删除留言</a>
									</div>
									<div class="book_content" id="${count.index+1}" >
										<p><s:property value="msg.text"/></p><!-- ${msg.text} -->
										
										<div align="right">
											<a href="javascript:hideMessage(${count.index+1})" style="maring-right:10px;">收起留言</a>
										</div>
									</div>
								</c:forEach>
								<!-- 翻页开始 -->
								<div class="list_page" align="right">
									<tag:adminPage name="page" formName="form" scope="request"></tag:adminPage>
								</div>
								<!-- 翻页结束 -->
							</div>
						</c:if>
						<!--说明开始-->
				    <div class="state">
					    <p><b>说明</b>：</p>
					    <p>1、删除：删除选中留言信息。</p>
				    </div> 
				    <!--说明结束-->		
					</div>
				</form>
				<!-- right end -->
			</div>
			<!-- bottom -->
			<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>
		<!-- 提示信息${request.msgInfo } -->
		<s:property value="request.msgInfo"/>
	</body>
</html>