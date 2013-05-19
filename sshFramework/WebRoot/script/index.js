//金牌会员
function AutoScroll(obj){
	$(obj).find("ul:first").animate({marginTop:"-185px"},1000,function(){
		$(this).css({marginTop:"0px"}).find("li:first").appendTo(this);
	});
}
$(document).ready(function(){
	setInterval('AutoScroll("#scrollDiv")',5000)
	
	//图片展示滚动
	var speed=10;
	var tab=document.getElementById("demo");
	var tab1=document.getElementById("demo1");
	var tab2=document.getElementById("demo2");
	tab2.innerHTML=tab1.innerHTML;
	function Marquee(){
		if(tab2.offsetWidth-tab.scrollLeft<=0)
			tab.scrollLeft-=tab1.offsetWidth
		else{
			tab.scrollLeft++;
		}
	}
	var MyMar=setInterval(Marquee,speed);
	tab.onmouseover=function() {clearInterval(MyMar)};
	tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
	
});
 
//模版滚动列表 mengjia 070927
var Speed_1 = 15; //速度(毫秒)
var Space_1 = 15; //每次移动(px)
var PageWidth_1 = 235*3; //翻页宽度
var interval_1 = 0; //翻页间隔
var fill_1 = 0; //整体移位
var MoveLock_1 = false;
var MoveTimeObj_1;
var MoveWay_1="right";
var Comp_1 = 0;
var AutoPlayObj_1=null;
function GetObj(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval('document.all.'+objName)}}
function AutoPlay_1(){clearInterval(AutoPlayObj_1);AutoPlayObj_1=setInterval('ISL_GoDown_1();ISL_StopDown_1();',interval_1)}
function ISL_GoUp_1(){if(MoveLock_1)return;clearInterval(AutoPlayObj_1);MoveLock_1=true;MoveWay_1="left";MoveTimeObj_1=setInterval('ISL_ScrUp_1();',Speed_1);}
function ISL_StopUp_1(){if(MoveWay_1 == "right"){return};clearInterval(MoveTimeObj_1);if((GetObj('ISL_Cont_1').scrollLeft-fill_1)%PageWidth_1!=0){Comp_1=fill_1-(GetObj('ISL_Cont_1').scrollLeft%PageWidth_1);CompScr_1()}else{MoveLock_1=false}
AutoPlay_1()}
function ISL_ScrUp_1(){if(GetObj('ISL_Cont_1').scrollLeft<=0){GetObj('ISL_Cont_1').scrollLeft=GetObj('ISL_Cont_1').scrollLeft+GetObj('List1_1').offsetWidth}
GetObj('ISL_Cont_1').scrollLeft-=Space_1}
function ISL_GoDown_1(){clearInterval(MoveTimeObj_1);if(MoveLock_1)return;clearInterval(AutoPlayObj_1);MoveLock_1=true;MoveWay_1="right";ISL_ScrDown_1();MoveTimeObj_1=setInterval('ISL_ScrDown_1()',Speed_1)}
function ISL_StopDown_1(){if(MoveWay_1 == "left"){return};clearInterval(MoveTimeObj_1);if(GetObj('ISL_Cont_1').scrollLeft%PageWidth_1-(fill_1>=0?fill_1:fill_1+1)!=0){Comp_1=PageWidth_1-GetObj('ISL_Cont_1').scrollLeft%PageWidth_1+fill_1;CompScr_1()}else{MoveLock_1=false}
AutoPlay_1()}
function ISL_ScrDown_1(){if(GetObj('ISL_Cont_1').scrollLeft>=GetObj('List1_1').scrollWidth){GetObj('ISL_Cont_1').scrollLeft=GetObj('ISL_Cont_1').scrollLeft-GetObj('List1_1').scrollWidth}
GetObj('ISL_Cont_1').scrollLeft+=Space_1}
function CompScr_1(){if(Comp_1==0){MoveLock_1=false;return}
var num,TempSpeed=Speed_1,TempSpace=Space_1;if(Math.abs(Comp_1)<PageWidth_1/2){TempSpace=Math.round(Math.abs(Comp_1/Space_1));if(TempSpace<1){TempSpace=1}}
if(Comp_1<0){if(Comp_1<-TempSpace){Comp_1+=TempSpace;num=TempSpace}else{num=-Comp_1;Comp_1=0}
GetObj('ISL_Cont_1').scrollLeft-=num;setTimeout('CompScr_1()',TempSpeed)}else{if(Comp_1>TempSpace){Comp_1-=TempSpace;num=TempSpace}else{num=Comp_1;Comp_1=0}
GetObj('ISL_Cont_1').scrollLeft+=num;setTimeout('CompScr_1()',TempSpeed)}}
function picrun_ini(){
GetObj("List2_1").innerHTML=GetObj("List1_1").innerHTML;
GetObj('ISL_Cont_1').scrollLeft=fill_1>=0?fill_1:GetObj('List1_1').scrollWidth-Math.abs(fill_1);
GetObj("ISL_Cont_1").onmouseover=function(){clearInterval(AutoPlayObj_1)}
GetObj("ISL_Cont_1").onmouseout=function(){AutoPlay_1()}
AutoPlay_1();
}


