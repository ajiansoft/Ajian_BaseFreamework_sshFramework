package com.ssh.framework.entity;

import java.util.HashSet;
import java.util.Set;

import com.google.gson.annotations.Expose;
import com.ssh.framework.util.MD5;

public class User {
	private Integer userId;
	private String userName;
	private String userSex;
	private Integer userAge;
	
	private Set<User> userSet = new HashSet<User>();
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public Integer getUserAge() {
		return userAge;
	}
	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}
	public User(Integer userId, String userName, String userSex, Integer userAge) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userSex = userSex;
		this.userAge = userAge;
	}
	public User() {
		super();
	}
	public Set<User> getUserSet() {
		return userSet;
	}
	public void setUserSet(Set<User> userSet) {
		this.userSet = userSet;
	}
}
