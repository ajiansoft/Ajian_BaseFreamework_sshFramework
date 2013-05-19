/*****编辑产品 开始 *******/
//编辑器
KE.show({
	id : 'txtContent',
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

//验证提交
function checkSubmit(){
	var form = document.forms["form"];
	form.action="admin/product_editProduct.htm";
	var txtProductTitle=document.getElementById("txtProductTitle");
	if(funTrim(txtProductTitle.value)==""){
		alert("请输入产品名称");
		txtProductTitle.focus();
		return false;
	}
	var selProductKind=document.getElementById("selProductKind");
	if(selProductKind.value=="-1"){
		alert("请选择产品大类型");
		selProductKind.focus();
		return false;
	}
	var selType=document.getElementById("selType");
	if(selType.value=="-1"){
		alert("请选择产品小类型");
		selType.focus();
		return false;
	}
	var txtProductText=document.getElementById("txtContent");
	if(txtProductText.value==""){
		alert("请输入产品说明");
		return false;
	}
	var hiddenImagUrl=document.getElementById("showImgPath");
	if(hiddenImagUrl.value==""){
		alert("请先上传图片!");
		return false;
	}
	form.submit();
}	
		    
//添加小类型
function addtype(){
	location.href="admin/producttype_initEditProductType.htm";
}
//添加大类型
function addkind(){
	location.href="admin/productkind_initEditProductKind.htm";
}		 	
//查询产品小类型    
function callProductType(){
	var kindId = document.getElementById("selProductKind").value;
	var userId = document.getElementById("hiddenUserID").value;
	dwrHelper.selectProducttype(userId,kindId,callBackProductType);
}
function callBackProductType(data){
	var type = document.getElementById("selType");
	type.options.length=0;
	type.options.add(new Option("请选择","-1"));
	if(data != null){
		for(var i = 0; i<data.length; i++){
			type.options.add(new Option(data[i].productTypeTitle,data[i].productTypeId));
		}
	}       
} 
//改变产品类型编号
function changeType(obj){
	var hiddenProductTypeID = document.getElementById("hiddenProductTypeID");
	hiddenProductTypeID.value=obj.value;
}  
/*****编辑产品 结束 *******/