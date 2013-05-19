//函数名：funCheckTel
//功能介绍：检查是否为电话号码
//参数说明：要检查的字符串
//返回值：1为是合法，0为不合法

//验证电话号码
function funCheckTel(tel){
 	var i,j,strTemp;
 	strTemp="0123456789-()# ";
 	for (i=0;i<tel.length;i++){
		j=strTemp.indexOf(tel.charAt(i)); 
		if (j==-1){
			//说明有字符不合法
			return 0;
		}
	}
	//说明合法
	return 1;
}

//函数名：fucCheckTEL
//功能介绍：检查是否为邮箱
//参数说明：要检查的字符串
//返回值：1为是合法，0为不合法
function funCheckEmail(email){
	if(email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){
		return 0;
	}
	return 1;
}

//函数名：funTrimAll
//功能介绍：去掉字符串所有空格
//参数说明：要检查的字符串
//返回值：去空格之后的字符串
function funTrimAll(str){
	var val=str.replace(/\s/g,"");//这里是去掉空字符
	return val;
}

//函数名：funLTrim
//功能介绍：去掉字符串左边的空格
//参数说明：要检查的字符串
//返回值：去空格之后的字符串
function funLTrim(str){ 
	return str.replace(/^\s*/g,""); 
} 

//函数名：funRTrim
//功能介绍：去掉字符串右边的空格
//参数说明：要检查的字符串
//返回值：去空格之后的字符串
function funRTrim(str){ 
	return str.replace(/\s*$/g,""); 
} 

//函数名：funTrim
//功能介绍：去掉字符串首尾的空格
//参数说明：要检查的字符串
//返回值：去空格之后的字符串
function funTrim(str){ 
	return str.replace(/^\s*|\s*$/g,""); 
}


/* 
用途：检查输入对象的值是否符合网址格式 
输入：str 输入的字符串 
返回：1为是合法，0为不合法
*/
function funCheckURL(url){     
	var myReg=/http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
    if(!myReg.test(url)){
    	return 0;
    }     
    return 1;     
} 

function funCheckURL2(url){     
	var myReg=/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/;
    if(!myReg.test(url)){
    	return 0;
    }     
    return 1;     
}



//未使用的---->








/* 
* 判断是否为数字，是则返回true,否则返回false 
*/
function f_check_number(obj)    
{           
    if (/^\d+$/.test(obj.value))    
    {    
       return true;    
    }     
    else     
    {    
       f_alert(obj,"请输入数字");    
       return false;    
    }    
}    
  

/* 
* 判断是否为自然数，是则返回true,否则返回false 
*/
function f_check_naturalnumber(obj)    
{           
    var s = obj.value;    
    if (/^[0-9]+$/.test( s ) && (s > 0))    
    {    
       return true;    
    }     
    else     
    {    
        f_alert(obj,"请输入自然数");    
        return false;    
    }    
}    
  

/* 
* 判断是否为整数，是则返回true,否则返回false 
*/
function f_check_integer(obj)    
{           
    if (/^(\+|-)?\d+$/.test( obj.value ))     
    {    
       return true;    
    }     
    else     
    {    
        f_alert(obj,"请输入整数");    
        return false;    
    }    
}    
  

/* 
* 判断是否为实数，是则返回true,否则返回false 
*/
function f_check_float(obj)    
{           
    if (/^(\+|-)?\d+($|\.\d+$)/.test( obj.value ))     
    {    
       return true;    
    }     
    else     
    {    
        f_alert(obj,"请输入实数");    
       return false;    
    }    
}    
   
/* 
用途：检查输入字符串是否只由汉字组成 
如果通过验证返回true,否则返回false 
*/
function f_check_zh(obj){    
    if (/^[\u4e00-\u9fa5]+$/.test(obj.value)) {    
      return true;    
    }    
    f_alert(obj,"请输入汉字");    
    return false;    
}    
  

/* 
* 判断是否为小写英文字母，是则返回true,否则返回false 
*/
function f_check_lowercase(obj)    
{           
    if (/^[a-z]+$/.test( obj.value ))     
    {    
       return true;    
    }     
    f_alert(obj,"请输入小写英文字母");    
    return false;    
}    
  

/* 
* 判断是否为大写英文字母，是则返回true,否则返回false 
*/
function f_check_uppercase(obj)    
{           
    if (/^[A-Z]+$/.test( obj.value ))     
    {    
       return true;    
    }     
    f_alert(obj,"请输入大写英文字母");    
    return false;    
}    
  

