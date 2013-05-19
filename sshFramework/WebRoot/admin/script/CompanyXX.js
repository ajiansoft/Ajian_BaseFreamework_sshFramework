//验证提交
function checkSubmit(){
	var form = document.forms['form'];
	var logoFile=document.getElementById("logoFile");
	if(logoFile.value==""){
		alert("请选择Logo图片！");
		logoFile.focus();
		return false;
	}
	var fileType = logoFile.value.substring(logoFile.value.lastIndexOf('.')+1,logoFile.value.length).toUpperCase();
	if(fileType!="JPG" && fileType!="GIF" && fileType!="BMP" && fileType!="PNG"){
		alert("对不起，您的文件格式不受支持!");
		logoFile.focus();
		return false;				
	}
	form.submit();
	document.getElementById("statu").style.display="inline-block";
}
			
//验证删除LOGO图片
function checkRemoveLogo(){
	if(confirm("你确定删除公司Logo吗？")){
		document.getElementById("statu").style.display="inline-block";
		location.href="admin/company_deleteLogoFile.htm";
	}
}