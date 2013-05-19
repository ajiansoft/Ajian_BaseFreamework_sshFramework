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
	var form=document.forms['form'];
	var txtNewsTitle=document.getElementById("txtNewsTitle");
	if(funTrim(txtNewsTitle.value)==""){
		alert("请输入新闻标题!");
		txtNewsTitle.focus();
		return false;
	}
	var txtNewsType=document.getElementById("selNewsType");
	if(txtNewsType.value=="-1"){
		alert("请选择新闻类型!");
		txtNewsType.focus();
		return false;
	}
	var txtContent=document.getElementById("txtContent")
	if(funTrim(txtContent.value)==""){
		alert("请输入新闻内容!");
		return false;
	}				
	form.submit();
}