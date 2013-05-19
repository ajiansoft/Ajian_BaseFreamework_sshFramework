//加载城市
function loadSearchCity(pro){
	if(pro==-1){
		var selCity=document.getElementById("selCity");
		selCity.options.length = 0;
		selCity.disabled="disabled";
	}else{
		document.getElementById("selCity").removeAttribute("disabled");
		
		dwrHelper.loadCity(pro,showSearchCity);
	}	
}	
//加载城市回调函数	
function showSearchCity(data){
	
	var selCity=document.getElementById("selCity");
	selCity.options.length = 0;
	selCity.options.add(new Option("请选择","-1")); 
	for(i=0;i<data.length;i++){
		selCity.options.add(new Option(data[i].city,data[i].cityID)); 
	}
}	

function loadLifetype(){
	var kind = document.getElementById("selKind");
	var kindId = kind.value;
	document.getElementById("selType").removeAttribute("disabled");
	dwrHelper.loadLifetype(kindId,showLifetype);
}

function showLifetype(data){
	var type = document.getElementById("selType");
	type.options.length = 0;
	type.options.add(new Option("请选择小类型","-1"))
	if(data != null){
		for(var i = 0; i<data.length; i++){
			type.options.add(new Option(data[i].lifeName,data[i].lifeTypeId)); 		
		}
	}
}

  function upform(){
	var form = document.getElementById("form");
	form.action="lifeshow_upfile2.htm";
	var txtFile=document.getElementById("file");
		if(txtFile.value==""){
			alert("请选择图片!");
			txtFile.focus();
			return false;
		}
		return true;
	}
	
	 function yz(){
  
  	 var txtTitle = document.getElementById("txtTitle")
     if(funTrim(txtTitle.value) == ""){
    	alert("请填写标题");
    	txtTitle.focus();
    	return false;
     }
     
     if(getStrActualLen(funTrim(txtTitle.value))>60){
    	alert("你填写的标题请控制在30字以内！");
    	txtTitle.select();
    	return false;
     }
     
     
     var selKind = document.getElementById("selKind");
     if(selKind.value == "-1"){
    	alert("请选择大类型");
    	selKind.focus();
    	return false;
    }
    
    var selType = document.getElementById("selType");
    if(selType.value == "-1"){
    	alert("请选择小类型");
    	selType.focus();
    	return false;
    }
    
    var selProvince = document.getElementById("selProvince");
     if(selProvince.value == "-1"){
    	alert("请选择地区");
    	selProvince.focus();
    	return false;
    }
    
    var selCity = document.getElementById("selCity");
    if(selCity.value == "-1"){
    	alert("请选择城市");
    	selCity.focus();
    	return false;
    }
    
    var txtTel = document.getElementById("telphone");
    if(funTrim(txtTel.value) == ""){
    	alert("请输入联系电话");
    	txtTel.focus();
    	return false;
    }
    
    if(funCheckTel(txtTel.value) == 0){
    	alert("请输入正确的电话");
    	txtTel.select();
    	return false;
    }
    
    if(getStrActualLen(funTrim(txtTel.value))>30){
    	alert("你填写的电话请控制在30字以内！");
    	txtTel.select();
    	return false;
    }
    
    var txtAddress = document.getElementById("address");
    if(funTrim(txtAddress.value) == ""){
    	alert("请输入主要详细地址");
    	txtAddress.focus();
    	return false;
    }
    
    if(getStrActualLen(funTrim(txtAddress.value))>200){
    	alert("你填写的主要详细地址请控制在100字以内！");
    	txtAddress.select();
    	return false;
    }
    
    var txtEmail = document.getElementById("email");
    if(funTrim(txtEmail.value) == ""){
    	alert("请输入邮箱");
    	document.getElementById("email").focus();
    	return false;
    }
    
    if(funCheckEmail(txtEmail.value) == 0){
    	alert("邮箱格式不正确");
    	return false;
    }
    
    if(getStrActualLen(funTrim(txtEmail.value))>255){
    	alert("你填写的邮箱地址请控制在255字以内！");
    	txtEmail.select();
    	return false;
    }
    
    var txtaLifeTest = document.getElementById("txtaLifeTest");
    if(funTrim(txtaLifeTest.value) == ""){
    	alert("请输入主要内容");
    	documen.txtaLifeTest.focus();
    	return false;
    }
    
    if(getStrActualLen(funTrim(txtaLifeTest.value))>8000){
    	alert("你填写的内容请控制在4000字以内！");
    	txtaLifeTest.select();
    	return false;
    }
    
     var form = document.getElementById("form");
	  form.submit();
  }
  
  
//得到输入内容的长度。
 function getStrActualLen(sChars){
	return sChars.replace(/[^\x00-\xff]/g,"xx").length;
}
  
  