
//验证登录
function loginSubmit(){
	var txtRegLogName=document.getElementById("txtRegLogName");
	if(funTrim(txtRegLogName.value) =="请输入登录名!"){
		alert("请输入登录名!");
		txtRegLogName.focus();
		return false;
	}
	var txtPwd=document.getElementById("txtPwd");
	if(funTrim(txtPwd.value) ==""){
		alert("请输入密码!");
		txtPwd.focus();
		return false;
	}
	document.forms['loginFrom'].submit();
	return true;
}	
//切换提示效果
function focusLogName(obj){
	if(obj.value=="请输入登录名!"){
		obj.value="";
	}
}
function blurLogName(obj){
	if(obj.value==""){
		obj.value="请输入登录名!";
	}
}

	
/*企业查询首页广告切换*/
var NowFrame = 1;
var MaxFrame = 4;
function switchAd(d1){
	if(d1!=""){
		clearTimeout(theTimer);  //当触动按扭时，清除计时器
		NowFrame=d1;                //设当前显示图片
	}
	for(var i=1;i<(MaxFrame+1);i++){
		if(i==NowFrame){
			//当前图片示
			document.getElementById("adImg"+i).style.display="block";
			document.getElementById("adTitle"+i).style.display="block";
		}
		else{
			 //隐藏其他图片层
			document.getElementById("adImg"+i).style.display="none";
			document.getElementById("adTitle"+i).style.display="none";
		}
	}
	if(NowFrame == MaxFrame){   //设置下一个显示的图片
		NowFrame = 1;
	}else{
		NowFrame++;
	}
	theTimer=setTimeout("switchAd('')", 3000);   //设置定时器，显示下一张图片
}

/*加载城市*/
function loadSearchCity(pro){
	if(pro==-1){
		var selCity=document.getElementById("selSearchCity");
		selCity.length = 0;
	}else{
		dwrHelper.loadCity(pro,showSearchCity);
	}	
}	
//加载城市回调函数
function showSearchCity(data){
	var selCity=document.getElementById("selSearchCity");
	selCity.options.length = 0;
	selCity.options.add(new Option("--请选择--","-1")); 
	for(i=0;i<data.length;i++){
		selCity.options.add(new Option(data[i].city,data[i].cityID)); 
	}
}