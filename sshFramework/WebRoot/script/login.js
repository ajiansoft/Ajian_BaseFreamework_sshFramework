//验证登录
function checkSubmit(){
	var msgInfo=document.getElementById("msgInfo");
	//清空服务器返回信息
	var svrMsg=document.getElementById("svrMsg");
	svrMsg.innerHTML="&nbsp";
	var txtRegLogName=document.getElementById("txtRegLogName");
	if(funTrim(txtRegLogName.value) ==""){
		msgInfo.innerHTML="请输入登录名!";
		txtRegLogName.focus();
		return false;
	}
	var txtPwd=document.getElementById("txtPwd");
	if(funTrim(txtPwd.value) ==""){
		msgInfo.innerHTML="请输入密码!";
		txtPwd.focus();
		return false;
	}
	return true;
}	