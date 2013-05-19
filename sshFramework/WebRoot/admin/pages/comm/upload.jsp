<%@ page language="java"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<!-- 提示消息 -->
  	${request.msgInfo }

    <base href="<%=basePath%>">
    <title> </title>
	<style type="text/css">
		body{margin:0px;padding:0px;height:40px;width:100%;padding-top:5px;text-align: center;margin-left: auto;margin-right: auto;}
	</style>
	<script type="text/javascript">
		//上传图片
	function upform(){
		var txtFile=document.getElementById("file");
		if(txtFile.value==""){
			alert("请选择图片!");
			txtFile.focus();
			return false;
		}
		var fileType = txtFile.value.substring(txtFile.value.lastIndexOf('.')+1,txtFile.value.length).toUpperCase();
		if(fileType!="JPG" && fileType!="GIF" && fileType!="BMP" && fileType!="PNG"){
			alert("对不起，您的文件格式不受支持!");
			txtFile.focus();
			return false;				
		}
		document.getElementById("msg").innerHTML="上传中..."
	};
	
	//提示用户上传了图片但是没有保存
	function notSaveData(e){
		/**
		* 注：仅在IE中起作用。由于在表单提交时仍然会弹出提示，故暂时屏蔽 ajian 2011.6.9
		if ( e && e.preventDefault ){
			e.preventDefault();
		}
		else{
			window.parent.event.returnValue = "没有保存数据将导致数据丢失！";
		}
		return false;
		*/
	}
	
	
	</script>
	
    <script type="text/javascript" src="admin/script/imgPreview/CJL.0.1.min.js"></script>
	<script type="text/javascript" src="admin/script/imgPreview/QuickUpload.js"></script>
	<script type="text/javascript" src="admin/script/imgPreview/ImagePreviewd.js"></script>
	 	 
  </head>
  <body>
	 <div>
    	<form name="form" action="upload_upload.htm" method="post" enctype="multipart/form-data" >
			<p><font size="2px" color="#808080">请选择您要上传的图片，支持jpg,gif,bmp,png格式的图片文件！</font></p>
			<div id="msg" style="text-align:center;margin-left:auto;margin-right:auto;border:3px double gainsboro;width:250px;height:280px;padding:10px;"><img id="showPic" ></img></div><br/>
    		<input name="file" type="file" id="file" size="30" ACCEPT="image/jpg,image/gif" />
			<input id="up" type="submit" value="上传" style="display:none" onclick="return upform()"/>
			<input type="hidden" name="destPath" id="oldImagePath" /> 
		</form>
		<script type="text/javascript">
			var ip = new ImagePreview( $$("file"), $$("showPic"), {
				maxWidth: 250, maxHeight: 275,
				onShow:function(){
					$$("up").style.display="inline-block";	
				},
				onErr:function(){
					$$("up").style.display="none";
					$$("msg").innerHTML="<br/><br/><br/><br/><br/><br/><font color='red' size='1.5px'>浏览异常...</font>";
				}
			});
			ip.img.src = ImagePreview.TRANSPARENT;
			ip.file.onchange = function(){ ip.preview(); };
			//给页面上的隐藏域赋值为父页面中的图片路径
			//要求：父页面中必须有一个含有图片保存路径的隐藏域，id为"showImgPath"
			//     含有预览图片的img标签id为"showImg"
			$$("oldImagePath").value=window.parent.document.getElementById("showImgPath").value;
		</script>
    </div>
  </body>
</html>
    
    
    <%--
   		try{
	   		//构建上传组件smarUpload对象
	   		SmartUpload upload = new SmartUpload();
   			//初始化上传组件
	   		upload.initialize(pageContext);
    		//设置上传的文件格式
    		upload.setAllowedFilesList("jpg,gif,png,bmp");
    		//设置上传文件的大小限制
    		upload.setTotalMaxFileSize(204800);
    		//上传文件
    		upload.upload();
			//实例化file对象
   			SmartFile file = upload.getFiles().getFile(0);
    		if(!file.isMissing()){
    			//取到图片保存路径
    			String destPath = upload.getRequest().getParameter("oldImagePath");
    			if(destPath==null || destPath.equals("")){
    				throw new Exception();
    			}
		    	//判断路径是一个图片路径还是文件夹路径
		    	if(destPath.matches(".+\\.(jpg|gif|bmp|png)$")){
		    		//删除图片
		    		Upload.removeFile(destPath);
		    	}
				//查看是否建立了文件夹
				Upload.createDirectory(destPath);
				
	    		//修改文件名字
	    		Random random=new Random();
				String strRand=""; 
				for(int i=0;i<3;i++){ 
				   String ch=String.valueOf("0123456789".charAt(random.nextInt(10))); 
				   strRand+=ch; 
				}
				String imageName = new Date().getTime()+Integer.parseInt(strRand)+"."+file.getFileExt();
				//上传文件
				file.saveAs(destPath+"\\"+imageName);
				out.print("<script type='text/javascript'>window.parent.document.getElementById('showImg').src='"
							+destPath+"/"+imageName+"';window.parent.document.getElementById('showImgPath').value='"
							+destPath+"/"+imageName+"';window.parent.ymPrompt.close();</script>");
			}
   		} catch(java.lang.NegativeArraySizeException e1){}
   		catch(Exception e2){out.print("<script type='text/javascript'>$$('msg').innerHTML='<br/><br/><br/><br/><br/><br/><font color=red size=1.5px>上传异常，请刷新重试...</font>';</script>");}
   	--%>

