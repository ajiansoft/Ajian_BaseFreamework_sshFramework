<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<script type="text/javascript" src="kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="script/funCheck.js"></script>
		<script type="text/javascript">
			//编辑器
			KE.show({
				id : 'txtContent',
				resizeMode : 1,
				cssPath : './index.css',
				afterCreate : function(id) {
					KE.event.ctrl(document, 13, function() {
						KE.util.setData(id);
						document.forms['example'].submit();
					});
					KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
						KE.util.setData(id);
						document.forms['example'].submit();
					});
				}
			});
		</script>
	</head>
	<body>
		<br><br><br><center>
		<form action="" method="post">
			<textarea id="txtContent" name="news.newsText" cols="100" rows="8" style="width: 700px; height: 300px;"></textarea>
		</form>
		</center>
	</body>
</html>
