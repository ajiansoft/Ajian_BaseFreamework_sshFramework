<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>top</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
	</head>
	<body>
		<div class="nav_bg">
			<div class="top_dh_bg">
				<div class="topText">
					<a href="index_initIndex.htm">返回首页</a>|
					<a href="pages/user/login.jsp">重新登录</a>|
					<a href="user_logoOut.htm">注销登录</a>
				</div>
			</div>
			<div class="top_dh_bg1">
				<div class="top_dh_left">
					尊敬的
					<font color="red">${session.loginUserBean.regLogName }</font>，您好！欢迎使用嗅觉用户中心
				    <br /><font class="topText" style="font-weight:lighter;">您的网站总数为：<s:property value="%{#session.loginUserBean.compSet.size()}"/>个</font>
				</div>
			</div>
		</div>
	</body>
</html>
