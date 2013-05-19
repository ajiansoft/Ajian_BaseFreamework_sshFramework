<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<tag:base />
		<title>model模块管理</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<script language="javascript" src="admin/pages/model/js/mgrModel.js"></script>
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
				<form name="form" action="admin/model_queryModel.htm?mtp=${request.mtp }" method="post">
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
							<div id="masterplate_content">
								<ul>
									<li>
										<c:forEach items="${request.modelDtoList}" var="mDto">
											<div class="masterplate_content_model">
												<img src="models/styles/${mDto.modelCss }/images/thum.jpg" width="230" height="208" />
												名称：${mDto.modelName } 主题:${mDto.modelThemeName}
												<c:if test="${mDto.modelType==0 }">
												 免费
												</c:if>
												<c:if test="${mDto.modelType==1 }">
												 收费
												</c:if>
												<div class="masterplate_content_model_text">
													<a href="site_initIndex.htm?siteId=${session.siteId}&pre=1&mid=${mDto.id}&showType=${showType }" target="_blank">预览</a>|
													<a href="admin/model_useModel.htm?siteId=${session.siteId}&model.id=${mDto.id }&mtp=${mtp }&showType=${showType }">使用</a>
												</div>
											</div>
										</c:forEach>
									</li>
								</ul>
							</div>
							<div align="right">
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
