<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>友情链接编辑页面</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<script type="text/javascript" src="script/funCheck.js"></script>
		<script type="text/javascript" src="admin/script/common.js"></script>
		<script type="text/javascript" src="admin/script/editFriendSite.js"></script>
	</head>	
	<body>
		${request.msgInfo }
		<div class="layout">
			<!-- top -->
			<jsp:include page="../comm/top.jsp"></jsp:include>
			<!-- middle -->
			<div class="nav_layout">
				<!-- menu -->
				<jsp:include page="../comm/menu.jsp"></jsp:include>
				<!-- right -->
				<form id="form" action="" method="post" enctype="multipart/form-data">
			<div class="nav_right">
				<div class="nav_right_top">
					<p class="nav_right_top_text">欢迎使用嗅觉用户中心</p>
				</div>
				<div class="nav_center">编辑友情链接</div>
				<div class="interlinkage">
					<table width="780" border="0"cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td width="140" height="40">站点名称：(*)</td>
							<td colspan="2">
								<input type="text" name="friendsite.siteTitle" id="txtSiteTitle" value="${friendsite.siteTitle}" maxlength="20" size="40"/>
							</td>
						</tr>
						<tr>
							<td height="40">站点图标：</td>
							<td colspan="2">
								<script type="text/javascript">
									if((/.+\.+(jpg|gif|bmp|png)$/).test("${friendsite.siteImgUrl}")){
										document.write("<img src='${friendsite.siteImgUrl}' width='150' height='60' id='showImg'/>");
									}else{
										document.write("<img src='admin/images/friendSiteDefaultLogo.gif' width='150' height='60' id='showImg'/>");
									}
								</script>
								&nbsp;&nbsp;&nbsp;
								<input type="hidden" name="friendsite.siteImgUrl" id="showImgPath" value="${friendsite.siteImgUrl}"/>
								<link rel="stylesheet" href="admin/script/ymPrompt/skin/vista/ymPrompt.css" type="text/css"></link>
								<script type="text/javascript" src="admin/script/ymPrompt/ymPrompt.js"></script>
								<input type="button" value="上传" onclick="ymPrompt.win('admin/pages/comm/upload.jsp',500,500,'图片上传',null,null,null,{iframe:true,id:'a',showShadow:true,useSlide:true,useSlide:true,maskAlpha:0.9})" />
										
							</td>	
						</tr>	
						<!-- 
						<c:if test="${not empty friendsite.siteImgUrl and friendsite.siteImgUrl!=''}">
							<tr>
								<td height="40">站点图标：</td>
								<td colspan="2">
									<img src="${friendsite.siteImgUrl}" width="150" height="60"/>&nbsp;&nbsp;&nbsp;
									<input type="button" name="upfile" value="上传"  onclick="upform()" />
								</td>	
							</tr>	
						</c:if>
						
						<c:if test="${empty friendsite.siteImgUrl or friendsite.siteImgUrl==''}">
							<tr>
								<td height="40" >文件</td>
								<td colspan="2">
									<input type="file" name="file" id="upFile" />
									<input type="button" name="upfile" value="上传"  onclick="upform()" />
									图片尺寸：150*60px
								</td>					
							</tr>
						</c:if>
						 -->
						<tr>
							<td height="40">链接地址：</td>
							<td colspan="2">
								<input type="text" size="40" name="friendsite.siteUrl" id="txtSiteUrl" maxlength="255" value="${friendsite.siteUrl}" onblur="checkUrl(this);"/>&nbsp;&nbsp;&nbsp;&nbsp;
								格式：http://www.ssmell.com
								<input type="hidden" name="friendsite.compInfo.cmpId" value="${friendsite.compInfo.cmpId}" />
								<input type="hidden" name="friendsite.siteId" value="${friendsite.siteId}" />
								<input type="hidden" name="friendsite.publishTime" value="${friendsite.publishTime}" />
								<input type="hidden" name="friendsite.modifyTime" value="${friendsite.modifyTime}" />
							</td>									
						</tr>	
						<tr>
							<td colspan="3">
								<input style="background-image: url('admin/images/qyxx_15.gif'); width:62px; height:30px; border: 0px; cursor: pointer;" name="button1" type="button"  onclick="checkSubmit()"/>
								<input style="background-image: url('admin/images/qyxx_18.gif'); width:62px; height:30px; border: 0px; cursor: pointer;" name="button2" type="button"  onclick="history.go(-1)"/>
							</td>
						</tr>
					</table>
					<!--说明开始-->
				    <div class="state">
					    <p><b>说明</b>：</p>
					    <p>1、上传友情链接图片请按照指定的尺寸上传，否则显示会不清晰。</p>
					    <p>2、友情链接网站地址请按照指定的格式输入，否则会造成打不开您链接的网站。</p>
				    </div> 
				     <!--说明结束-->
				</div>
			</div>
		</form>		
				
			</div>
			<!-- bottom -->
			<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>
	</body>
</html>
