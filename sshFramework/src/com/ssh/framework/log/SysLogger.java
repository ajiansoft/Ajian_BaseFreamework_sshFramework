package com.ssh.framework.log;


import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;

import com.ssh.framework.util.data.DateUtil;

/**   
 * SSMELLLogger 概要说明  
 *    
 */
public class SysLogger {

	private static Logger logger=Logger.getLogger(SysLogger.class);	
	private static String date= DateUtil.DateToString(DateUtil.getCurrentDate("yyyy-MM-dd HH:mm:ss"),"yyyy年MM月dd日  HH时mm分ss秒");
		
	public Object printLog(ProceedingJoinPoint joinpiont) throws Throwable{
		String targetPath= joinpiont.getTarget().getClass().toString();
		//获取子系统模块名
		String systemName=targetPath.substring(targetPath.indexOf("ssmell.")+7,targetPath.indexOf(".service"));		
		//获取当前登录用户
		//Userinfo user=(Userinfo)ServletActionContext.getRequest().getSession().getAttribute(UserFinal.SESSION_LOGINUSERBEAN);
		String UserName="";
		logger.info("[系统日志]{"+date+"]");
		logger.info("->子系统:"+systemName+"");
		//if(user !=null){
		//	UserName=user.getRegLogName();
			//logger.info("->操作用户:"+UserName+"");
		//}else{
			UserName="默认操作";
			logger.info("->操作:"+UserName+"");
		//}		
		//获取操作的方法
		String methodName =joinpiont.toString().substring(joinpiont.toString().lastIndexOf("(")+1, joinpiont.toString().length()-1);
		logger.info("->执行"+methodName+"()"+"方法...");
		Object[] args=joinpiont.getArgs(); 
		for (int i = 0;args!=null&&i<args.length; i++) {
				logger.info("->传入的参数: "+args[i].getClass().getSimpleName()+"="+args[i].toString());
		}		
		Object obj=null;
		try {
			obj=joinpiont.proceed();
			logger.info("->执行"+joinpiont.toString().substring(joinpiont.toString().lastIndexOf("(")+1, joinpiont.toString().length()-1)+"()方法完毕");
		} catch (Throwable e) {
			e.printStackTrace();
			throw e;
		}
		return obj;
	}
}
