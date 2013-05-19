<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>管理新闻类型</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
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

				<form name="form" action="admin/newsType_scanNewsType.htm" method="post">
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
									<td height="30" width="550">
										新闻类型列表<c:if test="${empty request.newsTypeList}">(无)</c:if>
									</td>
									<td align="right">
										<a href="admin/news_scanNews.htm">管理新闻</a>
										<input type="button" value="新增新闻类型" onclick="location.href='admin/newsType_initEditNewsType.htm';" />
									</td>
								</tr>
							</table>
						</div>
						<c:if test="${empty request.newsTypeList}">
							<div class="book_layout">
								<div class="book" style="text-align:center;line-height:28px">
									<b>暂时没有新闻类型信息。</b>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty request.newsTypeList}">
							<div class="blogroll">
								<table width="792" border="0" cellspacing="0" cellpadding="0">
									<tr bgcolor="#e4e4e4">
										<td align="center" class="blogroll_text" width="40"
											height="30">
											编号
										</td>
										<td align="left" class="blogroll_text" width="220" height="30">
											类型名称
										</td>
										<td align="center" class="blogroll_text" width="280"
											height="30">
											发布时间
										</td>
										<td align="center" class="blogroll_text" width="252"
											height="30" colspan="2">
											操作
										</td>
									</tr>		
									<c:forEach items="${request.newsTypeList}" var="type"
										varStatus="count">
										<tr>
											<td align="center" class="blogroll_border" width="40" height="30">
												${count.index+1 }
											</td>
											<td align="center" class="blogroll_border" width="220" height="30">
												${type.newsTypeTitle }
											</td>
											<td align="center" class="blogroll_border" width="280" height="30">
												<fmt:formatDate value="${type.publishTime }" pattern="yyyy-M-d HH:mm:ss" />
											</td>
											<td align="center" class="blogroll_border" width="126" height="30">
												<a href="admin/newsType_initEditNewsType.htm?newsType.newsTypeId=${type.newsTypeId}">
													<img src="admin/images/input_05.gif"></img> 
												</a>
											</td>
											<td align="center" class="blogroll_border" width="126" height="30">
												<a href="javascript:valDel('admin/newsType_removeNewsType.htm?newsType.newsTypeId=${type.newsTypeId}');">
													<img src="admin/images/input_07.gif"></img>
												</a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							</c:if>
						<!--说明开始-->
					    <div class="state">
						    <p><b>说明</b>：</p>
						    <p>1、新增新闻类型：新增新闻类型。</p>
						    <p>2、管理新闻：管理新闻页面。</p>
						    <p>3、修改：修改新闻类型。</p>
						    <p>4、删除：删除新闻类型信息。如果该新闻类型下有新闻信息，请先删除该类型下所有新闻再删除新闻类型。</p>				    
					    </div> 
					     <!--说明结束-->
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
