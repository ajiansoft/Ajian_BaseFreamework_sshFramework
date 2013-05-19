package com.ssh.framework.util.string;


import java.util.regex.Pattern;

/**   
 * StringUtil 概要说明  
 * 字符串工具类   
 */
public class StringUtil {
	
	/**
	 * clearHtml方法概要说明
	 * 去除HTML标签
	 * @param HTMLStr
	 * @return 去除HTML标签后的文本
	 */
	public String clearHtml(String htmlStr){     
        String textStr = "";   
        java.util.regex.Pattern p_script;   
        java.util.regex.Matcher m_script;   
        java.util.regex.Pattern p_style;   
        java.util.regex.Matcher m_style;   
        java.util.regex.Pattern p_html;   
        java.util.regex.Matcher m_html;   
        try {   
            String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>";    
            String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";    
            String regEx_html = "<[^>]+>";   
            p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);   
            m_script = p_script.matcher(htmlStr);   
            htmlStr = m_script.replaceAll("");    
            p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);   
            m_style = p_style.matcher(htmlStr);   
            htmlStr = m_style.replaceAll("");    
            p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);   
            m_html = p_html.matcher(htmlStr);   
            htmlStr = m_html.replaceAll("");   
            textStr = htmlStr.replaceAll(" ", "");   
            textStr = htmlStr.replaceAll("<",  "<");   
            textStr = htmlStr.replaceAll(">",  ">");   
            textStr = htmlStr.replaceAll("®", "®");   
            textStr = htmlStr.replaceAll("&", "&");   
        } catch (Exception e) {   
        	//不处理异常
        }   
        return textStr;   
    }

}
