package com.ssh.framework.constant;


/**   
 * BusinessExceptionFinal 概要说明  
 * 业务异常提示信息常量   
 */
public class BusinessExceptionFinal extends BaseFinal {
	
	/**
	 * 业务异常 提示信息
	 * 添加，删除，修改等操作异常错误
	 */
	public static final String REQUEST_OPERATE_ERROR="数据库繁忙，请稍后再试!";
	
	/**
	 * 业务异常 提示信息
	 * 信息不存在 
	 */
	public static final String REQUEST_NOT_EXIST="对不起该信息已不存在!";
	
	/**
	 * 业务异常 提示信息
	 * 没有数据
	 */
	public static String REQUEST_NONE_DATA="对不起，没有数据记录!";
	
	/**
	 * 业务异常 提示信息
	 * 有子记录不能删除
	 */
	public static String REQUEST_HAVE_CHILD_DATA="有子记录不能删除!";
	
	/**
	 * 业务异常 提示信息
	 * 信息提交之前已经被修改了  脏数据
	 */
	public static String REQUEST_DIRTY_DATA="数据被修改过，请重新再试!";
	
	/**
	 * 业务异常 提示信息
	 * 已经存在的名称
	 */
	public static String REQUEST_ALREADY_EXITS_NAME="该名称已经存在了，请更换!";
	/**   
	 * REQUEST_PARAMETER_ERROR:TODO概要说明   
	 * 业务异常 提示消息<br>
	 * 传入参数无效
	 */   
	public static String REQUEST_PARAMETER_ERROR="对不起，参数无效！";
}
