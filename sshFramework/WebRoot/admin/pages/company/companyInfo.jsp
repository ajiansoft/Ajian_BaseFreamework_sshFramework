<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>公司信息管理</title>
		<s:head/>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<script type="text/javascript" src="dwr/interface/dwrHelper.js"></script>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="script/funCheck.js"></script>
		<script type="text/javascript" src="admin/script/common.js"></script>
		<script type="text/javascript" src="admin/script/companyInfo.js"></script>
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
				<s:form name="form" action="admin/company_editCompanySite.htm" method="post">
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
										企业名称：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.cpyName" type="text" id="txtCpyName"
											value="${company.cpyName }" disabled="disabled" size="40" />
										<input type="hidden" name="company.cpyName"
											value="${company.cpyName }" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										营业执照：
									</td>
									<td colspan="5">
										<s:textfield name="company.license" value="%{#request.company.license}"></s:textfield>
										<s:fielderror fieldName="company.license"/>
										<s:set name="company.license" value=""></s:set>
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
												<c:if test="${company.compType.id==ct.id}">
													<option value="${ct.id }" selected="selected">
														${ct.title }
													</option>
												</c:if>
												<c:if test="${company.compType.id!=ct.id}">
													<option value="${ct.id }">
														${ct.title }
													</option>
												</c:if>
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
											value="${company.mainProduct }" id="txtMainProduct" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司规模：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<select name="company.compSize" id="selEmpNumber">
											<option value="-1">
												--请选择--
											</option>
											<c:forEach items="${request.companySizeList}" var="cs">
												<c:if test="${company.compSize==cs.id}">
													<option value="${cs.id }" selected>
														${cs.title }
													</option>
												</c:if>
												<c:if test="${company.compSize!=cs.id}">
													<option value="${cs.id }">
														${cs.title }
													</option>
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
									<td height="35" colspan="6" bgcolor="#fcd99c"
										class="caption_text">
										企业注册信息
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司注册地：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.regAddress" type="text"
											value="${company.regAddress }" id="txtRegAddress" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										法定代表人：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.regCeo" type="text"
											value="${company.regCeo }" id="txtRegCeo" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										注册资金：
									</td>
									<td colspan="5">
										<input name="company.regFunds" type="text"
											value="${company.regFunds }" id="textfield5" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										成立年份：
									</td>
									<td colspan="5">
										<select name="company.regTime" id="textfield6"> 
											<option value="-1">--请选择--</option>
											<script type="text/javascript">
												for(var i=1949;i<=2011;i++){
													document.write("<option value="+i+" selected=${company.regTime=="+i+"?'selected':''}>"+i+"</option>");
												}
											</script>
										</select>年
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										主要市场：
									</td>
									<td colspan="5">
										<input name="company.mainMarket" type="text"
											value="${company.mainMarket }" id="textfield8" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										运营商标：
									</td>
									<td colspan="5">
										<input name="company.brand" type="text"
											value="${company.brand }" id="textfield8" size="40" />
									</td>
								</tr>
								<tr>
									<td height="35" colspan="6" bgcolor="#fcd99c"
										class="caption_text">
										联系我们
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										联系人：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.linkman" type="text"
											value="${company.linkman }" id="txtLinkman" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										联系电话：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.telePhone" type="text"
											value="${company.telePhone }" id="txtTelePhone" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										手机：
									</td>
									<td colspan="5">
										<input name="company.mobilePhone" type="text"
											value="${company.mobilePhone }" id="txtMobilePhone" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司Email:
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.email" type="text"
											value="${company.email }" id="txtEmail" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										传真：
									</td>
									<td colspan="5">
										<input name="company.fax" type="text" value="${company.fax }"
											id="txtFax" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司地址：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.address" type="text"
											value="${company.address }" id="txtAddress" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司介绍：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<textarea name="company.cpyText" id="txtText" rows="15"
											cols="80">${company.cpyText }</textarea>
									</td>
								</tr>
								<tr>
									<td align="center" colspan="10">
										<input
											style="background-image: url('admin/images/qyxx_15.gif'); width: 62px; height: 30px; border: 0px; cursor: pointer;"
											name="button1" type="button" onclick="checkSubmit()" />
										<input
											style="background-image: url('admin/images/qyxx_18.gif'); width: 62px; height: 30px; border: 0px; cursor: pointer;"
											name="button2" type="button" onclick="history.go(-1)" />
										<input type="hidden" name="company.cmpId"
											value="${company.cmpId }" />
										<input type="hidden" name="company.userInfo.id"
											value="${company.userInfo.id }" />
										<input type="hidden" name="company.siteUrl"
											value="${company.siteUrl }" />
										<input type="hidden" name="company.isLinksite"
											value="${company.isLinksite }" />
										<input type="hidden" name="company.status"
											value="${company.status }" />
										<input type="hidden" name="company.publishTime"
											value="${company.publishTime }" />
										<input type="hidden" name="company.modifyTime"
											value="${company.modifyTime }" />
										<input type="hidden" name="company.isInNav" value="${company.isInNav }"/>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</s:form>
				

				<!-- right end -->
			</div>
			<!-- bottom -->
			<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>


	</body>
</html>
