<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>相册管理</title>
		<link rel="stylesheet" type="text/css"
			href="admin/style/customersystem.css" />
		<script type="text/javascript" src="admin/script/common.js"></script>
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
				<form name="form" action="admin/photo_queryPhoto.htm" method="post">
					<div class="nav_right">
						<div class="nav_right_top">
							<p class="nav_right_top_text">
								欢迎使用嗅觉用户中心
							</p>
						</div>
						<div class="nav_center">
							<table width="791" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="30">
										相册信息列表
									</td>
									<td align="right">
										<input type="button" name="button" id="button" value="新增相片" onclick="location.href='admin/photo_initEditPhoto.htm'" />
									</td>
								</tr>
							</table>
						</div>
						<c:if test="${empty request.photoList}"><center>当前没有照片信息！</center></c:if>
						<c:if test="${not empty request.photoList}">
							<table width="791" border="0" align="center" cellpadding="0"
								cellspacing="0" class="management_table">
								<tr class="management_tr">
									<td>
										编号
									</td>
									<td width="140">
										照片样图
									</td>
									<td height="25">
										照片名称
									</td>
									<td>
										上传时间
									</td>
									<td width="150">
										操作
									</td>
								</tr>
								<c:forEach items="${request.photoList}" var="photo"
									varStatus="count">
									<tr>
										<td class="management_tr1">
											${count.index+1}
										</td>
										<td class="management_tr1">
											<img src="${photo.minImage}" width="101"
												height="68" />
										</td>
										<td height="80" class="management_tr1">
											${photo.title}
										</td>

										<td class="management_tr1">
											<fmt:formatDate value="${photo.publishTime}"
												pattern="yyyy-MM-dd" />
										</td>

										<td width="180" class="management_tr1">
											<a
												href="admin/photo_initEditPhoto.htm?pid=${photo.photoId}">
												<img src="admin/images/input_05.gif" /> </a>
											<a
												href="javascript:valDel('admin/photo_removePhoto.htm?pid=${photo.photoId}')">
												<img src="admin/images/input_07.gif" /> </a>
										</td>
									</tr>
								</c:forEach>
							</table>
							<!------列表结束--->
							<!------产品列表结束--->
							<div class="list_page" align="right">
								<tag:adminPage name="page" formName="form" scope="request"></tag:adminPage>
							</div>
							<!-----分页结束----->
						</c:if>
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
