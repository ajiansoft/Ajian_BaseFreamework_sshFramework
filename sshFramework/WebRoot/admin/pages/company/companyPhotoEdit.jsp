<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>公司相册编辑</title>
		<link rel="stylesheet" type="text/css"
			href="admin/style/customersystem.css" />
		<script type="text/javascript" src="dwr/interface/dwrHelper.js"></script>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="admin/script/companyPhoto.js"></script>
		<script type="text/JavaScript" src="script/funCheck.js"></script>
	</head>
	<body>
		<div class="layout">
			<!-- top -->
			<jsp:include page="../comm/top.jsp"></jsp:include>
			<!-- middle -->
			<div class="nav_layout">
				<!-- menu -->
				<jsp:include page="../comm/menu.jsp"></jsp:include>
				<!---------right--------->
				<div class="nav_rightc">
					<div class="nav_rightc_top">
						<p class="nav_rightc_top_text">
							欢迎使用嗅觉用户中心
						</p>
					</div>

					<div class="business">
						<form id="form" name="form" action="admin/photo_upfile.htm" method="post" enctype="multipart/form-data">
						<input name="photo.photoId" type="hidden" value="${photo.photoId}"/>
						<input name="photo.hot" type="hidden" value="${photo.hot}"/>
						<input id="image" name="photo.image" type="hidden" value="${photo.image}"/>
						<input name="photo.minImage" type="hidden" value="${photo.minImage}"/>
						<input name="photo.modifyTime" type="hidden" value="${photo.modifyTime}"/>
							<table width="785" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="35" colspan="4" bgcolor="#fcd99c" class="caption_text">
										企业相册
									</td>
								</tr>
								<tr>
									<td width="150" height="40">
										相片标题：
									</td>
									<td width="350" colspan="2">
										<input id="title" name="photo.title" type="text" value="${photo.title}" style="width: 270px"/>
									</td>
									<td rowspan="3" align="center">
											<!-- 没有图片则显示默认预览 -->
										<c:if test="${empty photo.image or photo.image==''}">
											<img id="imgs" src="admin/images/product_03.gif" width="233" height="179"  />
										</c:if>
										<c:if test="${not empty photo.image and photo.image!=''}">
											<img id="imgs" src="${photo.image}"width="233" height="179"  />
										</c:if>
									</td>
								</tr>
								<tr>
									<c:if test="${empty photo.image or photo.image==''}">
										<td width="150" height="40">
											公司相册：
										</td>
										<td width="250" colspan="2">
											<input name="file" type="file" id="fileId" size="30" />
											<input name="up" type="button" value="上传" onclick="checkSubmit();" />	
										</td>
									</c:if>
								</tr>
								<tr>
									<td width="150" height="40">
										相册说明：
									</td>
									<td width="350" colspan="2">
										<label>
											<textarea id="txt" name="photo.text" style="width: 300px; height: 150px;">
												${photo.text}
											</textarea>
										</label>
									</td>
								</tr>
								<tr>
									<td colspan="4" align="center">
										<input style="background-image: url('admin/images/qyxx_15.gif'); width:62px; height:30px; border: 0px; cursor: pointer;" name="button1" type="button"  onclick="return yz()"/>
										<input style="background-image: url('admin/images/qyxx_18.gif'); width:62px; height:30px; border: 0px; cursor: pointer;" name="button2" type="button"  onclick="history.go(-1)"/>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<!-- bottom -->
				<jsp:include page="../comm/bottom.jsp"></jsp:include>
			</div>
		</div>
	</body>
</html>
