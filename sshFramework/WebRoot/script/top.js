function getTopComm(){
	//得到cookie中的省份
	var proID=getCookie("provinceID");
	if(proID!=null){
		//加载城市
		dwrHelper.loadOneProvince(proID,function(data){
			if(data!=null){
				document.getElementById("provienceText").innerHTML=data.province;
			}
		})
	}
}

//搜索切换(生活/企业/导航)
function switchSearch(tid){
	//切换搜索
	var searchButton=document.getElementById("searchButton");
	var searchs = document.getElementById("search").childNodes;
	var search1 = searchs[0].firstChild;
	var search2 = searchs[1].firstChild;
	var search3 = searchs[2].firstChild;
	if(tid==1){		
		search1.style.backgroundColor="#990000";
		search1.style.color="#fff";
		search2.style.backgroundColor="#fff";
		search2.style.color="#990000";
		search3.style.backgroundColor="#fff";
		search3.style.color="#990000";
		//注册onclick事件
			searchButton.onclick=function onclick(){
			searchCom();
			return false;
		};
	}else if(tid==2){
		search2.style.backgroundColor="#990000";
		search2.style.color="#fff";
		search1.style.backgroundColor="#fff";
		search1.style.color="#990000";
		search3.style.backgroundColor="#fff";
		search3.style.color="#990000";
		//注册onclick事件
		searchButton.onclick=function onclick(){
			searchComLife();
			return false;
		};
	}else if(tid==3){
		search3.style.backgroundColor="#990000";
		search3.style.color="#fff";
		search1.style.backgroundColor="#fff";
		search1.style.color="#990000";
		search2.style.backgroundColor="#fff";
		search2.style.color="#990000";
		//注册onclick事件
		searchButton.onclick=function onclick(){
			searchNav();
			return false;
		};
	}
}

//查询企业表单
function searchCom(){
	var wd=document.getElementById("txtWord").value;
	var pro=document.getElementById("hiddenProvince").value;
	var ct=document.getElementById("hiddenCity").value;
	var url="comIndex_searchCompany.htm?wd="+wd;
	if(wd==null || wd=="")return;
	if(!pro==""){
		url=url+"&pro="+pro;
	}
	if(!ct==""){
		url=url+"&ct="+ct;
	}
	location.href=encodeURI(url);
}

//查询生活服务表单
function searchComLife(){
	var wd=document.getElementById("txtWord").value;
	var pro=document.getElementById("hiddenProvince").value;
	var ct=document.getElementById("hiddenCity").value;
	var url="lifeshow_searchLifeinfo.htm?wd="+wd;
	if(wd==null || wd=="")return;
	if(!pro==""){
		url=url+"&pro="+pro;
	}
	if(!ct==""){
		url=url+"&ct="+ct;
	}
	location.href=encodeURI(url);
}

//查询生活服务表单
function searchNav(){
	var wd=document.getElementById("txtWord").value;
	var url="nav_searchSite.htm?wd="+wd;
	if(wd==""){
		alert("请输入关键字!");
		document.getElementById("txtWord").focus();
	}else{
		location.href=encodeURI(url);
	}
	
}

//打开省份DIV
function showProDiv(){
	var proDiv=document.getElementById("provienveDiv");
	proDiv.style.display="block";	
	proDiv.style.zindex="1000";	
}

//关闭省份DIV
function closeProDiv(){
	var proDiv=document.getElementById("provienveDiv");
	proDiv.style.display="none";		
}	
	
//首页加载城市
function loadCity(proID){	
	if(proID!="-1"){
		//加载城市信息
		dwrHelper.loadCity(proID,showCity);
		//得到省份名称
		var proName=document.getElementById("liProvince"+proID).innerHTML;
		//设置当前选中省份
		document.getElementById("provienceText").innerHTML=proName;
		//设置省份cookie信息
		setCookie("provinceID",proID);
		//设置省份编号
		document.getElementById("hiddenProvince").value=proID;
		//清空城市编号
		document.getElementById("hiddenCity").value="";
		//清空城市cookie
		delCookie("cityID");
	}else{
		//设置当前选中省份
		document.getElementById("provienceText").innerHTML="全国";
		//设置省份编号
		document.getElementById("hiddenProvince").value="";
		//清空城市cookie
		delCookie("provinceID");
		//清空城市cookie
		delCookie("cityID");
		//清空城市下来框
		var selCity=document.getElementById("selCity");
		selCity.length = 0;
		selCity.add(new Option("请选择区县","-1"));
	}
	//关闭选择省份 层
	closeProDiv();
}	

//首页加载城市回调函数	
function showCity(data){
	var selCity=document.getElementById("selCity");
	selCity.length = 0;
	selCity.add(new Option("请选择区县","-1"));
	for(i=0;i<data.length;i++){
		selCity.add(new Option(data[i].city,data[i].cityID)); 
	}
}

//选择城市
function chooseCity(city){
	//设置城市
	var selCity=document.getElementById("selCity");
	if(selCity.value!="-1"){
		//设置城市cookie信息
		setCookie("cityID",city);
		//设置城市编号
		document.getElementById("hiddenCity").value=city;
	}else{
		//清空城市cookie
		delCookie("cityID");
		//清空城市编号
		document.getElementById("hiddenCity").value="";
	}
}

//导航
$(document).ready(function(){
	//鼠标移上首页导航按钮时显示有隐藏层的隐藏部分
	$(".mainNav a").mouseover(function(){
		$(".mainNav a").attr("class","");
		$("#"+this.id).attr("class","actived");
		var currentMenuNo = parseInt(this.id.substring(1));
		$(".secondNav div").each(function(){
			$(this).hide();
			$("#subNav"+currentMenuNo).show();
		});
	});
	/*//通过读取服务器上的session中的id值确定当前点击的是哪个导航按钮
	var id = ${session.navigationId};
	$(".mainNav>a").click(function(){
		$(this).attr("BACKGROUND-IMAGE","../images/icons1.gif");
		//alert($(this).attr("background-image"));
	});
	*/
	
});