/* 
* 判断是否为英文字母，是则返回true,否则返回false 
*/
function f_check_letter(obj)    
{           
    if (/^[A-Za-z]+$/.test( obj.value ))     
    {    
       return true;    
    }     
    f_alert(obj,"请输入英文字母");    
    return false;    
}    
  

/* 
用途：检查输入字符串是否只由汉字、字母、数字组成 
输入： 
value：字符串 
返回： 
如果通过验证返回true,否则返回false 
*/
function f_check_ZhOrNumOrLett(obj){    
	//判断是否是汉字、字母、数字组成    
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5]+$";       
    var re = new RegExp(regu);    
    if (re.test( obj.value )) {    
      return true;    
    }    
    f_alert(obj,"请输入汉字、字母或数字");    
    return false;    
}    
  

/* 
用途：校验ip地址的格式 
输入：strIP：ip地址 
返回：如果通过验证返回true,否则返回false； 
*/
function f_check_IP(obj){     
    var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/; //匹配IP地址的正则表达式    
    if(re.test( obj.value )) {    
        if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256) return true;    
    }    
    f_alert(obj,"请输入合法的计算机IP地址");    
    return false;     
}    
  

/* 
用途：检查输入对象的值是否符合端口号格式 
输入：str 输入的字符串 
返回：如果通过验证返回true,否则返回false 
*/
function f_check_port(obj)    
{    
    if(!f_check_number(obj))    
        return false;    
    if(obj.value < 65536)    
        return true;    
    f_alert(obj,"请输入合法的计算机IP地址端口号");    
    return false;     
}    
  

   
  

/* 
用途：检查输入对象的值是否符合E-Mail格式 
输入：str 输入的字符串 
返回：如果通过验证返回true,否则返回false 
*/
function f_check_email(obj){      
    var myReg = /^([-_A-Za-z0-9\.]+)@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;     
    if(myReg.test( obj.value )) return true;     
    f_alert(obj,"请输入合法的电子邮件地址");    
    return false;     
}    
  

/* 
要求：一、移动电话号码为11或12位，如果为12位,那么第一位为0 
二、11位移动电话号码的第一位和第二位为"13" 
三、12位移动电话号码的第二位和第三位为"13" 
用途：检查输入手机号码是否正确 
输入： 
s：字符串 
返回： 
如果通过验证返回true,否则返回false 
*/
function f_check_mobile(obj){       
    var regu =/(^[1][3][0-9]{9}$)|(^0[1][3][0-9]{9}$)/;    
    var re = new RegExp(regu);    
    if (re.test( obj.value )) {    
      return true;    
    }    
    f_alert(obj,"请输入正确的手机号码");    
    return false;       
}    
  

/* 
要求：一、电话号码由数字、"("、")"和"-"构成 
二、电话号码为3到8位 
三、如果电话号码中包含有区号，那么区号为三位或四位 
四、区号用"("、")"或"-"和其他部分隔开 
用途：检查输入的电话号码格式是否正确 
输入： 
strPhone：字符串 
返回： 
如果通过验证返回true,否则返回false 
*/
function f_check_phone(obj)     
{    
    var regu =/(^([0][1-9]{2,3}[-])?\d{3,8}(-\d{1,6})?$)|(^\([0][1-9]{2,3}\)\d{3,8}(\(\d{1,6}\))?$)|(^\d{3,8}$)/;     
    var re = new RegExp(regu);    
    if (re.test( obj.value )) {    
      return true;    
    }    
    f_alert(obj,"请输入正确的电话号码");    
    return false;    
}    
  

/* 判断是否为邮政编码 */
function f_check_zipcode(obj)    
{    
    if(!f_check_number(obj))    
        return false;    
    if(obj.value.length!=6)    
    {    
        f_alert(obj,"邮政编码长度必须是6位");    
        return false;    
    }    
    return true;    
}    
  

