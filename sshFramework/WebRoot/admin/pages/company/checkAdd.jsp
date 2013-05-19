<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base></tag:base>
		<title>企业网站审核</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
	</head>
	<body>
		<div class="layout">
			<!-- top -->
			<jsp:include page="../comm/top.jsp"></jsp:include>
			<!-- middle -->
			<div class="nav_layout">
				<!-- menu -->
				<jsp:include page="../comm/menu.jsp"></jsp:include>
				<!-- right -->
				<div class="nav_right">
					<div class="nav_right_top">
						<p class="nav_right_top_text">
							欢迎使用嗅觉用户中心
						</p>
					</div>
					<div class="business_sh">
						<!-- 开通的企业网站 -->
						<c:if test="${session.currentCompany.isLinksite==0}">
							<h4>您开通的网站正在审核中...</h4>
							<div class="business_sh_text">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											恭喜您企业网站开通成功！您的企业网站正在审核！要审核通过之后才可以在企业查询中搜索出来! 我们将在24小时内审核您的网站。
											<br />
											请选择左侧菜单编辑网站数据!
											<a href="user_initSiteIndex.htm" style="color:red;font-size:15px">用户中心首页</a>
										</td>
									</tr>
									<tr>
										<td height="60" align="center">
										</td>
									</tr>
								</table>
							</div>
						</c:if>
						<!-- 链接企业网站 -->
						<c:if test="${session.currentCompany.isLinksite!=0}">
							<h4>您的链接网站正在审核！要审核通过之后才可以在首页搜索出来！</h4>
							<div class="business_sh_text">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											恭喜您链接网站成功！您链接的网站正在审核！要审核通过之后才可以在企业查询中搜索出来！我们将在24小时内审核您的网站。
										</td>
									</tr>
									<tr >
										<td height="60">
											<a href="user_initSiteIndex.htm" style="color:red;font-size:15px">用户中心首页</a>
											<!-- <a href="admin/company_initLinkCompanySite.htm?company.cmpId=${session.currentCompany.cmpId}" style="color:red;font-size:15px">编辑链接网站</a> -->
										</td>
									</tr>
								</table>
							</div>
						</c:if>
					</div>
					<!--审核结束-->
				</div>
				<!-- right end -->
			</div>
			<!-- bottom -->
			<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>
	</body>
</html>
