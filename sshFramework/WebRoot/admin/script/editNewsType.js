//验证提交
function checkSubmit(){
	var txtNewsTypeTitle= document.getElementById("txtNewsTypeTitle");
	if(funTrim(txtNewsTypeTitle.value)==""){
		alert("请输入新闻类型名称!");
		txtNewsTypeTitle.focus();
		return false;
	}
	return true;
}