package com.ssh.framework.filter;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**   
 * NoLoginFilter 概要说明  
 * 登录验证   
 */
public class NoLoginFilter implements Filter {
	
	@SuppressWarnings("unused")
	private FilterConfig config;
	
	public void destroy() {
		this.config=null;
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		//Userinfo user = (Userinfo) request.getSession().getAttribute(UserFinal.SESSION_LOGINUSERBEAN);
		//if(user==null){
			response.setContentType("text/html");
			response.setHeader("Cache-Control","no-cache");//设置请求响应消息不缓存
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script type='text/javascript'>");
			pw.println("alert('你的登陆信息已过期，请重新登陆!');"); 
			pw.println("location.href='pages/user/login.jsp';");
			pw.println("</script>");
			pw.flush();
			pw.close();
		//}else{
			chain.doFilter(request, response);
		//}
	}

	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}
	
}
