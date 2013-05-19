<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>top</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<script type="text/javascript" src="admin/script/checkRemove.js"></script>
	</head>
	<body>
		<div class="layout">
			<!-- top -->
			<%@include file="../comm/top.jsp" %>
			<!-- middle -->
			<div class="nav_layout">
				<!-- menu -->
				<%@include file="../comm/menu.jsp" %>
				<!-- right -->

				<div class="nav_right">
					<div class="nav_right_top">
						<p class="nav_right_top_text">
							欢迎使用嗅觉用户中心
						</p>
					</div>
					<div class="business_zx">
						<h4>
							您确定注销您的${session.isLink==0?'企业':'链接'}网站吗？
						</h4>
						<div class="business_zx_text">
							<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td colspan="2">
										该操作不可逆转，注销${session.isLink==0?'企业':'链接'}网站将会删除您在本站的所有资料。为了防止误删，请您谨慎操作!
									</td>
								</tr>
								<tr>
									<td width="600">
										<input type="button" name="button" id="button" value="${session.isLink==0?'注销企业网站':'删除链接网站' }" onclick="valLogoOut('admin/company_logoOutCompany.htm?siteId=${session.siteId }');" />
									</td>
									<td align="center">
										<input type="button" name="button2" id="button2" value="返回继续" onclick="history.go(-1)" />
									</td>
								</tr>
							</table><br/>
						</div>
						<div class="text_images">
							<img src="admin/images/20091201569533131.gif" align="right" />
						</div>
					</div>
					<!--结束-->
				</div>
				<!-- right end -->
			</div>
			<!-- bottom -->
			<%@include file="../comm/bottom.jsp" %>
		</div>
	</body>
</html>
