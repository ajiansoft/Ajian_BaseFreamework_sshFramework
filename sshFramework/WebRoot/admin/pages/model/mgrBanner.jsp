<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<tag:base />
		<title>model模块管理</title>
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
				<form name="form" action="admin/model_scanBanner.htm" method="post">
					<div class="nav_right">
						<div class="nav_right_top">
							<p class="nav_right_top_text">
								欢迎使用嗅觉用户中心
							</p>
						</div>
						<div class="masterplate">
						<div class="masterplate_bg">
								<div class="masterplate_menu">
									<ul>
										<li onmouseover="this.className='cli'"
											onmouseout="this.className=''">
											<a href="admin/model_queryModel.htm">全部模版</a>
										</li>
										<li onmouseover="this.className='cli'"
											onmouseout="this.className=''">
											<a href="admin/model_queryModel.htm?mtp=0">免费模版</a>
										</li>
										<li onmouseover="this.className='cli'"
											onmouseout="this.className=''">
											<a href="admin/model_queryModel.htm?mtp=1">收费模版</a>
										</li>
										<li onmouseover="this.className='cli'"
											onmouseout="this.className=''">
											<a href="admin/model_scanBanner.htm">Banner</a>
										</li>
									</ul>
								</div>
							</div>
						<div class="banner_show">
						<c:forEach items="${request.bannerList}" var="bnr">
							<div class="banner_show_list">
								<table width="98%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td colspan="3">
											<img src="models/banner/${bnr.imgUrl }/thum.jpg" width="395" height="105" />
										</td>
									</tr>
									<tr>
										<td height="35" align="center">
											${bnr.title }
										</td>
										<td height="35" align="center">
											<a href="admin/model_previewBanner.htm?bnId=${bnr.id }" target="_blank">预览</a>
										</td>
										<td>
											<a href="admin/model_useBanner.htm?uid=${session.loginUserBean.id}&&bnId=${bnr.id }">使用</a>
										</td>
									</tr>
								</table>

							</div>
							</c:forEach>
							<div class="clear"></div>
						</div>
						<div class="bannerpage">
							<tag:adminPage name="page" formName="form" scope="request"></tag:adminPage>
						</div>
					</div>
					</div>
			</form>
			<!-- right end -->
		</div>
		<!-- bottom -->
		<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>
		<!-- 提示信息 -->
		${request.msgInfo }
	</body>
</html>