/* 
功能：验证身份证号码是否有效 
提示信息：未输入或输入身份证号不正确！ 
使用：f_check_IDno(obj) 
返回：bool 
*/
function f_check_IDno(obj)    
{     
    var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};    
     
    var iSum = 0;    
    var info = "";    
    var strIDno = obj.value;    
    var idCardLength = strIDno.length;      
    if(!/^\d{17}(\d|x)$/i.test(strIDno)&&!/^\d{15}$/i.test(strIDno))     
    {    
        f_alert(obj,"非法身份证号");    
        return false;    
    }    
     
    //在后面的运算中x相当于数字10,所以转换成a    
    strIDno = strIDno.replace(/x$/i,"a");    
   
    if(aCity[parseInt(strIDno.substr(0,2))]==null)    
    {    
        f_alert(obj,"非法地区");    
        return false;    
    }    
        
    if (idCardLength==18)    
    {    
        sBirthday=strIDno.substr(6,4)+"-"+Number(strIDno.substr(10,2))+"-"+Number(strIDno.substr(12,2));    
        var d = new Date(sBirthday.replace(/-/g,"/"))    
        if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))    
        {           
            f_alert(obj,"非法生日");    
            return false;    
        }    
   
        for(var i = 17;i>=0;i --)    
            iSum += (Math.pow(2,i) % 11) * parseInt(strIDno.charAt(17 - i),11);    
   
        if(iSum%11!=1)    
        {    
            f_alert(obj,"非法身份证号");    
            return false;    
        }    
    }    
    else if (idCardLength==15)    
    {    
        sBirthday = "19" + strIDno.substr(6,2) + "-" + Number(strIDno.substr(8,2)) + "-" + Number(strIDno.substr(10,2));    
        var d = new Date(sBirthday.replace(/-/g,"/"))    
        var dd = d.getFullYear().toString() + "-" + (d.getMonth()+1) + "-" + d.getDate();       
        if(sBirthday != dd)    
        {    
            f_alert(obj,"非法生日");    
            return false;    
        }    
    }    
    return true;     
}    
   
/* 
功能：判断是否为日期(格式:yyyy年MM月dd日,yyyy-MM-dd,yyyy/MM/dd,yyyyMMdd) 
提示信息：未输入或输入的日期格式错误！ 
使用：f_check_date(obj) 
返回：bool 
*/
function f_check_date(obj)    
{    
    var date = Trim(obj.value);    
    var dtype = obj.eos_datatype;    
    var format = dtype.substring(dtype.indexOf("(")+1,dtype.indexOf(")")); //日期格式    
    var year,month,day,datePat,matchArray;    
   
    if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(format))    
        datePat = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2})$/;    
    else if(/^(y{4})(年)(M{1,2})(月)(d{1,2})(日)$/.test(format))    
        datePat = /^(\d{4})年(\d{1,2})月(\d{1,2})日$/;    
    else if(format=="yyyyMMdd")    
        datePat = /^(\d{4})(\d{2})(\d{2})$/;    
    else   
    {    
        f_alert(obj,"日期格式不对");    
        return false;    
    }    
    matchArray = date.match(datePat);    
    if(matchArray == null)     
    {    
        f_alert(obj,"日期长度不对,或日期中有非数字符号");    
        return false;    
    }    
    if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2})$/.test(format))    
    {    
        year = matchArray[1];    
        month = matchArray[3];    
        day = matchArray[4];    
    } else   
    {    
        year = matchArray[1];    
        month = matchArray[2];    
        day = matchArray[3];    
    }    
    if (month < 1 || month > 12)    
    {                 
        f_alert(obj,"月份应该为1到12的整数");    
        return false;    
    }    
    if (day < 1 || day > 31)    
    {    
        f_alert(obj,"每个月的天数应该为1到31的整数");    
        return false;    
    }         
    if ((month==4 || month==6 || month==9 || month==11) && day==31)    
    {    
        f_alert(obj,"该月不存在31号");    
        return false;    
    }         
    if (month==2)    
    {    
        var isleap=(year % 4==0 && (year % 100 !=0 || year % 400==0));    
        if (day>29)    
        {                   
            f_alert(obj,"2月最多有29天");    
            return false;    
        }    
        if ((day==29) && (!isleap))    
        {                   
            f_alert(obj,"闰年2月才有29天");    
            return false;    
        }    
    }    
    return true;    
}    
  

