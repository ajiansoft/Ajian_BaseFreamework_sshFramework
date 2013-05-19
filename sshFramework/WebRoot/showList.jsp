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
		<script type="text/javascript" src="script/jquery-1.4.4.min.js"></script>
	</head>
	<body>
		<form action="userAction!pageByForm.action?page.pageIndex=1&i=1" method="post" name="pageForm">
			<table border="1">
				<tr>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
				</tr>
				<c:forEach items="${requestScope.page.pageContent }" var="user">
					<tr>
						<td>${user.userName }</td>
						<td>${user.userSex }</td>
						<td>${user.userAge }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3">
						<!-- 分页开始--> 
						<tag:formPage name="page" formName="pageForm" scope="request"></tag:formPage>
					</td>
				</tr>
			</table>
			<div>
			</div>	
			<input type="submit" value="提交" />
		</form>
		
		<a href="javascript:getData();">getData</a>
		
		<div id="content"></div>
		
		<script type="text/javascript">
			function getData(){
				$.ajax({
					type:"get",
					url:"userAction!pageByForm.htm",
					success:function(txt){
						$("#content").html(txt);
					},
					error:function(){
						alert("error!");
					}
				});
			}
		</script>
	</body>
</html>

