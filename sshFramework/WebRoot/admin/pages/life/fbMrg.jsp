<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>管理您的信息</title>
		<link rel="stylesheet" type="text/css"
			href="admin/pages/style/customersystem.css" />
		<script type="text/javascript" src="admin/script/common.js"></script>
		<script type="text/javascript" src="admin/pages/life/js/fbMrg.js"></script>
	</head>

	<body>
		<div class="layout">
			<!-- top -->
			<%@include file="../comm/top.jsp"%>
			<!-- middle -->
			<div class="nav_layout">
				<!-- menu -->
				<%@include file="../comm/menu.jsp"%>
				<!-- right -->

				<div class="nav_righta">
					<div class="nav_righta_top">
						<p class="nav_right_topa_text">
							欢迎使用嗅觉用户中心
						</p>
					</div>
					<form id="form" name="form" action="lifeshow_initUserLifeinfo.htm"
						method="post">
						<div class="nav_centera">
							<table width="791" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="30">
										<a href="javascript: void(0)">用户发布信息管理</a>
									</td>
									<td height="30">
										<span class="STYLE2" style="margin-left: 50px; font-weight: bold;">状态</span>
										<select id="sel" name="status" onchange="change()" style="width: 100px;">
											<c:if test="${status == 0}">
												<option value="2">
													全部
												</option>
												<option value="0" selected="selected">
													审核中
												</option>
												<option value="1">
													已审核
												</option>
											</c:if>

											<c:if test="${status == 1}">
												<option value="2">
													全部
												</option>
												<option value="0">
													审核中
												</option>
												<option value="1" selected="selected">
													已审核
												</option>
											</c:if>

											<c:if test="${status == 2}">
												<option value="2" selected="selected">
													全部
												</option>
												<option value="0">
													审核中
												</option>
												<option value="1">
													已审核
												</option>
											</c:if>
										</select>
									</td>
									<td width="70" align="center">
										<label>
											<a href="lifeshow_initAddLifeinfo.htm">发布信息</a>
										</label>
									</td>
								</tr>
							</table>
						</div>


						<table width="791" border="0" align="center" cellpadding="0"
							cellspacing="0" class="management_table">
							<tr class="management_tr1">
								<td height="25">
									信息名称
								</td>

								<td>
									状态
								</td>
								<td>
									时间
								</td>
								<td width="150">
									操作
								</td>
							</tr>

							<c:forEach items="${lifeInfoList}" var="info">
								<tr>
									<td height="80" class="management_tra2">
										${info.lifeInfoTitle}
									</td>
									<c:if test="${info.status == 0}">
										<td class="management_tra2">
											审核中...
										</td>
									</c:if>
									<c:if test="${info.status == 1}">
										<td class="management_tra2">
											已审核
										</td>
									</c:if>
									<td class="management_tra2">
										<fmt:formatDate value="${info.publishTime}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td width="180" class="management_tra2">
										<a
											href="lifeshow_initModifyFb.htm?lifeinfo.lifeInfoId=${info.lifeInfoId}">
											<img src="admin/images/input_05.gif" /> </a>
										<a
											href="javascript:valDel('lifeshow_removeLifeinfo.htm?lifeinfo.lifeInfoId=${info.lifeInfoId}&lifeinfo.image=${info.image}')">
											<img src="admin/images/input_07.gif" /> </a>
									</td>
								</tr>
							</c:forEach>
						</table>
						<!------列表结束--->
						<!------产品列表结束--->
						<div style="text-align: right">
							<tag:managerPage name="page" formName="form" scope="request"></tag:managerPage>
						</div>
						<!-----分页结束----->
					</form>
				</div>
			</div>
			<!-- bottom -->
			<%@include file="../comm/bottom.jsp"%>
		</div>
	</body>
</html>
