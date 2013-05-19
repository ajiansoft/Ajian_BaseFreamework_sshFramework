package com.ssh.framework.util;


/**   
 * MessageInfo 概要说明  
 * 提示消息类  
 */
public class MessageInfo {
	
	/**
	 * msgAlert方法概要说明
	 * 获取JavaScript Alert()方法提示代码
	 * @param message 消息信息
	 * @return 
	 */
	public static String msgAlert(String message){
		if(message!=null&&message.length()!=0){
			/**
			 * 弹出系统默认样式框
			 */
			/*return "<script type='text/javascript'>alert('"+message+"');</script>";*/
			
			/**
			 * 弹出ymPrompt样式框
			 */
			return setYmPrompt().append("<script type='text/javascript'>alertMsg('"+message+"');</script>").toString();
		}		
		return "";	
	}
	
	/**
	 * msgAlertAndGoBack方法概要说明
	 * 获取JavaScript Alert()方法提示代码，并返回上一页面<br>
	 * @param message 消息信息
	 * @return 
	 */
	public static String msgAlertAndGoBack(String message){
		if(message!=null&&message.length()!=0){
			/**
			 * 弹出系统默认样式框
			 */
			//return "<script type='text/javascript'>alert('"+message+"');history.go(-1);</script>";
			
			
			/**
			 * 弹出ymPrompt框
			 */
			return setYmPrompt().append("<script type='text/javascript'>alertMsgAndBack('"+message+"');</script>").toString();
		}		
		return "";	
	}
	
	/**
	 * msgAlertAndGoURL方法概要说明
	 * 显示指定信息并跳转到指定页面
	 * @return
	 */
	public static String msgAlertAndGoURL(String message,String url){
		return setYmPrompt().append("<script type='text/javascript'>msgAlertAndGoURL('"+message+"','"+url+"');</script>").toString();
	}
	
	/**
	 * message方法概要说明
	 * 普通的消息提示
	 * @param message 消息内容
	 * @return
	 */
	public static String message(String message){
		return message;
	}
	
	
	/**   
	 * setYmPrompt方法概要说明
	 * 设置ymPrompt参数
	 * @return    
	*/
	public static StringBuffer setYmPrompt(){
		//String path = System.getProperty("user.dir");//取到用户的当前工作目录的绝对路径
		StringBuffer buff = new StringBuffer();
		//添加样式
		buff.append("<link rel='stylesheet' id='skin' type='text/css' href='script//ymPrompt//skin//vista//ymPrompt.css' />");
		//添加文件
		buff.append("<script type='text/javascript' src='script//ymPrompt//ymPrompt.js'></script>");
		return buff;
	}
}