//切换企业生活服务内容
function switchDiv(divId){
	var btnDiv1=document.getElementById("btnDiv1");
	var btnDiv2=document.getElementById("btnDiv2");
	var contentDiv1=document.getElementById("contentDiv1");
	var contentDiv2=document.getElementById("contentDiv2");
	var more=document.getElementById("link_compAndLife");
	if(divId==1){
		btnDiv1.className="d_span_img";
		btnDiv2.className="d_span_img1";
		contentDiv1.style.display="block";
		contentDiv2.style.display="none";
		//切换more按钮的地址
		more.href="aboutShow_queryNews.htm";
		more.target="top";
	}else if(divId==2){
		//查看是否加载了数据
		if(!document.getElementById("topLifeData")){
			//ajax请求数据，加载最新的生活信息
			try{
				$.ajax({
					type:'post',
					url:'index_scanTopLife.htm',
					success:function(data){
						var temp = eval("("+data+")");
						var lifeData = temp.topLife;//得到生活信息集合
						var newestLife = temp.newestLife;//得到最新的生活详细信息
						//解析生活信息集合，得到前台显示页面标签
						var len = lifeData.length;
						var leftHtml="<ul id='topLifeData'>";
						var rightHtml="<ul>";
						for(var i=0;i<len;i++){
							var life = lifeData[i];
							if(i<10){
								leftHtml+="<li><img src='images/index_82.gif' />  <a target='_blank' href='lifeshow_scanOnelifeinfo.htm?lifeinfo.lifeInfoId="+life.lifeInfoId+"'>"+life.lifeInfoTitle+"</a></li>";
							}else{
								rightHtml+="<li><a  target='_blank' href='lifeshow_scanOnelifeinfo.htm?lifeinfo.lifeInfoId="+life.lifeInfoId+"'>"+life.lifeInfoTitle+"</a></li>";																
							}
						}
						leftHtml+="</ul>";
						rightHtml+="</ul>";
						//解析最新生活信息详细内容，得到前台显示标签
						var newestLifeData = "<p><a href='lifeshow_scanOnelifeinfo.htm?lifeinfo.lifeInfoId="+newestLife.lifeInfoId+"' target='_blank'>"+newestLife.lifeInfoTitle+"</a></p><div class='d_index_centerbusiness_righttoptext'>"+newestLife.lifeTest+"</div>";
						//将数据显示在页面
						$("#showTopLifeDataLeft").addClass("d_index_centerlifeleft_list").html(leftHtml);
						$("#newestLifeData").addClass("d_index_centerbusiness_righttop").html(newestLifeData);
						$("#showTopLifeDataRight").addClass("d_index_centerlife_rightlist").html(rightHtml);
					},
					error:function(){
						$("#topLifeLeft_msg").html("信息加载异常，请刷新重试！");
						$("#topLifeRight_msg").html("信息加载异常，请刷新重试！");
					}
				});
			}catch(e){
				$("#topLifeLeft_msg").html("信息加载异常，请刷新重试！");
				$("#topLifeRight_msg").html("信息加载异常，请刷新重试！");
			}
		}
		btnDiv1.className="d_span_img1";
		btnDiv2.className="d_span_img";
		contentDiv1.style.display="none";
		contentDiv2.style.display="block";
		//切换more按钮的地址
		more.href="lifeshow_scanLifeinfo.htm";
		more.target="";
	}	
}
//切换侧边栏企业生活服务
function switchSideDiv(divId){
	var btnSideDiv1=document.getElementById("btnSideDiv1");
	var btnSideDiv2=document.getElementById("btnSideDiv2");
	var contentSideDiv1=document.getElementById("contentSideDiv1");
	var contentSideDiv2=document.getElementById("contentSideDiv2");
	if(divId==1){
		btnSideDiv1.className="d_span_img";
		btnSideDiv2.className="d_span_img1";
		contentSideDiv1.style.display="block";
		contentSideDiv2.style.display="none";
	}else if(divId==2){
		//查看是否已经请求得到了数据
		if(!document.getElementById("lifeHotData")){
			//ajax方式请求后台数据
			$.ajax({
				type:'post',
				url:'index_scanHotTopLife.htm',
				success:function(data){
					try{
						var temp = eval("("+data+")");
						var life = temp.life;
						var html = "<ul id='lifeHotData'>";
						var len = life.length;
						for(var i=0;i<len;i++){
							var info = life[i]; 
							html+=
							"<li><img src='images/new"+(i+1)+".gif' width='15' height='12' />&nbsp;"+
							"<a href='lifeshow_scanOnelifeinfo.htm?lifeinfo.lifeInfoId="+info.lifeInfoId+"' target='_blank'><font class='li_blue'>"+info.lifeInfoTitle+"</font></a>"+
							"</li>";
						}
						html+="</ul>";
						$("#contentSideDiv2").addClass("d_indexmainright_hot_content").html(html);
					}catch(e){$("#contentSideDiv2_msg").html("数据加载异常，请刷新重试！");}
				},
				error:function(){
					$("#contentSideDiv2_msg").html("数据加载异常，请刷新重试！");
				}
			});
		}
		btnSideDiv1.className="d_span_img1";
		btnSideDiv2.className="d_span_img";
		contentSideDiv1.style.display="none";
		contentSideDiv2.style.display="block";
	}	
}
