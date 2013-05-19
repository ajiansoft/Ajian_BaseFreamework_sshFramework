<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>友情链接管理页面</title>
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
				<div class="nav_right">
					<div class="nav_right_top">
						<p class="nav_right_top_text">
							欢迎使用嗅觉用户中心
						</p>
					</div>
					<div class="nav_center">
						<table width="792" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="30">
									友情链接列表
								</td>
								<td align="right">
									<input type="button" value="新增友情链接"
										onclick="location.href='admin/friendsite_initEditFriendSite.htm';" />
								</td>
							</tr>
						</table>
					</div>
					<c:if test="${empty request.friendsiteList}">
						<div class="book_layout">
							<div class="book" style="text-align:center;line-height:28px">
								<b>暂时还没有友情链接信息。</b>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty request.friendsiteList}">
						<div class="blogroll">
						<form name="form" action="admin/friendsite_qureyFriendSite.htm" method="post">
							<table width="791" border="0" cellspacing="0" cellpadding="0"
								align="center">
								<tr>
									<td width="40" height="35" class="blogroll_text" align="center">
										编号
									</td>
									<td height="35" class="blogroll_text" align="center">
										链接图标
									</td>
									<td height="35" class="blogroll_text" align="center">
										链接名字
									</td>
									<td height="35" class="blogroll_text" align="center">
										链接网址
									</td>
									<td height="35" class="blogroll_text" align="center">
										操作
									</td>
								</tr>
								<c:forEach items="${request.friendsiteList}" var="friend" varStatus="count">
									<tr>
										<td height="35" class="blogroll_border" align="center">
											${count.index +1}
										</td>
										<td height="35" class="blogroll_border">
											<a href="${friend.siteUrl}" target="_blank">
												<img src="${friend.siteImgUrl}" width="105" height="33" /></a>
										</td>
										<td height="35" class="blogroll_border" align="center">
											<tag:noHtml htmlStr="${friend.siteTitle}" length="10" endStr="..."></tag:noHtml>
										</td>
										<td height="35" class="blogroll_border" align="center">
											<tag:noHtml htmlStr="${friend.siteUrl}" length="30" endStr="..."></tag:noHtml>
										</td>
										<td height="35" class="blogroll_border" align="center">
											<a
												href="admin/friendsite_initEditFriendSite.htm?friendsite.siteId=${friend.siteId}">
												<img src="admin/images/input_05.gif" /> </a>
											<a
												href="javascript:valDel('admin/friendsite_removeFriendSite.htm?friendsite.siteId=${friend.siteId}')">
												<img src="admin/images/input_07.gif" /> </a>
										</td>
									</tr>
								</c:forEach>
									<tr>
										<td colspan="10">
											<tag:adminPage name="page" formName="form" scope="request"></tag:adminPage>
										</td>										
									</tr>
							</table>
						</form>
						</div>
					</c:if>					
					<!--说明开始-->
				    <div class="state">
					    <p><b>说明</b>：</p>
					    <p>1、新增友情链接：如果您要新增一个友情链接请点此按钮。</p>
					    <p>2、修改：修改选中行友情链接的名称和地址。</p>
					    <p>3、删除：删除选中行友情链接。</p>
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
