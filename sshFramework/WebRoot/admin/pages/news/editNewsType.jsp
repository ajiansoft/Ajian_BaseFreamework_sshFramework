<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<tag:base />
		<title>编辑新闻类型</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<script type="text/javascript" src="script/funCheck.js"></script>
		<script type="text/javascript" src="admin/script/editNewsType.js"></script>
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
				<form name="form" action="admin/newsType_editNewsType.htm" method="post"
					onsubmit="return checkSubmit();">
					<div class="nav_right">
						<div class="nav_right_top">
							<p class="nav_right_top_text">
								欢迎使用嗅觉用户中心
							</p>
						</div>
						<div class="business">
							<table width="785" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="30" colspan="1" bgcolor="#fcd99c" class="caption_text">
										编辑新闻类型
									</td>
									<td height="30" colspan="3" bgcolor="#fcd99c" class="caption_text" align="right">
										<a href="admin/newsType_scanNewsType.htm">管理新闻类型</a>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										类型名称：
									</td>
									<td colspan="3">
										<input name="newsType.newsTypeTitle" value="${newsType.newsTypeTitle }" type="text" id="txtNewsTypeTitle" size="20" maxlength="7"/>最多7个字
										<input type="hidden" name="newsType.newsTypeId" value="${newsType.newsTypeId }" />
										<input type="hidden" name="newsType.companyInfo.cmpId" value="${session.siteId }" />
									</td>
								</tr>
								<tr>
									<td height="30"> &nbsp; </td>
									<td>
										<input style="background-image: url('admin/images/qyxx_15.gif'); width:62px; height:30px; border: 0px; cursor: pointer;" name="button1" type="submit" value="" />
										<input style="background-image: url('admin/images/qyxx_18.gif'); width:62px; height:30px; border: 0px; cursor: pointer;" name="button2" type="button"  onclick="history.go(-1)"/>
									</td>
									<td>
										&nbsp;
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
						</div>
				<!--说明开始-->
			    <div class="state">
				    <p><b>说明</b>：</p>
				    <p>1、必须填写新闻名称,且类型名称不要重复。</p>
			    </div> 
			     <!--说明结束-->
					</div>
				</form>
				<!-- right end -->
			</div>
			<!-- bottom -->
			<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>
	</body>
</html>
