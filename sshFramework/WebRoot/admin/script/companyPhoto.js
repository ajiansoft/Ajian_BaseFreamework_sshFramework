//验证提交
function checkSubmit(){
	var logoFile=document.getElementById("fileId");
	var form = document.getElementById("form");
	if(funTrim(logoFile.value)==""){
		alert("请选择相片！");
		logoFile.focus();
		return false;
	}
	form.submit();
	return true;
}

//得到输入内容的长度。
 function getStrActualLen(sChars){
	return sChars.replace(/[^\x00-\xff]/g,"xx").length;
}

function yz(){

  	var title = document.getElementById("title");
  	var txt = document.getElementById("txt");
  	var image = document.getElementById("image");
  	var form = document.getElementById("form");
  	var fileId = document.getElementById("fileId");
  	
  	if(funTrim(title.value)==""){
		alert("请填写标题！");
		title.focus();
		return false;
	}
	if(getStrActualLen(funTrim(title.value))>50){
    	alert("填写的标题请控制在25字以内！");
    	title.select();
    	return false;
    }
	
	if(funTrim(txt.value)==""){
		alert("请填写说明！");
		txt.focus();
		return false;
	}
	
	if(getStrActualLen(funTrim(txt.value))>200){
    	alert("填写的说明请控制在100字以内！");
    	txt.select();
    	return false;
    }
	
	if(funTrim(image.value)==""){
		alert("请上传照片！");
		fileId.focus();
		return false;
	}
	form.action = "admin/photo_editPhoto.htm";
	form.submit();
	return true;
}
