package com.ssh.framework.util.mail;


import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import com.ssh.framework.util.MD5;
import com.ssh.framework.util.data.DateUtil;
import com.ssh.framework.util.xml.ReadMailXml;

/**   
 * SendMailAction 概要说明  
 * 注册时发送邮件action控制   
 */
public class SendMailClass{
	
	//MIME邮件对象
	private MimeMessage mimeMsg;
	//邮件会话对象
	private Session session; 
	//系统属性
	private Properties props; 
	//smtp是否需要认证
	@SuppressWarnings("unused")
	private boolean needAuth = true; 	
	//smtp认证用户名和密码
	private String username = ""; 	
	private String password = "";
	//Multipart对象,邮件内容,标题,附件等内容均添加到其中后再生成MimeMessage对象
	private Multipart mp; 	

	/**
	 * SendMailAction.   
	 * 无参构造函数
	 * @throws Exception 
	 */
	public SendMailClass() throws Exception {
		// 如果没有指定邮件服务器,就从getConfig类中获取
		setSmtpHost("getConfig.mailHost");
		createMimeMessage();
	}
	
	/**
	 * 创建一个新的实例 SendMailAction.   
	 * 有参构造函数  
	 * @param smtp
	 * @throws Exception 
	 */
	public SendMailClass(String smtp) throws Exception {
		setSmtpHost(smtp);
		createMimeMessage();
	}
	
	/**
	 * setSmtpHost方法概要说明
	 * 设置系统属性
	 * @param hostName SMTP主机
	 */
	public void setSmtpHost(String smtpHost) {
		//设置系统属性
		if (props == null){
			//获得系统属性对象
			props = System.getProperties();
		}
		//设置SMTP主机
		props.put("mail.smtp.host", smtpHost);	
	}
	

	/**
	 * createMimeMessage方法概要说明
	 * 创建MIME邮件对象
	 * @return
	 */
	public void createMimeMessage() throws Exception{
		//获取邮件会话对象
		session = Session.getDefaultInstance(props, null); 
		//创建MIME邮件对象
		mimeMsg = new MimeMessage(session); 
		mp = new MimeMultipart();
	}

	/**
	 * setNeedAuth方法概要说明
	 * 设置SMTP是否需要身份认证
	 * @param boolNeed 是/否
	 */
	public void setNeedAuth(boolean boolNeed) {
		//设置SMTP是否需要身份认证
		if (props == null){
			//获得系统属性对象
			props = System.getProperties();
		}
		if (boolNeed) {
			props.put("mail.smtp.auth", "true");
		} else {
			props.put("mail.smtp.auth", "false");
		}
	}

	/**
	 * setNamePass方法概要说明
	 * 设置用户名，密码
	 * @param name 用户名
	 * @param pass 密码
	 */
	public void setNamePass(String name, String pass) {
		username = name;
		password = pass;
	}

	/**
	 * setSubject方法概要说明
	 * 设置邮件主题
	 * @param mailSubject 右键主题
	 * @return
	 */
	public void setSubject(String mailSubject) throws Exception {
		//设置邮件主题
		mimeMsg.setSubject(mailSubject);
	}

	/**
	 * setBody方法概要说明
	 * 设置邮件主体内容
	 * @param mailBody 主体内容
	 * @return
	 */
	public void setBody(String mailBody) throws Exception{
		BodyPart bp = new MimeBodyPart();
		bp.setContent(mailBody, "text/html;charset=UTF-8");
		mp.addBodyPart(bp);
	}

	/**
	 * addFileAffix方法概要说明
	 * 增加邮件附件
	 * @param fileName 名称
	 * @return
	 */
	public void addFileAffix(String fileName) throws Exception {
		//增加邮件附件
		BodyPart bp = new MimeBodyPart();
		FileDataSource fds = new FileDataSource(fileName);
		bp.setDataHandler(new DataHandler(fds));
		bp.setFileName(fds.getName());
		mp.addBodyPart(bp);
	}

