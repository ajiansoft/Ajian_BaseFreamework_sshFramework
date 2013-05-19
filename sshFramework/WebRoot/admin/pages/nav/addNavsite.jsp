<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<tag:base />
		<title>加入嗅觉导航</title>
		<link rel="stylesheet" type="text/css" href="admin/style/customersystem.css" />
		<link rel="stylesheet" type="text/css" href="admin/script/uploadify.css" />
		<script type="text/javascript" src="admin/script/common.js"></script>
		<!-- DWR框架使用 -->		
		<script type="text/javascript" src="dwr/interface/dwrHelper.js"></script>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="script/funCheck.js"></script>	
		<script type="text/javascript">
		    //得到输入内容的长度。
 			function getStrActualLen(sChars){
				return sChars.replace(/[^\x00-\xff]/g,"xx").length;
			}
			
			function isdate(object)
            {
              var  s  = document.getElementById(object.id).value; 
              var  pattern  = / ^((\d{2}(([02468][048])|([13579][26]))[\-\ / \s] ? (((( 0 ? [ 13578 ]) | ( 1 [ 02 ]))[\ - \ / \s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\ / \s] ? (( 0 ? [ 1 - 9 ]) | ([ 1 - 2 ][ 0 - 9 ]) | ( 30 ))) | ( 0 ? 2 [\ - \ / \s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\ / \s] ? (((( 0 ? [ 13578 ]) | ( 1 [ 02 ]))[\ - \ / \s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\ / \s] ? (( 0 ? [ 1 - 9 ]) | ([ 1 - 2 ][ 0 - 9 ]) | ( 30 ))) | ( 0 ? 2 [\ - \ / \s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[0-9])|([1-2][0-3]))\:([0-5]?[0-9])((\s)|(\:([0-5]?[0-9])))))?$ / ;
                  if (s != "" )
                 {
                      if ( ! pattern.exec(s))
                     {
                      alert( ' 请输入正确的日期 ' );
                      return false;
                     }
                 }
                 return true;        
            }
            
			//验证提交
			function checkSummit(){
				var txtTitle = document.getElementById("txtTitle");
		      	if(funTrim(txtTitle.value) == ""){
		        	alert("请填写站点名称!");
		        	txtTitle.focus();
		      		return false;
		      	}	
		      	if(getStrActualLen(funTrim(txtTitle.value))>100){
    				alert("你填写的内容请控制在50字以内！");
    				txtTitle.select();
    				return false;
    			}
    			
    			var txtSiteUrl = document.getElementById("txtSiteUrl");
    			if(funTrim(txtSiteUrl.value) == "" || funTrim(txtSiteUrl.value)=="http://"){
		        	alert("请填写站点名称!");
		        	txtSiteUrl.focus();
		      		return false;
		      	}	
		      	if(getStrActualLen(funTrim(txtSiteUrl.value))>100){
    				alert("你填写的内容请控制在50字以内！");
    				txtSiteUrl.select();
    				return false;
    			}
    			if(funCheckURL(funTrim(txtSiteUrl.value))==0){
    				alert("请输入正确的链接地址");
    				txtSiteUrl.select();
    				return false;
    			}
    			
    			var txtTime = document.getElementById("txtTime");
    			if(funTrim(txtTime.value) == ""){
    				alert("请输入时间");
    				txtTime.focus();
    				return false;
    			}
    			
    			//if(!isdate(txtTime)){
     				//txtTime.select();
    				//return false;
    			//}
    			
    			var selNavarea = document.getElementById("selNavarea");
    			if(funTrim(selNavarea.value) == "-1"){
    				alert("请选择分类");
    				selNavarea.focus();
    				return false;
    			}
    			
    			
    			var selNavkind = document.getElementById("selNavkind");
    			if(funTrim(selNavkind .value) == "-1"){
    				alert("请选择种类");
    				selNavkind.focus();
    				return false;
    			}
    			
    			var selNavtype = document.getElementById("selNavtype");
    			if(funTrim(selNavtype.value) == "-1"){
    				alert("请选择类型");
    				selNavtype.focus();
    				return false;
    			}
    			
    			var txtaSiteText = document.getElementById("txtaSiteText");
    			if(funTrim(txtaSiteText.value) == ""){
    				alert("请填写站点介绍的内容，字数控制在300字内！");
    				txtaSiteText.focus();
    				return false;
    			}
    			if(getStrActualLen(funTrim(txtaSiteText.value))>600){
    				alert("你填写的内容请控制在300字以内！");
    				txtaSiteText.select();
    				return false;
    			}
		      	return true;
		   }
		   
		//加载大类型
		function loadNavkind(areaId){
			if(areaId=="-1"){
				alert("请选择分类");
			}else{				
				dwrHelper.loadNavkind(areaId,showNavkind);
			}
		}	
		//回调函数	
		function showNavkind(data){
			var selNavkind=document.getElementById("selNavkind");
			selNavkind.options.length = 0;
			selNavkind.options.add(new Option("--请选择--","-1"));
			if(data!=null){		
				for(i=0;i<data.length;i++){
					selNavkind.options.add(new Option(data[i].title,data[i].id)); 
				}
			}
		}
		//加载大类型
		function loadNavtype(kindId){
			if(kindId=="-1"){
				alert("请选择种类");
			}else{				
				dwrHelper.loadNavtype(kindId,showNavtype);
			}
		}	
		//回调函数	
		function showNavtype(data){
			var selNavtype=document.getElementById("selNavtype");
			selNavtype.options.length = 0;
			selNavtype.options.add(new Option("--请选择--","-1"));
			if(data!=null){		
				for(i=0;i<data.length;i++){
					selNavtype.options.add(new Option(data[i].title,data[i].id)); 
				}
			}
		}
		
		function upform(){
			var form = document.getElementById("form");
			form.action="navsite_upfile.htm?handleType=foreground";
			var txtFile=document.getElementById("file");
			if(txtFile.value==""){
				alert("请选择图片!");
				txtFile.focus();
				return false;
			}
			return true;
	   }
	   </script>
	   
	   
	   <!-- 
	   jquery.uploadify使用中，firefox不支持其中的falsh取session，导致IE、Firefox不兼容，废弃
	  	 //删除显示的上传结果方法
		function showResult(){
        	$("#result").html("");
        }
		//上传文件方法、
		function uploadFile(){
			$("#file").uploadifyUpload();
		}
		//取消上传方法
		function clearFile(){
			$("#file").uploadifyClearQueue();
		}
		
		<script type="text/javascript">
		$(function(){
			$("#file").uploadify({//给文件选择按钮添加uploadify()方法
				'uploader':'admin/script/uploadify.swf',//组件自带的flash文件，用于打开选取本地文件的按钮
				'script':'navsite_upfile.htm?handleType=foreground',//上传路径，提交给哪个action处理
				'cancelImg':'admin/script/cancel.png',//取消上传文件的按钮图片
				'fileDataName':'file',//和页面上file的name属性值相同，供struts取值
				'queueID':'fileQueue',//页面上显示上传进度的层的ID
				'auto':false,//是否选择文件后自动上传
				'multi':false,//是否支持多文件上传
				'buttonText':'SEARCH',//按钮上的文字
				'displayData':'percentage',//显示资料上传进度，可选值：speed，显示上传速度；percentage，显示上传百分比
				'fileExt':'*.jpg;*.gif;*.bmp;*.png;*.jpeg',//支持的文件格式
				'fileDesc':'仅支持jpg、jpeg、gif、bmp、png格式的文件！',//对支持文件的格式的提示，如果有fileExt属性，则这个属性是必须存在的
				'onComplete':function(event,queueID,fileObj,response,data){//上传完成后的回调函数
					var array = response.split("|");
					$("#result").html(array[0]);//显示上传结果
					//改变图片显示
					$("#imgShow").attr("src",array[1]);
					$("#imgUrl").attr("value",array[1]);
					//四秒后删除显示的上传结果
					setInterval("showResult()",4000);
				},
				'onError':function(){
					$("#result").html("上传失败！请刷新再试！");//显示上传结果
					setInterval("showResult()",4000);//四秒后删除显示的上传结果
				}
			});
		});
	</script>
	 -->
	
	</head>
	<body>
		<div class="layout">
			<!-- top -->
			<%@include file="../comm/top.jsp" %>
			<!-- middle -->
			<div class="nav_layout">
				<!-- menu -->
				<%@include file="../comm/menu.jsp" %>
				<!-- right -->
				<form id="form" name="form" action="navsite_editNavsite.htm?handleType=foreground" method="post" enctype="multipart/form-data">
					<div class="nav_right">
						<div class="nav_right_top">
							<p class="nav_right_top_text">
								欢迎使用嗅觉用户中心
							</p>
						</div>
						<div class="business_zx">
							<table width="812" height="246" border="0" align="center" cellpadding="2" cellspacing="1" background="images/www.momi8.com_20070413131353134.gif"
								style="margin-top: 8px">
								<tr align="center" bgcolor="#FAFAF1" height="22">
									<td height="34" align="left" valign="middle">
										站点名称:
										<input type="text" id="txtTitle" name="site.title" value="${site.title}" readonly="readonly"/>
										<input type="hidden" name="site.id" value="${site.id}" />
										<input type="hidden" name="site.topTime" value="${site.topTime }" />
										<input type="hidden" name="site.modifyTime" value="${site.modifyTime}" />
									</td>
								</tr>
								<tr align="center" bgcolor="#FAFAF1" height="22">
									<td height="34" align="left" valign="middle">
										站点地址:
										<c:if test="${empty site.siteUrl}">
										<input type="text" id="txtSiteUrl" name="site.siteUrl" value="http://${site.siteUrl}" />
										</c:if>
										<c:if test="${not empty site.siteUrl}">
										<input type="text" id="txtSiteUrl" name="site.siteUrl" value="${site.siteUrl}"/>
										</c:if>
									</td>
								</tr>
								<tr align="center" bgcolor="#FAFAF1" height="22">
									<td height="34" align="left" valign="middle">
										成立时间:
										<select name="site.foundTime" id="txtTime"> 
											<option value="-1">--请选择--</option>
											<script type="text/javascript">
												for(var i=1949;i<=2011;i++){
													document.write("<option value="+i+" selected=${site.foundTime=="+i+"?'selected':''}>"+i+"</option>");
												}
											</script>
										</select>年
									</td>
								</tr>
								<tr align="center" bgcolor="#FAFAF1" height="22">
									<td height="34" align="left" valign="middle">
									分类:
										<select id="selNavarea" name="site.areaId" onchange="loadNavkind(this.value);"  onblur="loadNavkind(this.value);">
											<option value="-1">--请选择--</option>
											<c:forEach items="${request.navareaList}" var="area">
									 			<option value="${area.id }" selected="${area.id==site.areaId?'selected':''}">${area.title }</option>
									 		</c:forEach>
										 </select>			
									</td>
								</tr>
								<tr align="center" bgcolor="#FAFAF1" height="22">
									<td height="34" align="left" valign="middle">
									种类:
										<select id="selNavkind" name="site.kindId" onchange="loadNavtype(this.value);">
											<option value="-1">--请选择--</option>
											<c:forEach items="${request.navkindList}" var="kind">
												<c:if test="${kind.id==site.kindId}">
									 				<option value="${kind.id }" selected>${kind.title }</option>
									 			</c:if>
									 			<c:if test="${kind.id!=site.kindId}">
									 				<option value="${kind.id }">${kind.title }</option>
									 			</c:if>
									 		</c:forEach>
										 </select>			
									</td>
								</tr>
								<tr align="center" bgcolor="#FAFAF1" height="22">
									<td height="34" align="left" valign="middle">
									类型:
										<select id="selNavtype" name="site.typeId">
											<option value="-1">--请选择--</option>
											<c:forEach items="${request.navtypeList}" var="type">
									 			<option value="${type.id }" selected="${type.id==site.typeId?'selected':''}">${type.title }</option>
									 		</c:forEach>
										 </select>			
									</td>
								</tr>
								<tr align="center" bgcolor="#FAFAF1" height="22">
									<td height="34" align="left" valign="middle">
									置顶状态:
										<select id="selCollege" name="site.top">
								 			<option value="0">否</option>
								 			<option value="1" selected="${site.top==1?'selected':''}">是</option>
									 	</select>
									</td>
								</tr>
								<tr align="center" bgcolor="#FAFAF1" height="22">
									<td height="34" align="left" valign="middle">
									名站状态:
										<select id="selCollege" name="site.isFamousSite">
								 			<option value="0">否</option>
								 			<option value="1" selected="${site.isFamousSite==1?'selected':''}">是</option>
									 	</select>
									</td>
								</tr>
								
								<tr>
								   <td>
										<img id="imgShow" name="site.imgUrl" src="${empty site.imgUrl?'pages/nav/images/notLog.gif':site.imgUrl}" width="101" height="48"/>
										<input type="hidden" name="site.imgUrl" value="${site.imgUrl }"/>
									</td>
								</tr>
								<tr align="center" bgcolor="#FAFAF1" height="22">
									<td height="34" align="left" valign="middle">
										站点介绍:
										<textarea id="txtaSiteText" rows="10" cols="80" name="site.text">${site.text}</textarea>
									</td>
								</tr>
								<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="34">
									<td height="34" align="left" valign="middle">
										<input type="submit" name="Submit2" value="保存" onclick="return checkSummit()"/>
									</td>
								</tr>
							</table>
						  </div>							
						<!--说明开始-->
					    <div class="state">
						    <p><b>说明</b>：</p>
						    <p>1、作用：加入嗅觉导航的网站可以在嗅觉导航中迅速查询到。</p>
						    <p>2、要求：如果您要将网站加入嗅觉导航中，您必须保证您的网站各项资料是正确有效的。</p>
						    <p>2、加入：对您选择的网点填写完以上各项资料后，击加入按钮即可加入嗅觉导航。</p>
					    </div> 
					    <!--说明结束-->		
					</div>	
				</form>
				<!-- right end -->
			</div>
			<!-- bottom -->
		<%@include file="../comm/bottom.jsp" %>
		</div>
		<!-- 提示信息 -->
		${request.msgInfo}
	</body>
</html>
