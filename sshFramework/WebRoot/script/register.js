//验证注册
function checkSubmit(){
	var txtRegLoginName=document.getElementById("txtRegLogName");
	if(funTrim(txtRegLoginName.value) ==""){
		alert("请输入登录名!");
		txtRegLoginName.focus();
		return false;
	}      
	var txtPassword=document.getElementById("txtPassword");
	if(funTrim(txtPassword.value) ==""){
		alert("请输入密码!");
		txtPassword.focus();
		return false;
	}
	if(funTrim(txtPassword.value).length < 6){
		alert("密码长度不能小于6位!");
		txtPassword.focus();
		return false;
	}
	var txtRepwd=document.getElementById("txtRePwd");
	if(funTrim(txtRepwd.value) ==""){
		alert("请输入确认密码!");
		txtRepwd.focus();
		return false;
	}
	var selQuestion=document.getElementById("selQuestion");
	if(selQuestion.value =="-1"){
		alert("请选择安全问题!");
		selQuestion.focus();
		return false;
	}
	var txtAnswer=document.getElementById("txtAnswer");
	if(funTrim(txtAnswer.value) ==""){
		alert("请输入问题答案!");
		txtAnswer.focus();
		return false;
	}
	var txtEmail=document.getElementById("txtEmail");
	if(funTrim(txtEmail.value) ==""){
		alert("请输入安全邮箱!");
		txtEmail.focus();
		return false;
	}
	var selProvince=document.getElementById("selProvince");
	if(selProvince.value =="-1"){
		alert("请选择省份!");
		selProvince.focus();
		return false;
	}
	var selCity=document.getElementById("selCity");
	if(selCity.value =="-1"){
		alert("请选择城市!");
		selCity.focus();
		return false;
	}
	if(txtPassword.value != txtRepwd.value ){
		alert("输入的密码不一致，请重新输入!");
		txtPassword.select();
		return false;
	}	      	
	//验证用户名存在，禁止提交
	if(regNameflag){
		alert("该登录名已经被注册，请更换!");
		txtRegLoginName.focus();
		return false;
	}
	var txtVerifyCode=document.getElementById("txtVerifyCode");
	if(txtVerifyCode.value ==""){
		alert("请输入验证码!");
		txtVerifyCode.focus();
		return false;
	}
	var ckProtocol=document.getElementById("ckProtocol");
	if(ckProtocol.checked==false ){
		alert("请勾选协议后，注册!");
		ckProtocol.focus();
		return false;
	}
	return true;
}
//验证邮箱
function checkEmail(obj){
	if(obj.value!=""){		   			
		if(obj.value.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){
			alert("邮箱格式不正确，请确认!");
			obj.select();
			return false;
		}
	}
}		
//验证密码
function checkPwd(obj){
	var errPwd=document.getElementById("errPwd");
	if(funTrim(obj.value).length<6){
		errPwd.innerHTML="<font style='color:red;'>密码长度不能小于6位!</font>";
		return false;
	}
	if(funTrim(obj.value).length>16){
		errPwd.innerHTML="<font style='color:red;'>密码长度不能大于16位!</font>";
		return false;
	}
	errPwd.innerHTML="";
	return true;
}
//验证重复密码
function checkRepwd(){
	var errPwd=document.getElementById("errPwd");
	var txtPassword=document.getElementById("txtPassword");
	var txtRepwd=document.getElementById("txtRePwd");
	if(txtPassword.value!=txtRepwd.value){
		errPwd.innerHTML="<font style='color:red;'>两次输入的密码不一致!</font>";
		return false;
	}
}

   	
//检测登录名
var regNameflag=false;
function checkRegLoginName(obj){
	var txtRegLoginName=document.getElementById("txtRegLogName");
	var errUserName=document.getElementById("errUserName");
	var userID = obj.value; 
	if(funTrim(obj.value).length==0){
		errUserName.innerHTML="<font style='color:red;'>登录名由6-20个数字和字母组成，不能以数字开头!</font>"; 
		return false;
	}  
    else if(userID.length<6){
   		errUserName.innerHTML="<font style='color:red;'>登录名必须大于6个字符!</font>"; 
    	return false;
    } 
    else if(userID.length > 20){
    	errUserName.innerHTML="<font style='color:red;'>登录名长度不能大于20!</font>"; 
        return false;    
    }   
    else if(!isNaN(userID.charAt(0))){ 
    	errUserName.innerHTML="<font style='color:red;'>登录第一个字符不能为数字!</font>";    
        return false;    
    }    
    else if(!/^\w{1,20}$/.test(userID)){  
    	errUserName.innerHTML="<font style='color:red;'>登录名只能由数字、字母、下划线组合而成!</font>";   
        return false;    
    }else{
		errUserName.innerHTML=""; 			
		dwrHelper.isUsedUserName(txtRegLoginName.value,callBackUserName);
	}
}
function callBackUserName(data){
	var errUserName=document.getElementById("errUserName");
	if(data=="true"){
		errUserName.innerHTML="<font style='color:red;'>对不起，该登录名已经注册!</font>";		   			
		regNameflag=true;
	}else{
		errUserName.innerHTML="<font style='color:blue;'>恭喜您，可以使用!</font>";
		regNameflag=false;
	}
}
		   	
//注册用户城市
function loadCity(pro){
	if(pro=="-1"){
		var selCity=document.getElementById("selCity");
		selCity.options.length = 0;
	}else{
		dwrHelper.loadCity(pro,showCity);
	}	
}	
//注册用户加载城市回调函数	
function showCity(data){
	var selCity=document.getElementById("selCity");
	selCity.options.length = 0;
	for(i=0;i<data.length;i++){				
		selCity.options.add(new Option(data[i].city,data[i].cityID)); 
	}
}