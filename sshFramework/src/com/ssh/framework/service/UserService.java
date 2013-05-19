package com.ssh.framework.service;

import com.ssh.framework.util.page.Page;

public interface UserService {
	/**   
	 * getUserByPage方法概要说明
	 * 分页显示user数据
	 * @param page
	 * @return    
	*/
	public Page getUserByPage(Page page);
}
