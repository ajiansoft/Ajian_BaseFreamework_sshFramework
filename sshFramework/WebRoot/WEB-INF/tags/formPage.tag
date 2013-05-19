<%@ tag import="com.ssh.framework.util.page.Page" pageEncoding="UTF-8" %>

<%@ attribute name="name" description="分页对象名称" required="true" %>
<%@ attribute name="scope" description="分页对象存储范围" required="true" %>
<%@ attribute name="formName" description="表单名" required="true" %>

<%
	Page pag = null; //分页对象
	if(scope.toLowerCase().equals("request")){
		pag = (Page)request.getAttribute(name);
	}
	else if(scope.toLowerCase().equals("session")){
		pag = (Page)session.getAttribute(name);
	}
	else{
		pag = (Page)application.getAttribute(name);
	}
%>
<link rel="stylesheet" type="text/css" href="script/page/page.css" />
<script type="text/javascript" src="script/page/page.js"></script>
<font style="font-size:12px;color=#006699;">共 <%=pag.getRecordNumber() %> 条记录
每页<input type="text" readonly="readonly" class="txt1" name="<%=name %>.pageSize" id="pageNumber" onmouseover="this.className='txt2'" onmouseout="this.className='txt1'" value="<%=pag.getPageSize() %>" onkeyup="checkNum(this);"/>条
当前<input type="text" class="txt1" name="<%=name %>.pageIndex" id="pageIndex" onmouseover="this.className='txt2'" onmouseout="this.className='txt1'" value="<%=pag.getPageIndex() %>" onblur="checkNum(this);" onkeyup="checkNum(this);"/>页
/ 共<%=pag.getPageCount() %>页
<input type="button" value="第一页" onclick="first(<%=pag.getPageIndex()%>,'<%=formName %>')" class=<%=pag.getPageIndex()<=1?"btnNotUser":"tagBut1"%> onmouseover="this.className='tagBut2'" onmouseout="this.className='tagBut1'" />
<input type="button" value="上一页" onclick="before(<%=pag.getPageIndex()%>,'<%=formName %>')" class=<%=pag.getPageIndex()<=1?"btnNotUser":"tagBut1"%> onmouseover="this.className='tagBut2'" onmouseout="this.className='tagBut1'" />
<input type="button" value="下一页" onclick="next(<%=pag.getPageIndex()%>,<%=pag.getPageCount()%>,'<%=formName %>')" class=<%=pag.getPageIndex()>=pag.getPageCount()?"btnNotUser":"tagBut1"%> onmouseover="this.className='tagBut2'" onmouseout="this.className='tagBut1'" />
<input type="button" value="末尾页" onclick="last(<%=pag.getPageIndex()%>,<%=pag.getPageCount()%>,'<%=formName %>')" class=<%=pag.getPageIndex()>=pag.getPageCount()?"btnNotUser":"tagBut1"%> onmouseover="this.className='tagBut2'" onmouseout="this.className='tagBut1'" />
<input type="hidden" value="<%=pag.getRecordNumber() %>" name="<%=name %>.recordNumber" />
<input type="hidden" value="<%=pag.getPageCount() %>" id="__formPageTAG_PageCount" />
<%
	if(pag.getPageCount()>1){
	%>
		<input type="button" id="page_go_btn" value="跳转" style="background-color:transparent;border:1px solid black;" onclick="send('<%=formName %>')" />
	<%
	}
%>
</font>