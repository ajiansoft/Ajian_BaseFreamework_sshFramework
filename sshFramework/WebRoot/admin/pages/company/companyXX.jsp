<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>公司信息LOGO</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<script type="text/javascript" src="dwr/interface/dwrHelper.js"></script>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="admin/script/CompanyXX.js"></script>
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
					<div class="business">
						<form id="form" name="form" action="admin/company_upLogoFile.htm" method="post" enctype="multipart/form-data">
							<table width="785" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="35" colspan="3" bgcolor="fcd99c"
										class="caption_text">
										企业LOGO
									</td>
									<td height="35" colspan="3" bgcolor="fcd99c"></td>
								</tr>
								<tr>
									<td width="150" height="40"></td>
									<td width="350" colspan="2">
										<!-- 没有上传LOGO -->
										<c:if test="${empty oneCompany.logo or oneCompany.logo==''}">
											<img id="imgs" src="admin/images/product_03.gif" width="150" height="100" />
										</c:if>
										<!-- 已经上传LOGO -->
										<c:if test="${not empty oneCompany.logo and oneCompany.logo!=''}">
											<img id="imgs" src="${oneCompany.logo }" width="150" height="100" />
										</c:if>
									</td>
								</tr>
								<tr>
									<td width="150" height="40">
										公司LOGO：
									</td>
									<td width="250" colspan="2">
										<input name="logoFile" type="file" id="logoFile" size="40" />
										<!-- 没有上传LOGO -->
										<c:if test="${empty oneCompany.logo or oneCompany.logo==''}">
											<input name="up" type="button" value="上传" onclick="checkSubmit();" />
										</c:if>
										<!-- 已经上传LOGO -->
										<c:if test="${not empty oneCompany.logo and oneCompany.logo!=''}">
											<input name="up" type="button" value="更换Logo" onclick="checkSubmit();" />
											<input name="up" type="button" value="删除logo" onclick="checkRemoveLogo();" />
										</c:if>
										<img src='admin/images/loading.gif' id="statu" style="width:20px;height:20px;display:none;"/>
									</td>
								</tr>
								<tr>
									<td width="150" height="40">
									</td>
									<td width="250" colspan="2">
										Logo图片尺寸：158 * 117px
									</td>
								</tr>
								<tr>
									<td height="70" width="150"></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</form>
					</div>
					<!--说明开始-->
						    <div class="state">
							    <p><b>说明</b>：</p>
							    <p>1、请按规定尺寸上传公司Logo否则会造成显示不清晰。</p>
							    <p>2、没有上传Logo我们将使用默认的Logo。</p>
						    </div> 
						     <!--说明结束-->
				</div>
				<!-- right end -->
			</div>
			<!-- bottom -->
			<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>
	</body>
</html>
