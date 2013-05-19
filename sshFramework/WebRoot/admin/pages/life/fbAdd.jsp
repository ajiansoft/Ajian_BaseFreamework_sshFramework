<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<tag:base />
	<title>发布信息修改</title>
	<link rel="stylesheet" type="text/css" href="admin/pages/style/customersystem.css"/>
	<script type="text/javascript" src="script/funCheck.js"></script>
	<script type="text/javascript" src="dwr/interface/dwrHelper.js"></script>
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	<script type="text/JavaScript" src="admin/pages/life/js/fbAdd.js"></script>
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
       <p class="nav_right_top_text">欢迎使用嗅觉用户中心</p>
       </div>
       <div class="business1">
       <form id="form" name="form" action="lifeshow_editLifeinfo.htm" method="post" enctype="multipart/form-data">
       	 <input id="img2"name="lifeinfo.image" type="hidden" value="${lifeinfo.image}"/>
          <table width="785" border="0" cellspacing="0" cellpadding="0"  >
            <tr>
              <td height="30" colspan="3" bgcolor="#fcd99c"><span class="caption_text"><a href="lifeshow_initUserLifeinfo.htm">点击这里返回管理页面</a></span></td>
            </tr>
            <tr>
              <td width="130" height="40">信息名称：</td>
              <td width="410"><label>
                <input type="text" name="lifeinfo.lifeInfoTitle" id="txtTitle" value="${lifeinfo.lifeInfoTitle}"/>
              </label></td>
              
              <td rowspan="4">
              		<c:if test="${not empty lifeinfo.image}">
              			<img src="UploadFolder/userFiles/${session.loginUserBean.regLogName}/life/${lifeinfo.image}" width="200" height="150"/>
              		</c:if>
              		<c:if test="${empty lifeinfo.image}">
              			<img src="admin/images/product_03.gif" width="200" height="150"/>
              		</c:if>
              </td>
           
            </tr>
            <tr>
              <td height="40">类型选择：</td>
              <td>
					<select id="selKind" name="lifeinfo.lifeKindId" style="width: 150px;" onchange="loadLifetype()">
						<option id="-1" value="-1">请选择大类型</option>
						<c:forEach items="${request.lifeKindList}" var="kind">
						
						<c:if test="${kind.lifeKindId != lifeinfo.lifeKindId}">
							<option id="${kind.lifeKindId}" value="${kind.lifeKindId}">${kind.lifeTitle}</option>
						</c:if>
						
						<c:if test="${kind.lifeKindId == lifeinfo.lifeKindId}">
							<option id="${kind.lifeKindId}" value="${kind.lifeKindId}" selected="selected">${kind.lifeTitle}</option>
						</c:if>
						
						</c:forEach>
					</select>
						<select id="selType" name="lifeinfo.lifeTypeId" style="width: 150px;">
						
								<c:forEach items="${request.lifeTypeList}" var="type">
								<c:if test="${type.lifeTypeId == lifeinfo.lifeTypeId}">
								<option id="${type.lifeTypeId}" value="${type.lifeTypeId}" selected="selected">${type.lifeName}</option>
							    </c:if>
							    
								<c:if test="${type.lifeTypeId != lifeinfo.lifeTypeId}">
								<option id="${type.lifeTypeId}" value="${type.lifeTypeId}">${type.lifeName}</option>
							    </c:if>
							    </c:forEach>
						</select>
					</td>
            </tr>
            <tr>
			   <td height="40">请选择地区：</td>
               <td>
               		<select id="selProvince" name="lifeinfo.province" style="width: 100px;" onchange="loadSearchCity(this.value);">
						<option id="-1" value="-1">请选择</option>
						<c:forEach items="${request.provinceList}" var="pro" varStatus="count">
						
							<c:if test="${pro.provinceID != lifeinfo.province}">
								<option id="${count.index+1}" value="${pro.provinceID}">${pro.province}</option>
							</c:if>
							
							<c:if test="${pro.provinceID == lifeinfo.province}">
								<option id="${count.index+1}" value="${pro.provinceID}" selected="selected">${pro.province}</option>
							</c:if>
							
						</c:forEach>
					</select>
					<select id="selCity" name="lifeinfo.city" style="width: 100px;">
						<c:forEach items="${request.cityList}" var="city" varStatus="count">
						
							<c:if test="${city.cityID != lifeinfo.city}">
								<option id="${count.index+1}" value="${city.cityID}">${city.city}</option>
							</c:if>
							
							<c:if test="${city.cityID == lifeinfo.city}">
								<option id="${count.index+1}" value="${city.cityID}" selected="selected">${city.city}</option>
							</c:if>
							
						</c:forEach>
					</select>
				</td>
            </tr>
            
            <tr>
            	<td width="130" height="40">联系电话：</td>
            	<td width="410">
            		<input id="telphone" name="lifeinfo.telphone" type="text" value="${lifeinfo.telphone}"/>
            	</td>
            </tr>
            
            <tr>
            	<td width="130" height="40">详细地址：</td>
            	<td width="410">
            		<input id="address" name="lifeinfo.address" type="text" value="${lifeinfo.address}"/>
            	</td>
            </tr>
            
            <tr>
            	<td width="130" height="40">电子邮件：</td>
            	<td width="410">
            		<input id="email" name="lifeinfo.email" type="text" value="${lifeinfo.email}"/>
            	</td>
            </tr>
       
            <tr>
              <td height="40">上传产品图片：</td>
              <td>
              	<input id="file" type="file" name="file" value="${lifeinfo.image}"/>
                <input name="up" type="submit" value="上传图片" onclick="return upform()"/>
              </td>
            </tr>
            <tr>
              <td height="40">信息说明：</td>
              <td colspan="3"><textarea id="txtaLifeTest" name="lifeinfo.lifeTest" id="textarea" cols="45" rows="5">${lifeinfo.lifeTest}</textarea></td>
            </tr>
            <tr>
              <td height="50">&nbsp;</td>
              <td><input type="button" name="button" id="button" value="确认" onclick="return yz()"/>
              <input type="button" name="button2" id="button2" value="取消" onclick="history.go(-1)"/></td>
              <td>&nbsp;</td>
            </tr>
          </table>
        </form> 
       </div>
			</div>
			<!-- bottom -->
			<jsp:include page="../comm/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
