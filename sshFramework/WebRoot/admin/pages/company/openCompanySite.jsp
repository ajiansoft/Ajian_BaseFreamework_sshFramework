<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>欢迎使用嗅觉用户中心-开通企业网站</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<script type="text/javascript" src="dwr/interface/dwrHelper.js"></script>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="script/funCheck.js"></script>
		<script type="text/javascript" src="admin/script/common.js"></script>
		
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
				<form name="form" action="admin/company_openCompanySite.htm" method="post" onsubmit="return checkSubmit();">
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
										<input name="company.cpyName" type="text" id="txtCpyName" size="40" onblur="checkCompName(this.value)" maxlength="50"/>
										<font color="red" id="errCpyName">注意*：公司名称注册之后不能修改!</font>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										营业执照：
									</td>
									<td colspan="5">
										<input name="company.license" type="text" id="txtLicense" size="40" maxlength="50"/>
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
												<option value="${ct.id }">${ct.title }</option>
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
											id="txtMainProduct" size="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司规模：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<select name="company.compSize" size="1" id="selEmpNumber">
											<option value="-1">
												--请选择--
											</option>
											<c:forEach items="${request.companySizeList}" var="cs">
												<option value="${cs.id }">${cs.title }</option>
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
												<option value="${pro.provinceID }">
													${pro.province }
												</option>
											</c:forEach>
										</select>
										<select name="company.cpyCity" size="1" id="selCity">
											<option value="-1">
												--请选择--
											</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										所属行业：
										<font color="red">*</font>
									</td>
									<td colspan="5">
											<select name="company.bigIndustryId" size="1" id="selBig"
												onchange="loadMinIndustry(this.value);">
												<option value="-1">
													--请选择--
												</option>
												<c:forEach items="${request.bigIndustryList}" var="bi">
													<option value="${bi.id }">
														${bi.bigIndustryName }
													</option>
												</c:forEach>
											</select>
											<select name="company.minIndustryId" size="1" id="selMin">
												<option value="-1">
													--请选择--
												</option>
											</select>
									</td>
								</tr>
								<tr>
									<td height="35" colspan="6" bgcolor="#fcd99c" class="caption_text">
										公司注册信息
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司注册地：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.regAddress" type="text" id="txtRegAddress" size="40" maxlength="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										法定代表人：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.regCeo" type="text" id="txtRegCeo" size="40" maxlength="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										注册资金：
									</td>
									<td colspan="5">
										<input name="company.regFunds" type="text" id="textfield5" size="40" maxlength="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										成立年份：
									</td>
									<td colspan="5">
										<select name="company.regTime" id="textfield6">
											<option selected="selected" value="0">--请选择--</option>
											<script type="text/javascript">for(var i=1949;i<=2011;i++){document.write("<option value="+i+">"+i+"</option>")};</script>
										</select>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										主要市场：
									</td>
									<td colspan="5">
										<input name="company.mainMarket" type="text" id="textfield8" size="40" maxlength="20" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										运营商标：
									</td>
									<td colspan="5">
										<input name="company.brand" type="text" id="textfield8" size="40" maxlength="20" />
									</td>
								</tr>
								<tr>
									<td height="35" colspan="6" bgcolor="#fcd99c"
										class="caption_text">
										联系我们(下列将在您的网站上显示，请认真填写)
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										联系人：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.linkman" type="text" id="txtLinkman" size="40" maxlength="20"/>
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										联系电话：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.telePhone" type="text" id="txtTelePhone" size="40" maxlength="40" onblur="checkTel(this)" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										手机：
									</td>
									<td colspan="5">
										<input name="company.mobilePhone" type="text" id="txtMobilePhone" size="40" maxlength="40" onblur="checkTel(this)" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司Email:
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.email" type="text" id="txtEmail" size="40" maxlength="40" onblur="checkEmail(this);" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										传真：
									</td>
									<td colspan="5">
										<input name="company.fax" type="text" id="txtFax" size="40" maxlength="40" />
									</td>
								</tr>
								<tr>
									<td width="150" height="30">
										公司地址：
										<font color="red">*</font>
									</td>
									<td colspan="5">
										<input name="company.address" type="text" id="txtAddress" size="40" maxlength="50"/>
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
										&nbsp;
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



				<!-- right end -->
				<script type="text/javascript" src="admin/script/openCompanySite.js"></script>
			</div>
			<!-- bottom -->
			<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>



	</body>
</html>
