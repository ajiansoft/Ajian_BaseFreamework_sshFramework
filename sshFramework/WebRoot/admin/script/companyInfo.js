//编辑器
KE.show({
	id : 'txtText',
	resizeMode : 1,
	cssPath : './index.css',
	afterCreate : function(id) {
		KE.event.ctrl(document, 13, function() {
			KE.util.setData(id);
			document.forms['example'].submit();
		});
		KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
			KE.util.setData(id);
			document.forms['example'].submit();
		});
	}
});

//加载城市
function loadCity(pro){
	if(pro==-1){
		var selCity=document.getElementById("selCity");
		selCity.options.length = 0;
	}else{
		dwrHelper.loadCity(pro,showCity);
	}	
}	
//加载城市回调函数	
function showCity(data){
	var selCity=document.getElementById("selCity");
	selCity.options.length = 0;
	selCity.options.add(new Option("--请选择--","-1")); 
	for(i=0;i<data.length;i++){
		selCity.options.add(new Option(data[i].city,data[i].cityID)); 
	}
}	
//加载小行业类型
function loadMinIndustry(big){
	if(big=="-1"){
		var selMin=document.getElementById("selMin");
		selMin.options.length = 0;
		selMin.options.add(new Option("--请选择--","-1"));
	}else{
		dwrHelper.loadMinIndustry(big,showMinIndustry);
	}	
}
//加载小类型回调函数
function showMinIndustry(data){
	var selMin=document.getElementById("selMin");
	selMin.options.length = 0;
	selMin.options.add(new Option("--请选择--","-1"));
	if(data!=null){	
		for(i=0;i<data.length;i++){
			selMin.options.add(new Option(data[i].minIndustryName,data[i].id)); 
		}
	}
}
//验证提交
function checkSubmit(){
	var form=document.forms["form"];
	var txtCpyName=document.getElementById("txtCpyName");
	if(txtCpyName.value==""){
		alert("请输入公司名称!");
		txtCpyName.focus();
		return false;
	}
	var selectCpyType=document.getElementById("selectCpyType");
	if(selectCpyType.value=="-1"){
		alert("请选择公司性质!");
		selectCpyType.focus();
		return false;
	}
	var txtMainProduct=document.getElementById("txtMainProduct");
	if(txtMainProduct.value==""){
		alert("请填写主营产品!");
		txtMainProduct.focus();
			return false;
		}
	var selEmpNumber=document.getElementById("selEmpNumber");
	if(selEmpNumber.value=="-1"){
		alert("请选择公司规模!");
		selEmpNumber.focus();
		return false;
	}
	var selProvince=document.getElementById("selProvince");
	if(selProvince.value=="-1"){
		alert("请选择城市!");
		selProvince.focus();
		return false;
	}
	var selCity=document.getElementById("selCity");
	if(selCity.value=="-1"){
		alert("请选择地区!");
		selCity.focus();
		return false;
	}
	var selBig=document.getElementById("selBig");
	if(selBig.value=="-1"){
		alert("请选择行业!");
		selBig.focus();
		return false;
	}
	var selMin=document.getElementById("selMin");
	if(selMin.value=="-1"){
		alert("请选择行业小分类!");
		selMin.focus();
		return false;
	}		
	var txtRegAddress=document.getElementById("txtRegAddress");
	if(txtRegAddress.value==""){
		alert("请填写企业注册地!");
		txtRegAddress.focus();
		return false;
	}
	var txtRegCeo=document.getElementById("txtRegCeo");
	if(txtRegCeo.value==""){
		alert("请填写企业法人代表!");
		txtRegCeo.focus();
		return false;
	}
	var txtLinkman=document.getElementById("txtLinkman");
	if(txtLinkman.value==""){
		alert("请填写联系人!");
		txtLinkman.focus();
		return false;
	}
	var txtMobilePhone=document.getElementById("txtMobilePhone");
	var txtTelePhone=document.getElementById("txtTelePhone");
	if(txtMobilePhone.value==""){
		if(txtTelePhone.value==""){
			alert("请至少填写一个联系电话!");
			txtTelePhone.focus();
			return false;
		}
	}
	var txtEmail=document.getElementById("txtEmail");
	if(txtEmail.value==""){
		alert("请填写公司邮箱!");
		txtEmail.focus();
		return false;
	}
	var txtAddress=document.getElementById("txtAddress");
	if(txtAddress.value==""){
		alert("请填写公司地址!");
		txtAddress.focus();
		return false;
	}
	var txtText=document.getElementById("txtText");
	if(txtText.value==""){
		alert("请填写公司介绍!");
		return false;
	}
	form.submit();
}