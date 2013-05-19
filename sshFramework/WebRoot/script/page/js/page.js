function checkNum(obj){
	obj.value=obj.value.replace(/[\D\.]/gi,"");
}

function send(formName){
	var pageIndex = document.getElementById("__formPageTAG_PageIndex").value;
	if(pageIndex!=null && pageIndex!="" && !/\D/.test(pageIndex)){
		var allPageCount = document.getElementById("__formPageTAG_PageCount").value;
		if(allPageCount!=null && !isNaN(allPageCount) && allPageCount>=0){
			if(pageIndex > allPageCount || pageIndex<=0){
				alert("对不起，页码超出范围，请查证！");return;				
			}
			document.getElementsByName(formName)[0].submit();
		}
	}
}
function first(pageIndex,formName){
	if(pageIndex != 1){
		document.getElementById("__formPageTAG_PageIndex").value = 1;
		send(formName);
	}
}
function before(pageIndex,formName){
	if(pageIndex > 1){
		document.getElementById("__formPageTAG_PageIndex").value = pageIndex-1;
		send(formName);
	}
}
function next(pageIndex,pageCount,formName){
	if(pageIndex < pageCount){
		document.getElementById("__formPageTAG_PageIndex").value =pageIndex+1;
		send(formName);
	}
}
function last(pageIndex,pageCount,formName){
	if(pageIndex != pageCount){
		document.getElementById("__formPageTAG_PageIndex").value = pageCount;
		send(formName);
	}
}
