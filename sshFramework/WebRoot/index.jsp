<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<base href="<%=basePath%>">

<%
	//response.sendRedirect("index_initIndex.htm");
%>


<body style="display: block;">

<h2> 
	tthis is my jsp! 
</h2>
<a href="editor.jsp">编辑器</a>
<br />
<a href="userAction!pageByForm.htm">分页</a>
<br />
<br />
ajian 2011.11.22

<%--<tag:formPage pageName="page" formName="aa" scope="request"></tag:formPage>--%>



</body>
</html>