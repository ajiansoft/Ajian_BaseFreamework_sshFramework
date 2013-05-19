/*****编辑产品小类型 开始 *******/
//验证提交
function checkSubmit(){		
	var txtProductTitle=document.getElementById("txtProductTitle");
	if(funTrim(txtProductTitle.value)==""){
		alert("请输入产品小类型名称");
		txtProductTitle.focus();
		return false;
	}
	var txtProductKind=document.getElementById("selProductKind");
	if(txtProductKind.value=="-1"){
		alert("请选择产品大类型");
		txtProductKind.focus();
		return false;
	}
	return true;
}

/*****编辑产品小类型 结束 *******/