	/**
	 * setFrom方法概要说明
	 * 设置发信人地址
	 * @param fromName 发信人名称
	 * @param from 来自
	 * @return
	 */
	public void setFrom(String fromName, String from) throws Exception {
		//设置发信人
		mimeMsg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "b")));			
	}

	/**
	 * setTo方法概要说明
	 * 设置邮件发送对象
	 * @param to 发送地址
	 * @return
	 */
	public void setTo(String to) throws Exception {
		if (to == null){			
			throw new Exception();
		}
		mimeMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	}

	/**
	 * setCopyTo方法概要说明
	 * 设置抄送地址
	 * @param copyTo 抄送地址
	 * @return
	 */
	public void setCopyTo(String copyTo) throws Exception {
		if (copyTo == null) throw new Exception();
		mimeMsg.setRecipients(Message.RecipientType.CC,(Address[]) InternetAddress.parse(copyTo));
	}
	
	/**
	 * sendOut方法概要说明
	 * 发送邮件
	 * @return
	 */
	public void sendOut() throws Exception{
		//正在发送邮件...
		Session mailSession = Session.getInstance(props, null);
		Transport transport = mailSession.getTransport("smtp");
		transport.connect((String)props.get("mail.smtp.host"),username,password);
		transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.TO));
		//发送邮件成功,关闭transport
		transport.close();
	}

	/**
	 * sendMail方法概要说明
	 * 发送邮件方法，提供调用
	 * @param userName 用户名
	 * @param usermail 用户邮箱
	 * @return
	 */
	public String sendMail(String userName, String usermail) throws Exception{
		String encode_userMail = "";
		try {
			String encode_userID = "" ;
			ReadMailXml rx = new ReadMailXml();
			//设置端口
			this.setSmtpHost(rx.getMailXml("smtpHost"));
			String mailBody = null;
			//将用户名、网站名做转码操作
			encode_userID = java.net.URLEncoder.encode(userName, "utf-8");
			//role = java.net.URLEncoder.encode(rx.getMailXml("webName"),"utf-8");
			MD5 md5 = new MD5();
			encode_userMail = md5.getMD5ofStr(userName+usermail+DateUtil.getCurrentDate("yyyyMMdd"));
			//构建超链接(验证的各个参数)
			StringBuffer buff = new StringBuffer();
			//buff.append(rx.getMailXml("webUrl"));
			buff.append("user.regLogName=");
			buff.append(encode_userID);
			//buff.append("&role=");
			//buff.append(role);
			buff.append("&user.userEmail=");
			buff.append(usermail);
			buff.append("&user.mailValCode=");
			buff.append(encode_userMail);
			String backUrl = buff.toString();
			
			//得到邮件的内容
			mailBody = this.getMailBody(rx.getMailXml("webLogo"), rx.getMailXml("webUrl"), rx.getMailXml("validateUrl")+backUrl, rx.getMailXml("phone"), rx.getMailXml("mail"), rx.getMailXml("webName"), usermail,userName);
			
			//设置邮件是否验证
			this.setNeedAuth(true);
			//设置邮件主题
			this.setSubject(rx.getMailXml("mailSubject"));
			//设置邮件内容
			this.setBody(mailBody);
			//设置邮件发送对象
			this.setTo(usermail);	
			//设置发件人
			this.setFrom(rx.getMailXml("mailFromName"), rx.getMailXml("mail"));
			//设置发件邮箱用户名密码
			this.setNamePass(rx.getMailXml("mailUserName"), rx.getMailXml("mailPass"));
			//确定邮件内容
			mimeMsg.setContent(mailBody, "text/html;charset=UTF-8");
			mimeMsg.saveChanges();
			//发送邮件
			this.sendOut();
			
			rx=null;
		} catch (Exception ac) {
			throw new Exception("邮件发送失败！");
		}
		return encode_userMail;
	}
	
	
	/**
	 * sendMail方法概要说明
	 * 发送邮件方法，提供调用(重载)
	 * @param userName 用户名
	 * @param usermail 用户邮箱
	 * @param userPass 用户密码
	 * @param op 操作
	 * @return
	 */
	public String sendMail(String userName, String userPass,String usermail,String op) throws Exception{
		if(op.equals("register"))sendMail(userName, usermail);
		
		String encode_userMail = "";
		try {
			ReadMailXml rx = new ReadMailXml();
			//设置端口
			this.setSmtpHost(rx.getMailXml("smtpHost"));
			String mailBody = null;
			//将用户名、网站名做转码操作
			MD5 md5 = new MD5();
			encode_userMail = md5.getMD5ofStr(userName+usermail+DateUtil.getCurrentDate("yyyyMMdd"));
			if(op.equals("findPass")){
				//得到邮件的内容
				mailBody = this.getMailBodyForUserPass(rx.getMailXml("webLogo"), rx.getMailXml("webUrl"), rx.getMailXml("phone"), rx.getMailXml("mail"), userPass, usermail,userName );
			}
			
			//设置邮件是否验证
			this.setNeedAuth(true);
			//设置邮件主题
			this.setSubject(rx.getMailXml("mailSubject"));
			//设置邮件内容
			this.setBody(mailBody);
			//设置邮件发送对象
			this.setTo(usermail);	
			//设置发件人
			this.setFrom(rx.getMailXml("mailFromName"), rx.getMailXml("mail"));
			//设置发件邮箱用户名密码
			this.setNamePass(rx.getMailXml("mailUserName"), rx.getMailXml("mailPass"));
			//确定邮件内容
			mimeMsg.setContent(mailBody, "text/html;charset=UTF-8");
			mimeMsg.saveChanges();
			//发送邮件
			this.sendOut();
			
			rx=null;
		} catch (Exception ac) {
			throw new Exception("邮件发送失败！");
		}
		return encode_userMail;
	}

	
	/**   
	 * getMailBody方法概要说明
	 * 得到邮件主体内容
	 * @param webLogo：logo
	 * @param webUrl：网址
	 * @param url：点击验证的路径
	 * @param phone：服务热线
	 * @param mail：电子邮箱
	 * @param webName:名称
	 * @param userMail：用户邮箱
	 * @param loginName：用户注册名
	 * @return    
	*/
	public String getMailBody(String webLogo, String webUrl, String url,
			String phone, String mail, String webName, String userMail,
			String loginName) {
		StringBuffer str = new StringBuffer();
		str.append("<p><img height=\"1\" src=\""+webLogo+"\" width=\"1\" alt=\"\" /></p><center><br />");
		str.append("<table cellspacing=\"0\" cellpadding=\"0\" width=\"570\" border=\"0\"><tbody><tr>");
		str.append("<td align=\"center\" width=\"200\"><a href=");
		str.append(webUrl);
		str.append(" target=\"_blank\" rel=\"nofollow\"><img height=\"45\" src='");
		str.append(webLogo);
		str.append("' /></a></td><td class=\"S\">&nbsp;</td></tr></tbody></table><br />");
		str.append("<table  style=\"border-right: #cccccc 2px solid; padding-right: 20px; border-top: #cccccc 2px solid; padding-left: 20px; padding-bottom: 20px; border-left: #cccccc 2px solid; padding-top: 20px; border-bottom: #cccccc 2px solid\" cellspacing=\"0\" cellpadding=\"15\"  width=\"570\" border=\"0\">");
		str.append("<tbody><tr><td align=\"center\" bgcolor=\"#ffffff\"><br /><table cellspacing=\"0\" cellpadding=\"0\" width=\"94%\" border=\"0\"><tbody><tr><td class=\"lh13\">");
		str.append("<p class=\"lh15\">尊敬的用户：</p><p class=\"lh15\">感谢您注册");
		str.append(webName);
		str.append("会员（会员登录名：");
		str.append(loginName);
		str.append("）<br /><br /><font color=\"#ff6600\">您注册时填写的邮箱：");
		str.append(userMail);
		str.append("还未通过验证！</font></p>");
		str.append("<table style=\"cellspacing=\"0\" cellpadding=\"0\" width=\"500\" border=\"0\"><tbody><tr><td align=\"center\"><br /><span class=\"M\"><font size=\"4\"><font face=\"黑体\"><span class=\"l\"><font color=\"#ff6600\">");
		str.append("请确认此邮箱是您本人使用  ！<br /></font></span><br /></font></font></span><table cellspacing=\"0\" cellpadding=\"0\"  border=\"0\"><tbody><tr><td width=\"12\"></td><td nowrap=\"nowrap\" align=\"center\">");
		str.append("<a href=");
		str.append(url);
		str.append(" target=\"_blank\" rel=\"nofollow\"><font style=\"font-size: 33px\" face=\"黑体\" color=\"#000000\">");
		str.append("<strong>点此确认</strong>");
		str.append("</font></a></td><td align=\"right\" width=\"45\"></td></tr></tbody></table>&nbsp;</td></tr></tbody></table></td></tr></tbody></table>");
		str.append("<table cellspacing=\"0\" cellpadding=\"4\" width=\"380\" border=\"0\"><tbody width=\"180\"><tr><td width=\"380\"><br /><p><br />看不到或者无法点击以上按钮？<br />");
		str.append("&nbsp;您可以将以下链接复制到浏览器中访问，同样能完成验证！<br />");
		str.append("<font color=\"#3d362b\">");
		str.append(url);
		str.append("</font><br />");
		str.append("<br /></p></td></tr><tr><td align=\"right\"><span class=\"style10\">");
		str.append(webName);
		str.append("</span></td></tr></tbody></table></td></tr></tbody></table><br /><hr width=\"180\" />");
		str.append("<table cellspacing=\"0\" cellpadding=\"0\" width=\"680\" border=\"0\"><tbody><tr><td align=\"center\"><font color=\"#333333\">");
		str.append("服务热线：");
		str.append(phone);
		str.append(" &nbsp;&nbsp;电子邮箱：<a href=\"mailto:");
		str.append(mail);
		str.append("\" target=\"_blank\" rel=\"nofollow\">");
		str.append("<font color=\"#3d362b\">");
		str.append(mail);
		str.append("</font></a></font></td></tr></tbody></table></center>");
		
		return str.toString();
	}
	
	
	/**   
	 * getMailBodyForUserPass方法概要说明
	 * 得到邮件主体内容(重载)
	 * @param webLogo：logo
	 * @param webUrl：网址
	 * @param phone：服务热线
	 * @param mail：电子邮箱
	 * @param userPass:用户密码
	 * @param userMail：用户邮箱
	 * @param loginName：用户注册名
	 * @return    
	*/
	public String getMailBodyForUserPass(String webLogo, String webUrl,String phone, String mail, String userPass, String userMail,
			String loginName) {
		StringBuffer str = new StringBuffer();
		str.append("<p><img height=\"1\" src=\""+webLogo+"\" width=\"1\" alt=\"\" /></p><center><br />");
		str.append("<table cellspacing=\"0\" cellpadding=\"0\" width=\"570\" border=\"0\"><tbody><tr>");
		str.append("<td align=\"center\" width=\"200\"><a href=");
		str.append(webUrl);
		str.append(" target=\"_blank\" rel=\"nofollow\"><img height=\"45\" src='");
		str.append(webLogo);
		str.append("' /></a></td><td class=\"S\">&nbsp;</td></tr></tbody></table><br />");
		str.append("<table  style=\"border-right: #cccccc 2px solid; padding-right: 20px; border-top: #cccccc 2px solid; padding-left: 20px; padding-bottom: 20px; border-left: #cccccc 2px solid; padding-top: 20px; border-bottom: #cccccc 2px solid\" cellspacing=\"0\" cellpadding=\"15\"  width=\"570\" border=\"0\">");
		str.append("<tbody><tr><td align=\"center\" bgcolor=\"#ffffff\"><br /><table cellspacing=\"0\" cellpadding=\"0\" width=\"94%\" border=\"0\"><tbody><tr><td class=\"lh13\">");
		str.append("<p class=\"lh15\">尊敬的用户：</p><p class=\"lh15\">"+loginName+"，您好！</p>");
		str.append("<p>您在本站的密码是："+userPass+"，请及时更改您的密码以确保您的帐号安全。</p><p>祝您工作愉快！</p>");
		str.append("<table cellspacing=\"0\" cellpadding=\"0\" width=\"680\" border=\"0\"><tbody><tr><td align=\"center\"><font color=\"#333333\">");
		str.append("服务热线：");
		str.append(phone);
		str.append(" &nbsp;&nbsp;电子邮箱：<a href=\"mailto:");
		str.append(mail);
		str.append("\" target=\"_blank\" rel=\"nofollow\">");
		str.append("<font color=\"#3d362b\">");
		str.append(mail);
		str.append("</font></a></font></td></tr></tbody></table></center>");
		
		return str.toString();
	}

}
