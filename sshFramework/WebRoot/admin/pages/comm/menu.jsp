<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>menu</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
	</head>
	<body>
		<div class="nav_left">
			<div class="nav_left_list">
				<ul class="rolinList" id="rolin">
					<li>
						<h2><a href="user_initSiteIndex.htm">用户中心首页</a></h2>
					</li>
					<li>
						<h2>企业中心</h2>
						<div class="content">
							<p>
								<!-- 用户没有网站时 -->
								<s:if test="%{#session.loginUserBean.compSet.size()==0}">
									<a href="admin/company_initOpenCompanySite.htm">点击开通</a>
									<a href="admin/company_initLinkCompanySite.htm">链接已有网站</a>
								</s:if>
								<!-- 用户有网站时 -->
								<s:else>
									<!-- 如果网站没有通过审核 -->
									<s:if test="%{#session.siteId!=null && #session.status==1}">
										<a href="site_initIndex.htm?uid=${session.siteId }&siteId=${session.siteId }&showType=preview" target="_balack">网站预览</a>
										<a href="admin/model_queryModel.htm?">更换模版</a>
									</s:if>
									<!-- 通过审核 -->
									<s:elseif test="%{#session.siteId!=null && #session.status==2}">
										<!-- 开通的网站 -->
										<s:if test="%{#session.isLink==0}">
											<a href="site_initIndex.htm?uid=${session.siteId }&showType=scan" target="_balack">网站预览</a>
											<a href="admin/model_queryModel.htm">更换模版</a>
											<a href="admin/news_scanNews.htm?siteId=${session.siteId }">企业新闻</a>
											<a href="admin/product_scanProduct.htm?siteId=${session.siteId }">产品管理</a>
											<a href="admin/company_initCompanyXX.htm?siteId=${session.siteId }">企业形象</a>
											<a href="admin/photo_queryPhoto.htm?siteId=${session.siteId }">公司相册</a>
											<a href="admin/company_initEditCompany.htm?siteId=${session.siteId }">企业资料</a>
											<a href="admin/friendsite_qureyFriendSite.htm?siteId=${session.siteId }">友情链接</a>
											<a href="admin/message_scanMessage.htm?siteId=${session.siteId }">留言管理</a>
											<a href="admin/pages/company/checkRemove.jsp">注销企业网站</a>
										</s:if>
										<!-- 链接的网站 -->
										<s:if test="%{#session.isLink==1}">
											<a href="admin/company_initLinkCompanySite.htm?company.cmpId=${session.siteId }">编辑链接网站</a>										
											<a href="admin/pages/company/checkRemove.jsp">删除链接网站</a>
										</s:if>
										<!-- 将网站加入嗅觉导航 -->
										<a href="navsite_initEditNavsite.htm?handleType=foreground&siteId=${session.siteId }&op=add" >加入嗅觉导航</a>
										<a href="navsite_initEditNavsite.htm?handleType=foreground&siteId=${session.siteId }&op=update" >修改导航资料</a>
									</s:elseif>
									<!-- 再次开通 -->
									<a href="admin/company_initOpenCompanySite.htm">继续开通</a>
									<a href="admin/company_initLinkCompanySite.htm">继续链接网站</a>
								</s:else>
							</p>
						</div>
					</li>
					<li>
						<h2>
							生活服务
						</h2>
						<div class="content">
							<p>
								<a href="lifeshow_initAddLifeinfo.htm">免费发布信息</a>
								<a href="lifeshow_initUserLifeinfo.htm">管理信息</a>
							</p>
						</div>
					</li>
					<li>
						<h2>基本信息</h2>
						<div class="content">
							<p>
								<a href="admin/pages/user/editPass.jsp">修改密码</a>
							</p>
						</div>
					</li>
					<li>
						<h2>
							增值服务
						</h2>
						<div class="content">
							<p>
								<a href="admin/pages/user/editPass.jsp">域名申请</a>
								<a href="admin/pages/user/editPass.jsp">申请二级域名</a>
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</body>
</html>
