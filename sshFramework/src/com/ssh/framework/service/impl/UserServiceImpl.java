package com.ssh.framework.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ssh.framework.entity.User;
import com.ssh.framework.service.UserService;
import com.ssh.framework.util.page.Page;
import com.ssh.framework.util.page.PageUtil;

public class UserServiceImpl implements UserService{

	public Page getUserByPage(Page page) {
		User u1 = new User(1, "aa", "男", 21);
		User u2 = new User(2, "ab", "女", 21);
		User u3 = new User(3, "b", "男", 24);
		User u4 = new User(4, "szfcf", "男", 21);
		User u5 = new User(5, "xdfg", "女", 18);
		User u6 = new User(6, "sdfs三点", "男", 21);
		User u7 = new User(7, "地方", "女", 22);
		User u8 = new User(8, "才vgh", "男", 24);
		User u9 = new User(9, "娃儿", "男", 20);
		User u10 = new User(10, "飞过海", "女", 19);
		User u11 = new User(11, "娃儿1", "男", 20);
		User u12 = new User(12, "飞过海2", "女", 19);
		List<User> uL = new ArrayList<User>();
		uL.add(u1);uL.add(u2);uL.add(u3);uL.add(u4);uL.add(u5);
		uL.add(u6);uL.add(u7);uL.add(u8);uL.add(u9);uL.add(u10);
		uL.add(u11);uL.add(u12);
		
		if(page==null){
			page = new Page(uL.size(), 10, 1);
		}
		page.setPageContent(uL.subList((page.getPageIndex()-1)*page.getRecordNumber(),((page.getPageIndex()-1)*page.getRecordNumber()+page.getRecordNumber())>uL.size()?uL.size():((page.getPageIndex()-1)*page.getRecordNumber()+page.getRecordNumber())));
		
		return page;
	}

}
