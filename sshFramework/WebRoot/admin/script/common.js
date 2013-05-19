//引入外部js或css文件的方法
/*function Import(file){ 
   if (file.match(/.js$/)){
       document.write("<script type='text/javascript' src="+file+"></script>"); 
   }  
   else if(file.match(/.css$/)){
   		document.write("<link rel='stylesheet' id='skin' type='text/css' href='"+file+"'/>");
   }
}
*/
//防止误删，提示用户
function valDel(url) {
	if (confirm("你确定删除吗 ?")) {
		//url即要提交的地址
		location.href = url;
	}
}



//直接创建FCKEditor
function createFCKEditor() {
	var oFCKeditor = new FCKeditor("FCKeditor1");   
	//1.BasePath表示fckeditor的目录
	//第一个/表示WEBServer的根目录，所以必须加上工程路径
	//最后必须以/结尾，否则报错
	//2.可以使用相对路径如： fckeditor/   
	oFCKeditor.BasePath = "fckeditor/";
	oFCKeditor.Width = "100%";
	oFCKeditor.Height = 400;   
	//默认属性	Width 100%
	//Height	200
	//Value	""
	//ToolbarSet	"Default"(Basic或自己定制)
	//BasePath	/fckeditor/   
	oFCKeditor.Create();
}

//导入FCKEditor
function includeFCKEditor() {
	var oFCKeditor = new FCKeditor("MyTextarea");
	oFCKeditor.BasePath = "fckeditor/";
	oFCKeditor.Width = "100%";
	oFCKeditor.Height = 300; 
	oFCKeditor.ReplaceTextarea();
}

//显示用户留言信息
function showMessage(id){
	$("#"+id).slideDown();
}
//隐藏用户留言信息
function hideMessage(id){
	$("#"+id).slideUp();
}