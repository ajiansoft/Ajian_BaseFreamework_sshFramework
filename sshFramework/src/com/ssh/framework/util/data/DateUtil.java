package com.ssh.framework.util.data;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**   
 * DateUtil 概要说明  
 * 日期工具类   
 */
public class DateUtil {
	
	/**
	 * 字符串转换到时间格式
	 * @param dateStr 需要转换的字符串
	 * @param formatStr 需要格式的目标字符串  举例 yyyy-MM-dd
	 * @return Date 返回转换后的时间
	 * @throws ParseException 转换异常
	 */
	public static Date StringToDate(String dateStr,String formatStr){	
		DateFormat sdf=new SimpleDateFormat(formatStr);
		Date date=null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	} 
	
	/**
	 * 时间格式转换到字符串
	 * @param date 需要转换的时间对象
	 * @param formatStr 需要格式的目标字符串  举例 yyyy-MM-dd
	 * @return String 转换出的String 对象  
	 */
	public static String DateToString(Date date,String formatStr){
		DateFormat sdf=new SimpleDateFormat(formatStr);
		return sdf.format(date);
	}
	
	/**
	 * 获取当前时间字符串
	 * @param formatStr 需要格式的目标字符串  举例 yyyy-MM-dd
	 * @return String 当前时间的字符串形式
	 */
	public static Date getCurrentDate(String formatStr){
		DateFormat sdf=new SimpleDateFormat(formatStr);
		String dateTime=sdf.format(new Date());
		Date date=null;
		try {
			date = sdf.parse(dateTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

}
