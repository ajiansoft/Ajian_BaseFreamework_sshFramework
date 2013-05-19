package com.ssh.framework.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**   
 * DomainFielter 概要说明  
 * 域名过滤器   
 */
public class DomainFielter implements Filter {
	
	//域名
	private static final String DOMAIN = "";//匹配指定域名   
	//分隔符
	//private static final String SEP    = "/";
	
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;   
		HttpServletResponse httpServletResponse = (HttpServletResponse) response; 
		String domainName = "";  
		// 获取域名  
		String serverName = request.getServerName();
		// 获取请求路径  
		String path = httpServletRequest.getRequestURI();
		// 判断是否是三级域名   
		int end = serverName.indexOf(DOMAIN);   
		// 获取domain  
		if (end != -1 && end != 0) {  
			domainName = serverName.substring(0, end - 1);   
		} else {   
			domainName = "www";   
		}
		String uid="";
//		try {
//			//根据用户的编号查询用户域名关联对象
//			//Userdomainname userDomainName=userDomainNameService.queryUserDomainNameByDomainName(domainName);
//			//得到用户编号
//			//uid=userDomainName.getUserId().toString();
//		} catch (SSMELLBusinessException e) {
//			//异常不处理
//		}
		// domain不为空 切不为www
		if (domainName != null && !"".equals(domainName) && !"www".equals(domainName)) {
			//本地测试时候需要代码
			if(path.equals("/ssmell/")){
				path="";
			}
			if(path.equals("")){
				String url="/ssmell/site_initIndex.htm?uid="+uid;
				httpServletResponse.sendRedirect(url); 
				return;				
			}
		}   
		chain.doFilter(request, response);  
	}

	public void init(FilterConfig arg0) throws ServletException {
		//不做任何操作
	}
	
	public void destroy() {
		//不做任何操作
	}
}
