<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<script type="text/javascript" src="admin/script/common.js"></script>
	</head>
	<body>
		<form action="" method="post" name="pageForm">
			<table border="1">
				<tr>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
				</tr>
				<c:forEach items="${requestScope.userList }" var="user">
					<tr>
						<td>${user.userName }</td>
						<td>${user.userSex }</td>
						<td>${user.userAge }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2">
						<tag:adminPage name="page" formName="pageForm" scope="request"></tag:adminPage>
					</td>
				</tr>
			</table>
			<!-- 分页开始-->
			<div>
			</div>	
		</form>
	</body>
</html>