/* 
功能：校验的格式为yyyy年MM月dd日HH时mm分ss秒,yyyy-MM-dd HH:mm:ss,yyyy/MM/dd HH:mm:ss,yyyyMMddHHmmss 
提示信息：未输入或输入的时间格式错误 
使用：f_check_time(obj) 
返回：bool 
*/
function f_check_time(obj)    
{    
    var time = Trim(obj.value);    
    var dtype = obj.eos_datatype;    
    var format = dtype.substring(dtype.indexOf("(")+1,dtype.indexOf(")")); //日期格式    
    var datePat,matchArray,year,month,day,hour,minute,second;    
   
    if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2}) (HH:mm:ss)$/.test(format))    
        datePat = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;    
    else if(/^(y{4})(年)(M{1,2})(月)(d{1,2})(日)(HH时mm分ss秒)$/.test(format))    
        datePat = /^(\d{4})年(\d{1,2})月(\d{1,2})日(\d{1,2})时(\d{1,2})分(\d{1,2})秒$/;    
    else if(format == "yyyyMMddHHmmss")    
        datePat = /^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})$/;    
    else   
    {    
        f_alert(obj,"日期格式不对");    
        return false;    
    }    
    matchArray = time.match(datePat);    
    if(matchArray == null)     
    {    
        f_alert(obj,"日期长度不对,或日期中有非数字符号");    
        return false;    
    }    
    if(/^(y{4})(-|\/)(M{1,2})\2(d{1,2}) (HH:mm:ss)$/.test(format))    
    {    
        year = matchArray[1];    
        month = matchArray[3];    
        day = matchArray[4];    
        hour = matchArray[5];    
        minute = matchArray[6];    
        second = matchArray[7];    
    } else   
    {    
        year = matchArray[1];    
        month = matchArray[2];    
        day = matchArray[3];    
        hour = matchArray[4];    
        minute = matchArray[5];    
        second = matchArray[6];    
    }    
    if (month < 1 || month > 12)    
    {                 
        f_alert(obj,"月份应该为1到12的整数");    
        return false;    
    }    
    if (day < 1 || day > 31)    
    {               
        f_alert(obj,"每个月的天数应该为1到31的整数");    
        return false;    
    }         
    if ((month==4 || month==6 || month==9 || month==11) && day==31)    
    {             
        f_alert(obj,"该月不存在31号");    
        return false;    
    }         
    if (month==2)    
    {    
        var isleap=(year % 4==0 && (year % 100 !=0 || year % 400==0));    
        if (day>29)    
        {                   
            f_alert(obj,"2月最多有29天");    
            return false;    
        }    
        if ((day==29) && (!isleap))    
        {                   
            f_alert(obj,"闰年2月才有29天");    
            return false;    
        }    
    }    
    if(hour<0 || hour>23)    
    {    
        f_alert(obj,"小时应该是0到23的整数");    
        return false;    
    }    
    if(minute<0 || minute>59)    
    {    
        f_alert(obj,"分应该是0到59的整数");    
        return false;    
    }    
    if(second<0 || second>59)    
    {    
        f_alert(obj,"秒应该是0到59的整数");    
        return false;    
    }    
    return true;    
}    
  

/*判断当前对象是否可见*/
function isVisible(obj){    
    var visAtt,disAtt;    
    try{    
        disAtt=obj.style.display;    
        visAtt=obj.style.visibility;    
    }catch(e){}    
    if(disAtt=="none" || visAtt=="hidden")    
        return false;    
    return true;    
}    
  

/*判断当前对象及其父对象是否可见*/
function checkPrVis(obj){    
    var pr=obj.parentNode;    
    do{    
        if(pr == undefined || pr == "undefined") return true;    
        else{    
            if(!isVisible(pr)) return false;    
        }    
    }while(pr=pr.parentNode);    
    return true;    
}    
  

/* 弹出警告对话框，用户点确定后将光标置于出错文本框上， 并且将原来输入内容选中。*/

function f_alert(obj,alertInfo)    
{    
    var caption = obj.getAttribute("eos_displayname");    
    if(caption == null)    
        caption = "";    
    alert(caption + "：" + alertInfo + "！");     
    obj.select();    
    if(isVisible(obj) && checkPrVis(obj))    
        obj.focus();    
}    
  

/** 
* 检测字符串是否为空 
*/

function isNullOrEmpty(str)    
{    
    str = Trim(str);    
    if(str.length == 0) {   
        return true;    
    } 
    else { 
        return false 
    } 
}   


//get parameter value from 'get' url, strurl: window.parent.location.href or window.location.href, para: keyName
function getPara(para, strurl){ 
if (strurl.indexOf("?") == -1) { 
   //Do nothing. 
   return null; 
} 
else { 
   //get the string after '?' 
   var urlQuery = strurl.split("?"); 
   if(urlQuery[1].indexOf("&")==-1){//only one parameter
    if (urlQuery[1].indexOf("=") == -1) { 
     //no parameter value
     //Do nothing 
     return null; 
    }
    else{ 
     var keyValue = urlQuery[1].split("="); 
     var key = keyValue[0]; 
     var value = keyValue[1]; 
     if(key==para){ 
      return value; 
     } 
    } 
   }
   else{ 
    // analyse parameters
    var urlTerms = urlQuery[1].split("&"); 
    for (var i = 0; i < urlTerms.length; i++){
     var keyValue = urlTerms[i].split("="); 
     var key = keyValue[0]; 
     var value = keyValue[1]; 
     if(key==para){ 
      return value; 
     } 
    } 
   } 
} 
return null; 
}

