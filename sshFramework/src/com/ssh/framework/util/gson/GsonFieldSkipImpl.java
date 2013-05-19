package com.ssh.framework.util.gson;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;

/**
 * Google Gson过滤json字符串转换当中的类、字段工具
 * @author Ajian
 * @version 2012-5-10 下午02:48:41
 */
public class GsonFieldSkipImpl implements ExclusionStrategy{
	
	private final String[] skipFieldsName;
	
	public GsonFieldSkipImpl(Class<?> clasz,final String[] skipFieldsName){
		this.skipFieldsName = skipFieldsName;
	}
	
	/** 
	 * Google Gson 过滤Class实现
	 * @see com.google.gson.ExclusionStrategy#shouldSkipClass(java.lang.Class)
	 * @param arg0
	 * @return
	 * @author Ajian
	 * @version 2012-5-10 上午11:59:15
	 */
	@Override
	public boolean shouldSkipClass(Class<?> arg0) {
		return false;
	}

	/** 
	 *  Google Gson 过滤指定属性实现
	 * @see com.google.gson.ExclusionStrategy#shouldSkipField(com.google.gson.FieldAttributes)
	 * @param arg0
	 * @return
	 * @author Ajian
	 * @version 2012-5-10 下午12:22:45
	 */
	@Override
	public boolean shouldSkipField(FieldAttributes field) {
		if(skipFieldsName==null || skipFieldsName.length==0){
			return false;
		}
		for (String fieldName : skipFieldsName) {
			if(field.getName().equalsIgnoreCase(fieldName)){
				return true;
			}
		}
		return false;
	}
}
