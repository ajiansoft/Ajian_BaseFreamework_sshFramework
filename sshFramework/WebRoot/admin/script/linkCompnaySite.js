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
		selCity.length = 0;
	}else{
		dwrHelper.loadCity(pro,showCity);
	}	
}	
//加载城市回调函数	
function showCity(data){
	var selCity=document.getElementById("selCity");
	selCity.length = 0;
	selCity.add(new Option("--请选择--","-1")); 
	for(i=0;i<data.length;i++){
		selCity.add(new Option(data[i].city,data[i].cityID)); 
	}
}	
//加载小行业类型
function loadMinIndustry(big){
	if(big=="-1"){
		var selMin=document.getElementById("selMin");
		selMin.length = 0;
		selMin.add(new Option("--请选择--","-1"));
	}else{
		dwrHelper.loadMinIndustry(big,showMinIndustry);
	}	
}
//加载小类型回调函数
function showMinIndustry(data){
	var selMin=document.getElementById("selMin");
	selMin.length = 0;
	selMin.add(new Option("--请选择--","-1"));
	if(data!=null){	
		for(i=0;i<data.length;i++){
			selMin.add(new Option(data[i].minIndustryName,data[i].id)); 
		}
	}
}
//验证提交
function checkSubmit(){
	var form=document.forms["form"];
	var txtCpyName=document.getElementById("txtCpyName");
	if(funTrim(txtCpyName.value)==""){
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
	var txtSiteUrl=document.getElementById("txtSiteUrl");
	if(txtSiteUrl.value==""){
		alert("请填写链接网址!");
		txtSiteUrl.focus();
		return false;
	}
	var txtText=document.getElementById("txtText");
	if(txtText.value==""){
		alert("请填写公司介绍!");
		return false;
	}
	//验证公司名称是否存在
	if(existsflag){
		alert("该公司名称已经被注册!");
		txtCpyName.focus();
		return false;
	}
	form.submit();
}

//验证公司名称是否存在
//全局变量公司存在
var existsflag=false;
function checkCompName(cpyName){
	if(cpyName!=""){
		dwrHelper.isExistCompanyName(cpyName,callbackCheckCompName);
	}
}
function callbackCheckCompName(data){
	if(data=="true"){
		document.getElementById("errCpyName").innerHTML="公司名称已经存在，请更换!";
		existsflag = true;
	}else{
		document.getElementById("errCpyName").innerHTML="恭喜，该公司名称未被注册!";
		existsflag = false;
	}
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