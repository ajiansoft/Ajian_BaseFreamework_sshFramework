/*****编辑产品大类型 开始 *******/
//验证提交
function checkSubmit(){		   	
	var txtKindName=document.getElementById("txtKindName");	  
	if(funTrim(txtKindName.value)==""){	
		alert("请输入产品大类型名称");		      			   		
		txtKindName.focus();
		return false;
	}	
	return true;   
}	
/*****编辑产品大类型 结束 *******/
