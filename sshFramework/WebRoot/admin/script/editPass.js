//验证提交
function checkSubmit(){
	var txtOldPwd=document.getElementById("txtOldPwd");
	if(funTrim(txtOldPwd.value)==""){
		alert("请输入旧密码!");
		txtOldPwd.select();
		return false;
	}
	var txtNewPwd=document.getElementById("txtNewPwd");
	if(funTrim(txtNewPwd.value)==""){
		alert("请输入新密码!");
		txtNewPwd.select();
		return false;
	}
	var txtRePwd=document.getElementById("txtRePwd");
	if(funTrim(txtRePwd.value)==""){
		alert("请输入确认密码!");
		txtRePwd.select();
		return false;
	}
	if(funTrim(txtNewPwd.value)!=funTrim(txtRePwd.value)){
		alert("两次输入的密码一致!");
		txtNewPwd.select();
		return false;
	}
	return true;
}