package com.ssh.framework.action;

import javax.servlet.http.HttpServletRequest;
import com.ssh.framework.entity.User;
import com.ssh.framework.service.UserService;
import com.ssh.framework.util.page.Page;

public class UserAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	private User user;
	private UserService userService;
	private Page page;
	private int i;

	/** 
	 * pageByForm方法概要说明
	 * 通过from表单刷新方式分页  
	 * @return    
	*/
	public String pageByForm(){
		page = userService.getUserByPage(page);
		getRequest().setAttribute("page", page);
		return "toPage";
	}
	
	/**   
	 * pageByAjax方法概要说明
	 *  通过ajax方式分页  
	*/
	public void pageByAjax(){
		
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setPage(Page page) {
		System.out.println("baseAction setpage!");
		this.page = page;
	}

	public Page getPage() {
		return page;
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}
	
}
