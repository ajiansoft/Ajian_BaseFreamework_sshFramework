<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>公司信息管理</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<script type="text/javascript" src="dwr/interface/dwrHelper.js"></script>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="script/funCheck.js"></script>
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
				<form name="form" action="admin/company_linkCompanySite.htm" method="post" enctype="multipart/form-data">
					<div class="nav_right">
						<div class="nav_right_top">
							<p class="nav_right_top_text">
								欢迎使用嗅觉用户中心
							</p>
						</div>
						<div class="business">
							<table width="785" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="35" colspan="6" bgcolor="#fcd99c"
										class="caption_text">
										公司基本资料(带
										<font color="red">*</font>的是必须填写的项!)
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司名称：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<c:if test="${empty company.cmpId}">
											<input name="company.cpyName" type="text" id="txtCpyName" size="40" maxlength="50" onblur="checkCompName(this.value)" />
											<font color="red" id="errCpyName">注意*：公司名称注册之后不能修改!</font>
										</c:if>
										<c:if test="${not empty company.cmpId}">
											<input type="text" id="txtCpyName"
												value="${company.cpyName }" disabled="disabled" size="40" />
											<input name="company.cpyName" type="hidden" id="txtCpyName"
												value="${company.cpyName }" size="40" />
										</c:if>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										营业执照：
									</td>
									<td colspan="5">
										<input name="company.license" type="text" value="${company.license }" size="40" maxlength="30"  />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司性质：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<select name="company.compType.id" size="1" id="selectCpyType">
											<option value="-1">
												--请选择--
											</option>
											<c:forEach items="${request.companyTypeList}" var="ct">
												<option value="${ct.id }" selected="${company.compType.id==ct.id?'selected':'' }">${ct.title }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										主营产品：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.mainProduct" type="text"
											value="${company.mainProduct }" id="txtMainProduct" size="40" maxlength="30"/>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司规模：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<select name="company.compSize" id="selEmpNumber">
											<option value="-1">--请选择--</option>
											<c:forEach items="${request.companySizeList}" var="cs">
												<c:if test="${company.compSize==cs.id}">
													<option value="${cs.id }" selected>${cs.title }</option>
												</c:if>
												<c:if test="${company.compSize!=cs.id}">
													<option value="${cs.id }">${cs.title }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										所属地区：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<select name="company.cpyProvince" size="1" id="selProvince"
											onchange="loadCity(this.value);">
											<option value="-1">
												--请选择--
											</option>
											<c:forEach items="${request.provinceList}" var="pro">
												<c:if test="${company.cpyProvince == pro.provinceID}">
													<option value="${pro.provinceID }" selected="selected">
														${pro.province }
													</option>
												</c:if>
												<c:if test="${company.cpyProvince != pro.provinceID}">
													<option value="${pro.provinceID }">
														${pro.province }
													</option>
												</c:if>
											</c:forEach>
										</select>
										<select name="company.cpyCity" size="1" id="selCity">
											<option value="-1">
												--请选择--
											</option>
											<c:forEach items="${request.cityList}" var="city">
												<c:if test="${company.cpyCity==city.cityID}">
													<option value="${city.cityID }" selected="selected">
														${city.city }
													</option>
												</c:if>
												<c:if test="${company.cpyCity!=city.cityID}">
													<option value="${city.cityID }">
														${city.city }
													</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										所属行业：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<label>
											<select name="company.bigIndustryId" size="1" id="selBig"
												onchange="loadMinIndustry(this.value);">
												<option value="-1">
													--请选择--
												</option>
												<c:forEach items="${request.bigIndustryList}" var="big">
													<c:if test="${company.bigIndustryId==big.id}">
														<option value="${big.id }" selected="selected">
															${big.bigIndustryName }
														</option>
													</c:if>
													<c:if test="${company.bigIndustryId!=big.id}">
														<option value="${big.id }">
															${big.bigIndustryName }
														</option>
													</c:if>
												</c:forEach>
											</select>
											<select name="company.minIndustryId" size="1" id="selMin">
												<option value="-1">
													--请选择--
												</option>
												<c:forEach items="${request.minIndustryList}" var="min">
													<c:if test="${company.minIndustryId==min.id}">
														<option value="${min.id }" selected="selected">
															${min.minIndustryName }
														</option>
													</c:if>
													<c:if test="${company.minIndustryId!=min.id}">
														<option value="${min.id }">
															${min.minIndustryName }
														</option>
													</c:if>
												</c:forEach>
											</select>
										</label>
									</td>
								</tr>
								<tr>
									<td height="35" colspan="6" bgcolor="#fcd99c" class="caption_text">
										链接信息
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										链接网址：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.siteUrl" type="text"
											value="${company.siteUrl }" id="txtSiteUrl" size="40" maxlength="255"
											onblur="checkUrl(this);" />
										格式:http://www.ssmell.com
									</td>
								</tr>
								<tr>
									<td width="150" height="40"></td>
									<td width="350" colspan="2">
										<!-- 没有图片则显示默认预览 -->
										<c:if test="${empty company.logo or company.logo==''}">
											<img id="imgs" src="admin/images/product_03.gif" width="150"
												height="100" />
										</c:if>
										<c:if test="${not empty company.logo and company.logo!=''}">
											<img id="imgs" src="${company.logo }"
												width="150" height="100" />
										</c:if>
									</td>
								</tr>
								<tr>
									<td width="150" height="40">
										公司LOGO：
									</td>
									<td width="250" colspan="2">
										<input name="logoFile" type="file" id="fileLogo" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司介绍：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<textarea name="company.cpyText" id="txtText" rows="15" cols="80">${company.cpyText }</textarea>
									</td>
								</tr>
								<tr>
									<td width="150" height="50" align="center">

									</td>
									<td align="left">
										<input style="background-image: url('admin/images/qyxx_15.gif'); width:62px; height:30px; border: 0px; cursor: pointer;" name="button1" type="button"  onclick="checkSubmit()"/>
										<input style="background-image: url('admin/images/qyxx_18.gif'); width:62px; height:30px; border: 0px; cursor: pointer;" name="button2" type="button"  onclick="history.go(-1)"/>
								
									</td>
									<td width="40" align="center">
									</td>
									<td align="center">
										<input type="hidden" id="hiddenLogo" name="company.logo"
											value="${company.logo }" />
										<input type="hidden" name="company.cmpId"
											value="${company.cmpId }" />
										<input type="hidden" name="company.userId"
											value="${company.userInfo.id }" />
										<input type="hidden" name="company.isLinksite"
											value="${company.isLinksite }" />
										<input type="hidden" name="company.status"
											value="${company.status }" />
										<input type="hidden" name="company.publishTime"
											value="${company.publishTime }" />
										<input type="hidden" name="company.modifyTime"
											value="${company.modifyTime }" />
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
					</div>
				</form>
				<!-- 操作 -->
				${request.msgInfo }

				<!-- right end -->
				<script type="text/javascript" src="admin/script/linkCompnaySite.js"></script>
			</div>
			<!-- bottom -->
			<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>


	</body>

</html>
