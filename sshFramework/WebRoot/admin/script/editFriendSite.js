//验证提交
function checkSubmit(){
	var form=document.forms['form'];
	form.action="admin/friendsite_editFriendSite.htm";	       
	var txtSiteTitle=document.getElementById("txtSiteTitle");
	if(funTrim(txtSiteTitle.value) ==""){
		alert("请输入站点名称");
		txtSiteTitle.focus();
		return false;
	}	
	var txtSiteUrl =document.getElementById("txtSiteUrl");       
	if(txtSiteUrl.value==""){
		alert("请输入站点地址");
		txtSiteUrl.focus();
		return false;
	}
	
	var upFile=document.getElementById("upFile");
	
	form.submit();	        
}
//上传图片
function upform(){
	var form=document.forms['form'];
	form.action="admin/friendsite_upfile.htm";
	var upFile=document.getElementById("upFile");
	if(upFile.value==""){
		alert("请选择图片!");
		upFile.focus();
		return false;
	}
	var fileType = upFile.value.substring(upFile.value.lastIndexOf('.')+1,upFile.value.length).toUpperCase();
	if(fileType!="JPG" && fileType!="GIF" && fileType!="BMP" && fileType!="PNG"){
		alert("对不起，您的文件格式不受支持!");
		upFile.focus();
		return false;				
	}
	form.submit();
}
//验证网址
function checkUrl(obj){
	if(obj.value!=""){
		var result=funCheckURL(obj.value);
		if(result==0){
			alert("网站格式不正确，请检查");
			obj.select();
		}
	}
}